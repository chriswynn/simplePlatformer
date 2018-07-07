Gamestate = require 'libs.hump.gamestate'

local levelOne = require 'gamestates.levelOne'
local pause = require 'gamestates.pause'

function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(levelOne)
end

function love.keypressed(key)
  if key == "escape" then
    love.event.push("quit")
  end
end
