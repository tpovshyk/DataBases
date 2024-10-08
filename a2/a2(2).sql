-- not good      
-- EXPLAIN ANALYZE
SELECT 
    (SELECT name 
     FROM opt_clients c 
     WHERE c.id = o.client_id AND c.status = 'active') AS name,
    (SELECT surname 
     FROM opt_clients c 
     WHERE c.id = o.client_id AND c.status = 'active') AS surname,
    (SELECT product_name 
     FROM opt_products p 
     WHERE p.product_id = o.product_id) AS product_name,
    o.order_date
FROM 
    opt_orders o
WHERE 
    o.client_id IN (
        SELECT id 
        FROM opt_clients
        IGNORE INDEX (idx_status)
        WHERE status = 'active'
    )
    AND o.product_id IN (
        SELECT product_id 
        FROM opt_products 
        )
ORDER BY 
    o.order_date DESC;

 
CREATE INDEX idx_status ON opt_clients (status);

-- good
   
-- EXPLAIN ANALYZE
SELECT 
    c.name, 
    c.surname, 
    p.product_name, 
    o.order_date
FROM 
    opt_orders o
JOIN 
    opt_clients c ON o.client_id = c.id
JOIN 
    opt_products p ON o.product_id = p.product_id
WHERE 
    c.status = 'active'
ORDER BY 
    o.order_date DESC;

