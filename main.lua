-- editable love.run if desired
-- function love.run()

-- 	if love.math then
-- 		love.math.setRandomSeed(os.time())
-- 	end

-- 	if love.load then love.load(arg) end

-- 	-- We don't want the first frame's dt to include time taken by love.load.
-- 	if love.timer then love.timer.step() end

-- 	local dt = 0

-- 	-- Main loop time.
-- 	while true do
-- 		-- Process events.
-- 		if love.event then
-- 			love.event.pump()
-- 			for name, a,b,c,d,e,f in love.event.poll() do
-- 				if name == "quit" then
-- 					if not love.quit or not love.quit() then
-- 						return a
-- 					end
-- 				end
-- 				love.handlers[name](a,b,c,d,e,f)
-- 			end
-- 		end

-- 		-- Update dt, as we'll be passing it to update
-- 		if love.timer then
-- 			love.timer.step()
-- 			dt = love.timer.getDelta()
-- 		end

-- 		-- Call update and draw
-- 		if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled

-- 		if love.graphics and love.graphics.isActive() then
-- 			love.graphics.clear(love.graphics.getBackgroundColor())
-- 			love.graphics.origin()
-- 			if love.draw then love.draw() end
-- 			love.graphics.present()
-- 		end

-- 		if love.timer then love.timer.sleep(0.001) end
-- 	end

-- end
Object = require 'lib/classic/classic'
Circle = require 'obj.Circle'
image = love.graphics.newImage('sans.png')
function love.load()
    local object_files = {}
    recursiveEnumerate('objects', object_files)
    requireFiles(object_files)
end

function recursiveEnumerate(folder, file_list)
    local items = love.filesystem.getDirectoryItems(folder)
    for _, item in ipairs(items) do
        local file = folder .. '/' .. item
        if love.filesystem.isFile(file) then
            table.insert(file_list, file)
        elseif love.filesystem.isDirectory(file) then
            recursiveEnumerate(file, file_list)
        end
    end
end

function requireFiles(files)
    for _, file in ipairs(files) do
        local file = file:sub(1, -5)
        require(file)
    end
end

-- function love.update(dt)

-- end
love.window.setMode(1000,1000, {resizable=false, vsync=true})
circle_instance = Circle(400, 300, 50)

function love.draw()
    circle_instance:draw()
    print(circle_instance.creation_time)
    love.graphics.draw(image, love.math.random(0, 1900), love.math.random(0, 1000))
end