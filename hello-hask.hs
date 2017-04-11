import Data.List
import System.IO

{-
    Data Types--
        Int: (-2^63, 2^63)
        Integer: Unbounding whole number (big as memory can hold)
        Float: Single precision
        Double: 11 point precision
        Bool
        Char: Single unicode; ' ' denoted
        Tuple: Lists, generally 2 values

        Value declaration:
            always5 :: Int
            always5 = 5

        Prefix operator:
            modEx = mod 5 4

        Infix operator:
            modEx = 5 `mod` 4

        Negative handling:
            negNumEx = 5 + (-4)

        Math stuff:
            - trig functions (sin, cos, etc...)
            - pi, exp, log
            - truncate, round, ceiling, floor
            - logical operators
            - not(...)

        Lists:
            - singly linked
            - can only add to front
            - concatenation
                * list1 ++ list2
            - cons operator: :
                * combine numbers into List
                * myNums = 2 : 7 : 66 : []
            - nested lists
                * [[], []]
            - operators
                * length
                * sum
                * null: checks if empty
                * reverse
                * !!: index access
                * head
                * last
                * init: everything except last
                * take: return first n elements
                * drop: returns everything except first n
                * elem: detects if list contains element
                    + use as infix with parameter
                * maximum, minimum
                * product: LCD
                * sort
                * zipWith: zip two lists with operation
                * filter
                * takeWhile: take with operation
                * foldl
                *list generation
                    + constant: [0..10]
                    + w/steps: [2,4..20] ; even list 2 -> 20
                    + character list: ['A', 'C'..'Z']
                    + infinite: [2,4,..]
                        ~ lazy evaluations
                        ~ won't create until we request information,
                            then will only generate what we need
                    + repeat: generates infinte repetitions
                        ~ use in conjunction with take to bound amount
                    + cycle: repeate with variation
                    + operations over lists
                        ~ Example
        Tuples:
            - lists but do not need to be same type
            - usually tuple pairs (like most contexts)
            - declaration: (1, "Random Tuple")
            - operations:
                * fst: first element
                * snd: second element
                * zip: combines two lists into pairs of list items

        Functions:
            - type declaration & implementation vs solo implementation and type prediciton
            - Must return something
            - cannot begin with Uppercase
            - functions w/o paramters are called definitions or names

        Conditionals:
            - if
                then
                else

        Modules:
            - Contain functions that can be used elsewhere
            - accessed with import

        Enumerated Type:
            - List of available types

        Custom Types:
            - Store multiple values
            - like struct

        Type Variations:
            - data <name> = type1 | type2






        GOOD EXAMPLES FOR PRESENTATION:
            -sumOfNums = sum[1..1000]
            -Infix vs. Prefix operator
            - :t sqrt
            - List: foldl
            - List comprehensions
            - factorial change Int to Integer and do large number

        OTHER NOTES:
            - strict compilier, very safe
            - no for loop, not really a while
            - haskell is lazy: only uses when you need it
                * EX: inifinite list generation
            - Higher order functions
            - recursion oriented
-}

{--Lists--}
--Fold Left
multOfList = foldl (*) 1 [2,3,4,5]

--List Comprehensions
listDivisBy9And13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]

multTable = [[x * y | y <- [1..10]] | x <- [1..10]]

pow3List = [3^n | n <- [0..10]]



{--Functions--}

--Type Declaration: Receives -> Receives -> Returns
addMe :: Int -> Int -> Int

--funcName param1 param2 = operations (returned value)
addMe x y = x + y

--more examples
addTuples (x, y) (x2, y2) = (x + x2, y + y2)

whatAge :: Int -> String

whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You can drink!"
whatAge x = "Who cares"



{--Recursion--}
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n-1)

prodFact n = product [1..n]



{--Guards--}
-- | : syntax
isOdd :: Int -> Bool
isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

whatGrade :: Int -> String
whatGrade age
    | (age >= 5) && (age <=6) = "Kintergarten"
    | (age >= 6) && (age <=10) = "Elementary"
    | (age >= 10) && (age <=14) = "Middle"
    | (age >= 14) && (age <=18) = "High School"
    | otherwise = "Git a jab"



{--Higher Order Functions--}
times4 :: Int -> Int
times4 x = x * 4

--with map
listTimes4 = map times4 [1,2,3,4,5]

--explicitely declared with recursion
multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4(x:xs) = times4 x : multBy4 xs

--receive function
doMult :: (Int -> Int) -> Int
doMult func = func 3

num3Times4 = doMult times4

--return function
-- getAddFunc :: Int -> (Int -> Int)
--
-- getAddFunct x y = x + y
--
-- adds3 getAddFunc 3
--
-- fourPlus3 = adds3 4



{--Lambdas--}
double1To10 = map (\x -> x * 2) [1..10]



{--Conditionals--}
doubleEvenNumber y =
    if (y `mod` 2 /= 0)
        then y
        else y*2



{--Case COnditionals--}
getClass n = case n of
    5 -> "Go to bed"
    16 ->"Go to school"
    _ -> "Go away"



{--Enumerators--}
data SoccerPlayer = Striker
                  | Midfield
                  | Defenseman
                  | Goalie
                  deriving Show

beckham :: SoccerPlayer -> Bool
beckham Midfield = True



{--Custom Types--}
data Customer = Customer String String Double
    deriving Show

edEastwood :: Customer
edEastwood = Customer "Ed Eastwood" "666 Mars" 1234.56

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

data RPS = Rock | Paper | Scissors
shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper Beats Rock"
shoot Rock Scissors = "Rock beats scissors"
shoot Scissors Paper = "Scissors beats paper"
shoot _ _ = "Error"
