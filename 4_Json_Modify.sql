DECLARE @json NVARCHAR(4000) = 
N'{
    "FranchiseID": 4,
    "FranchiseName": "The Librarians",
    "Characters": [
        {
            "CharacterID": 2,
            "CharacterName": "Cassandra"
        },
        {
            "CharacterID": 3,
            "CharacterName": "Ezekiel"
        },
        {
            "CharacterID": 4,
            "CharacterName": "Jake"
        }
    ]
  }';

--Modify property
SELECT JSON_MODIFY(@json, '$.FranchiseName', 'TNT The Librarians')

--Add property, since not already there
--SELECT JSON_MODIFY(@json, '$.FranchiseProducer', 'Dean Devlin')

--Delete property, since making value null
--SELECT JSON_MODIFY(@json, '$.FranchiseName', NULL )

--Add property to first character object
--SELECT JSON_MODIFY(@json, '$.Characters[0].Actor', 'Lindy Booth')

--Insert additional JSON object to JSON array, but this code won't work as expected
--SELECT JSON_MODIFY(@json, 'append $.Characters', '{"CharacterID": 5,"CharacterName": "Colonel Eve Baird"}')

--Insert additional JSON object to JSON array 
--SELECT JSON_MODIFY(@json, 'append $.Characters', JSON_QUERY('{"CharacterID": 5,"CharacterName": "Colonel Eve Baird"}'))








