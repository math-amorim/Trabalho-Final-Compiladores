module Main where

import System.IO
import Token
import Parser as P
import qualified Lex as L
import AS_Abs
import Semantic 


main :: IO ()
main = do
    -- Abre o arquivo de entrada para leitura
    handle <- openFile "texto.txt" ReadMode
    contents <- hGetContents handle

    -- Abre o arquivo de saída para escrita
    outputHandle <- openFile "resultados.txt" WriteMode
    hSetEncoding outputHandle utf8  

    -- Aqui faz a análise léxica
    let tokens = L.alexScanTokens contents
    
    putStrLn "Tokens gerados pela análise léxica: "
    print tokens -- Imprime a lista de tokens
    putStrLn "\n"

    hPutStrLn outputHandle "Tokens gerados pela análise léxica:"
    hPutStrLn outputHandle (show tokens)  -- Convertendo a lista de tokens para string e botando no arquivo de saída
    hPutStrLn outputHandle "\n"

    -- Aqui faz a análise sintática
    let ast = P.calc tokens
    putStrLn "Árvore Abstrata gerada pela análise sintática: "
    print ast -- Imprime AST
    putStrLn "\n"

    hPutStrLn outputHandle "Árvore Abstrata gerada pela análise sintática:"
    hPutStrLn outputHandle (show ast)  -- Passa a AST pro arquivo
    hPutStrLn outputHandle "\n"

    -- Faz a análise semântica
    let MS (mensagens, resultado) = analisarSemantica ast
    putStrLn "Resultados da análise semântica: "
    let MS (mensagens, resultado) = analisarSemantica ast
    putStrLn mensagens -- Imprime erros ou avisos
    print resultado -- Imprime o resultado final 

    hPutStrLn outputHandle "Resultados da análise semântica:"
    hPutStrLn outputHandle mensagens  -- Escreve erros ou avisos no arquivo
    hPutStrLn outputHandle (show resultado)  -- Escreve o resultado final no arquivo

    hClose handle
    hClose outputHandle