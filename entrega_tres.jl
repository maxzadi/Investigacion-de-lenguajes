function raices(a,b,c)
    discriminante = b^2-4a*c

    x1= (-b+sqrt(complex(discriminante)))/(2a)
    x2= (-b-sqrt(complex(discriminante)))/(2a)

    println("Las raíces del polinomio son x1 = $x1, x2 = $x2")
end

struct Triangulo
    a::Float64
    b::Float64
    c::Float64
end

function menu()

    while true
    println("Ingresa el término \"a\" de ax^2 + bx + c (o s para salir): ")
    a_in = readline()

    if a_in == "s"
        break
    end

    a = parse(Float64, a_in)

    println("Ingresa el término \"b\": ")
    b = parse(Float64, readline())

    println("Ingresa el término \"c\": ")
    c = parse(Float64, readline())

    raices(a,b,c)
    end
end

menu()