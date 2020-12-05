local CONST_A = 1103515245
local CONST_C = 12345
local CONST_M = 2^31

local Random = {}
Random.__index = Random

function Random.new(initial)
	local self = setmetatable({}, Random)
	self._value = initial or 0
	return self
end

function Random:Next()
	self._value = (CONST_A*self._value + CONST_C)%CONST_M
	return self._value
end

function Random:Rand()
	return self:Next()/CONST_M
end

function Random:Destroy()
	self._value = nil
	setmetatable(self, nil)
end

return Random