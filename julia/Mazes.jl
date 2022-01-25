module Mazes
export Maze

using Graphs

struct Maze
    dim::Tuple # TODO
    graph::SimpleGraph
end
function Maze(dim)
    graph = SimpleGraph(prod(dim))
    return Maze(dim, graph)
end

function Base.show(io::IO, maze::Maze)
    if length(maze.dim) == 2
        empty = "   "
        rows, cols = maze.dim
        println(io, "+" * "---+"^cols)
        for row = 1:rows
            sides = "|"
            floors = "+"
            for col = 1:cols
                # julia uses column major order
                cell = cols * (col - 1) + row
                right = cols * (col) + row
                down = cols * (col - 1) + row + 1
                sides = sides * empty * (
                    if has_edge(maze.graph, cell, right)
                        " "
                    else
                        "|"
                    end
                )
                floors = floors * (
                    if has_edge(maze.graph, cell, down)
                        "   "
                    else
                        "---"
                    end
                ) * "+"
            end
            println(io, sides)
            println(io, floors)
        end
    else
        print("Higher dimensions are not implemented.")
    end
end

end
