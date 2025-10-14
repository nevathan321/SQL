with Total_Count as (
    Select 
      Count(user_id) as Total 
    FROM Users
)

Select 
  contest_id,
  ROUND((Count(contest_id)/CAST(t.Total AS float)) * 100, 2)  As percentage 
From Register
Cross join Total_Count as t 
Group by contest_id
ORDER BY percentage desc, contest_id ASC 