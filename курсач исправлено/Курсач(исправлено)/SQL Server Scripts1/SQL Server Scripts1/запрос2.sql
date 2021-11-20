-- Выдавать список стран, популярных у определенного возраста клиентов.
SELECT DISTINCT Countries.[Name] AS Country_Name
FROM Countries
INNER JOIN Tours
ON Tours.ID_Country = Countries.ID
INNER JOIN Clients
ON Tours.ID_Client = Clients.ID
WHERE Clients.Age BETWEEN 14 AND 25;