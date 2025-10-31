Select 
  Project_id, 
  Round(SUM(experience_years) / count(*), 2) as average_years 
From Project as P 
LEFT JOIN Employee as E 
ON P.employee_id = E.employee_id 
Group by P.project_id 