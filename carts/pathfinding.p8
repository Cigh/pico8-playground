pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

function _init()
  start = getspecialtile(17)
  goal = getspecialtile(16)

  frontier = {}
  insert(frontier, start)
  came_from = {}
  came_from[vectorToIndex(start)] = 'none'

  while #frontier > 0 do
    current = popend(frontier)

    local neighbours = getNeighbours(current)
    for next in all(neighbours) do
      if came_from[vectorToIndex(next)] = current
    end
  end
end

function _update()
end

function _draw()
  cls()
  mapdraw(0, 0, 0, 0, 16, 16)
end

-- find all existing neighbours of a position that are not walls
function getNeighbours(pos)
  local neighbours = {}
  local x = pos[1]
  local y = pos[2]

  if x > 0 and (mget(x - 1, y) != wallID) then
    add(neighbours, {x - 1, y})
  end

  if x < 15 and (mget(x + 1, y) != wallID) then
    add(neighbours, {x + 1, y})
  end

  if x > 0 and (mget(x, y - 1) != wallID) then
    add(neighbours, {x, y - 1})
  end

  if x < 15 and (mget(x, y + 1) != wallID) then
    add(neighbours, {x, y + 1})
  end

  return neighbours
end
