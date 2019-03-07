function MainMenuState:load()
  require "parallaxstars"
end

local t = 0
local keyPressLastFrame = false

function MainMenuState:draw()
  love.graphics.clear()
  BackgroundStar.drawAll()
  if usingGamepad() then
    love.graphics.printf("ALIEN INVASION\n\nBY MARK KALDAS\n\nCONTROLS:\nLEFT JOYSTICK TO MOVE\nANY BUTTON TO SHOOT", 0, 40, retroEngine.gameWidth, "center")
    if t < 1 then
      love.graphics.printf("PRESS ANY BUTTON TO PLAY", 0, 90, retroEngine.gameWidth, "center")
    end
  else
    love.graphics.printf("ALIEN INVASION\n\nBY MARK KALDAS\n\nCONTROLS:\nARROW KEYS TO MOVE\nSPACEBAR TO SHOOT", 0, 40, retroEngine.gameWidth, "center")
    if t < 1 then
      love.graphics.printf("PRESS SPACE TO PLAY", 0, 90, retroEngine.gameWidth, "center")
    end
  end
end

function MainMenuState:update(dt)
  BackgroundStar.updateAll(dt)
  t = t + dt
  if t >= 2 then t = 0 end
  
  if keyPressLastFrame and not (key("space") or gamepadPressed()) then 
    GameState.enter(PlayingState.instance)
  end
  
  keyPressLastFrame = key("space") or gamepadPressed()
end