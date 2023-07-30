-- List all entries in the orders table that have no corresponding customer_id in the customer table.

USE fwwebb;

SELECT o.*
FROM orders o
LEFT JOIN customer c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
