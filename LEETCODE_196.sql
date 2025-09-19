DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Person
    GROUP BY email
);


/* Pandas method aswell */
Person.sort_values(by='id', inplace=True)

/* Drop duplicates based on the 'email' column, keeping the first (smallest id) */ 
Person.drop_duplicates(subset='email', keep='first', inplace=True)