module Grids
export Grid

include("Cells.jl")
using .Cells

struct Grid
    rows::Unsigned
    cols::Unsigned
    grid::Matrix{Cell}
end
function Grid(rows::Integer, cols::Integer)
    grid = Matrix{Cell}(undef, rows, cols)
    for row in 1:rows
        for col in 1:cols
            grid[row, col] = Cell(row, col)
        end
    end
    return Grid(rows, cols, grid)
end

function Base.show(io::IO, grid::Grid)
    print(io, "+"*"---+"^grid.cols*"\n")
    for row in eachrow(grid.grid[1:end-1,1:end])
        sides = "|"
        floors = "+"
        for cell in row[1:end-1]
            sides = sides*(if haskey(cell.links, grid.grid[cell.row, cell.col+1]) "    " else "   |" end)
            floors = floors*(if haskey(cell.links, grid.grid[cell.row+1, cell.col]) "   +" else "---+" end)
        end
        print(io, sides*"   |\n")
        cell = row[end]
        floors = floors*(if haskey(cell.links, grid.grid[cell.row+1, cell.col]) "   +" else "---+" end)
        print(io, floors*"\n")
    end
    sides = "|"
    for cell in grid.grid[end, 1:end-1]
        sides = sides*(if haskey(cell.links, grid.grid[cell.row, cell.col+1]) "    " else "   |" end)
    end
    print(io, sides*"   |\n")
    print(io, "+"*"---+"^grid.cols*"\n")
end
# function Base.show(io::IO, ::MIME"image/png", grid::Grid)
# end

end