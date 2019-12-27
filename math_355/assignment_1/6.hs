-- f maps two numbers onto one using a key. (not an onto function, is one-to-one)
-- a can be any integer
-- b has to be integer greater than or equal to 1
-- The key (n) has to be a integer greater than 1

-- For f to be a function from Q to Z:
-- (a/b) becomes the unique irreducible fraction form of a rational number.
-- And the key (n) becomes a constant
f :: Integer -> Integer -> Integer -> Integer
f a b n
    | a >= 0 = ans
    | otherwise = -ans
    where
        m = max (abs a) b
        d = (floor (logBase (fromIntegral n) (fromIntegral m))) + 1
        ans = (n ^ (2 * d)) + (n ^ d * (abs a)) + b

-- "Decrypts" an output of f with the key
f_inverse :: Integer -> Integer -> String
f_inverse z n
    | z >= 0 = ans
    | otherwise = "-" ++ ans
    where
        d = (floor (logBase (fromIntegral n) (fromIntegral (abs z)))) `div` 2
        z' = (abs z) `mod` (n ^ (2 * d))
        a = z' `div` (n ^ d)
        b = z' `mod` (n ^ d)
        ans = show a ++ " / " ++ show b


-- h maps three numbers onto one using a the third number to generate the key.
-- returns the result and the key
h :: Integer -> Integer -> Integer -> [Integer]
h a b c = [code, key]
    where
        a' = abs a
        b' = abs b
        c' = abs c
        -- key can be any function which the output is >= 2
        key = ((137 * c) `mod` 100003) + 2
        --
        -- Test
        -- Main> h (-631278) 432132 (-1238790432)
        -- [774510464155919780562216885444,2094]
        -- Main> h_inverse 774510464155919780562216885444 2094
        -- [-631278,432132,-2266680]
        -- 
        -- key = 10
        m = maximum [a', b', c']
        d = (floor (logBase (fromIntegral key) (fromIntegral m))) + 2
        i = key ^ d
        sa | a >= 0 = 0
            | otherwise = key ^ (d - 1)
        sb | b >= 0 = 0
            | otherwise = key ^ (d - 1)
        sc | c >= 0 = 0
            | otherwise = key ^ (d - 1)
        code = (i ^ 3) + ((i ^ 2) * (a' + sa)) + ((i ^ 1) * (b' + sb)) + (c' + sc)

-- "Decrypts" an output of h with the key
h_inverse :: Integer -> Integer -> [Integer]
h_inverse code key = [a, b, c]
    where
        d = (floor (logBase (fromIntegral key) (fromIntegral code))) `div` 3
        ccode = code -- Trash code, use a list or something for the general case
        c' = ccode `mod` (key ^ (d - 1))
        sc = ccode `mod` (key ^ d)
        bcode = ccode `div` (key ^ d)
        b' = bcode `mod` (key ^ (d - 1))
        sb = bcode `mod` (key ^ d)
        acode = bcode `div` (key ^ d)
        a' = acode `mod` (key ^ (d - 1))
        sa = acode `mod` (key ^ d)
        c | sc == c' = c'
            | otherwise = - c'
        b | sb == b' = b'
            | otherwise = - b'
        a | sa == a' = a'
            | otherwise = - a'