Select 
  Max(num) As num 
From (
    Select 
      num 
    From MyNumbers
    Group by num 
    Having count(*) = 1 
) as Tableuse       