Select 
  user_id, 
  Count(follower_id) As followers_count 
From Followers 
Group by user_id
Order by user_id ASC 