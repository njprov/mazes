module Maxes
export Maxe

using Graphs

struct Maxe
    dim::Tuple # TODO
    graph::SimpleGraph
end
function Maxe(dim)
    graph = SimpleGraph(prod(dim))
    return Maxe(dim, graph)
end

function Base.show(io::IO, maxe::Maxe)
    if length(maxe.dim) == 2
        empty = "   "
        rows, cols = maxe.dim
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
                    if has_edge(maxe.graph, cell, right)
                        " "
                    else
                        "|"
                    end
                )
                floors = floors * (
                    if has_edge(maxe.graph, cell, down)
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
        print("not implemented")
    end
end

end
