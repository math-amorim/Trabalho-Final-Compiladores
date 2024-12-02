module AS_Abs where

type Id = String 

data Tipo = TDOUBLE 
            | TINT 
            | TSTRING 
            | TVOID deriving (Show, Eq)

data TCons = CFloat Double | CInt Int | CString String deriving Show

data Expr = Add Expr Expr 
            | Sub Expr Expr    
            | Mul Expr Expr 
            | Div Expr Expr 
            | Neg Expr 
            | Const TCons 
            | IdVar String 
            | Chama Id [Expr] 
            | Lit String 
            | IntDouble Expr 
            | DoubleInt Expr deriving Show

data ExprR = Req Expr Expr 
            | Rdif Expr Expr
            | Rlt Expr Expr 
            | Rgt Expr Expr 
            | Rle Expr Expr 
            | Rge Expr Expr deriving Show

data ExprL = And ExprL ExprL 
            | Or ExprL ExprL 
            | Not ExprL 
            | Rel ExprR deriving Show

data Var = Id :#: (Tipo, Int) deriving Show

data Funcao =  Id :->: ([Var], Tipo) deriving Show

data Programa = Prog [Funcao] [(Id, [Var], Bloco)] [Var] Bloco deriving Show

type Bloco = [Comando]

data Comando = If ExprL Bloco Bloco
                | While ExprL Bloco
                | Atrib Id Expr
                | Leitura Id 
                | Imp Expr
                | Ret (Maybe Expr)
                | Proc Id [Expr] deriving Show

-- Função que transforma a função no formato esperado para o Programa
transformaFuncao :: (Funcao, ([Var], Bloco)) -> (Id, [Var], Bloco)
transformaFuncao (funcao, (variaveisBloco, bloco)) = 
    let 
        -- Decompoe a função, extraindo o nome e as variáveis
        (identificador, tipo) = decompoeFuncao funcao
        
        -- Combina as variáveis do tipo da função com as variáveis do bloco
        todasVariaveis = tipo ++ variaveisBloco
    in 
        -- Retorna o identificador da função, todas as variáveis (tipo + variáveis do bloco), e o bloco de comandos
        (identificador, todasVariaveis, bloco)

-- Função auxiliar para decompor uma função no estilo Id :->: ([Var], Tipo)
decompoeFuncao :: Funcao -> (Id, [Var])
decompoeFuncao (identificador :->: (variaveis, _)) = (identificador, variaveis)
