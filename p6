import pandas as pd

try:
    with open('Movie.txt') as f:
        lines = [line.split() for line in f if line.strip()]
except FileNotFoundError:
    exit("Error: 'Movie.txt' not found.")

movies = {}
for emp, mov in lines:
    movies.setdefault(emp, []).append(mov)

emps = list(movies)
matrix = pd.DataFrame(0, index=emps, columns=emps)

for e1 in emps:
    for e2 in emps:
        if e1 != e2:
            matrix.loc[e1, e2] = len(set(movies[e1]) & set(movies[e2]))

print("\nCommon Movies Matrix:\n", matrix)
