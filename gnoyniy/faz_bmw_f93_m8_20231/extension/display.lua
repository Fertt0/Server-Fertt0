
  local player = ui.MediaPlayer()
  local prev_extraA = car.extraA
  local plate=true
local plate1=true
player:setSource('f95Logo.wmv')

function script.update(dt)

if car.extraA then
  ui.drawImage(player, vec2(), vec2(1205, 437))
  player:play()
  player:setCurrentTime(0)
  player:isPaused()
  player:pause()
end
end
