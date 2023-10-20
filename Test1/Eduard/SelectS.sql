SELECT Name, SUM(Amount) as TotalAmount
FROM Products
WHERE Cost > 6
GROUP BY Name;


SELECT *
FROM Consumer
ORDER BY Surname, Name
LIMIT 3;
