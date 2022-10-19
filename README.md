![Adventureworks Logo](adventure-works-logo-150x150.png)

Exploring the Adventureworks dataset using AZURE Data Studio

## SQL Exercises & Solutions

### [SQL Exercises & Solutions](w3resource-SQL-Practice/SQL Exercises & Solutions.ipynb)
<label for="file">25 out of 81</label>
<progress id="file" value="32" max="100"> 30% </progress>

Taken from [w3resource](https://www.w3resource.com/sql-exercises/adventureworks/adventureworks-exercises.php)

### Question 1

From the following table write a query in SQL to retrieve all rows and columns from the employee table in the Adventureworks database. Sort the result set in ascending order on jobtitle.



Sample table: humanresources.employee


```sql
SELECT *

FROM humanresources.employee

ORDER BY JobTitle;
```

### Question 2

From the following table write a query in SQL to retrieve all rows and columns from the employee table using table aliasing in the Adventureworks database. Sort the output in ascending order on lastname.



Sample table: person.person


```sql
SELECT Q2.*

FROM Person.Person AS Q2

ORDER BY LastName;
```

### Question 3

From the following table write a query in SQL to return all rows and a subset of the columns (FirstName, LastName, businessentityid) from the person table in the AdventureWorks database. The third column heading is renamed to Employee_id. Arranged the output in ascending order by lastname.



Sample table: person.person


```sql
SELECT FirstName

    , LastName

    , BusinessEntityID AS Employee_id

FROM Person.Person

ORDER BY LastName;
```

### Question 4
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

### Question 5

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

### Question 6

From the following table write a query in SQL to create a list of unique jobtitles in the employee table in Adventureworks database. Return jobtitle column and arranged the resultset in ascending order.



Sample table: humanresources.employee


```sql
SELECT DISTINCT JobTitle

FROM HumanResources.Employee

ORDER BY JobTitle;
```

### Question 7

From the following table write a query in SQL to calculate the total freight paid by each customer. Return customerid and total freight. Sort the output in ascending order on customerid.



Sample table: sales.salesorderheader


```sql
SELECT CustomerID

    , SUM(Freight) AS TotalFreight

FROM Sales.SalesOrderHeader

GROUP BY CustomerID

ORDER BY CustomerID;
```

### Question 8

From the following table write a query in SQL to find the average and the sum of the subtotal for every customer. Return customerid, average and sum of the subtotal. Grouped the result on customerid and salespersonid. Sort the result on customerid column in descending order.



Sample table: sales.salesorderheader


```sql
SELECT CustomerID

    , SalesPersonID

    , AVG(SubTotal) AS AvgSubTotal

    , SUM(SubTotal) AS SumSubTotal

FROM Sales.SalesOrderHeader

GROUP BY CustomerID

    , SalesPersonID

ORDER BY CustomerID DESC;
```

### Question 9

From the following table write a query in SQL to retrieve total quantity of each productid which are in shelf of 'A' or 'C' or 'H'. Filter the results for sum quantity is more than 500. Return productid and sum of the quantity. Sort the results according to the productid in ascending order.



Sample table: production.productinventory


```sql
SELECT ProductID

    , SUM(Quantity) AS TotalQuantity

FROM Production.ProductInventory

WHERE Shelf IN ('A', 'C', 'H')

GROUP BY ProductID

HAVING SUM(Quantity) > 500

ORDER BY ProductID;
```

### Question 10

From the following table write a query in SQL to find the total quantity for a group of locationid multiplied by 10.



Sample table: production.productinventory


```sql
SELECT SUM(Quantity) AS TotalQuantity

FROM Production.ProductInventory

GROUP BY (LocationID * 10);
```

### Question 11

From the following tables write a query in SQL to find the persons whose last name starts with letter 'L'. Return BusinessEntityID, FirstName, LastName, and PhoneNumber. Sort the result on lastname and firstname.



Sample table: Person.PersonPhone


```sql
SELECT PH.BusinessEntityID

    , P.FirstName

    , P.LastName

    , PH.PhoneNumber

FROM Person.PersonPhone AS PH

JOIN Person.Person AS P

    ON PH.BusinessEntityID = P.BusinessEntityID

WHERE P.LastName LIKE 'L%'

ORDER BY P.LastName

    , P.FirstName;
```

### Question 12

From the following table write a query in SQL to find the sum of subtotal column. Group the sum on distinct salespersonid and customerid. Rolls up the results into subtotal and running total. Return salespersonid, customerid and sum of subtotal column i.e. sum_subtotal.



Sample table: sales.salesorderheader


```sql
SELECT SalesPersonID

    , CustomerID

    , SUM(SubTotal) AS SumSubTotal

FROM sales.salesorderheader

WHERE SalesPersonID IS NOT NULL

GROUP BY ROLLUP(SalesPersonID, CustomerID);
```

### Question 13

From the following table write a query in SQL to find the sum of the quantity of all combination of group of distinct locationid and shelf column. Return locationid, shelf and sum of quantity as TotalQuantity.



Sample table: production.productinventory


```sql
SELECT LocationID

    , Shelf

    , SUM(Quantity) AS TotalQuantity

FROM production.productinventory

GROUP BY CUBE(LocationID, Shelf);
```

### Question 14

From the following table write a query in SQL to find the sum of the quantity with subtotal for each locationid. Group the results for all combination of distinct locationid and shelf column. Rolls up the results into subtotal and running total. Return locationid, shelf and sum of quantity as TotalQuantity.



Sample table: production.productinventory


```sql
SELECT LocationID

    , Shelf

    , SUM(Quantity) AS TotalQuantity

FROM production.productinventory

GROUP BY GROUPING SETS(ROLLUP(LocationID, Shelf), CUBE(LocationID, Shelf));
```

### Question 15

From the following table write a query in SQL to find the total quantity for each locationid and calculate the grand-total for all locations. Return locationid and total quantity. Group the results on locationid.



Sample table: production.productinventory


```sql
SELECT locationid

    , SUM(quantity) AS TotalQuantity

FROM production.productinventory

GROUP BY GROUPING SETS(locationid, ());
```

### Question 16

From the following table write a query in SQL to retrieve the number of employees for each City. Return city and number of employees. Sort the result in ascending order on city.



Sample table: Person.BusinessEntityAddress


```sql
SELECT A.city

    , COUNT(BA.BusinessEntityID) AS NumberOfEmployees

FROM Person.BusinessEntityAddress BA

JOIN Person.Address AS A

    ON BA.AddressID = A.AddressID

GROUP BY A.City

ORDER BY A.City;
```

### Question 17

From the following table write a query in SQL to retrieve the total sales for each year. Return the year part of order date and total due amount. Sort the result in ascending order on year part of order date.



Sample table: Sales.SalesOrderHeader


```sql
SELECT YEAR(OrderDate) AS Year

    , SUM(TotalDue) AS TotalDueAmount

FROM Sales.SalesOrderHeader

GROUP BY YEAR(OrderDate)

ORDER BY YEAR(OrderDate);
```

### Question 18

From the following table write a query in SQL to retrieve the total sales for each year. Filter the result set for those orders where order year is on or before 2016. Return the year part of orderdate and total due amount. Sort the result in ascending order on year part of order date.



Sample table: Sales.SalesOrderHeader


```sql
SELECT DATEPART(YEAR, OrderDate) AS Year

    , SUM(TotalDue) TotalDueAmount

FROM Sales.SalesOrderHeader

WHERE DATEPART(YEAR, OrderDate) <= 2016

GROUP BY DATEPART(YEAR, OrderDate)

ORDER BY DATEPART(YEAR, OrderDate);
```

### Question 19

From the following table write a query in SQL to find the contacts who are designated as a manager in various departments. Returns ContactTypeID, name. Sort the result set in descending order.



Sample table: Person.ContactType


```sql
SELECT ContactTypeID

    , Name

FROM Person.ContactType

WHERE Name LIKE '%Manager%'

ORDER BY ContactTypeID DESC;
```

### Question 20

From the following tables write a query in SQL to make a list of contacts who are designated as 'Purchasing Manager'. Return BusinessEntityID, LastName, and FirstName columns. Sort the result set in ascending order of LastName, and FirstName.



Sample table: Person.BusinessEntityContact


```sql
SELECT BEC.BusinessEntityID

    , P.LastName

    , P.FirstName

FROM Person.BusinessEntityContact AS BEC

INNER JOIN Person.ContactType AS CT

    ON BEC.ContactTypeID = CT.ContactTypeID

INNER JOIN Person.Person AS P

    ON BEC.PersonID = P.BusinessEntityID

WHERE CT.Name = 'Purchasing Manager'

ORDER BY P.LastName

    , P.FirstName
```
