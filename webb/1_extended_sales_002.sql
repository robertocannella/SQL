-- List each order_date, customer_name, item_description, qty, and extended sales for orders for Jack's Plumbing.

SELECT 
	o.order_date,
    c.customer_name, 
    im.item_description, 
    od.qty, 
    CONCAT('$', FORMAT(od.unit_price * od.qty,2)) AS 'extended sales',
	CONCAT('$', FORMAT(od.unit_price * od.qty - od.unit_cost * od.qty, 2)) AS 'gross_profit',
	CONCAT(
		FORMAT(
			(od.unit_price * od.qty - od.unit_cost * od.qty) / od.unit_price * od.qty * 100, 2),'%' )
				AS 'gross_profit_percentage'
FROM orders o
LEFT JOIN order_detail od ON (o.order_id = od.order_id)
JOIN item_master im ON (od.item_id = im.item_id)
JOIN customer c ON (o.customer_id = c.customer_id)
WHERE c.customer_id = 533


