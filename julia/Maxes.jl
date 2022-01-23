module Maxes
export hello, Cell, Grid

hello() = println("hell from Maxes")

struct Cell
    row::UInt
    col::UInt
end

end