![Adventureworks Logo](adventure-works-logo-150x150.png)

Exploring the Adventureworks dataset using AZURE Data Studio

## [SQL Exercises & Solutions](w3resource-SQL-Practice/SQL_Exercises_&_Solutions.ipynb)
25 Excersises out of 81 (can be found on [w3resource.com](https://www.w3resource.com/sql-exercises/adventureworks/adventureworks-exercises.php))

![30](https://progress-bar.dev/30)

### Preview:
#### Excersise 1

From the following table write a query in SQL to retrieve all rows and columns from the employee table in the Adventureworks database. Sort the result set in ascending order on jobtitle.

Sample table: humanresources.employee

```sql
SELECT *
FROM humanresources.employee
ORDER BY JobTitle;
```
#### Excersise 2

From the following table write a query in SQL to retrieve all rows and columns from the employee table using table aliasing in the Adventureworks database. Sort the output in ascending order on lastname.

Sample table: person.person

```sql
SELECT Q2.*
FROM Person.Person AS Q2
ORDER BY LastName;
```
#### Excersise 3

From the following table write a query in SQL to return all rows and a subset of the columns (FirstName, LastName, businessentityid) from the person table in the AdventureWorks database. The third column heading is renamed to Employee_id. Arranged the output in ascending order by lastname.

Sample table: person.person

```sql
SELECT FirstName
    , LastName
    , BusinessEntityID AS Employee_id
FROM Person.Person
ORDER BY LastName;
```
#### Excersise 4
From the following table write a query in SQL to return only the rows for product that have a sellstartdate that is not NULL and a productline of 'T'. Return productid, productnumber, and name. Arranged the output in ascending order on name.

Sample table: production.product

```sql
SELECT ProductID
    , ProductNumber
    , Name
FROM Production.Product
WHERE SellStartDate IS NOT NULL
    AND ProductLine = 'T'
ORDER BY Name;
```
#### Excersise 5

From the following table write a query in SQL to return all rows from the salesorderheader table in Adventureworks database and calculate the percentage of tax on the subtotal have decided. Return salesorderid, customerid, orderdate, subtotal, percentage of tax column. Arranged the result set in ascending order on subtotal.

Sample table: sales.salesorderheader

```sql
SELECT SalesOrderID
    , CustomerID
    , OrderDate
    , SubTotal
    , (TaxAmt / SubTotal) * 100 AS TaxPercent
FROM Sales.SalesOrderHeader
ORDER BY SubTotal DESC;
```
