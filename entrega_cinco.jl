using DataStructures

# Grafo: nodo => [(vecino, peso)]
grafo = Dict(
    1 => [(2,7), (3,9), (6,14)],
    2 => [(3,10), (4,15)],
    3 => [(4,11), (6,2)],
    4 => [(5,6)],
    5 => [(6,9)],
    6 => []
)


function dijkstra(grafo, inicio)

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

resultado = dijkstra(grafo, 1)

println("Distancias mínimas:")

for (nodo, distancia) in resultado
    println("Nodo $nodo => $distancia")
end