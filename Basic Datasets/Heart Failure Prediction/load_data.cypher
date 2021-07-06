LOAD CSV WITH HEADERS FROM "file:///hfp.csv" AS line
WITH line
 
CREATE (p:Patient { age:line.age, sex: toInteger(line.sex), id:line.ID})
MERGE (an:AnaemiaNode{name:line.anaemia, id:line.ID})
MERGE (cr:CreatinineNode{name:line.creatinine_phosphokinase, id:line.ID})
MERGE (dn:DiabetesNode{name:line.diabetes, id:line.ID})
MERGE (en:EjectionNode{name:line.ejection_fraction, id:line.ID})
MERGE (bpn:BloodPressureNode{name:line.high_blood_pressure, id:line.ID})
MERGE (pn:PlateletsNode{name:line.platelets, id:line.ID})
MERGE (scn:SerumCreatinineNode{name:line.serum_creatinine, id:line.ID})
MERGE (ssn:SerumSodiumNode{name:line.serum_sodium, id:line.ID})
MERGE (sn:SmokingNode{name:line.smoking, id:line.ID})
MERGE (tn:TimeNode{name:line.time, id:line.ID})
MERGE (den:DeathNode{name:line.DEATH_EVENT, id:line.ID})
 
MERGE (p)-[:Decreased_Of_Red_BloodCells]->(an)
MERGE (p)-[:Levels_Of_CPK]->(cr)
MERGE (p)-[:Has_Diabetes]->(dn)
MERGE (p)-[:Percentage_Of_BloodLeaving]->(en)
MERGE (p)-[:Has_Hypertension]->(bpn)
MERGE (p)-[:Platelets_In_Blood]->(pn)
MERGE (p)-[:Levels_Of_Creatinine]->(scn)
MERGE (p)-[:Levels_Of_Sodium]->(ssn)
MERGE (p)-[:Smoke]->(sn)
MERGE (p)-[:Follow_Up]->(tn)
MERGE (tn)-[:Decreased]->(den)
RETURN count(*);