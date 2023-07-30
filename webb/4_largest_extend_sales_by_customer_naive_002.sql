-- List the largest extended sales value for each customer 
	-- Does not include customers without orders.
    -- This query will return multiple records if there are multiple occurrences of the highest extended sales value. 
		-- Each occurrence of the maximum extended sales value will be included as a separate row in the result.
-- Naive solution.

USE fwwebb;

SELECT 
	o.order_id,
	c.customer_name, 
	im.item_description, 
	od.unit_price * od.qty AS `largest order_detail line`
FROM orders o
LEFT JOIN customer c ON (o.customer_id = c.customer_id)
JOIN order_detail od ON (o.order_id = od.order_id)
JOIN item_master im ON (od.item_id = im.item_id)
HAVING `largest order_detail line` = (
    SELECT MAX(extended_sales) 
    FROM (
        SELECT 
			o.order_id,
            c.customer_name,
            od.unit_price * od.qty AS extended_sales
        FROM orders o
        LEFT JOIN customer c ON (o.customer_id = c.customer_id)
        JOIN order_detail od ON (o.order_id = od.order_id)
        JOIN item_master im ON (od.item_id = im.item_id)
    ) AS max_sales
    WHERE c.customer_name = max_sales.customer_name
);