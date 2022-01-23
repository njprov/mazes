module Demos
    include("Maxes.jl")
    using .Maxes

    hello()

    c11 = Cell(1,1)
    c12 = Cell(1,2)
    c21 = Cell(2,1)
    c11.links["east"] = c12
    c11.links["south"] = c21
    println(c11.links)

end