# Node Similarity Algorithm
Node similarity algorithm compares two nodes based on their shared nodes. Two nodes are considered similar if they share many of the same neighbors. Node Similarity computes pair-wise similarities based on the Jaccard metric, also known as the Jaccard Similarity Score.


The formula to find the Index is:

Jaccard Index = (the number in both sets) / (the number in either set) * 100

The same formula in notation is:
![jaccard](https://user-images.githubusercontent.com/49483578/127020435-b67fba5e-aea3-4168-bcab-6a7a0dd5460b.png)


The Node Similarity algorithm compares each node that has outgoing relationships with each other such node. For every node n, we collect the outgoing neighborhood N(n) of that node, that is, all nodes m such that there is a relationship from n to m. For each pair n, m, the algorithm computes a similarity for that pair which is the Jaccard similarity of N(n) and N(m).
The complexity of this comparison grows quadratically with the number of nodes to compare. The algorithm reduces the complexity by ignoring disconnected nodes.



## Syntax
Node similarity in stream mode on a named graph

CALL gds.nodeSimilarity.stream(
  graphName: String,
  configuration: Map
) YIELD
  node1: Integer,
  node2: Integer,
  similarity: Float
  
![NS_Parameters](https://user-images.githubusercontent.com/49483578/127020951-bf74f546-2b8b-47d4-a28d-1318c70289ac.png)  


We used it on our Metaprotein dataset and got following result:

It shows that Peptide-560 and Peptide-559 are fully similar or in other words, have fully shared neighbours
![NS_Res](https://user-images.githubusercontent.com/49483578/127020331-aa57d23f-b924-46c1-bd8f-41fefc443f7e.png)

![NS_Res_2](https://user-images.githubusercontent.com/49483578/127022231-2629a7b8-61a7-4e71-8813-54ff19b4bf8b.png)


_Some of the data from above is copied from Neo4j website: https://neo4j.com/docs/graph-data-science/current/algorithms/node-similarity/_
