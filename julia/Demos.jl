module Demos
    include("Cells.jl")
    using .Cells
    include("Grids.jl")
    using .Grids

    # c11 = Cell(1,1)
    # c12 = Cell(1,2)
    # c21 = Cell(2,1)
    # Cells.link!(c11, c12)
    # Cells.link!(c11, c21)
    # println(c11.links)
    # Cells.unlink!(c11, c12)
    # println(c11.links)

    g = Grid(4,4)
    Cells.link!(g.grid[1,1], g.grid[1,2])
    Cells.link!(g.grid[1,2], g.grid[1,3])
    Cells.link!(g.grid[1,3], g.grid[1,4])
    Cells.link!(g.grid[2,1], g.grid[2,2])
    Cells.link!(g.grid[2,2], g.grid[1,2])
    Cells.link!(g.grid[2,3], g.grid[2,4])
    Cells.link!(g.grid[2,4], g.grid[1,4])
    Cells.link!(g.grid[3,1], g.grid[3,2])
    Cells.link!(g.grid[3,2], g.grid[3,3])
    Cells.link!(g.grid[3,3], g.grid[2,3])
    Cells.link!(g.grid[3,4], g.grid[2,4])
    Cells.link!(g.grid[4,1], g.grid[3,1])
    Cells.link!(g.grid[4,2], g.grid[4,3])
    Cells.link!(g.grid[4,3], g.grid[4,4])
    Cells.link!(g.grid[4,4], g.grid[3,4])
    print(g)

end