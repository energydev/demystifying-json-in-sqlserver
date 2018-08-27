--This script creates the demo tables and their corresponding seed data

CREATE TABLE dbo.Franchise(
	FranchiseID int IDENTITY(1,1) NOT NULL,
	FranchiseName varchar(100) NOT NULL,
	Description varchar(1000) NULL
	CONSTRAINT PK_Franchise PRIMARY KEY CLUSTERED 
	(
		FranchiseID ASC
	)
)


CREATE TABLE dbo.Character(
	CharacterID int IDENTITY(1,1) NOT NULL,
	CharacterName varchar(100) NOT NULL,
	Description varchar(1000) NULL, 
	FranchiseID int NOT NULL
	CONSTRAINT PK_Character PRIMARY KEY CLUSTERED 
	(
		CharacterID ASC
	),
	FOREIGN KEY (FranchiseID) REFERENCES Franchise(FranchiseID)
)

CREATE TABLE dbo.Quote(
	QuoteID int IDENTITY(1,1) NOT NULL,
	CharacterID int NOT NULL,
	QuoteText varchar(1000) NOT NULL
	CONSTRAINT PK_Quote PRIMARY KEY CLUSTERED
	(
		QuoteID ASC
	),
	FOREIGN KEY (CharacterID) REFERENCES Character(CharacterID)
)

CREATE TABLE dbo.Episode(
	EpisodeID INT NOT NULL,
	EpisodeTitle varchar(100) NOT NULL,
	FranchiseID int NOT NULL,
	EpisodeJson nvarchar(4000) NOT NULL,
	CONSTRAINT PK_Episode PRIMARY KEY CLUSTERED 
	(
		EpisodeID ASC
	),
	FOREIGN KEY (FranchiseID) REFERENCES Franchise(FranchiseID)
)


SET IDENTITY_INSERT dbo.Franchise ON

INSERT dbo.Franchise
(FranchiseID, FranchiseName, Description)
VALUES
(1, 'The Librarians', 'The Librarians are the guardians of powerful and magical relics')

INSERT dbo.Franchise
(FranchiseID, FranchiseName, Description)
VALUES
(2, 'Eureka', 'Scientific geniuses live in the fictional town of Eureka, Oregon')

SET IDENTITY_INSERT dbo.Franchise OFF


SET IDENTITY_INSERT dbo.Character ON

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(1, 'Flynn', NULL, 1)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(2, 'Eve', NULL, 1)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(3, 'Cassandra', 'A mathematician and scientist with synesthesia.', 1)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(4, 'Ezekiel', NULL, 1)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(5, 'Jake', NULL, 1)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(6, 'Jenkins', NULL, 1)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(7, 'Jack Carter', NULL, 2)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(8, 'Allison Blake', NULL, 2)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(9, 'Jo Lupo', NULL, 2)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(10, 'Douglas Fargo', NULL, 2)

INSERT dbo.Character
(CharacterID, CharacterName, Description, FranchiseID)
VALUES
(11, 'Henry Deacon', NULL, 2)

SET IDENTITY_INSERT dbo.Character OFF


SET IDENTITY_INSERT dbo.Quote ON

INSERT dbo.Quote
(QuoteID, CharacterID, QuoteText)
VALUES
(1, 4, '"Crazy"? So, on a scale of "running from minotaurs" to "Santa Claus is now a best mate of ours," where would a time loop fall?')

INSERT dbo.Quote
(QuoteID, CharacterID, QuoteText)
VALUES
(2, 3, 'It''s "Brain Robbers From Planet Alpha Xenon Six." A classic.')

INSERT dbo.Quote
(QuoteID, CharacterID, QuoteText)
VALUES
(3, 5, 'Architecture is just art we live in. Why doesn''t anybody get that?')

INSERT dbo.Quote
(QuoteID, CharacterID, QuoteText)
VALUES
(4, 3, 'Magic''s real.')


SET IDENTITY_INSERT dbo.Quote OFF


