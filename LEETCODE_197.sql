SELECT id
FROM (
    SELECT 
        id,
        recordDate,
        temperature,
        LAG(recordDate) OVER (ORDER BY recordDate) AS prevDate,
        LAG(temperature) OVER (ORDER BY recordDate) AS prevTemp
    FROM Weather
) t
WHERE DATEDIFF(recordDate, prevDate) = 1
  AND temperature > prevTemp;
