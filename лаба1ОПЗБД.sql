--1.Показать все поля из таблицы Production.TransactionHistory
SELECT *
FROM Production.TransactionHistory

--2.Показать поля ProductSubcategoryID, ProductCategoryID, [Name] из таблицы Production.ProductSubCategory
SELECT ProductSubcategoryID , ProductCategoryID , [Name]
FROM Production.ProductSubCategory

--3. Показать поля WorkOrderID, ProductID, ScheduledStartDate, ScheduledEndDate из таблицы Production.WorkOrderRouting при условии, что запланированная дата начала производства (ScheduledStartDate) начинается не ранее 2011-06-03T00:00:00.000 (включительно), а запланированная дата окончания производства (ScheduledEndDate) заканчивается не позднее 2011-06-14T00:00:00.000 (включительно). Таблица Production.WorkOrderRouting
SELECT WorkOrderID, ProductID, ScheduledStartDate, ScheduledEndDate
FROM Production.WorkOrderRouting
WHERE ScheduledStartDate >= '2011-06-03T00:00:00.000'  AND ScheduledEndDate <= '2011-06-14T00:00:00.000'

--4. Из таблицы Production.Product показать идентификационный номер и название товара (ProductID и [Name]), а также СУЩЕСТВУЮЩИЕ единицы измерения размера и веса (SizeUnitMeasureCode и WeightUnitMeasureCode).
SELECT ProductID , [Name] , SizeUnitMeasureCode, WeightUnitMeasureCode
FROM Production.Product
WHERE SizeUnitMeasureCode IS NOT NULL AND WeightUnitMeasureCode IS NOT NULL

--5. Показать из таблицы Production.ProductSubcategory все названия товаров ([Name]), содержащих в названии 'bike'.
SELECT [Name]
FROM Production.ProductSubcategory
WHERE [Name] LIKE '%bike%'

--6. Из таблицы Purchasing.ProductVendor показать поля ProductID и UnitMeasureCode, где значения поля UnitMeasureCode принадлежат списку ('GAL', 'CS', 'EA'). Использовать оператор IN.
SELECT ProductID , UnitMeasureCode
FROM Purchasing.ProductVendor
WHERE UnitMeasureCode IN ('GAL', 'CS', 'EA')

--7. Показать ID специального предложения (SpecialOfferID), тип и категорию товаров ([Type] и Category), а так же минимальное и максимальное количество товаров, попавших в специальное предложение (MinQty и MaxQty) из таблицы Sales.SpecialOffer. Неизвестное максимальное количество товаров заменить на 0. Названия полей оставить без изменений.
SELECT SpecialOfferID , [Type], Category, MinQty, ISNULL (MaxQty, 0) AS MaxQty
FROM Sales.SpecialOffer

--8. Показать поля ProductID, [Name] из таблицы Production.Product с применением функции COALESCE(). Показать поле Meauserement , так, чтобы, если значение в поле Color известно, то показать его, а иначе, показать значение в поле Size. Если и в поле Size значение неизвестно, то вывести значение 'UNKNOWN'.
SELECT ProductID,[Name],COALESCE(Color, Size, 'UNKNOWN') AS Meauserement
FROM Production.Product

--9. Отсортировать в порядке убывания строки таблицы Production.ProductCostHistory в соответствии с полем StartDate. Показать поля ProductID, StartDate, EndDate и StandardCost.
SELECT ProductID , StartDate, EndDate, StandardCost
FROM Production.ProductCostHistory
ORDER BY StartDate DESC

--10. Из таблицы Person.StateProvince показать поля StateProvinceID, StateProvinceCode, CountryRegionCode и IsOnlyStateProvinceFlag. Все значения поля IsOnlyStateProvinceFlag, равные 0, заменить на NULL. Названия полей оставить без изменений.
SELECT StateProvinceID , StateProvinceCode, CountryRegionCode, NULLIF (IsOnlyStateProvinceFlag, 0) AS IsOnlyStateProvinceFlag
FROM Person.StateProvince
