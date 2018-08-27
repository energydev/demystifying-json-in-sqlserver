--This is the FOR JSON AUTO query that gives us one row per quote, but has nested properties
SELECT Quotes.QuoteID, QuoteText AS Quote, Franchise.FranchiseName, Characters.CharacterName
FROM Franchise 
INNER JOIN Character AS Characters ON (Franchise.FranchiseID = Characters.FranchiseID)
INNER JOIN Quote AS Quotes on (Characters.CharacterID = Quotes.CharacterID)
FOR JSON AUTO

--The only difference here is using FOR JSON PATH
SELECT Quotes.QuoteID, QuoteText AS Quote, Franchise.FranchiseName, Characters.CharacterName
FROM Franchise 
INNER JOIN Character AS Characters ON (Franchise.FranchiseID = Characters.FranchiseID)
INNER JOIN Quote AS Quotes on (Characters.CharacterID = Quotes.CharacterID)
FOR JSON PATH

--The only other difference here is using ROOT
SELECT Quotes.QuoteID, QuoteText AS Quote, Franchise.FranchiseName, Characters.CharacterName
FROM Franchise 
INNER JOIN Character AS Characters ON (Franchise.FranchiseID = Characters.FranchiseID)
INNER JOIN Quote AS Quotes on (Characters.CharacterID = Quotes.CharacterID)
FOR JSON PATH, ROOT('Quotes')


----------------------------------------------------------------------------------
--FOR JSON AUTO
--	Requires tables
----------------------------------------------------------------------------------

SELECT 1 AS X, 2 AS Y, 3 AS Z
FOR JSON AUTO

----------------------------------------------------------------------------------
--FOR JSON PATH
--	Can use without tables
--	Can use against tables (like initial example above)
----------------------------------------------------------------------------------

SELECT 1 AS X, 2 AS Y, 3 AS Z
FOR JSON PATH

SELECT 1 AS [axis.X], 2 AS [axis.Y], 3 AS [axis.point.Z]
FOR JSON PATH

SELECT 1 AS [axis.X], 2 AS [axis.Y], 3 AS [axis.point.Z]
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER

