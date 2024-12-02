{
module Lex where
import System.IO 
import Token
}

%wrapper "basic"

$digit = [0-9]          -- digits
$alpha = [A-Za-z]       -- chars



@int = $digit+
@float = $digit+(\.$digit+)
@id = $alpha [$alpha  $digit]*
@literal = \"[^ \"]*\" 

tokens :-

-- trata espaço em branco
<0> $white+ ;

-- Operações Aritméticas  
<0> "+" {\s -> ADD}  
<0> "-" {\s -> SUB}  
<0> "*" {\s -> MUL}  
<0> "/" {\s -> DIV}  

-- caracteres especiais 
<0> "(" {\s -> LPAR}  
<0> ")" {\s -> RPAR}
<0> "{" {\s -> LCOL}
<0> "}" {\s -> RCOL}
<0> "," {\s -> VIRG}
<0> ";" {\s -> PONTVIRG}
<0> "=" {\s -> IGUAL}

-- Booleanas e relacionais
<0> "/=" {\s -> RDIF}
<0> "||" {\s -> OR} 
<0> "&&" {\s -> AND} 
<0> "!" {\s -> NOT} 
<0> "==" {\s -> REQ}
<0> ">" {\s -> RGT}
<0> ">=" {\s -> RGE}
<0> "<" {\s -> RLT} 
<0> "<=" {\s -> RLE}

-- Controle de fluxo
<0> "if" {\s -> IF} 
<0> "else" {\s -> ELSE}
<0> "while" {\s -> WHILE} 
<0> "return" {\s -> Return}
<0> "print" {\s -> Print} 
<0> "read" {\s -> Read} 


-- Tipagem 
<0> "int" {\s -> TInt} 
<0> "string" {\s -> TString} 
<0> "float" {\s -> TDouble} 
<0> "void" {\s -> TVoid} 


-- token p número e literal
<0> @id {\s -> ID s}
<0> @float {\s -> FLOAT (read s)} 
<0> @int {\s -> INT (read s)} 
<0> @literal {\s -> LITERAL (read s)} 


-- Serve para mostrar erro caso n reconheça caracter
<0> . { \s -> error ("lexical error: " ++ show s) }

{
-- As ações têm tipo :: String -> Token

testLex = do 
    handle <- openFile "texto.txt" ReadMode
    contents <- hGetContents handle
    print (alexScanTokens contents) 
    hClose handle
}