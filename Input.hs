
module Input where

import Data.Maybe (listToMaybe)

main :: IO()
main = do
	n <- grab
	putStr "You entered: "
	putStrLn (show n)

-- function for verifying user input: http://stackoverflow.com/questions/2931557/haskell-check-for-user-input-errors
maybeRead :: Read a => String -> Maybe a
maybeRead = fmap fst . listToMaybe . filter (null . snd) . reads

-- used for grabbing any sort of user input. Uses recursion to reprompt in event of user input errors.
grab :: IO(Int)
grab = do
	putStr "Enter an integer: "
	x <- fmap maybeRead getLine :: IO (Maybe Int)
	case x of
  	  Just x -> return x
  	  Nothing -> grab
