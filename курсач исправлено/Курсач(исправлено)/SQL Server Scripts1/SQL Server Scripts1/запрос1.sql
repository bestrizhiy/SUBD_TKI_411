--Показать все купленные программы путевок в данный город.
SELECT DISTINCT Cities.[Name] AS City_Name
	 , Countries.[Name] AS Country_Name
	 , Programs.[Name] AS [Program_Name]
FROM Tours
INNER JOIN Countries
ON Tours.ID_Country = Countries.ID
INNER JOIN Cities
ON Countries.ID_City = Cities.ID
INNER JOIN Programs
ON Tours.ID_Program = Programs.ID
WHERE Cities.[Name] LIKE '%рим%';