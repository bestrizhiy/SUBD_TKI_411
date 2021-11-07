--Показать все купленные программы путевок в данный город.
SELECT DISTINCT Cities.ID
     , Cities.[Name]
	 , Countries.[Name]
	 , Programs.[Name]
FROM Tours
INNER JOIN Cities
ON Tours.ID_City = Cities.ID
INNER JOIN Countries
ON Tours.ID_Country = Countries.ID
INNER JOIN Programs
ON Tours.ID_Program = Programs.ID
WHERE Cities.[Name] LIKE '%рим%'; 