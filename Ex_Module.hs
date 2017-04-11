-- import Data.List
-- import System.IO

module Ex_Module(getUse) where

getUse :: String -> String
getUse "hammer" = "Use to hammer"
getUse "saw" = "Use to saw"
getUse "robot" = "Pass the butter"
getUse _ = "Useless"
