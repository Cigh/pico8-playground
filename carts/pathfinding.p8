pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

function _init()
  start = getSpecialTile(17)
  goal = getSpecialTile(16)

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

-- find the first location of a specific tile type
function getSpecialTile(tileID)
  for x = 0, 15 do
    for y = 0, 15 do
      local tile = mget(x, y)
      if tile == tileID then
        return {x, y}
      end
    end
  end
  printh('Did not find tile: ' ..tileID)
end

-- insert into a start of table
function insert(t, val)
  for i = (#t + 1), 3, -1 do
    t[i] = t[i - 1]
  end
  t[1] = val
end

-- pop the last element off a table
function popend(t)
  local top = t[#t]
  del(t, t[#t])
  return top
end

function reverse(t)
  for i = 1, (#t / 2) do
    local temp = t[i]
    local oppIndex = #t - (i - 1)
    t[i] = t[oppIndex]
    t[oppIndex] = temp
  end
end

-- translate a 2D x, y coordinate to a 10 index and back again
function vectorIndex(vec)
  return mapToIndex(vec[1], vec[2])
end

function mapToIndex(x, y)
  return ((x + 1) * 16) + y
end

function indexToMap(index)
  local x = (index - 1) / 16
  local y = index - (x * w)

  return {x, y}
end