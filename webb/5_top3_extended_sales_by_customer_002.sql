-- List the top 3 transactions for each customer.
	-- If two transactions, of the top 3, have the same extended sales value, this query lists both as separare records

SELECT 
    customer_name,
    item_description,
    extended_sales AS "largest order_detail line"
FROM (
    SELECT 
		o.order_id,
        c.customer_name, 
        im.item_description, 
        CONCAT('$', FORMAT(od.unit_price * od.qty, 2)) AS extended_sales,
        -- CAN THIS BE RANK() or DENSE_RANK() ??
		ROW_NUMBER() OVER (PARTITION BY c.customer_id ORDER BY SUM(od.unit_price * od.qty) DESC) AS rnk
    FROM orders o
    LEFT JOIN order_detail od ON (o.order_id = od.order_id)
    JOIN item_master im ON (od.item_id = im.item_id)
    JOIN customer c ON (o.customer_id = c.customer_id)

) AS subquery
WHERE rnk <= 3;