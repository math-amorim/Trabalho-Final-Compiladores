{
module Parser where
import System.IO
import Token
import qualified Lex as L
import AS_Abs
}

%name calc
%tokentype { Token }
%error { parseError }
%token 

  -- tipagem 
  'int' {TInt}
  'float' {TDouble}
  'string' {TString}
  'void' {TVoid}

 -- identificador 
  Id {ID $$}

  -- operacoes 
  '+' {ADD}
  '-' {SUB}
  '*' {MUL}
  '/' {DIV}

 -- operacao booleana 
  '||' {OR}
  '&&' {AND}
  '!' {NOT} 

  -- relacoes
  '==' {REQ} 
  '/=' {RDIF} 
  '>' {RGT} 
  '<' {RLT} 
  '>=' {RGE} 
  '<=' {RLE}

  -- palavras reservadas 
  'if' {IF}
  'else' {ELSE}
  'while' {WHILE}
  'print' {Print}
  'read' {Read}
  'return' {Return}

  -- caracteres especiais 
  '(' {LPAR}
  ')' {RPAR}
  '{' {LCOL}
  '}' {RCOL}
  ',' {VIRG}
  '=' {IGUAL}
  ';' {PONTVIRG}

  -- constantes 
  CINT {INT $$}
  CFLOAT {FLOAT $$}
  CSTRING {LITERAL $$}
   
%%

Programa : ListaFuncoes BlocoPrincipal {Prog (map fst $1) (map transformaFuncao $1) (fst $2) (snd $2)}
         | BlocoPrincipal  {Prog [] [] (fst $1) (snd $1)}

ListaFuncoes : ListaFuncoes Funcao {$1 ++ [$2]} 
	       | Funcao {[$1]} 
 
Funcao : TipoRetorno Id '(' DeclParametros ')' BlocoPrincipal {($2:->:($4,$1), $6)}   
       | TipoRetorno Id '(' ')' BlocoPrincipal {($2 :->:([],$1), $5)}   

TipoRetorno : Tipo {$1} 
	      | 'void' {TVOID} 	   

Tipo : 'int' {TINT} 
     | 'string' {TSTRING} 
     | 'float' {TDOUBLE} 

DeclParametros : DeclParametros ',' Parametro { $1 ++ [$3]} 
	         | Parametro { [$1] }

Parametro : Tipo Id {$2:#:($1, 0)}

BlocoPrincipal : '{' Declaracoes ListaCmd '}'  { ($2, $3) }  
	         | '{' ListaCmd '}'  {([],$2)}

Declaracoes : Declaracoes Declaracao { $1 ++ $2 }
	      | Declaracao  {$1} 

Declaracao  : Tipo ListaId ';' {map (\x -> x:#: ($1,0)) $2} 

ListaId : ListaId ',' Id {$1 ++ [$3]} 
	  | Id  {[$1]} 

Bloco : '{' ListaCmd '}'  {$2} 

ListaCmd : ListaCmd Comando {$1 ++ [$2]} 
	| Comando {[$1]} 

Comando : CmdSe {$1}  
	| CmdEnquanto {$1} 
	| CmdAtrib {$1}
	| CmdEscrita {$1}
	| CmdLeitura {$1}
	| ChamadaProc {$1}
	| Retorno {$1}

Retorno : 'return' ArithmeticExpr ';' {Ret (Just $2)} 
	| 'return' ';' {Ret Nothing} 

CmdSe: 'if' '(' BooleanExpr ')' Bloco  {If $3 $5 []}
     | 'if'  '(' BooleanExpr ')' Bloco  'else'  Bloco {If $3 $5 $7} 

CmdEnquanto : 'while' '(' BooleanExpr ')' Bloco {While $3 $5} 

CmdAtrib : Id '=' ArithmeticExpr ';' {Atrib $1 $3}   

CmdEscrita : 'print' '(' ArithmeticExpr ')' ';' {Imp $3}  

CmdLeitura : 'read' '('Id ')' ';' {Leitura $3} 

ChamadaProc : ChamaFuncao ';' {Proc (fst $1) (snd $1)}  

ChamaFuncao : Id '(' ListaParametros ')' {($1,$3)} 
	    | Id'(' ')' {($1,[])} 
	 
ListaParametros : ListaParametros ',' ArithmeticExpr {$1 ++ [$3]} 
		| ArithmeticExpr {[$1]}  
			  
BooleanExpr : BooleanExpr '&&' Negacao {And $1 $3} 
            | BooleanExpr '||' Negacao {Or $1 $3} 
            | Negacao {$1}
            
Negacao : '!' NFator {Not $2} 
        | NFator {$1}

NFator : '(' BooleanExpr ')' {$2}
       | Booleanterm {Rel $1}

Booleanterm : ArithmeticExpr '>' ArithmeticExpr    {Rgt $1 $3} 
            | ArithmeticExpr '>=' ArithmeticExpr  {Rge $1 $3} 
            | ArithmeticExpr '<' ArithmeticExpr    {Rlt $1 $3} 
            | ArithmeticExpr '<=' ArithmeticExpr  {Rle $1 $3} 
            | ArithmeticExpr '==' ArithmeticExpr  {Req $1 $3} 
            | ArithmeticExpr '/=' ArithmeticExpr    {Rdif $1 $3} 

ArithmeticExpr  : '-' ArithmeticExpr  {Neg $2}
                | ArithExpr {$1}

ArithExpr  : ArithExpr '+' Term  {Add $1 $3}
           | ArithExpr '-' Term {Sub $1 $3}
           | Term {$1}

Term  : Term '*' Factor {Mul $1 $3}
      | Term '/' Factor {Div $1 $3}
      | Factor {$1}

Factor : CINT {Const (CInt $1)}
       | CFLOAT  {Const (CFloat $1)}
       | CSTRING  {Const (CString $1)}
       | Id {IdVar $1}
       | '(' ArithmeticExpr ')' {$2}
       | Id '('  ListaParametros ')' {Chama $1 $3}
       | Id '(' ')' {Chama $1 []}
       | '(' 'int' ')' Factor {DoubleInt $4}


{
parseError :: [Token] -> a
parseError s = error ("Parse error:" ++ show s)}

