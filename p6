graph={}

from re import M
with open("Movie.txt","r")as f:
    for line in f :
        emp,mov=line.strip().split("\t")

        if emp not in graph:
          graph[emp]={"type":"employee","node":set()}

        if mov not in graph:
          graph[mov]={"type":"movie","node":set()}
        graph[emp]["node"].add(mov)
        graph[mov]["node"].add(emp)
print("Two-mode Bipartite Graph Graph (employee-movie):\n")
for node,data in graph.items():
    print(f"{node}({data['type']})->{list(data['node'])}\n")
