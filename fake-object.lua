local magic = {} -- table which is returned when module is required

function magic:new(name) -- function 'new' which will be in the returned table to be called
	name = not name or type(name)~="string" and "object" or name -- if the name is invalid then call it "object", if it is, then leave it as it is

	local new = newproxy(true) -- newproxy returns a userdata, and, if given the arg true, with a blank metadata.
	local mt = getmetatable(new) -- gets the metatable of the userdata

	local data = {} -- this is where data will be stored for the object

	mt.__index = function(t,k) -- index metamethod is when you try and get a property (e.g. object.name). t is the metatable ( i believe ) and k is what was indexed (e.g. "name")
		return rawget(data,k) -- attempts to get 'k' from the data table, if k doesn't exist in data it returns nil. rawget basically indexes data with k without calling the index metamethod
	end

	mt.__newindex = function(t,k,v) -- newindex metamethod is when you try and set a property (e.g. object.name = "Hi"). v is the value that k is being set with (e.g. "Hi")
		rawset(data,k,v) -- attempts to set data[k]=v, basically meaning that k in the data table is now what v is. (e.g. object.name = "hi" will set "name" in data to "hi")
	end

	mt.__tostring = function() return name end -- when being outputted, instead of being a bunch of hex stuff (since its a userdata), it'll just output the given name.
											   -- tostring metamethod is when the object is trying to be turned into string, e.g tostring(object) will call this metamethod.
	
	mt.__metatable = "metatable not available" -- if someone tries to get the objects metatable it'll return this string instead of the actual metatable
											   -- this is used to prevent people who are venturing to tamper with the code.
	return new

end

return magic
