--Показать список заказанных путёвок с определённой программой.
SELECT Tours.ID
     , Countries.[Name] AS Country_Name
	 , Cities.[Name] AS City_Name
	 , Programs.[Name] AS [Program_Name]
FROM Tours
INNER JOIN Countries
ON Tours.ID_Country = Countries.ID
INNER JOIN Cities
ON Tours.ID_City = Cities.ID
INNER JOIN Programs
ON Tours.ID_Program = Programs.ID
WHERE Programs.[Name] LIKE  '%деловой%'; 