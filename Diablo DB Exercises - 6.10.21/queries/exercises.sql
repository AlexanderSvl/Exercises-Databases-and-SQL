USE Diablo

--Exercise 1
SELECT * 
FROM [GameTypes]

--Exercise 2
SELECT [Items].[Name], [Items].[Price], [Items].[MinLevel]
FROM [Items]
WHERE [Items].[Price] BETWEEN '790' AND '800'

--Exercise 3
SELECT [Games].[Name], [Games].[IsFinished] 
FROM [Games]
WHERE [Games].[Duration] IS NULL

--Exercise 4
SELECT TOP(5) [Items].[Name], [Items].[Price] 
FROM [Items]
ORDER BY [Items].[Price] DESC

--Exercise 5
UPDATE [Items]
SET [Price] = [Price] * 1.1
WHERE [Items].[MinLevel] = 24
   OR [Items].[MinLevel] = 41 
   OR [Items].[MinLevel] = 8
   OR [Items].[MinLevel] = 18
SELECT [Items].[Price] 
FROM [Items]

--Exercise 6
SELECT TOP(50) [Games].[Name], [Games].[Start], [GameTypes].[Name] AS 'GameTypeName'
FROM [Games]
JOIN [GameTypes] ON [Games].[GameTypeId] = [GameTypes].[Id]
ORDER BY [Games].[Duration] ASC

--Exercise 7
SELECT [Items].[Name] AS 'Item Name', 
       [Items].[Price], 
	   [ItemTypes].[Name] AS 'Item Type', 
	   [Statistics].[Speed], 
	   [Statistics].[Luck]
FROM [Items]
JOIN [ItemTypes] ON [ItemTypes].[Id] = [Items].[ItemTypeId]
JOIN [Statistics] ON [Items].[StatisticId] = [Statistics].[Id]
WHERE [Items].[MinLevel] = 76
ORDER BY [Statistics].[Luck] DESC

--Exercise 8
SELECT 
   [Users].[Username], 
   [Games].[Name], 
   [UsersGames].[Level], 
   [UsersGames].[Cash]
FROM [Games]
JOIN [UsersGames] ON [Games].[Id] = [UsersGames].[GameId]
JOIN [Users] ON [Users].[Id] = [UsersGames].[UserId] 
WHERE [Games].[Start] > '1.1.2015' AND ([Games].[Duration] = 5 OR [Games].[Duration] = 7)