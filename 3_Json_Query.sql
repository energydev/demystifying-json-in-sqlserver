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

SELECT JSON_QUERY(@json, '$.Characters')

--SELECT JSON_QUERY(@json, '$.Characters[0]')

--Adding strict allows us to see an error returned instead of null if an error occurs
--SELECT JSON_QUERY(@json, 'strict$.FranchiseName')




