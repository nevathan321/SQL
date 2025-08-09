#Leetcode Medium 

SELECT Employee.name
FROM Employee
JOIN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
) m 
 ON Employee.id = m.managerId;