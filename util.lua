key = love.keyboard.isDown
--keyPress = love.keypressed

ternary = function(condition, trueVal, falseVal)
  if condition then
    return trueVal
  else
    return falseVal
  end
end

lowerLimit = function(value, min)
  return ternary(value < min, min, value)
end

upperLimit = function(value, max)
  return ternary(value > max, max, value)
end

limit = function(value, min, max)
  return lowerLimit(upperLimit(value, max), min)
end

table.indexOf = function(t, o)
  for i, v in ipairs(t) do
    if v == o then return i end
  end
end

table.removeValue = function(t, o)
  table.remove(t, table.indexOf(o))
end

table.print = function(t)
  local output = "{ "
  for i, v in ipairs(t) do 
    output = output .. tostring(v) 
    if i ~= #t then
      output = output .. ", "
    end
  end
  output = output .. " }" 
  print(output)
end

foreach = function(t, func)
  for i in pairs(t) do
    func(i)
  end
end

intersects = function(x1, y1, w1, h1, x2, y2, w2, h2)
  return (x1 + w1 >= x2) and (y1 + h1 >= y2) and (x1 <= x2 + w2) and (y1 <= y2 + h2)
end

function randomf(lower, greater)
    return lower + math.random()  * (greater - lower);
end


local DEADZONE = 0.15

function gamepadPressed()
  local gp = gamepad()
  return gp ~= nil and gp:isGamepadDown("a", "b", "x", "y");
end

function gamepad()
  return love.joystick.getJoysticks()[1]
end

function joystickAxisDiscrete(name)
  local axis = gamepad():getGamepadAxis(name)
  if axis > DEADZONE then
    return 1
  elseif axis < -DEADZONE then 
    return -1
  else
    return 0
  end
end

function joystickAxis(name)
  local axis = gamepad():getGamepadAxis(name)
  if axis > DEADZONE or axis < -DEADZONE then return axis end
  return 0
end

function usingGamepad()
  return #(love.joystick.getJoysticks()) > 0
end