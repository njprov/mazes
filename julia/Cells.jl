module Cells
export Cell

struct Cell
    row::Unsigned
    col::Unsigned
    links::Dict{Cell, Bool}
end
Cell(row, col) = Cell(row, col, Dict())

function link!(a, b, bidirectional=true)
    a.links[b] = true
    if bidirectional link!(b, a, false) end
end

function unlink!(a, b, bidirectional=true)
    delete!(a.links, b)
    if bidirectional unlink!(b, a, false) end
end

end