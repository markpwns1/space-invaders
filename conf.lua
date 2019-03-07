require "retroengine"

function love.conf(t)
	t.title = retroEngine.windowTitle 
	t.version = "11.2"        
  
	t.window.width = retroEngine.windowWidth
	t.window.height = retroEngine.windowHeight
  t.window.resizable = true
  t.window.minHeight = retroEngine.windowHeight
  t.window.minWidth = retroEngine.windowWidth
  
	t.console = false
  t.window.vsync = false
end