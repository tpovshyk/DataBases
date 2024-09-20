WITH ORDERS1 AS (
	SELECT *
	FROM ORDERS
	WHERE Quantity > 1
)
SELECT 
    CLIENTS.ClientName,
    PRODUCTS.ProductName,
    ORDERS1.Quantity,
    PAYMENTS.Amount,
    SHIPMENTS.DeliveryAddress
FROM ORDERS1
JOIN CLIENTS ON ORDERS1.ClientID = CLIENTS.ClientID
JOIN PRODUCTS ON ORDERS1.ProductID = PRODUCTS.ProductID
JOIN PAYMENTS ON ORDERS1.OrderID = PAYMENTS.OrderID
JOIN SHIPMENTS ON ORDERS1.OrderID = SHIPMENTS.OrderID
WHERE CLIENTS.ClientName = 'Laura Walker'  
-- GROUP BY CLIENTS.ClientName, PRODUCTS.ProductName, ORDERS1.Quantity, PAYMENTS.Amount, SHIPMENTS.DeliveryAddress
ORDER BY PAYMENTS.Amount DESC;



