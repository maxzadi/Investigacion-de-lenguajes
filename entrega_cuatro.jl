# Definimos el struct del grafo
struct Grafo
    conexiones::Dict{String, Vector{String}}
end

# Función para buscar ruta más corta 
function buscar_ruta(g::Grafo, inicio::String, fin::String)
    cola = [[inicio]]              # Array de caminos
    visitados = Set([inicio])      # Set

    while !isempty(cola)
        camino = popfirst!(cola)   
        nodo = camino[end]

        if nodo == fin
            return camino
        end

        for vecino in get(g.conexiones, nodo, [])
            if !(vecino in visitados)
                push!(visitados, vecino)
                nuevo_camino = copy(camino)
                push!(nuevo_camino, vecino)
                push!(cola, nuevo_camino)
            end
        end
    end

    return nothing
end

# Creacion del grafo
g = Grafo(Dict(
    "A" => ["B","C"],
    "B" => ["D","E"],
    "C" => ["F"],
    "D" => ["G"],
    "E" => ["G"],
    "F" => ["G"],
    "G" => []
))

# Inicio
ruta = buscar_ruta(g, "A", "G")

if ruta != nothing
    println("Ruta encontrada: ", ruta)
else
    println("No hay ruta")
end