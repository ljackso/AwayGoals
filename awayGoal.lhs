Away Goals Rule 
--------------------------------------------------------------------------------------------------

Data Types used. For Score is in format; Score (Home Goals) (Away Goals). 

> data Score                = Result Goals Goals
>                               deriving Show
>
> type Goals                = Int
>
> data Outcome              = Draw | A | B
>                               deriving (Show, Eq)

--------------------------------------------------------------------------------------------------
A bunch of test scores to stop me having to write out new scores every time!
 
> test                      :: Score 
> test                      = Result 1 0
>
> test1                     :: Score
> test1                     = Result 2 0
>
> test2                     :: Score 
> test2                     = Result 3 0
> 
> test3                     :: Score
> test3                     = Result 2 2
>
> test4                     :: Score
> test4                     = Result 1 1
>
> test5                     :: Score
> test5                     = Result 0 0

--------------------------------------------------------------------------------------------------

Works out the outcome of a match that has been played over 2 legs where team A is at home first. If
both teams have scored the same amount of away goals in a draw, it still returns a draw

> getOutcome                :: Score -> Score -> Outcome
> getOutcome l1 l2          | resultNoRule /= Draw      = resultNoRule
>                           | otherwise                 = getGameOutcome (Result aA aB) 
>                               where
>                                   aA              = getAwayGoals l2
>                                   aB              = getAwayGoals l1
>                                   overallScore    = Result ((getHomeGoals l1) + aA) ((getHomeGoals l2) + aB)
>                                   resultNoRule    = getGameOutcome overallScore
>    


Gets a single matches outcome, team A is assumed to be the home team

> getGameOutcome             :: Score -> Outcome
> getGameOutcome (Result a b)
>                           | (a > b)       = A
>                           | (a < b)       = B
>                           | otherwise     = Draw 


Gets the number of home goals scored in a single match 

> getHomeGoals              :: Score -> Goals
> getHomeGoals (Result h a) = h


Gets the number of away goals scored in a single match 

> getAwayGoals              :: Score -> Goals 
> getAwayGoals (Result h a) = a


