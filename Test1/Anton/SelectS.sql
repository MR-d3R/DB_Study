SELECT Name, SUM(Amount) as TotalAmount
FROM Products
WHERE Cost > 5
GROUP BY Name;


SELECT *
FROM Costumer
ORDER BY Surname, Name
LIMIT 3;
