SELECT 
    patient_id, 
    patient_name, 
    conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'      
   OR conditions LIKE '% DIAB1%';   



/* pandas */ 

import pandas as pd

def find_patients(patients: pd.DataFrame) -> pd.DataFrame:
    result = patients[patients['conditions'].str.contains(r'(^|\s)DIAB1[0-9]*($|\s)' , regex=True na=False)]
    return result
