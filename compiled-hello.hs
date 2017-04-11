import Data.List
import System.IO

{-
COMPILATION COMMAND:
        ghc --make <name>
-}

main = do
    putStrLn "What is your name: "
    name <- getLine
    putStrLn ("Hello " ++ name)
