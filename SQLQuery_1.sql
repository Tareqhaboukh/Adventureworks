-- CustomerKey
-- Prefix
-- FirstName
-- LastName
-- BirthDate
-- MaritalStatus
-- Gender
-- EmailAddress
-- AnnualIncome
-- TotalChildren
-- EducationLevel
-- Occupation
-- HomeOwner
USE AdventureWorks2019;

SELECT TOP (1000) C.CustomerID
    , P.BusinessEntityID
    , P.Title
    , P.FirstName
    , P.LastName
    -- , Emp.BirthDate
    -- , Emp.MaritalStatus
    -- , Emp.Gender
    , E.EmailAddress
    , PH.PayFrequency
    , PH.Rate
    , PH.RateChangeDate
FROM Sales.Customer AS C
INNER JOIN Person.Person AS P
    ON C.PersonID = P.BusinessEntityID
JOIN Person.EmailAddress E
    ON P.BusinessEntityID = E.BusinessEntityID
-- LEFT JOIN HumanResources.Employee AS Emp
--     ON C.PersonID = Emp.BusinessEntityID;
LEFT JOIN HumanResources.EmployeePayHistory AS PH
    ON C.PersonID = PH.BusinessEntityID
