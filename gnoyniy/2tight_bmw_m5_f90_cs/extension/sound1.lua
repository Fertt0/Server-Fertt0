local sound = ui.MediaPlayer()
sound:setSource('./AIRlift.mp3')
sound:setLooping(false)
local flag = 0

function update(dt)
  if car.extraE and flag == 0 then
    sound:play()
    flag = 1
  end

  if not car.extraE then
    flag = 0
  end

end