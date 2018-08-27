DECLARE @json NVARCHAR(4000) = 
N'{
    "FranchiseID": 4,
    "FranchiseName": "The Librarians",
    "Characters": [
        {
            "CharacterID": 2,--
            "CharacterName": "Cassandra"
        },
        {--
            "CharacterID": 3,
            "CharacterName": "Ezekiel"
        },
        {
            "CharacterID": 4,
            "CharacterName": "Jake"
        }
    ]
  }';

SELECT FranchiseID = JSON_VALUE(@json, '$.FranchiseID')

--SELECT FranchiseName = JSON_VALUE(@json, '$.FranchiseName')

--SELECT FirstCharacterName = JSON_VALUE(@json, '$.Characters[0].CharacterName')

--SELECT CHARACTERS = JSON_VALUE(@json, '$.Characters')

--SELECT CHARACTERS = JSON_VALUE(@json, 'strict $.Characters')
