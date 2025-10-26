SELECT 
  P.product_id, 
  COALESCE(Round(SUM(units * price)/SUM(units), 2), 0) as average_price 
From Prices as P 
LEFT JOIN UnitsSold as U  
on P.product_id = U.product_id 
AND U.purchase_date Between start_date AND end_date
GROUP by product_id 
