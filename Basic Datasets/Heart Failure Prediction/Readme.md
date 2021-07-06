# Dataset : Heart Failure Prediction

You will find two files in this folder. A short descrption of the dataset and how to use it is written below:

## hfp.csv
This csv file contain 'Heart Failure Prediction' dataset. It contains 14 coulmns and 299 rows. Heart faliure commonly occurs because of Cardiovascular diseases (CVDs) and we can features in this dataset to predict mortality by heart faliure

## load_data_hfp.cypher
This file contains the cypher queries to upload the csv file into Neo4j and create nodes, relationships and properties.

### Steps
* Create a database in Neo4j 
* Open the "import" folder of your database and the drop the file "hfp.csv" / or you can make a new csv file in excel and copy the contents of "hfp.csv" from Github
* Start your database
* Open Neo4j Browser
* Open the "load_data_hfp.cypher" in GitHub or notepad/text editor and copy all the cypher queries
  * Alternatively, use apoc.cypher.runFile Procedure (https://neo4j.com/labs/apoc/4.1/cypher-execution/run-cypher-scripts/) for running the project files 
* Paste the query in the Neo4j browser and run

### Acknowledgement
'''
Citation
Davide Chicco, Giuseppe Jurman: Machine learning can predict survival of patients with heart failure from serum creatinine and ejection fraction alone. BMC Medical Informatics and Decision Making 20, 16 (2020). (link)

License
CC BY 4.0
'''
