module Token where

-- Definindo o tipo Token com diversos valores possíveis
data Token
  = 
  -- tipagem 
  TDouble 
  | TInt 
  | TString 
  | TVoid

  -- constantes 
  | FLOAT Double  
  | INT Int 
  | LITERAL String

  -- id 
  | ID String  

  -- operacoes 
  | ADD 
  | SUB 
  | MUL 
  | DIV 

  -- operacao bool 
  | AND 
  | OR 
  | NOT

  -- relacoes
  | REQ 
  | RDIF 
  | RLT 
  | RGT 
  | RLE 
  | RGE 

  -- palavras reservadas
  | IF 
  | ELSE 
  | WHILE 
  | Print 
  | Read 
  | Return

  -- caracteres especiais 
  | LPAR | RPAR -- parenteses
  | LCOL | RCOL -- colchetes
  | VIRG        -- virgula    
  | IGUAL       -- '='
  | PONTVIRG    -- para ponto e vírgula ';'
  
  deriving (Eq, Show)