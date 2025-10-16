DELETE 
from Person 
where id not in (
    Select id from (
    Select 
      MIN(id) as id 
    From Person 
    Group by email ) t 
) 


import pandas as pd

def delete_duplicate_emails(person: pd.DataFrame) -> None:
    keep_idx = person.groupby('email', sort=False)['id'].idxmin()
    drop_idx = person.index.difference(keep_idx)
    person.drop(index=drop_idx, inplace=True)
    person.reset_index(drop=True, inplace=True)

