pico-8 cartridge // http://www.pico-8.com
version 4
__lua__

-- paddle 
padx = 52
pady = 122 
padw = 24
padh = 4

function movepaddle() 
  if btn(0) then
    padx -= 3
  elseif btn(1) then
    padx += 3
  end
end

function _update()
  movepaddle()
end

function _draw()
  -- clear the screen
  rectfill(0, 0, 128, 128, 3)

  -- draw the paddle
  rectfill(padx, pady, padx + padw, pady + padh, 15)
end
