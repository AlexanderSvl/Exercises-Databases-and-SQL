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

--Exercise 9
CREATE DATABASE DB_01

USE DB_01

CREATE TABLE [Passports](
   [PassportID] INT PRIMARY KEY IDENTITY (100,1),
   [PassportNumber] VARCHAR(50)
);

CREATE TABLE [Persons](
   [PersonID] INT PRIMARY KEY IDENTITY (1,1),
   [FirstName] VARCHAR(50) NOT NULL,
   [Salary] FLOAT NOT NULL,
   [PassportID] INT,
   FOREIGN KEY ([PassportID]) REFERENCES [Passports]([PassportID])
);

--Exercise 10
CREATE TABLE [Manufacturers] (
   [ManufacturerID] INT PRIMARY KEY IDENTITY (1,1),
   [Name] VARCHAR(50),
   [EstablishedOn] VARCHAR(50),
);

CREATE TABLE [Models] (
   [ModelID] INT NOT NULL PRIMARY KEY IDENTITY (100,1),
   [Name] VARCHAR(50) NOT NULL,
   [ManufacturerID] INT NOT NULL
   FOREIGN KEY ([ManufacturerID]) REFERENCES [Manufacturers]([ManufacturerID])
);

--Exercise 11
CREATE TABLE [Students] (
   [StudentID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
   [Name] VARCHAR (50)
);

CREATE TABLE [Exams] (
   [ExamID] INT NOT NULL PRIMARY KEY IDENTITY(100,1),
   [Name] VARCHAR (50)
);


CREATE TABLE [StudentsExams] (
   [StudentID] INT REFERENCES [Students]([StudentID]),
   [ExamID] INT REFERENCES [Exams]([ExamID]),
   PRIMARY KEY ([StudentID], [ExamID])
);

--Exercise 12
CREATE TABLE [Teachers] (
   [TeacherID] INT NOT NULL PRIMARY KEY IDENTITY (100, 1),
   [Name] VARCHAR (50),
   [ManagerID] INT,
   FOREIGN KEY ([ManagerID]) REFERENCES [Teachers]([TeacherID])
);

--Exercise 13
CREATE TABLE [Cities] (
   [CityID] INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
   [Name] VARCHAR (50),
);

CREATE TABLE [Customers] (
   [CustomerID] INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
   [Name] VARCHAR (50),
   [Birthday] DATE,
   [CityID] INT NOT NULL,
   FOREIGN KEY ([CityID]) REFERENCES [Cities]([CityID])
);

CREATE TABLE [Orders] (
   [OrderID] INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
   [CustomerID] INT NOT NULL,
   FOREIGN KEY ([CustomerID]) REFERENCES [Customers]([CustomerID])
);

CREATE TABLE [ItemTypes] (
   [ItemTypeID] INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
   [Name] VARCHAR (50),
);

CREATE TABLE [Items] (
   [ItemID] INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
   [Name] VARCHAR (50),
   [ItemTypeID] INT NOT NULL,
   FOREIGN KEY ([ItemTypeID]) REFERENCES [ItemTypes]([ItemTypeID])
);

CREATE TABLE [OrderItems] (
   [OrderID] INT NOT NULL,
   FOREIGN KEY ([OrderID]) REFERENCES [Orders]([OrderID]),
   [ItemID] INT NOT NULL,
   FOREIGN KEY ([ItemID]) REFERENCES [Items]([ItemID]),
   PRIMARY KEY (OrderID, ItemID)
);

--Exercise 14
CREATE TABLE [Majors] (
   [MajorID] INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
   [Name] VARCHAR (50),
);

CREATE TABLE [Students] (
   [StudentID] INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
   [StudentNumber] INT NOT NULL,
   [StudentName] VARCHAR (50),
   [MajorID] INT NOT NULL,
   FOREIGN KEY ([MajorID]) REFERENCES [Majors]([MajorID])
);

CREATE TABLE [Payments] (
   [PaymentID] INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
   [PaymentDate] DATE,
   [PaymentAmount] DECIMAL,
   [StudentID] INT NOT NULL,
   FOREIGN KEY ([StudentID]) REFERENCES [Students]([StudentID])
);

CREATE TABLE [Subjects] (
   [SubjectID] INT NOT NULL PRIMARY KEY IDENTITY (1, 1),
   [SubjectName] VARCHAR (50)
);

CREATE TABLE [Agenda] (
   [StudentID] INT NOT NULL,
   FOREIGN KEY ([StudentID]) REFERENCES [Students]([StudentID]),
   [SubjectID] INT NOT NULL,
   FOREIGN KEY ([SubjectID]) REFERENCES [Subjects]([SubjectID]),
   PRIMARY KEY (StudentID, SubjectID)
);

--Exercise 17
USE Geography

SELECT [Mountains].[MountainRange], [Peaks].[PeakName], [Peaks].[Elevation] FROM [Peaks]
JOIN [Mountains] ON [Peaks].[MountainId] = [Mountains].[Id]
WHERE [MountainRange] = 'Rila'
ORDER BY [Peaks].[Elevation] DESC 
