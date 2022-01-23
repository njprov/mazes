module Cells
export Cell

struct Cell
    row::Unsigned
    col::Unsigned
    links::Dict{Cell, Bool}
end
Cell(row, col) = Cell(row, col, Dict())

function link!(a::Cell, b::Cell, bidirectional::Bool=true) # do i need the bool type on bidirectional if i assign true as default?
    a.links[b] = true
    if bidirectional link!(b, a, false) end
end

function unlink!(a::Cell, b::Cell, bidirectional::Bool=true)
    delete!(a.links, b)
    if bidirectional unlink!(b, a, false) end
end

end