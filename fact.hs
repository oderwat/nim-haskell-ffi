{-# LANGUAGE ForeignFunctionInterface #-}

import Foreign
import Foreign.C.Types

-- wrapper function for the nim compiled frac
foreign import ccall "fact"
  c_fact :: CLong -> CLong

-- well Haskell uses no unsigned int
fact' :: Int -> Int
fact' = fromIntegral . c_fact . fromIntegral

-- Let's call it!
main :: IO ()
main = do
  putStr "fact(20) = "
  print $ fact' 20

  -- notice how 21 will segfault because
  -- of the overflow exception Nim generates!
