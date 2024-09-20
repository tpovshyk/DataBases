WITH OrderQuantities AS (
	SELECT ClientID, SUM(Quantity) AS TotalQuantity
	FROM ORDERS
	WHERE Quantity > 1
	GROUP BY ClientID
)
SELECT ClientID, TotalQuantity
FROM OrderQuantities
ORDER BY TotalQuantity DESC;

