worldResponse = {

 	new = function( params ) 
    local self = { }
		self.buildings = { }	

    function self:init( params )
	    if params then
		    if params.buildings then
		    	self.buildings = params.buildings
		    end
		  end
    end

    function self:addBuilding( building )
    	table.insert(self.buildings, building)
    end
    
    return self
	end
}