local sound = ui.MediaPlayer()
local sound1 = ui.MediaPlayer()
local sound2 = ui.MediaPlayer()
local rpmCheck = ui.MediaPlayer()
local turnSignal = ui.MediaPlayer()
sound:setSource('./engine.mp3')
sound1:setSource('./sounds/chime.mp3')
sound2:setSource('./sounds/door_open.wav')
rpmCheck:setSource('./sounds/chime.mp3')
turnSignal:setSource('./sounds/turn_signals.mp3')
sound:setLooping(false)
sound1:setLooping(false)
sound2:setLooping(false)
rpmCheck:setLooping(false)
turnSignal:setLooping(false)
local flag = 0


function update(dt)
  if car.extraA and flag == 0  then
    sound:play()
    sound:setVolume(ac.getAudioVolume('main') * 0.7)
    flag = 1
  end

  if not car.extraA then
    flag = 0
  end

if ((ac.getCar().turningLeftLights == true or ac.getCar().turningRightLights == true) and ac.isInteriorView() ==
        true) then
          turnSignal:setVolume(ac.getAudioVolume('main') * 0.2)
          turnSignal:play()
        else 
          turnSignal:pause()
          turnSignal:setCurrentTime()
        end          
end

