module BinaryTrees
using Random
using Graphs

include("Mazes.jl")
using .Mazes

function generator!(maze::Maze)
    if length(maze.dim) == 2
        rows, cols = maze.dim
        for cell in 1:prod(maze.dim)
            row = mod(cell-1, rows) + 1
            col = fld(cell-1, rows) + 1
            if row + 1 > rows
                linked = cols * (col) + row
            elseif col + 1 > cols
                linked = cols * (col - 1) + row + 1
            else
                down, right = shuffle([0,1])
                linked = cols * (col + right - 1) + row + down
            end
            add_edge!(maze.graph, cell, linked)
        end
    else
        print("Higher dimensions are not implemented.")
    end
end

end