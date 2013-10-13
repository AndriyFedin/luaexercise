local storyboard = require "storyboard"
local scene = storyboard.newScene()
local widget = require( "widget" )
require( 'world' )
require( 'stubs' )

local wrStub = stubs.worldResponseStub()

local w = world.new( )
local myButton


function scene:createScene(event)
  local screenGroup = self.view

  local function handleButtonEvent( event )
    local phase = event.phase 

    if "ended" == phase then
      myButton.isVisible = false
      w:init( wrStub )
    end
  end

  -- Create the button
  myButton = widget.newButton
  {
    left = 100,
    top = 200,
    width = 150,
    height = 50,
    -- defaultFile = "default.png",
    -- overFile = "over.png",
    id = "button_1",
    label = "Start battle",
    onEvent = handleButtonEvent,
  }

  -- local image = display.newImageRect( 'images/eadormbw.jpg', 950, 594 )
  -- screenGroup:insert( image )
  -- image:setReferencePoint( display.CenterReferencePoint )
  -- image.x, image.y = display.contentCenterX, display.contentCenterY

  screenGroup:insert( myButton )


end

function scene:enterScene( event )

end

function scene:exitScene( event )

end

function scene:destroyScene( event )

end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
---------------------------------------------------------------------------------

return scene
