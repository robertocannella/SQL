-- List the largest extededed sales value for each customer. 
	-- Does not include customers without orders.
	-- If there are multiple records with the same value for the highest extended sales, 
		-- the query will return only the first occurrence of that value.
-- Complex solution (row_number/ partition)

USE fwwebb;

SELECT 
    customer_name,
    item_description,
    extended_sales AS "largest order_detail line"
FROM (
    SELECT 
		o.order_id,
        c.customer_name, 
        im.item_description, 
        CONCAT('$', FORMAT(SUM(od.unit_price * od.qty),2)) AS extended_sales,
        ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY SUM(od.unit_price * od.qty) DESC) AS row_num
    FROM orders o
    LEFT JOIN order_detail od ON (o.order_id = od.order_id)
    JOIN item_master im ON (od.item_id = im.item_id)
    JOIN customer c ON (o.customer_id = c.customer_id)
    GROUP BY o.order_id, c.customer_id, c.customer_name, im.item_description
) AS subquery
WHERE row_num = 1;