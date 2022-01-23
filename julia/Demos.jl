module Demos
    include("Cells.jl")
    using .Cells

    c11 = Cell(1,1)
    c12 = Cell(1,2)
    c21 = Cell(2,1)
    Cells.link!(c11, c12)
    Cells.link!(c11, c21)
    println(c11.links)
    Cells.unlink!(c11, c12)
    println(c11.links)

end