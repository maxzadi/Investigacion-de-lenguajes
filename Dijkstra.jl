using DataStructures

# 3 grafos de prueba con casos normales
CASO1 = Dict(
    1 => [(2,4.0),(3,2.0)],
    2 => [(4,1.0)],
    3 => [(4,7.0)],
    4 => []
)

CASO2 = Dict(
    1 => [(2,10.0),(3,1.0)],
    2 => [(4,2.0)],
    3 => [(2,3.0),(4,8.0)],
    4 => []
)

CASO3 = Dict(
    1 => [(2,7.0),(3,9.0),(6,14.0)],
    2 => [(3,10.0),(4,15.0)],
    3 => [(4,11.0),(6,2.0)],
    4 => [(5,6.0)],
    5 => [],
    6 => [(5,9.0)]
)

# Caso de una arista con peso negativo
NEGATIVO = Dict(
    1 => [(2,-5.0)],
    2 => []
)

# Caso de un nodo no conectado a otro nodo
NODOAISLADO = Dict(
    1 => [(2,3.0)],
    2 => [],
    3 => []
)

#Algoritmo
function dijkstra(grafo, inicio)

    if !haskey(grafo, inicio)
        error("El nodo inicial no existe en el grafo.")
    end
    # Verificar si hay aristas con peso negativo
    for (u, vecinos) in grafo
        for (v, peso) in vecinos
            if peso < 0
                error("El grafo contiene aristas con peso negativo.")
            end
        end
    end


    dist = Dict()
    for nodo in keys(grafo)
        dist[nodo] = Inf
    end

    dist[inicio] = 0

    pq = BinaryMinHeap{Tuple{Float64,Int}}()

    push!(pq, (0.0, inicio))

    while !isempty(pq)

        (d, u) = pop!(pq)

        # Ignorar entradas viejas
        if d > dist[u]
            continue
        end

        for (v, peso) in grafo[u]

            nueva = dist[u] + peso

            if nueva < dist[v]

                dist[v] = nueva

                push!(pq, (nueva, v))

            end
        end
    end

    return dist
end

# Pruebas
println("Caso 1:")
resultado1 = dijkstra(CASO1, 1)
for (nodo, distancia) in resultado1 
    println("Nodo $nodo => $distancia")
end
println("\nCaso 2:")
resultado2 = dijkstra(CASO2, 1)
for (nodo, distancia) in resultado2 
    println("Nodo $nodo => $distancia")
end
println("\nCaso 3:")
resultado3 = dijkstra(CASO3, 1)
for (nodo, distancia) in resultado3
    println("Nodo $nodo => $distancia")
end
try
    println("\nCaso no existente el nodo:")
    resultado4 = dijkstra(CASO1, 10)
    for (nodo, distancia) in resultado4
        println("Nodo $nodo => $distancia")
    end
exclusively catch e
    println("Error: ", e)
end

try
    println("\nCaso con peso negativo:")
    resultado_negativo = dijkstra(NEGATIVO, 1)
    for (nodo, distancia) in resultado_negativo
        println("Nodo $nodo => $distancia")
    end
exclusively catch e
    println("Error: ", e)
end

println("\nCaso con nodo aislado:")
resultado_aislado = dijkstra(NODOAISLADO, 1)
for (nodo, distancia) in resultado_aislado
    println("Nodo $nodo => $distancia")
end