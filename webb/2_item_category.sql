-- List item_category and the sum of extended sales for each item_category. 

USE fwwebb;

SELECT 
	im.item_category,
	CONCAT('$', FORMAT(SUM(od.qty * od.unit_price),2)) AS extended_sales,
	CONCAT('$', FORMAT(SUM(od.unit_price * od.qty) - SUM(od.unit_cost * od.qty), 2)) AS 'gross_profit',
	CONCAT(FORMAT((SUM(od.unit_price * od.qty) - SUM(od.unit_cost * od.qty)) / SUM(od.qty * od.unit_price) * 100, 2), '%') AS gross_profit_percentage

FROM orders o
LEFT JOIN order_detail od on (o.order_id = od.order_id)
JOIN item_master im ON  (od.item_id = im.item_id)
GROUP BY im.item_category