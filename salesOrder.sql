 
 CREATE PROCEDURE dbo.uspGetCustomerSales @Customer varchar(50), @Territory INT 
 AS
 SELECT a1.CustomerID , a2.FirstName +' '+a2.LastName AS 'Name',
        count(SalesOrderID)
 FROM Sales.Customer a1
 JOIN Person.Person a2 
   ON a1.CustomerID=a2.BusinessEntityID
 LEFT JOIN Sales.SalesOrderHeader a3
   ON a1.CustomerID = a3.CustomerID  
 WHERE a1.TerritoryID =@Territory AND
   a1.CustomerID =@Customer
   GROUP BY a1.CustomerID,
        a2.FirstName +' '+a2.LastName
GO

   