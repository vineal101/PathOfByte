Object = require 'lib/classic/classic'

Circle = Object:extend()

function Circle:new(x, y, radius)
    self.xCord = x
    self.yCord = y
    self.rad = radius
    self.creation_time = love.timer.getTime()
end

function Circle:update(dt)
end

function Circle:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.circle("fill", self.xCord, self.yCord, self.rad)
end

return Circle