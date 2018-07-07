local Gamestate = require 'libs.hump.gamestate'
local Class = require 'libs.hump.class'

local LevelBase = require 'gamestates.levelBase'
local Player = require 'entities.player'
local camera = require 'libs.camera'

local levelOne = Class{
  __includes = LevelBase
}

player = nil

function levelOne:init()
  LevelBase.init(self, 'assets/levels/level_one.lua')
end

function levelOne:enter()
  player = Player(self.world, 32, 64)
  LevelBase.Entities:add(player)
end

function levelOne:update(dt)
  self.map:update(dt)
  LevelBase.Entities:update(dt)
  LevelBase.positionCamera(self, player, camera)
end

function levelOne:draw()
  camera:set()
  self.map:draw(-camera.x, -camera.y)
  LevelBase.Entities:draw()
  camera:unset()
end

function levelOne:keypressed(key)
  LevelBase:keypressed(key)
end

return levelOne
