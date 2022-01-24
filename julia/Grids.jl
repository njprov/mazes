module Grids
export Grid

include("Cells.jl")
using .Cells

struct Grid
    rows::Unsigned
    cols::Unsigned
    grid::Matrix{Cell}
end

function prepare_grid(rows::Integer, cols::Integer)::Grid
    grid = Matrix{Cell}(undef, rows, cols)
    for row in 1:rows
        for col in 1:cols
            grid[row, col] = Cell(row, col)
        end
    end
    return Grid(rows, cols, grid)
end

Grid(rows, cols) = prepare_grid(rows, cols)

end