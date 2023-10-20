SELECT Name, COUNT(*) as TotalConsumers
FROM Consumer
GROUP BY Name
LIMIT 3;


SELECT *
FROM Products
WHERE Cost > 50
ORDER BY Cost DESC;
