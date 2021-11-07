--Показать данные всех клиентов, попадающих под категорию "Дети младше 12-ти лет", а также страны и города, которые они посещали.
SELECT Clients.ID
     , Clients.Surname
	 , Clients.[Name]
	 , Clients.Middle_Name
	 , Clients.Age
	 , Clients.Passport
	 , Clients.International_Passport
	 , Clients.Medical_Insurance
	 , Countries.[Name] AS Country_Name
	 , Cities.[Name] AS City_Name
FROM Clients
INNER JOIN Tours
ON Tours.ID_Client = Clients.ID
INNER JOIN Countries
ON Tours.ID_Country = Countries.ID
INNER JOIN Cities
ON Tours.ID_City = Cities.ID
WHERE Clients.Age < 12; 
