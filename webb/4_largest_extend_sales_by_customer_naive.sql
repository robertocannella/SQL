-- List the largest extended sales value for each customer 
	-- Does not include customers without orders.
    -- This query will return multiple records if there are multiple occurrences of the highest extended sales value. 
		-- Each occurrence of the maximum extended sales value will be included as a separate row in the result.
-- Naive solution.

USE fwwebb;

SELECT 
	order_id,
    customer_name, 
    item_description, 
    CONCAT('$', FORMAT(extended_sales, 2)) AS 'extended sales'
FROM (
    SELECT 
		o.order_id,
        c.customer_name, 
        im.item_description, 
        SUM(od.unit_price * od.qty) AS extended_sales
    FROM orders o
    LEFT JOIN customer c ON (o.customer_id = c.customer_id)
    JOIN order_detail od ON (o.order_id = od.order_id)
    JOIN item_master im ON (od.item_id = im.item_id)
    GROUP BY o.order_id, c.customer_id, c.customer_name, im.item_description
) AS subquery
WHERE extended_sales = (
    SELECT MAX(total_sales)
    FROM (
        SELECT 
			o.order_id,
            c.customer_name,
            SUM(od.unit_price * od.qty) AS total_sales
        FROM orders o
        LEFT JOIN customer c ON (o.customer_id = c.customer_id)
        JOIN order_detail od ON (o.order_id = od.order_id)
        JOIN item_master im ON (od.item_id = im.item_id)
        GROUP BY o.order_id, c.customer_id, c.customer_name, im.item_description
    ) AS max_sales
    WHERE subquery.customer_name = max_sales.customer_name
);