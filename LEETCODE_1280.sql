SELECT 
  s.student_id,
  s.student_name,
  sb.subject_name,
  Count(e.subject_name) as attended_exams
From Students as s 
Cross join Subjects as sb 
Left join Examinations as e
on s.student_id = e.student_id and sb.subject_name = e.subject_name
GROUP by s.student_id, s.student_name, sb.subject_name 
Order by s.student_id, sb.subject_name 