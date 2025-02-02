--Query to find out the data type of the table
EXEC sp_help [Employee Data]


--Query to demonstrate the ability of table creation
--STEP 1
CREATE TABLE [dbo].[Employee Data2] (
	EEID nvarchar(255),
	[Full Name] nvarchar(255),
	[Job Title] nvarchar(255),
	Department nvarchar(255),
	[Business Unit] nvarchar(255),
	Gender nvarchar(50),
	Ethnicity nvarchar(50),
	Age INT,
	[Hire Date] DATETIME,
	[Annual Salary] MONEY,
	[Bonus %] INT,
	Country nvarchar(255),
	City nvarchar(255),
	[Exit Date] DATETIME
)

--STEP 2
INSERT INTO [dbo].[Employee Data2] (EEID, [Full Name], [Job Title], Department, [Business Unit], Gender, Ethnicity, Age, [Hire Date], [Annual Salary], [Bonus %], Country, City, [Exit Date])
SELECT EEID, [Full Name], [Job Title], Department, [Business Unit], Gender, Ethnicity, Age, [Hire Date], [Annual Salary], [Bonus %], Country, City, [Exit Date] FROM [dbo].[Employee Data];

SELECT * FROM [dbo].[Employee Data2]

-- Data Manipulation Queries
SELECT *
FROM [dbo].[Employee Data]

-- Average Salary by Departments and Business Units
SELECT [Business Unit], Department, AVG([Annual Salary]) [Avg. Annual Salary]
FROM [dbo].[Employee Data]
GROUP BY [Business Unit], Department
ORDER BY [Business Unit], Department

-- Employee Age Analysis
SELECT MIN(Age), MAX(Age), AVG(Age)
FROM [dbo].[Employee Data]

-- Employee Age Grouping Query
SELECT EEID, 
	   [Full Name],
	   Department,
	   [Business Unit], 
	   Gender, 
	   [Hire Date],
	   CASE 
			WHEN AGE BETWEEN 18 AND 25 THEN '18-25'
			WHEN AGE BETWEEN 26 AND 35 THEN '26-35'
			WHEN AGE BETWEEN 36 AND 45 THEN '36-45'
			WHEN AGE BETWEEN 46 AND 60 THEN '46-60'
			ELSE '60+'
	   END AS [Age Group]
FROM [dbo].[Employee Data]
ORDER BY [Age Group], Department, Gender, [Business Unit]

