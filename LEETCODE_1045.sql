SELECT customer_id
FROM (
  SELECT customer_id, COUNT(DISTINCT product_key) AS bought
  FROM Customer
  GROUP BY customer_id
) t
WHERE t.bought = (SELECT COUNT(*) FROM Product);
 

/* ------ */ 

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
