module Semantic where
import System.IO
import AS_Abs
import Lex


-- A monada M serve para encapsular um valor 'a' junto de uma string que se refere as mensagens de erro ou aviso 
data M a = MS (String, a) deriving Show 

-- Instância Functor vai definir como vamos alterar o valor da monada usando o fmap
instance Functor M where 
    fmap f (MS (s, a)) = MS (s, f a) 

-- Instância Applicative define como aplicar as funções dentro da monada, criando monadas usando pure (função auxiliar para botar valor ou função normal em um contexto) e ai combina-las usando o <*> 
instance Applicative M where    
    pure a = MS ("", a)
    MS (s1, f) <*> MS (s2, x) = MS (s1 ++ s2, f x) 

-- Instância Monad vai definir como encadeamos operações sequenciais com o bind, permitindo manipulações do estado (mensagens de erro ou avisos) de forma incremental
instance Monad M where 
    MS m >>= f = let (s, a) = m in let MS (s', b) = f a in MS(s++s', b)

-- define mensagem de erro como função que retorna um valor para dentro da mônada 
erro :: String -> M ()
erro s = MS ("Erro: " ++ s ++ "\n", ())

-- define mensagem de aviso como função que retorna um valor para dentro da mônada
adv :: String -> M ()
adv s = MS ("Adv: " ++ s ++ "\n", ())

analisarSemantica :: Programa -> M Programa
analisarSemantica ast = do 
    analisaPrograma ast 

analisaPrograma :: Programa -> M Programa 
analisaPrograma (Prog listaFuncoes corpoFuncoes variaveis bloco) = do 
    (listaFuncoes', corpoFuncoes') <- verFuncoes listaFuncoes listaFuncoes corpoFuncoes
    bloco' <- verBloco listaFuncoes Nothing variaveis bloco  
    variaveis' <- verificaMultiplasVars variaveis
    pure(Prog listaFuncoes' corpoFuncoes'  variaveis' bloco')


-- VERIFICA EXPRESSOES
verExpr :: [Funcao] -> [Var] -> Expr -> M (Tipo, Expr)
verExpr funcoes vars (Const (CInt n)) = pure (TINT, Const(CInt n))
verExpr funcoes vars (Const (CFloat n)) = pure (TDOUBLE, Const(CFloat n))
verExpr funcoes vars  (Const (CString s)) = pure (TSTRING, Const(CString s))

-- VERIFICA CONVERSÕES 
verExpr funcoes vars (IntDouble e1) = do 
    (t, e') <- verExpr  funcoes vars e1 
    if t == TINT
       then pure (TDOUBLE, IntDouble e')
       else do 
        erro ("Não pôde converter " ++ show e' ++ " pois número já é um double.")
        return (t, e')

verExpr funcoes vars (DoubleInt e1) = do 
    (t, e') <- verExpr funcoes vars  e1 
    if t == TDOUBLE
       then pure (TINT, DoubleInt e')
       else do 
        erro ("Não pôde converter " ++ show e' ++ " pois número já é um inteiro.")
        return (t, e')

verExpr funcoes vars (Chama id es) = do 
     case buscarFuncao id funcoes of
        Just funcao -> do
            let (i :->: (vars', tipo)) = funcao
            es' <- verChamadas funcoes vars funcao funcao es
            return (tipo, Chama id es')
        Nothing -> do
            erro ("A função de nome " ++ id ++ " não foi declarada!")
            return (TVOID, Chama id es)


verExpr funcoes vars (Add e1 e2) = verAritExpr funcoes vars Add e1 e2 
verExpr funcoes vars (Sub e1 e2) = verAritExpr funcoes vars Sub e1 e2 
verExpr funcoes vars (Mul e1 e2) = verAritExpr funcoes vars Mul e1 e2 
verExpr funcoes vars (Div e1 e2) = verAritExpr funcoes vars Div e1 e2 

verExpr funcoes vars (IdVar id) = do 
    t <- case buscarVar id vars of  
        Just tipo -> return tipo 
        Nothing -> return TVOID 
    
    if t == TVOID then do
         erro("Variável " ++ id ++ " não declarada!")
         return(TVOID, IdVar id) 
    else pure (t, IdVar id)

verExpr funcoes vars (Neg e)  = do
  (t, e') <- verExpr funcoes vars e
  if (t == TSTRING)
    then do
      erro "Não é possível tornar uma string negativa!" 
      return (TVOID, e)
  else pure(t, e')

verExprR :: [Funcao] -> [Var] -> ExprR -> M ExprR
verExprR funcoes vars (Req e1 e2) = verRelExpr funcoes vars Req e1 e2 
verExprR funcoes vars (Rdif e1 e2) =  verRelExpr funcoes vars Rdif e1 e2 
verExprR funcoes vars (Rlt e1 e2) = verRelExpr funcoes vars Rlt e1 e2 
verExprR funcoes vars (Rgt e1 e2) = verRelExpr funcoes vars  Rgt e1 e2
verExprR funcoes vars (Rle e1 e2) = verRelExpr funcoes vars  Rle e1 e2 
verExprR funcoes vars (Rge e1 e2) = verRelExpr funcoes vars Rge e1 e2 


verExprL :: [Funcao] -> [Var] -> ExprL -> M ExprL
verExprL funcoes vars (And e1 e2) = verBoolExpr funcoes vars  And e1 e2
verExprL funcoes vars (Or e1 e2) = verBoolExpr funcoes vars Or e1 e2
verExprL funcoes vars (Not e1) = verExprL funcoes vars e1
verExprL funcoes vars (Rel e1)  = pure Rel <*> verExprR funcoes vars e1


-- VERIFICAÇÃO DE EXPRESSÕES ARITMÉTICAS 
verAritExpr :: [Funcao] -> [Var] -> (Expr -> Expr -> Expr)  -> Expr -> Expr -> M(Tipo, Expr)
verAritExpr funcoes vars op e1 e2 = do
    (t1, e1') <- verExpr funcoes vars  e1
    (t2, e2') <- verExpr funcoes vars e2 

    if t1 == TSTRING || t2 == TSTRING
        then do
            erro "Apenas se pode utilizar tipo String em expressoes relacionais."
            return (TSTRING, op e1' e2')
        else if t1 == t2
            then pure (t1, op e1' e2')
            else if t1 == TINT && t2 == TDOUBLE
                then do
                    adv ("Conversão implícita de Int para Double no primeiro operando " ++ show e1) 
                    return (t2, op (IntDouble e1') e2')
                else if t1 == TDOUBLE && t2 == TINT
                    then do
                        adv ("Conversão implícita de Int para Double no segundo operando " ++ show e2)  
                        return (t2, op e1' (IntDouble e2'))
                else do 
                    erro ("Tipos incompatíveis: " ++ show t1 ++ " e " ++ show t2)
                    return (TVOID, op e1' e2')

-- VERIFICAÇÃO DE EXPRESSÕES RELACIONAIS
verRelExpr :: [Funcao] -> [Var] -> (Expr -> Expr -> ExprR)  -> Expr -> Expr -> M ExprR
verRelExpr funcoes vars op e1 e2 = do
    (t1, e1') <- verExpr funcoes vars e1
    (t2, e2') <- verExpr funcoes vars e2

    if t1 == TSTRING && t2 /= TSTRING || t1 /= TSTRING && t2 == TSTRING
        then do 
            erro "Variáveis de ambos os lados devem ser do tipo String para que se possa realizar a expressão relacional."
            return (op e1' e2')
        else if t1 == t2
            then pure (op e1' e2')
            else if t1 == TINT && t2 == TDOUBLE
                then do
                    adv ("Conversão implícita de Int para Double no primeiro operando " ++ show e1) 
                    return (op (IntDouble e1') e2')
                else if t1 == TDOUBLE && t2 == TINT
                    then do
                        adv ("Conversão implícita de Int para Double no segundo operando " ++ show e2)  
                        return (op e1' (IntDouble e2'))
                    else do
                        erro ("Tipos incompatíveis: " ++ show t1 ++ " e " ++ show t2) 
                        return (op e1' e2') 

-- VERIFICAÇÃO DE EXPRESSÕES BOOLENAAS 
verBoolExpr :: [Funcao] -> [Var] -> (ExprL -> ExprL -> ExprL)  -> ExprL -> ExprL -> M ExprL
verBoolExpr funcoes vars  op e1 e2 = do 
    e1' <- verExprL funcoes vars e1 
    e2' <- verExprL funcoes vars e2
    pure (op e1' e2') 


extrairId :: Maybe Funcao -> Id
extrairId (Just (id :->: _)) = id 
extrairId Nothing = "LABELPARARETORNODENOTHING" 

extrairIdFuncao :: Funcao -> Id
extrairIdFuncao (id :->: _) = id 

extrairIdVar :: Var -> Id
extrairIdVar (id :#: _) = id 

-- função para verificar variaveis  
buscarVar :: Id -> [Var] -> Maybe Tipo 
buscarVar id [] = Nothing 
buscarVar id ((id' :#: (tipo, escopo)):vars)
    | id == id' = Just tipo 
    | otherwise = buscarVar id vars


-- verifica múltiplas declarações de variáveis
verificaMultiplasVars :: [Var] -> M [Var]
verificaMultiplasVars vars = verificar vars [] []
  where
    verificar [] vistos validadas = pure validadas 

    verificar (v@(id' :#: tipo) :vs) vistos validadas
      | id' `elem` vistos = do
          erro ("Variável " ++ id' ++ " declarada múltiplas vezes.")
          verificar vs vistos validadas
      | otherwise = verificar vs (id':vistos) (v:validadas)


-- SESSÃO PARA VERIFICAÇÃO DE FUNÇÕES 

verificaMultiplasFuncoes :: Id -> [Funcao] -> M [Funcao]

verificaMultiplasFuncoes _ [] = pure []

verificaMultiplasFuncoes id (fun@(id' :->: (tipo, int)) : fs)
    | id == id' = do
        rest <- verificaMultiplasFuncoes id fs 
        pure (fun : rest)
    | otherwise = verificaMultiplasFuncoes id fs


verFuncao :: [Funcao] -> Funcao -> (Id, [Var], Bloco) -> M(Funcao, (Id, [Var], Bloco)) 

verFuncao funcoes f (id, vars, bloco) = do 
    bloco' <- verBloco funcoes (Just f) vars bloco 
    funcoesRepetidas <-  verificaMultiplasFuncoes (extrairIdFuncao f) funcoes
     
    if length funcoesRepetidas > 1 then do 
        erro("Função " ++ id ++ " foi declarada mais de uma vez!")
        pure(f, (id, vars, bloco'))
    else 
        pure(f, (id, vars, bloco'))


verFuncoes :: [Funcao] -> [Funcao] -> [(Id, [Var], Bloco)] -> M([Funcao], [(Id, [Var], Bloco)])

verFuncoes _ [] [] = pure ([],[])
verFuncoes funcoes (f : fs) ((id, vars, bloco) : restante) = do 
    vars' <- verificaMultiplasVars vars
    (f', bloco') <- verFuncao funcoes f (id, vars', bloco)
    (fs', bs') <- verFuncoes funcoes fs restante
    pure(f' : fs, bloco' : bs') 

-- verifica nome da função e se exite 
buscarFuncao :: Id -> [Funcao] -> Maybe Funcao 
buscarFuncao id [] = Nothing 
buscarFuncao id (fun@(id' :->: (tipo, vars)) : funcoes)
    | id == id' = Just fun 
    | otherwise = buscarFuncao id funcoes



-- SESSÃO PARA VERIFICAR BLOCOS
verBloco :: [Funcao] -> Maybe Funcao -> [Var] -> Bloco -> M Bloco 
verBloco _ f vars [] = pure [] 

verBloco funcoes f vars (comando : bloco) = do
    bloco' <- verBloco funcoes f vars bloco 
    comando' <- verComando funcoes f vars comando  
    pure (comando' : bloco')

-- SESSÃO PARA VERIFICAÇÃO DE COMANDOS 
verComando :: [Funcao] -> Maybe Funcao -> [Var] -> Comando -> M(Comando)

verComando funcoes _  vars (Atrib id expr) = do
    let t1 = case buscarVar id vars of
            Just tipo -> tipo 
            Nothing -> TVOID

    (t2, e2') <- verExpr funcoes vars expr  
    

    if t1 == TVOID 
        then do 
            erro("Variavel " ++ id ++ " nao foi declarada!!")
            return (Atrib id expr)
    else 
        if t1 == t2
            then pure (Atrib id e2')
            else if t1 == TDOUBLE && t2 == TINT
                then return (Atrib id (IntDouble e2'))
                else if t1 == TINT && t2 == TDOUBLE
                    then do
                        adv ("Conversão implícita de double para inteiro na expressão dada: " ++ show e2') 
                        return (Atrib id (DoubleInt e2'))
                    else do
                        erro ("Tipos incompatíveis. Tipo 1: " ++ show t1 ++ " e Tipo 2: " ++ show t2) 
                        return (Atrib id expr)


verComando funcoes _ vars (Imp e) = do
    (t, e') <- verExpr funcoes vars e
    pure (Imp e')

verComando funcoes f vars (Proc id expressoes) = 
    case buscarFuncao id funcoes of
        Just fun -> do 
            expressoes' <- verChamadas funcoes vars fun fun expressoes
            return (Proc id expressoes')
        Nothing -> do  
            erro ("Função de nome " ++ id ++ " nao declarada")
            return (Proc id expressoes)


verComando funcoes f vars (Ret maybe) = do 
    
    t1 <- case buscarFuncao (extrairId f) funcoes of
              Just (_ :->: (_, tipo)) -> return tipo
              Nothing  -> return TVOID
    
    case maybe of  
        Just e -> do 
            (t2, e') <- verExpr funcoes vars e

            if t1 == t2 then 
                pure (Ret (Just e'))  
            else if t1 == TSTRING && t2 /= TSTRING then do 
                erro ("Função "  ++ (extrairId f) ++ " deve retornar tipo STRING! O que a função retorna: " ++ show t1 ++ ". O que está retornando: " ++ show t2)
                return (Ret (Just e'))
            else if t1 /= TSTRING && t2 == TSTRING then do
                erro ("Função "  ++ (extrairId f) ++ " deve ser do tipo STRING! O que a função retorna: " ++ show t1 ++ ". O que está retornando: " ++ show t2)
                return (Ret (Just e'))
            else if t1 == TDOUBLE && t2 == TINT then 
                return (Ret (Just (IntDouble e')))
            else if t1 == TINT && t2 == TDOUBLE then do 
                adv ("Conversão implícita de double para inteiro na expressão que vai ser retornada na função " ++ (extrairId f))
                return (Ret (Just (DoubleInt e')))
            else do 
                erro ("Função "  ++ (extrairId f) ++ " não esperava retorno.")
                return (Ret (Just e'))

        Nothing -> 
            if t1 == TVOID then 
                pure (Ret Nothing)
            else do 
                erro ("Função " ++ (extrairId f) ++" espera retorno.")
                pure (Ret Nothing)


verComando funcoes f vars (If e b1 b2) = do 
    e' <- verExprL funcoes vars e 
    b1' <- verBloco funcoes f vars b1 
    b2' <- verBloco funcoes f vars b2 
    pure(If e' b1' b2')

verComando funcoes f vars (While e b) = do
    e' <- verExprL funcoes vars  e 
    b' <- verBloco funcoes f vars b
    pure(While e' b')

verComando _ _ vars (Leitura v) = do 

    t1 <- case buscarVar v vars of
              Just tipo -> return tipo
              Nothing  -> return TVOID
    
    if t1 == TVOID then do 
        erro("Variável " ++   v ++ " não foi declarada!") 
        return (Leitura v)
    else 
        pure(Leitura v)


verChamadas :: [Funcao] -> [Var] -> Funcao -> Funcao -> [Expr] -> M[Expr]

verChamadas funcoes variaveis fun (_ :->: ([], _)) [] = pure []

verChamadas funcoes variaveis fun f exprs = do 
    let (id :->: (vars, tipo)) = f 
    if length vars < length exprs
        then do 
            erro("Muitos argumentos na função chamada " ++ id)
            return exprs 
        else if length vars > length exprs 
            then do 
                erro("Poucos argumentos na função chamada: " ++ id)
                return exprs 
    else do 
        let (v : vs) = vars

        let (id :#: (t1, m)) =  v 
        
        let (e : es) = exprs 

        let prox = id :->: (vs, tipo) 
        
        (t2, e') <- verExpr funcoes variaveis e 
        
        vs' <- verChamadas funcoes variaveis fun prox es

        if t1 == t2 then 
            pure(e' : vs')
        else 
            if t1 == TSTRING && t2 /= TSTRING then do
                erro("Tipo da expressão é: " ++ show t2 ++ " na função " ++ id ++ ". Esperava-se tipo String!")
                return (e': vs')
            else 
                if t1 /= TSTRING && t2 == TSTRING then do 
                    erro("Esperava-se tipo " ++ show t1 ++ " na função " ++ id ++ "! Porem expressão é do tipo String.")
                    return(e' : vs')
                else 
                    if t1 == TINT && t2 == TDOUBLE then do 
                        adv("Conversão implícita da expressão recebida na função " ++ id ++ "de double para inteira!!")
                        return (DoubleInt e' : vs')
                    else 
                        if t1 == TDOUBLE && t2 == TINT then
                            return (IntDouble e' : vs')
                        else do 
                            erro("Tipo inválido no argumento da função " ++ id)
                            return (e' : vs')

