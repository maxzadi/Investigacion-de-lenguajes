#Ejemplo de datos numericos
x=7
y=2

println("Numeros enteros:\n",x," - ",y," = ",x-y)
x2=15.2

println("Numeros punto flotante:\n",x2," / ",y," = ",x2/y)

i=1-2*im
println("Numeros complejos:\n",y,"*(",i,") = ",y*i)

#Ejemplo de datos de texto
caracterA='a'
caracterB='b'
caracterC='c'
caracterD='d'
cadenaA="Hola"
cadenaB="Mundo"
println("Chars: ",caracterA,caracterB,caracterC,caracterD)
println("Strings: ",cadenaA,cadenaB)

#Ejemplo de datos especiales
function saludar(nombre)
    println("Hola ", nombre)
    return nothing
end

resultado = saludar("JUAN")

println(resultado)      
typeof(resultado)       

especial = Any[1, "texto", 3.14, true]

println(x)

#Ejemplo de un error debido a operaciones con tipos de dato incompatibles
println("Operación inválida: 5 + \"hola\"")
try
    A = 5
    B = "hola"
    C = A + B      # Error: Int + String
catch
    println("Error: no se pueden operar tipos de datos incompatibles")
end

# Ejemplos de estructuras de datos
#Array
numeros = [1, 2, 3, 4]
println("Array de numeros: ",numeros)

#Tupla
nombres = ("Juan","Ana")
println("Tupla de nombres: ",nombres)

#Diccionario
edades = Dict("Ana" => 20, "Juan" => 22)
println("Diccionario de nombres y edades: ",edades)

#Set
numeros2 = Set([1, 2, 2, 3])
println("Set de numeros: ",numeros2)   

#Estructura personalizada
struct Estudiante
    nombre::String
    edad::Int
end

e = Estudiante("Nicolas", 21)
println("Estuctura de datos con datos de persona: ",e)
