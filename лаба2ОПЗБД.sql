--1.  Найти средний вес из таблицы Production.Product
SELECT AVG(Weight) AS WeightAvg
FROM Production.Product;
--2.  Найти количество людей, которых зовут Barry Johnson, из таблицы Person.Person
SELECT Count(FirstName) as CountPerson
FROM Person.Person
WHERE FirstName LIKE 'Barry' AND LastName LIKE 'Johnson';
--3.  Показать суммарную стоимость товаров в каждой линейке продуктов ProductLine из таблицы Production.Product (из выборки исключить пустые поля).
SELECT ProductLine, SUM(ListPrice) As SumPrice
FROM Production.Product
WHERE ProductLine IS NOT NULL
GROUP BY ProductLine;
--4.  Найти профессии из таблицы HumanResources.Employee, где количество работников мужского пола больше 2 (из выборки исключить пустые поля).
SELECT JobTitle, Gender, Count(BusinessEntityID) as Count
FROM HumanResources.Employee
WHERE JobTitle IS NOT NULL AND Gender IS NOT NULL
GROUP BY JobTitle, Gender
HAVING Count(BusinessEntityID) > 2 AND Gender LIKE 'M';
--5.  Вывести DueDate из таблицы Production.WorkOrder, где минимум по OrderQty меньше 5. Добавить столбец с рангом, идущим по порядку, определяя его порядок в зависимости от минимальной цены. (Использовать DENSE_RANK)
SELECT DENSE_RANK() OVER(ORDER BY MIN(OrderQty)) as N, DueDate, MIN(OrderQty) as MinOrder
FROM Production.WorkOrder
GROUP BY DueDate
HAVING MIN(OrderQty) < 5