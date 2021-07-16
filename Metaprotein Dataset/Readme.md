# Dataset : Metaprotein

You will find three files in this folder. A short descrption of the dataset and how to use it is written below:

## protein.csv
This csv file contain proteins. It contains 14 coulmns and 299 rows.

## peptide.csv
This csv file contain peptides. It contains 14 coulmns and 299 rows.

## relationships.csv
This csv file contain relatioinships between proteins and peptides. It contains 14 coulmns and 299 rows. You will find following types of relationships in this file
 * Shared peptides
 * Peptides set

## load_data_metaprotein.cypher
This file contains the cypher queries to upload the csv file into Neo4j and create nodes, relationships and properties.

### Steps
* Create a database in Neo4j 
* Open the "import" folder of your database and the drop the files "protein.csv" , "peptide.csv"  nad "relationships.csv" / or you can make a new csv file in excel and copy the contents of "hfp.csv" from Github
* Start your database
* Open Neo4j Browser
* Open the "load_data_metaprotein.cypher" in GitHub or notepad/text editor and copy all the cypher queries
  * Alternatively, use apoc.cypher.runFile Procedure (https://neo4j.com/labs/apoc/4.1/cypher-execution/run-cypher-scripts/) for running the project files 
* Paste the query in the Neo4j browser and run

### Acknowledgement
```
Santos, Alberto; Colaço, Ana Rita; Nielsen, Annelaura Bach; Mann, Matthias (2020), “Clinical Knowledge Graph”, Mendeley Data, V1, doi: 10.17632/mrcf7f4tc2.1

```
