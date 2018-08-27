----------------------------------------------------------------------------------
--FOR JSON AUTO
----------------------------------------------------------------------------------

--SELECT * FROM dbo.Franchise
--SELECT * FROM dbo.Character

SELECT * 
FROM dbo.Franchise
FOR JSON AUTO

SELECT CharacterID, CharacterName, Description
FROM dbo.Character
FOR JSON AUTO

SELECT CharacterID, CharacterName, Description
FROM dbo.Character
FOR JSON AUTO, INCLUDE_NULL_VALUES

SELECT * 
FROM dbo.Franchise
FOR JSON AUTO, ROOT('Franchises')

--Order of the columns in the select statement impacts the results beyond column ordering. It impacts the nesting
SELECT Franchise.FranchiseID, Franchise.FranchiseName, Character.CharacterID, Character.CharacterName
FROM Franchise 
INNER JOIN Character ON (Franchise.FranchiseID = Character.FranchiseID)
FOR JSON AUTO

SELECT Character.CharacterID, Character.CharacterName, Franchise.FranchiseID, Franchise.FranchiseName
FROM Franchise 
INNER JOIN Character ON (Franchise.FranchiseID = Character.FranchiseID)
FOR JSON AUTO

--Change the alias naming to change the property names
SELECT Franchise.FranchiseID, Franchise.FranchiseName, Characters.CharacterID AS ID, Characters.CharacterName AS Name
FROM Franchise 
INNER JOIN Character AS Characters ON (Franchise.FranchiseID = Characters.FranchiseID)
FOR JSON AUTO

--Let's take a look at character escaping

--SELECT * from dbo.Quote

SELECT * FROM dbo.Quote
FOR JSON AUTO

--Let's say we wanted JSON for each individual Quote
--This gets us started, however, we have built in nesting. FOR JSON PATH allows us to flatten out down to top level properties only
SELECT Quotes.QuoteID, QuoteText AS Quote, Franchise.FranchiseName, Characters.CharacterName
FROM Franchise 
INNER JOIN Character AS Characters ON (Franchise.FranchiseID = Characters.FranchiseID)
INNER JOIN Quote AS Quotes on (Characters.CharacterID = Quotes.CharacterID)
FOR JSON AUTO