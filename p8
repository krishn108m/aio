import networkx as nx
import matplotlib.pyplot as plt
from itertools import combinations


G = nx.Graph({
    ('A','B'),('A','C'),('A','D'),
    ('B','E'),('B','F'),
    ('C','I'),
    ('D','G'),('D','H')
})


structural = [(u,v) for u,v in combinations(G.nodes(),2)
              if set(G.neighbors(u)) == set(G.neighbors(v))]


atomic = [(u,v) for u,v in combinations(G.nodes(),2)
           if G.degree(u) == G.degree(v)]


groups = {}
for u in G.nodes():
    pattern = tuple(sorted([G.degree(n) for n in G.neighbors(u)]))
    groups.setdefault(pattern, []).append(u)
regular = [pair for g in groups.values() if len(g)>1 for pair in combinations(g,2)]

print("Structural Equivalence:", structural)
print("Atomic Equivalence:", atomic)
print("Regular Equivalence:", regular)


pos = nx.spring_layout(G, seed=42)
nx.draw(G, pos, with_labels=True, node_color='lightblue', node_size=1000, font_size=12, edge_color='gray')
plt.title("Graph for Equivalence Relations")
plt.show()
