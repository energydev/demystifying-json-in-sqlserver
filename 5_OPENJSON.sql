--------------------------------------------------------------------
--OPENJSON
--------------------------------------------------------------------

DECLARE @json NVARCHAR(4000) = 
N'{
        "QuoteID": 1,
        "Franchise": "Star Wars",
        "Character": "Yoda",
        "QuoteText": "Do. Or do not. There is no try."
  }';

SELECT * FROM OPENJSON(@json)


DECLARE @JSON2 NVARCHAR(4000) = 
N'[
    {
        "QuoteID": 1,
        "Franchise": "Star Wars",
        "Character": "Yoda",
        "QuoteText": "Do. Or do not. There is no try."
    },
    {
        "QuoteID": 2,
        "Franchise": "The Librarians",
        "Character": "Cassandra",
        "QuoteText": "Mathemagics. I like it.."
    }
]';

SELECT * FROM OPENJSON(@JSON2)

--Here's how to pull QuoteID, Character, and QuoteText into their own columns
--One additional note here is that the ordering of the columns in the json isn't impacting the openjson logic
DECLARE @JSON3 NVARCHAR(4000) = 
N'[
    {
        "QuoteID": 1,
        "Franchise": "Star Wars",
        "Character": "Yoda",
        "QuoteText": "Do. Or do not. There is no try."
    },
    {
        "Character": "Cassandra",
        "QuoteID": 2,
        "Franchise": "The Librarians",
        "QuoteText": "Mathemagics. I like it.."
    }
]';

SELECT * FROM OPENJSON(@JSON3)
	WITH (QuoteID INT, Character VARCHAR(100), QuoteText VARCHAR(1000))

--Example to pull out FranchiseID and FranchiseName into own columns
--and Characters JSON into own column
DECLARE @json4 NVARCHAR(4000) = 
N'{
    "FranchiseID": 4,
    "FranchiseName": "The Librarians",
    "Characters": [{"CharacterID": 2,"CharacterName": "Cassandra"},
                   {"CharacterID": 3,"CharacterName": "Ezekiel"},
                   {"CharacterID": 4,"CharacterName": "Jake"}]
  }';   

SELECT * FROM OPENJSON(@JSON4)
	WITH (ID INT '$.FranchiseID', Franchise VARCHAR(100) '$.FranchiseName', Characters nvarchar(MAX) '$.Characters' AS JSON)   

--Here's how you can upper case a value
DECLARE @json5 NVARCHAR(4000) = 
N'{
    "FranchiseID": 4,
    "FranchiseName": "The Librarians",
    "Characters": [{"CharacterID": 2,"CharacterName": "Cassandra"},
                   {"CharacterID": 3,"CharacterName": "Ezekiel"},
                   {"CharacterID": 4,"CharacterName": "Jake"}]
  }';   

SELECT ID, UPPER(Franchise), Characters FROM OPENJSON(@JSON5)
	WITH (ID INT '$.FranchiseID', Franchise VARCHAR(100) '$.FranchiseName', Characters nvarchar(MAX) '$.Characters' AS JSON)   

