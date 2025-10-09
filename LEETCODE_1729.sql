SELECT 
  user_id, 
  count(follower_id) as followers_count
FROM Followers 
Group by user_id 
Order by followers_count ASC
   