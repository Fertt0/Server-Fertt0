if car.isAIControlled then
  return nil
end

local bagslevel=500
local i=1

function script.update(dt)
	local data = ac.accessCarPhysics()
	data.controllerInputs[0]=bagslevel
	if car.extraE then
		if bagslevel>0 then
			bagslevel=bagslevel-i
			ac.setMessage("down "..bagslevel)
			data.controllerInputs[0]=bagslevel
		end
	end
	if car.extraF then
		if bagslevel<1000 then
			bagslevel=bagslevel+i
			ac.setMessage("up "..bagslevel)
			data.controllerInputs[0]=bagslevel
		end
	end
end