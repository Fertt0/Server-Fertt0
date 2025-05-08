local start = ui.MediaPlayer()
local start2 = ui.MediaPlayer()
local warning = ui.MediaPlayer()
local rpmCheck = ui.MediaPlayer()
local turnSignal = ui.MediaPlayer()
local extraF = car.extraF
local zvukLuka = ui.MediaPlayer()
start:setSource('./1/START_UP.wav')
warning:setSource('./1/chime3.ogg')
rpmCheck:setSource('./sounds/chime.mp3')
turnSignal:setSource('./1/turn_signals.mp3')
zvukLuka:setSource('./1/mech2.mp3')
start2:setSource('./1/start2.mp3')
warning:setLooping(false)
rpmCheck:setLooping(false)
start:setLooping(false)
start2:setLooping(false)
local flag = 0
local flag1 = 0
local prev_extraA = car.extraA


function update(dt)
  if car.extraA ~= prev_extraA and flag == 0 and car.oilTemperature < 8 then
    start:play()
    start:setVolume(ac.getAudioVolume('main') * 0.3)
    flag = 1
  end
  if not car.extraA ~= prev_extraA then
    flag = 0
  end
  if car.extraA ~= prev_extraA and flag == 0 and car.oilTemperature > 30 then
    start2:play()
    start2:setVolume(ac.getAudioVolume('main') * 0.3)
    flag= 1
  end
  if not car.extraA ~= prev_extraA then
    flag = 0
  end
  

  
if ((ac.getCar().turningLeftLights == true or ac.getCar().turningRightLights == true) and ac.isInteriorView() ==
        true) then
          turnSignal:setVolume(ac.getAudioVolume('main') * 0.1)
          turnSignal:play()
        else
          turnSignal:pause()
          turnSignal:setCurrentTime(0)
        end
      end

--if (((ac.getCar().rpm > 100) == false) and ac.isInteriorView()) then
  --rpmCheck:play()
  --rpmCheck:setVolume(ac.getAudioVolume('main') * 0.58)
  --end
