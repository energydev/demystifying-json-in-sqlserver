DECLARE @json NVARCHAR(4000) = 
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

SELECT ISJSON(@json) -- returns 1

SELECT ISJSON(N'NotJson') -- returns 0

SELECT ISJSON(null) --returns null