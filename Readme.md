
#Implementación del Algoritmo de Dijkstra en Julia

##Descripción

Este proyecto implementa el algoritmo de Dijkstra utilizando el lenguaje Julia y la estructura de datos BinaryMinHeap proporcionada por el paquete DataStructures.jl.

El algoritmo calcula la distancia mínima desde un nodo origen hacia todos los demás nodos de un grafo ponderado con pesos no negativos.

Además de la implementación principal, el programa incluye varios casos de prueba para verificar el funcionamiento correcto del algoritmo y el manejo de situaciones especiales.

##Requisitos

Antes de ejecutar el programa es necesario tener instalado:

Julia 1.10 o superior (o una versión compatible).
El paquete DataStructures.jl.

##Ejecución del programa


Desde la terminal o consola ubicarse en la carpeta donde se encuentra el archivo y ejecutar:

julia Dijkstra.jl

También puede ejecutarse directamente desde VS Code, Julia REPL o cualquier entorno compatible con Julia.


#Casos de prueba incluidos


El programa incluye tres casos normales y varios casos borde.


##Caso 1


Grafo pequeño conectado.

1 --4--> 2 --1--> 4
|
2
|
v
3 --7--> 4

Permite verificar el funcionamiento básico del algoritmo.

##Caso 2

Grafo con múltiples caminos hacia un mismo nodo.

1 --10--> 2 --2--> 4
|
1
|
v
3 --3--> 2
 \
  \--8--> 4

Permite comprobar que el algoritmo selecciona la ruta de menor costo.

##Caso 3

Grafo de mayor tamaño con múltiples alternativas.

1 → 2 → 4 → 5
↓   ↓
3 → 6 → 5

Se utiliza para validar el comportamiento en grafos más complejos.


#Casos borde implementados


##Nodo inicial inexistente


Se intenta ejecutar el algoritmo con un nodo origen que no pertenece al grafo.

Ejemplo:

dijkstra(CASO1, 10)

Resultado esperado:

Error: El nodo inicial no existe en el grafo.


##Peso negativo

Se utiliza un grafo que contiene una arista con peso negativo.

Ejemplo:

NEGATIVO = Dict(
    1 => [(2,-5.0)],
    2 => []
)

Resultado esperado:

Error: El grafo contiene aristas con peso negativo.

Este caso es importante porque el algoritmo de Dijkstra no garantiza resultados correctos cuando existen pesos negativos.


##Nodo aislado

Se evalúa un grafo que contiene un nodo sin conexión con el resto de la red.

Ejemplo:

1 → 2

3

Resultado esperado:

Nodo 1 => 0
Nodo 2 => 3
Nodo 3 => Inf

La distancia infinita indica que el nodo no es alcanzable desde el origen.