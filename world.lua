
require( 'worldResponse' )
require( 'building' )

local buildingsCoordinates = { }
buildingsCoordinates[1] = {x = 3, y = 5}
buildingsCoordinates[2] = {x = 150, y = 30}
buildingsCoordinates[3] = {x = 70, y = 200}
buildingsCoordinates[4] = {x = 200, y = 300}


world = {
    
  new = function( ) 
    local self = {}
    self.buildings = { }

    local function onObjectTouch( event )
      if event.phase == "began" then
          event.target:setFrame(event.target.frame + 1)
      end
      return true
    end 
    
    function self:init( worldResponse )

      print("world.init! #buildings = "..#worldResponse.buildings)

      self.group = display.newGroup()
      
      for i = 1, 4 do
        local part_name = 'part_' .. i .. '.jpg'
        local part = display.newImageRect(part_name, 512, 512)

        part:setReferencePoint( display.TopLeftReferencePoint )
        
        self.group:insert(part)
      end
      
      self.group[1].x, self.group[1].y = 0, 0
      self.group[2].x, self.group[2].y = 512, 0
      self.group[3].x, self.group[3].y = 0, 512
      self.group[4].x, self.group[4].y = 512, 512

      self.group.x, self.group.y = 0, 0 

      self:createBuildingsViews( worldResponse.buildings )

      Runtime:addEventListener("touch", self) 
    end

    function self:createBuildingsViews( buildings )
      print("function createBuildingsViews")
      print(buildings)

      for i=1,#buildings do

        local buildingView = self:createBuildingView( )

        table.insert(self.buildings, buildingView)
        self.group:insert( buildingView )
        buildings[i].view = buildingView

        buildingView.x, buildingView.y = buildingsCoordinates[i].x, buildingsCoordinates[i].y
        buildingView:setFrame(buildings[i].state)

      end
      
    end

    function self:createBuildingView(  )
      local sector_name = 'sector_sheet.jpg'
      local options =
      {
          width = 128,
          height = 128,
          numFrames = 5
      }

      local sequenceData = {
         { name = "sector1", start=1, count=5, time=0, loopCount=1 },
      }

      local sector_sheet = graphics.newImageSheet( sector_name, options )

      local sectorSprite = display.newSprite( sector_sheet, sequenceData )

      sectorSprite:setReferencePoint( display.TopLeftReferencePoint )
      sectorSprite.x, sectorSprite.y = 0, 0
      sectorSprite.id = "bla1"
      sectorSprite:addEventListener( "touch", onObjectTouch ) 
      sectorSprite:setSequence("sector1")
      return sectorSprite
    end


    local _x, _y = 0, 0  

    function self:touch( event )
      if event.phase == "began" then   
        _x, _y = event.x, event.y
      elseif event.phase == "moved" then   
        
        local new_x, new_y = self.group.x -(_x - event.x), self.group.y -(_y - event.y)
        
        if new_x > 0 then new_x = 0 end
        if new_y > 0 then new_y = 0 end

        local right_offset = 1024 - display.contentWidth
        local bottom_offset = 1024 - display.contentHeight

        if new_x < -right_offset then new_x = -right_offset end
        if new_y < -bottom_offset then new_y = -bottom_offset end

        self.group.x, self.group.y =  new_x, new_y 

        _x, _y = event.x, event.y
      end
    end

    return self
  end

}