LOAD CSV WITH HEADERS FROM 'file:///covid.csv' AS row WITH row
MERGE (p:Patient{p_id:row.ID, age:toInteger(row.Age),  sex:row.Sex, risk:row.RiskFactors, diarrhea:row.Diarrhea, fever:row.Fever, coughing:row.Coughing, soreThroat:row.SoreThroat, temp:toFloat(row.Temperature), fatigue:row.Fatigue}) MERGE(d:Disease{p_id:row.ID,diagnosis:row.Diagnosis}) MERGE(p)-[:have]->(d)
RETURN count(*);
