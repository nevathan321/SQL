SELECT *
FROM Cinema
WHERE id % 2 != 0
  AND LOWER(description) != 'boring'
ORDER by rating desc 