-- CustomerKey	Prefix	FirstName	LastName	BirthDate	MaritalStatus	Gender	EmailAddress	AnnualIncome	TotalChildren	EducationLevel	Occupation	HomeOwner

SELECT C.[CustomerID]
    ,P.[Title]
    ,P.[FirstName]
    ,P.[LastName]
    ,Emp.[BirthDate]
    ,Emp.[MaritalStatus]
    ,Emp.[Gender]    
    ,E.[EmailAddress]
    ,PH.PayFrequency
    ,PH.Rate
    ,PH.RateChangeDate
FROM [AdventureWorks2019].[Sales].[Customer] C
INNER JOIN [AdventureWorks2019].[Person].[Person] P ON C.[PersonID] = P.[BusinessEntityID]
JOIN [AdventureWorks2019].[Person].[EmailAddress] E ON C.[PersonID] = E.[BusinessEntityID]
JOIN [AdventureWorks2019].[HumanResources].[Employee] EMP ON C.[PersonID] = EMP.[BusinessEntityID]
JOIN [AdventureWorks2019].[HumanResources].[EmployeePayHistory] PH ON C.[PersonID] = PH.[BusinessEntityID]