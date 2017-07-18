pico-8 cartridge // http://www.pico-8.com
version 8
__lua__

aliveColor = 7
width = 128
height = 128

boardI = 1
boards = {{}, {}}

for y = 1, height do
  boards[1][y] = {}
  boards[2][y] = {}
  for x = 1, width do
    boards[1][y][x] = 0
    boards[1][y][x] = 0
  end
end

function get(bi, x, y)
  if((x < 1) or (x > width) or (y < 1) or (y > height)) then
    return 0
  end
  return boards[bi][y][x]
end

-- draw an r pentomino
boards[1][60][64] = 1
boards[1][60][65] = 1
boards[1][61][63] = 1
boards[1][61][64] = 1
boards[1][62][64] = 1

cls()

while true do
  for y = 1, height do
    for x = 1, width do
      pset(x - 1, y - 1, boards[boardI][y][x] * aliveColor)
    end
  end
  flip()
  otherI = (boardI % 2) + 1
  for y = 1, height do
    for x = 1, width do
      neighbors = (
        get(boardI, x -1, y - 1) +
        get(boardI, x, y - 1) +
        get(boardI, x + 1, y - 1) +
        get(boardI, x - 1, y) +
        get(boardI, x + 1, y) +
        get(boardI, x - 1, y + 1) +
        get(boardI, x, y + 1) +
        get(boardI, x + 1, y + 1))
      if((neighbors == 3) or ((boards[boardI][y][x] == 1) and neighbors == 2)) then
        boards[otherI][y][x] = 1
      else
        boards[otherI][y][x] = 0
      end
    end
  end
  boardI = otherI
end
