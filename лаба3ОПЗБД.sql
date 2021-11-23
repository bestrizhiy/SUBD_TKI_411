--1.Показать количество продукции на складе (StockedQty) и поля Name, ProductNumber из таблиц Production.Product, Production.WorkOrder.
SELECT Name, ProductNumber, StockedQty
FROM 
Production.Product AS PP
INNER JOIN
Production.WorkOrder AS WO
ON PP.ProductID=WO.ProductID;
GO
--2.	Показать список людей (поля FirstName, LastName), в котором указано, установлено у человека семейное положение или нет, из таблиц Person.Person, HumanResources.Employee, используя LEFT OUTER JOIN.
SELECT FirstName,LastName, MaritalStatus
FROM 
Person.Person AS PP
LEFT OUTER JOIN
HumanResources.Employee AS E
ON PP.BusinessEntityID=E.BusinessEntityID;
GO
--3.	Показать список покупателей (поле AccountNumber из Sales.Customer), в котором указано, есть ли у покупателя статус заказа (Status из Sales.SalesOrderHeader) или нет, из таблиц Sales.SalesOrderHeader, Sales.Customer, используя RIGHT OUTER JOIN.
SELECT C.AccountNumber, Status
FROM 
Sales.SalesOrderHeader AS SOH
RIGHT OUTER JOIN
Sales.Customer AS C
ON SOH.CustomerID=C.CustomerID;
GO
--4.	Показать список покупателей (CustomerID), к которым относятся несколько продавцов (SalesPersonID), из таблицы Sales.SalesOrderHeader, используя SELF JOIN.
SELECT DISTINCT S1.CustomerID, S1.SalesPersonID
FROM Sales.SalesOrderHeader AS S1
INNER JOIN Sales.SalesOrderHeader AS S2
ON S1.CustomerID=S2.CustomerID
AND S1.SalesPersonID<>S2.SalesPersonID
ORDER BY S1.CustomerID;
GO
--5.	Показать список продавцов (SalesPersonID), к которым относятся несколько покупателей (CustomerID), из таблицы Sales.SalesOrderHeader, используя SELF JOIN.
SELECT DISTINCT S1.CustomerID, S1.SalesPersonID
FROM Sales.SalesOrderHeader AS S1
INNER JOIN Sales.SalesOrderHeader AS S2
ON S1.SalesPersonID=S2.SalesPersonID
AND S1.CustomerID<>S2.CustomerID
ORDER BY S1.SalesPersonID;
GO
--6.	Показать список подкатегорий продуктов (ProductSubcategoryID), которые имеют несколько нормативных цен (StandardCost) больше 500, из таблицы Production.Product, используя SELF JOIN.
SELECT DISTINCT P1.ProductSubcategoryID, P1.StandardCost
FROM Production.Product AS P1
INNER JOIN Production.Product AS P2
ON P1.ProductSubcategoryID=P2.ProductSubcategoryID
AND P1.StandardCost<>P2.StandardCost 
WHERE P1.StandardCost>500 AND P2.StandardCost>500
ORDER BY P1.ProductSubcategoryID;
GO
--7.	Показать комбинированный список таблиц Purchasing.PurchaseOrderHeader по полям PurchaseOrderID, TaxAmt, Purchasing.PurchaseOrderDetail по полям PurchaseOrderDetailID, UnitPrice, используя UNION.
SELECT PurchaseOrderID, TaxAmt
FROM Purchasing.PurchaseOrderHeader
UNION
SELECT PurchaseOrderDetailID, UnitPrice
FROM Purchasing.PurchaseOrderDetail
--8.	Показать список BusinessEntityID, которые содержатся и в таблице Person.Person, и в таблице Sales.PersonCreditCard.
SELECT BusinessEntityID
FROM Person.Person
INTERSECT
SELECT BusinessEntityID
FROM Sales.PersonCreditCard