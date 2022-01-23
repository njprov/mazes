module Maxes
export hello, Cell, Grid

hello() = println("hell from Maxes")

struct Cell
    row::Unsigned
    col::Unsigned
    links::Dict{String, Cell}
end
Cell(row, col) = Cell(row, col, Dict())

end