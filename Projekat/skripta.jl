include("graph.jl")
include("projekat.jl")
M=[0 4 6 0 0 0 0 0 0 0 0;
   0 0 0 8 0 3 0 0 0 0 0;
   0 1 0 4 0 7 0 0 0 0 0;
   0 0 0 0 0 0 9 0 0 0 0;
   0 0 0 0 0 0 1 2 0 0 0;
   0 0 0 5 0 0 0 0 0 0 0;
   0 0 0 0 4 0 0 0 0 5 0;
   0 0 0 0 0 0 11 0 6 0 3;
   0 0 0 0 0 0 1 0 0 0 8;
   0 0 0 0 0 2 0 0 0 0 0;
   0 0 0 0 0 0 0 0 0 9 0]
G=nonEmptyGraph(M)
s=3
path=dijkstra!(G,s)
println()
println("Najkrace rastojanje od $s. cvora do svih ostalih je dato kao niz i to je \n$path. \n(0 oznacava pocetni cvor,-1 oznacava cvor do kog nije moguce stici)")
println()
