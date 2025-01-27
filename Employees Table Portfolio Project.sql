SELECT *
FROM [dbo].[Employee Data]


-- Average Salary by Departments and Business Units
SELECT [Business Unit], Department, AVG([Annual Salary]) AS [Avg. Annual Salary]
FROM [dbo].[Employee Data]
GROUP BY [Business Unit], Department
ORDER BY [Business Unit], Department


-- Employee Age Analysis

--SELECT MIN(Age), MAX(Age), AVG(Age)
--FROM [dbo].[Employee Data]


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


-- Average bonus percentage depending on department
SELECT Department, AVG([Bonus %]) AS [Avg. Bonus]
FROM [dbo].[Employee Data]
GROUP BY Department
ORDER BY [Avg. Bonus]


-- The average number of years that employees spend in the company
SELECT 
    Department, 
    AVG(DATEDIFF(YEAR, [Hire Date], ISNULL([Exit Date], GETDATE()))) AS [Avg. YearsInCompany]
FROM [dbo].[Employee Data]
GROUP BY Department
ORDER BY [Avg. YearsInCompany] DESC;

-- The total amount of employees' salaries after five years
SELECT EEID, [Full Name], [Job Title], Department, 
	   [Annual Salary] + ([Annual Salary] * [Bonus %] / 100) As [Annual Income],
	   ([Annual Salary] + ([Annual Salary] * [Bonus %] / 100)) * 5 As [Five Year Income]
FROM [dbo].[Employee Data]
ORDER BY Department ASC
