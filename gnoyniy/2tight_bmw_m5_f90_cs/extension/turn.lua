local carSounds = ui.MediaPlayer()
local carSounds2 = ui.MediaPlayer()
local carSounds3 = ui.MediaPlayer()


function update(dt)

    if ((ac.getCar().turningLeftLights == true or ac.getCar().turningRightLights == true) and ac.isInteriorView() ==
        true) then
        -- if(carSounds:playing() ~= true) then
        carSounds:setSource('./sounds/turn_signals.mp3'):setAutoPlay(true)
        carSounds:setVolume(ac.getAudioVolume('main') * 0.3)
        carSounds:play()
        -- carSounds:setLooping(true)
        -- end
    else
        carSounds:pause()
        carSounds:setCurrentTime(0)
    end
	
end