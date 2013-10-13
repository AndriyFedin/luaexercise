require("building")
require("worldResponse")

stubs = {

    worldResponseStub = function( )

      local building1 = building.new ( )
      building1:init( { 
        state = building1.buildingState.locked,
        buildingUid = "1",
        options = {
          { optionUid = "optionUid1", group = "updates" },
          { optionUid = "optionUid2", group = "units" },
          { optionUid = "optionUid3", group = "technology" }
        }
      })

      local building2 = building.new ( )
      building2:init( { 
        state = building1.buildingState.available,
        buildingUid = "2",
        options = {
          { optionUid = "optionUid1", group = "updates" },
          { optionUid = "optionUid2", group = "units" },
          { optionUid = "optionUid3", group = "technology" }
        }
      })

      local building3 = building.new ( )
      building3:init( { 
        state = building1.buildingState.constructing,
        buildingUid = "3",
        options = {
          { optionUid = "optionUid1", group = "updates" },
          { optionUid = "optionUid2", group = "units" },
          { optionUid = "optionUid3", group = "technology" }
        }
      })


      local wr = worldResponse.new ( )
      wr:init( { buildings = { building1 , building2, building3 } } )

      local building4 = building.new ( )
      building4:init( { 
        state = building1.buildingState.conquired,
        buildingUid = "4",
        options = {
          { optionUid = "optionUid1", group = "updates" },
          { optionUid = "optionUid2", group = "units" },
          { optionUid = "optionUid3", group = "technology" }
        }
      })

      wr:addBuilding( building4 )

      return wr
    end
}