# Analysis of executed queries in cypher, including Stored Procedures 

We have performed the analysis of our queries by storing them in the file **query_data.csv** and analysing 
them both in Python and R and you will find them in the files **Query_analysis_python.ipynb** and **Query_analysis_r.R** respectively.

## Variables in dataset (query_data.csv)
1. **Query** - Index of all queries we executed for the analysis
2. **Rows** - Rows returned for the query
3. **DbHits** - Units of storage work processed during each query
4. **time_not_ind** - Time taken for query execution without any **Indexing**
5. **time_ind** - Time taken for query execution after **Indexing**
6. **time(not_ind-ind)** - (Value in 5) - (Value in 4)
7. **Memory** - Memory required for the query execution
8. **Cache_memory** - Indicate whether cache memory was kept to **default** or **zero** during query execution

## For analysis in R
Open the **Query_analysis_r.R** in RStudio and run the code line by line. You can also select everything and click "Source".
