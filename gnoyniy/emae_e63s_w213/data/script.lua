if car.isAIControlled then
  return nil
end

local counter = 0 -- тот самый счетчик
local prev_extraC = car.extraC
local countertime = 0

function script.update(dt)
  local data = ac.accessCarPhysics()
  data.controllerInputs[0]=counter

  if car.extraC ~= prev_extraC then 
    counter = counter + 1 -- сколько изменяеться при клике, нужно менять тольчко число counter + не трогать
    prev_extraC = car.extraC
    countertime = 0
  end

  if counter >= 2 then -- если число ровно или больше 4 то изменяеться на 0
    counter = 0
  end

if countertime <= 0.6 then -- значение можно поменять что бы сообщение было либо больше времени либо меньше 
	if counter == 0 then-- ну типо при каком значении будет выводиться сообщение
	countertime = countertime + dt
	ac.setMessage("4WD MODE")-- твой текст писать в скобках
	end  
end

if countertime <= 0.6 then-- значение можно поменять что бы сообщение было либо больше времени либо меньше 
	if counter == 1 then -- ну типо при каком значении будет выводиться сообщение
	countertime = countertime + dt
	ac.setMessage("2WD MODE")-- твой текст писать в скобках
	end
end

end