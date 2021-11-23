--1.Показать самый дорогой товар (Таблица Production.Product). Вывести наименование и цену товара. Показать поля [Name], ListPrice
	select top 1 name,listprice from Production.Product order by listprice DESC
--2.Определить количество продавцов и территорию (TerritoryName), которую обслуживает максимальное количество продавцов (Представление Sales.vSalesPerson).
	select TOP 1 TerritoryName, COUNT(TerritoryName) AS kolvo from Sales.vSalesPerson group by TerritoryName order by kolvo DESC
--3.Показать товар, для которого существует менее 3 размеров в той же подкатегории товаров (Таблица Production.Product). [Name], ProductSubcategoryID.
	select ProductSubcategoryID, COUNT(ProductModelID) AS kolvo, ProductModelID from Production.Product WHERE Size IS NOT NULL group by ProductSubcategoryID, ProductModelID having COUNT(ProductModelID)<3
--4.Показать товары, цена которых равна минимальной (больше нуля) цене товара из той же подкатегории (Таблица Production.Product). Показать поля [Name], ListPrice и ProductSubcategoryID.
	select [name],ProductSubcategoryID,ListPrice from Production.Product WHERE Listprice in (select MIN(ListPrice) as minprice from Production.Product WHERE ListPrice>0 AND ProductSubcategoryID IS NOT NULL  group by ProductSubcategoryID) 
--5.Показать товары, цена которых меньше средней цены в любом стиле (Таблица Production.Product). Показать поля [Name], ListPrice и Style.
	select ProductModelID,style,ListPrice from Production.Product WHERE style is not null and Listprice < (select AVG(ListPrice) as AVGprice from Production.Product WHERE style is not null ) group by ProductModelID,style,ListPrice