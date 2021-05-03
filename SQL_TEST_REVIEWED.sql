-- 1. What is the longest email address in the orders table?

SELECT o.notifyemail,
	   LENGTH(o.notifyemail) AS email_length
FROM orders o
ORDER BY email_length DESC
LIMIT 1

-- 2. Which state has the lowest sales dollars?

SELECT q1.billstate
	 , SUM(q1.order_total) AS state_total
FROM
	(SELECT o.orderid
		, o.billstate
		, SUM(oi.quantity * oi.price) AS order_total
	FROM orders o
	JOIN orderitems oi
	ON o.orderid = oi.orderid
	GROUP BY o.orderid, o.billstate
	)q1
GROUP BY q1.billstate
ORDER BY state_total ASC 
LIMIT 1

-- 3. What order has the highest sales dollars?

SELECT o.orderid
	 , SUM(oi.quantity * oi.price) AS order_total
FROM orders o
JOIN orderitems oi
ON o.orderid = oi.orderid
GROUP BY o.orderid
ORDER BY order_total DESC
LIMIT 1

-- 4. What is the sitename of the site that has the highest sales dollars?

SELECT q1.sitename
	 , SUM(q1.order_total) AS site_total
FROM
	(SELECT o.orderid
		, s.sitename
		, SUM(oi.quantity * oi.price) AS order_total
	FROM sites s
	JOIN orders o
	ON o.siteid = s.siteid
	JOIN orderitems oi
	ON oi.orderid = o.orderid
	GROUP BY o.orderid, s.sitename
	)q1
GROUP BY q1.sitename
ORDER BY site_total DESC 
LIMIT 1

-- 5. For orderid 5000005, return the customer's first and last name as one value, 
-- with a space in between first and last name. 
-- Ex. |'First Last'| instead of |'First'|'Last'|

SELECT CONCAT(billfname, ' ' , billlname)
FROM orders o 
WHERE orderid = 5000005

-- 6. Select the single pay orders, ordered by lowest to highest total sales dollars.

SELECT o.orderid
	 , SUM(oi.quantity * oi.price) AS order_total
FROM orders o 
JOIN orderitems oi 
ON oi.orderid = o.orderid
WHERE o.installments_code = 1
GROUP BY orderid
ORDER BY order_total ASC

-- 7. Which installment plan is the most popular for zZounds?

SELECT installments_code AS most_popular_plan
	 , COUNT(*) AS count_of_plan
FROM orders o
GROUP BY installments_code
ORDER BY count_of_plan DESC
LIMIT 1

-- 8. Select the sitename that does not have any sales.

SELECT sitename
FROM sites s 
LEFT JOIN orders o 
ON o.siteid = s.siteid
WHERE orderid IS NULL

-- 9. Which supplier_skus have the highest and lowest margins?

SELECT supplier_sku
	 , (sell_price - cost)/sell_price AS margin_max
FROM items i 
ORDER BY margin_max DESC
LIMIT 1

-- 9'. lowest margin

SELECT supplier_sku
	 , (sell_price - cost)/sell_price AS margin_min
FROM items i 
ORDER BY margin_min ASC
LIMIT 1

-- 10. Which supplier_skus have not been ordered by anyone in the orders table?

SELECT i.supplier_sku AS unordered_supplier_skus
FROM orders o
JOIN orderitems oi
ON o.orderid = oi.orderid
RIGHT JOIN items i 
ON i.supplier_item_id = oi.supplier_item_id
WHERE o.orderid IS NULL

-- 11. Select the supplier_sku for the most expensive item on orderid 5000002.

SELECT i.supplier_sku 
	 , i.cost
FROM orders o
JOIN orderitems oi
ON oi.orderid = o.orderid
JOIN items i 
ON oi.supplier_item_id = i.supplier_item_id
WHERE o.orderid = 5000002
ORDER BY i.cost DESC
LIMIT 1

-- 12. Create a new table with a column for orderid and a column for total sales dollars. 
-- Add a primary key on the orderid column.

CREATE TABLE new_table (
	orderID INT AUTO_INCREMENT PRIMARY KEY,
    total_sales_dollars DEC(7,2)
)
-- 13. Insert into the new table each order and its total sales dollars.

INSERT INTO new_table(orderID, total_sales_dollars)
SELECT o.orderid
	, SUM(oi.quantity * oi.price) AS total_sales_dollars
FROM orders o
JOIN orderitems oi
ON o.orderid = oi.orderid
GROUP BY o.orderid

-- 14. Find the total sales dollars for every order combined.

SELECT SUM(q1.order_total)
FROM
(SELECT o.orderid
	, SUM(oi.quantity * oi.price) AS order_total
FROM orders o
JOIN orderitems oi
ON o.orderid = oi.orderid
GROUP BY o.orderid
)q1

-- 15. Delete the table you made.

DROP TABLE new_table
















