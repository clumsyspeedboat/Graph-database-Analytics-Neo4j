# Dataset : H1N1_COVID Classification

You will find two files in this folder. A short descrption of the dataset and how to use it is written below:

## covid.csv
This csv file contain 'H1N1_COVID Classification' dataset. It contains 14 coulmns and 1485 rows.
## load_data_flu.cypher
This file contains the cypher queries to upload the csv file into Neo4j and create nodes, relationships and properties.

### Steps
* Create a database in Neo4j 
* Open the "import" folder of your database and the drop the file "covid.csv" / or you can make a new csv file in excel and copy the contents of "covid.csv" from Github
* Start your database
* Open Neo4j Browser
* Open the "load_data_flu.cypher" in GitHub or notepad/text editor and copy all the cypher queries
  * Alternatively, use apoc.cypher.runFile Procedure (https://neo4j.com/labs/apoc/4.1/cypher-execution/run-cypher-scripts/) for running the project files 
* Paste the query in the Neo4j browser and run

### Acknowledgement
```
Citation
https://github.com/yoshihiko1218/COVID19ML

```
