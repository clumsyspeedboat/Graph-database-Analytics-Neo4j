# Subgraphing

Our dataset is essentially a big network of multiple connected nodes and relationships. Running Cypher queries on the whole network costs a lot of resources and time. Subgraphing is a way to narrow down and focus on a small portion of the whole dataset, or use native projection to project a neo4j graph into an in-memory graph. 

## Subgraphing in Neo4j

Neo4j contains a library called the Graph Data Science (GDS) Library that provides built-in support for efficiently implemented algorithms that can be run on the graphs. Different algorithms compute scores or structures or patterns differently. However one essential step before running these algorithms is subgraphing. Breaking down the whole network into smaller chunks makes it faster and less resource-intensive when running GDS algorithms and procedures. 

### Syntax and Use

In our case, we used subgraphing to load to project our graph into an in-memory graph to run algorithms. To do this, first we build the database using the method outlined previously for the metaprotein dataset, enable GDS library functionality in the graph, and then we can use a built-in procedured called gds.graph.create. 

gds.graph.create takes mandatory parameters: subgraph name, the nodes, and the relationships. 
```
CALL gds.graph.create(
    graphName: String,
    nodeProjection: String, List or Map,
    relationshipProjection: String, List or Map,
    configuration: Map
)
```

In our case we can use shorthand notation to easily create a subgraph of all peptides and proteins, and the relationships between them.
```
CALL gds.graph.create( 'myGraph',{Peptide:{label:'Peptide'}, Protein:{label:'Protein'} }, '*') YIELD graphName, nodeCount, relationshipCount;
```


