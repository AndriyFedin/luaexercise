building = {

 	new = function( params ) 

    print("new building")

    local self = { }
    self.options = { } 

    self.buildingState = {
      locked = 1,
      available = 2,
      conquired = 3,
      constructing = 4,
      built = 5
    }

    function self:init( params )
      if params then
        self.state = params.state
        self.id = params.id
        if params.options then
          self.options = params.options
        end
      end
    end

    return self
	end
}



