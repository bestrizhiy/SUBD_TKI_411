--Показать все цены на путёвки (без скидок) в порядке убывания.
SELECT DISTINCT Countries.[Name] AS Country_Name
	 , Cities.[Name] AS City_Name
	 , Programs.[Name] AS [Program_Name]
	 , Price
FROM Tours
INNER JOIN Countries
ON Tours.ID_Country = Countries.ID
INNER JOIN Cities
ON Countries.ID_City = Cities.ID
INNER JOIN Programs
ON Tours.ID_Program = Programs.ID
INNER JOIN Clients
ON Tours.ID_Client = Clients.ID
INNER JOIN Discounts
ON Clients.ID_Discount = Discounts.ID
WHERE Discounts.[Name] LIKE '%нет%'
ORDER BY Price DESC;