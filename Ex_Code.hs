import Data.List
import System.IO
--import Ex_Module(getUse)

{--Lists--}
--Infinite (lazy eval)
infinite = [2,4..]


--Fold Left
multOfList = foldl (*) 1 [2,3,4,5]

--List Comprehensions




{--Recursion--}
--Overload with big number, then switch to Integer
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)


addTuples (x, y) (x2, y2) = (x + x2, y + y2)
