-- local Object = require 'lib/classic/classic'
Circle = require 'obj.Circle'
HyperCircle = Circle:extend()

function HyperCircle:new(x, y, radius, line_width, outer_radius)
    HyperCircle.super.new(self, x, y, radius)
    self.rad = radius
    self.line_width = line_width
    self.outer_radius = outer_radius
    self.creation_time = love.timer.getTime()
end

function HyperCircle:draw()
    love.graphics.setColor(1, 1, 1)
    --love.graphics.setLineWidth(self.line_width)
    love.graphics.circle("line", self.xCord, self.yCord, self.rad)
    love.graphics.circle("line", self.xCord, self.yCord, self.outer_radius)
end

return HyperCircle