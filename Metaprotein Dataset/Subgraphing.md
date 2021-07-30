# Subgraphing

Our dataset is essentially a big network of multiple connected nodes and relationships. Running Cypher queries on the whole network costs a lot of resources and time. Subgraphing is way to narrow down and focus on a small portion of the whole dataset. A local network of some connected nodes is an example of a subgraph.

## Subgraphing in Neo4j

Neo4j contains a library called the Graph Data Science (GDS) Library that provides built-in support for efficiently implemented algorithms that can be run on the graphs. Different algorithms compute scores or structures or patterns differently. However one essential step before running these algorithms is subgraphing. Breaking down the whole network into smaller chunks makes it faster and less resource-intensive when running GDS algorithms and procedures. 
