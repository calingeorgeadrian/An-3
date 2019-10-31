
-- la nevoie decomentati liniile urmatoare:

import Data.Char
-- import Data.List


---------------------------------------------
-------RECURSIE: FIBONACCI-------------------
---------------------------------------------

fibonacciCazuri :: Integer -> Integer
fibonacciCazuri n
  | n < 2     = n
  | otherwise = fibonacciCazuri (n - 1) + fibonacciCazuri (n - 2)

fibonacciEcuational :: Integer -> Integer
fibonacciEcuational 0 = 0
fibonacciEcuational 1 = 1
fibonacciEcuational n =
    fibonacciEcuational (n - 1) + fibonacciEcuational (n - 2)

{-| @fibonacciLiniar@ calculeaza @F(n)@, al @n@-lea element din secvența
Fibonacci în timp liniar, folosind funcția auxiliară @fibonacciPereche@ care,
dat fiind @n >= 1@ calculează perechea @(F(n-1), F(n))@, evitănd astfel dubla
recursie. Completați definiția funcției fibonacciPereche.

Indicație:  folosiți matching pe perechea calculată de apelul recursiv.
-}
fibonacciLiniar :: Integer -> Integer
fibonacciLiniar 0 = 0
fibonacciLiniar n = snd (fibonacciPereche n)
  where
    fibonacciPereche :: Integer -> (Integer, Integer)
    fibonacciPereche 1 = (0, 1)
    fibonacciPereche n = let (x,y) = fibonacciPereche(n-1)
                         in (y,x+y)

---------------------------------------------
----------RECURSIE PE LISTE -----------------
---------------------------------------------
semiPareRecDestr :: [Int] -> [Int]
semiPareRecDestr l
  | null l    = l
  | even h    = h `div` 2 : t'
  | otherwise = t'
  where
    h = head l
    t = tail l
    t' = semiPareRecDestr t

semiPareRecEq :: [Int] -> [Int]
semiPareRecEq [] = []
semiPareRecEq (h:t)
  | even h    = h `div` 2 : t'
  | otherwise = t'
  where t' = semiPareRecEq t

---------------------------------------------
----------DESCRIERI DE LISTE ----------------
---------------------------------------------
semiPareComp :: [Int] -> [Int]
semiPareComp l = [ x `div` 2 | x <- l, even x ]


-- L2.2
inIntervalRec :: Int -> Int -> [Int] -> [Int]
inIntervalRec lo hi xs 
    | null xs = xs
    | h >= lo && h <= hi = h : xs'
    | otherwise = xs'
    where
        h = head xs
        t = tail xs
        xs' = inIntervalRec lo hi t

inIntervalComp :: Int -> Int -> [Int] -> [Int]
inIntervalComp lo hi xs = [ x | x <- xs, lo <= x && x <= hi ]

-- L2.3

pozitiveRec :: [Int] -> Int
pozitiveRec l 
    | null l  = 0
    | h > 0 = 1 + l'
    | otherwise = l'
    where
        h = head l
        t = tail l
        l' = pozitiveRec t

pozitiveComp :: [Int] -> Int
pozitiveComp l = length [ x | x <- l, x > 0 ]

-- L2.4 
pozitiiImpareRec :: [Int] -> [Int]
pozitiiImpareRec l = pozitiiImpareRec2 l [0..length l - 1]

pozitiiImpareRec2 :: [Int] -> [Int] -> [Int]
pozitiiImpareRec2 l i
    | null l = l
    | odd h = hi : l'
    | otherwise = l'
    where
        h = head l
        hi = head i
        ti = tail i
        t = tail l
        l' = pozitiiImpareRec2 t ti


pozitiiImpareComp :: [Int] -> [Int]
pozitiiImpareComp l = [ y | (x,y) <- zip l [1..length l], odd x ]


-- L2.5

multDigitsRec :: String -> Int
multDigitsRec sir 
    | null sir = 1 
    | isDigit h = digitToInt h * s'
    | otherwise = s'
    where
        h = head sir
        t = tail sir
        s' = multDigitsRec t        

multDigitsComp :: String -> Int
multDigitsComp sir = product [ digitToInt x | x<- sir, isDigit x ]

-- L2.6 

discountRec :: [Float] -> [Float]
discountRec list
    | null list = list
    | h' < 200 = h' : t'
    | otherwise = t'
    where 
        h = head list
        h' = h * 0.75
        t = tail list
        t' = discountRec t
        
discountComp :: [Float] -> [Float]
discountComp list = [ x * 0.75 | x <- list, x * 0.75 < 200 ]


