--DELETE dbo.episode
--SELECT * FROM dbo.episode

declare @episodes nvarchar(max) = '
[{
  "id" : 1,
  "title": "And the Crown of King Arthur",
  "franchiseID": 1,
  "director": "Dean Devlin",
  "usViewersMillions": 5.35
},
{
  "id" : 2,
  "title": "And the Sword in the Stone",
  "franchiseID": 1,
  "director": "Dean Devlin",
  "writers": ["John Rogers"]
},{
  "id" : 3,
  "title": "And Santa''s Midnight Run",
  "franchiseID": 1,
  "director": "Jonathan Frakes",
  "usViewersMillions": 3.37
}]'

  INSERT INTO dbo.episode (EpisodeID, EpisodeTitle, FranchiseID, EpisodeJson)
    SELECT * FROM OPENJSON(@episodes)
    WITH (EpisodeID int '$.id',
          EpisodeTitle varchar(100) '$.title',
          FranchiseID int '$.franchiseID',
          EpisodeJson nvarchar(MAX) N'$' AS JSON  )


 SELECT * FROM dbo.episode

 SELECT * FROM dbo.episode
 WHERE ISJSON(EpisodeJSON) = 1
 AND JSON_VALUE(EpisodeJSON, '$.director') = 'Dean Devlin'

SELECT * FROM dbo.episode
 WHERE ISJSON(EpisodeJSON) = 1
 AND JSON_VALUE(EpisodeJSON, '$.usViewersMillions') > 5.00

 --add usViewersMillions to the second episode 
SELECT episodeJson FROM dbo.episode
--UPDATE dbo.episode set EpisodeJson = JSON_MODIFY(EpisodeJson, '$.usViewersMillions', 4.00 ) 
 WHERE ISJSON(EpisodeJSON) = 1
 AND JSON_VALUE(EpisodeJSON, '$.id') = 2

--update usViewersMillions value to 5.35 on the second episode
 SELECT episodeJson FROM dbo.episode
--UPDATE dbo.episode set EpisodeJson = JSON_MODIFY(EpisodeJson, '$.usViewersMillions', 5.35 ) 
 WHERE ISJSON(EpisodeJSON) = 1
 AND JSON_VALUE(EpisodeJSON, '$.id') = 2











