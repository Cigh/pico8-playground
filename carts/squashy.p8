pico-8 cartridge // http://www.pico-8.com
version 4
__lua__

-- paddle 
padx = 52
pady = 122 
padw = 24
padh = 4

-- ball
ballx = 64
bally = 64
ballsize = 3
ballxdir = 5
ballydir = -3

function movePaddle() 
  if btn(0) then
    padx -= 3
  elseif btn(1) then
    padx += 3
  end
end

function moveBall()
  ballx += ballxdir
  bally += ballydir
end

function loseDeadBall()
  if bally > 128 then
    sfx(3)
    bally = 24
  end
end

function bounceBall()
  -- left
  if ballx < ballsize then
    ballxdir =- ballxdir
    sfx(0)
  end
  -- right
  if ballx > 128 - ballsize then
    ballxdir =- ballxdir
    sfx(0)
  end
  --top
  if bally < ballsize then
    ballydir =- ballydir
    sfx(0)
  end
end

function bouncePaddle()
  if ballx >= padx and
    ballx <= padx * padw and
    bally > pady then
    sfx(0)
    ballydir =- ballydir
  end
end


function _update()
  movePaddle()
  bounceBall()
  bouncePaddle()
  moveBall()
end

function _draw()
  -- clear the screen
  rectfill(0, 0, 128, 128, 3)
  -- draw the paddle
  rectfill(padx, pady, padx + padw, pady + padh, 15)
  -- draw the ball
  circfill(ballx, bally, ballsize, 15)
end

