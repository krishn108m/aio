#practical 3
import matplotlib.pyplot as plt
adj = np.array([
    [0, 1, 0, 0, 1, 0],
    [1, 0, 1, 1, 0, 0],
])
print(adj)

from collections import deque
def bfs(adj, s, t):
  q, seen = deque([(s, 0)]), {s}
  while q:
    v, d = q.popleft()
    if v == t:
      return d
    for u in range(len(adj)):
      if adj[v][u] and u not in seen:
        seen.add(u)
        q.append((u, d + 1))
  return None
print("\nShortest path length: ", bfs(adj, 0, 3))

import networkx as nx
G = nx.from_numpy_array(adj)
shortest_path_length = nx.shortest_path_length(G, source=0, target=3)
print(f"Shortest path length using networkx: {shortest_path_length}")



density=(2*np.sum(adj))/adj.size
print(density)


import matplotlib.pyplot as plt
import numpy as np

graph = {"0": ['1', '2', '3'], '1': ['0'], '2': ['0'], '3': ['0']}
edges = np.array([(1,0), (0,3), (0,2), (3,0)])
ego = max(graph, key=lambda n: len(graph[n]))  # node with most connections
print("Ego node:", ego)

p = {0:(0,1), 1:(2,1), 2:(2,0), 3:(3,2)}

def socio(p, edges):
    print("Sociogram:")
    for k,(x,y) in p.items():
        color = "red" if str(k)==ego else "skyblue"  # highlight ego
        plt.scatter(x, y, s=500, c=color, edgecolors="black")
        plt.text(x, y, k, ha='center', va='center', fontsize=10)
    for a,b in edges:
        plt.plot([p[a][0],p[b][0]], [p[a][1],p[b][1]], 'k-', lw=1)
    plt.show()

socio(p, edges)
