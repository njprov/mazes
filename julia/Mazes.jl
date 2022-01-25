module Mazes
export Maze, generate_btree!, generate_sidewinder!

using Graphs, Random

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

function generate_btree!(maze)
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

function generate_sidewinder!(maze)
    if length(maze.dim) == 2
        rows, cols = maze.dim
        run = []
        for cell in 1:prod(maze.dim)
            row = mod(cell-1, rows) + 1
            col = fld(cell-1, rows) + 1
            if row + 1 > rows
                linked = cols * (col) + row
            elseif col + 1 > cols
                linked = cols * (col - 1) + row + 1
            else
                append!(run, cell)
                forward = rand([true, false])
                if forward
                    linked = cols * (col - 1) + row + 1
                else
                    choice = rand(run)
                    add_edge!(maze.graph, choice, choice+1)
                    empty!(run)
                    continue
                end
            end
            add_edge!(maze.graph, cell, linked)
        end
    else
        print("Higher dimensions are note implemented.")
    end
end

end
