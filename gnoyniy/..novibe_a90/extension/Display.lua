local shiftWarnOn = true
local shiftWarnCycle = 1
local shiftPercentage = 60

local carSounds = ui.MediaPlayer()
local carSounds2 = ui.MediaPlayer()

function update(dt)

if ((ac.getCar().turningLeftLights == true or ac.getCar().turningRightLights == true) and ac.isInteriorView() ==
        true) then
        -- if(carSounds:playing() ~= true) then
        carSounds:setSource('./cornhub/turn_signals.mp3'):setAutoPlay(true)
        carSounds:setVolume(ac.getAudioVolume('main') * 0.7)
        carSounds:play()
        -- carSounds:setLooping(true)
        -- end
    else
        carSounds:pause()
        carSounds:setCurrentTime(10)
    end


local rpmPercentage = (car.rpm / car.rpmLimiter * 100)

if shiftWarnCycle < 3 and 95 < rpmPercentage then
	shiftWarnCycle = shiftWarnCycle + 1
else
		shiftWarnCycle = 0
end

 display.rect {
    pos = vec2(523.1, 713.3),
    size = vec2(224.4, 156.6),
    color = rgbm(0, 0, 0, 1)
	}

 display.rect {
    pos = vec2(547, 847),
    size = vec2(78, 6),
    color = car.fuel < 7.42 and rgbm(1, 0, 0, 1) or rgbm(1, 1, 1, 1)
	}
 display.rect {
    pos = vec2(547, 826),
    size = vec2(78, 6),
    color = car.fuel > 14.84 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(547, 805),
    size = vec2(78, 6),
    color = car.fuel > 22.26 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(547, 784),
    size = vec2(78, 6),
    color = car.fuel > 29.68 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(547, 763),
    size = vec2(78, 6),
    color = car.fuel > 37.1 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(547, 742),
    size = vec2(78, 6),
    color = car.fuel > 44.52 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(547, 721),
    size = vec2(78, 6),
    color = car.fuel >= 51.94 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(654, 847),
    size = vec2(78, 6),
    color = car.waterTemperature < 17.14 and rgbm(1, 0, 0, 1) or rgbm(1, 1, 1, 1)
	}

	 display.rect {
    pos = vec2(654, 826),
    size = vec2(78, 6),
    color = car.waterTemperature > 34.28 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(654, 805),
    size = vec2(78, 6),
    color = car.waterTemperature > 51.42 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(654, 784),
    size = vec2(78, 6),
    color = car.waterTemperature > 68.56 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(654, 763),
    size = vec2(78, 6),
    color = car.waterTemperature > 85.7 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(654, 742),
    size = vec2(78, 6),
    color = car.waterTemperature > 102.84 and rgbm(1, 1, 1, 1) or rgbm(1, 1, 1, 0.5)
	}

 display.rect {
    pos = vec2(654, 721),
    size = vec2(78, 6),
    color = car.waterTemperature > 120 and rgbm(1, 0, 0, 1) or rgbm(1, 1, 1, 0.5)
	}

	display.text{
	text = string.format("%05d", car.distanceDrivenTotalKm),
	pos = vec2(750, 526),
    letter = vec2(15, 45),
    font = "e92_big",
    color = rgbm(1, 1, 1, 1),
    width = 0,
    alignment = 0.0,
    spacing = 0.3
	}
	display.text{
	text = string.format("%05.1f", car.distanceDrivenSessionKm),
	pos = vec2(520, 526),
    letter = vec2(15, 45),
    font = "e92_big",
    color = rgbm(1, 1, 1, 1),
    width = 0,
    alignment = 0.0,
    spacing = 0.3
	}

	if rpmPercentage > 65 then

	display.image {
        image = "cornhub/REV_1.dds",
        pos = vec2(335, 409),
        size = vec2(22, 58),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }
	end

	if rpmPercentage > 70 then

	display.image {
        image = "cornhub/REV_2.dds",
        pos = vec2(303, 403),
        size = vec2(38, 61),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }
	end

	if rpmPercentage > 75 then

	display.image {
        image = "cornhub/REV_3.dds",
        pos = vec2(269, 391),
        size = vec2(56, 59),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }
	end

	if rpmPercentage > 80 then

	display.image {
        image = "cornhub/REV_4.dds",
        pos = vec2(242, 360),
        size = vec2(77, 66),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }
	end

	if rpmPercentage > 85 then

	display.image {
        image = "cornhub/REV_5.dds",
        pos = vec2(239, 314),
        size = vec2(60, 59),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }
	end

	if rpmPercentage > 87 then

	display.image {
        image = "cornhub/REV_6.dds",
        pos = vec2(243, 258),
        size = vec2(75, 70),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }
	end

	if rpmPercentage > 90 then

	display.image {
        image = "cornhub/REV_7.dds",
        pos = vec2(285, 227),
        size = vec2(72, 68),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }
	end

	if rpmPercentage > 95	 then

	display.image {
        image = "cornhub/REV_8.dds",
        pos = vec2(364, 227),
        size = vec2(76, 71),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }
	end

	if shiftWarnCycle > 1 then

	display.image {
        image = "cornhub/REV_8.dds",
        pos = vec2(364, 227),
        size = vec2(76, 71),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }

		display.image {
        image = "cornhub/REV_7.dds",
        pos = vec2(285, 227),
        size = vec2(72, 68),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }

	display.image {
        image = "cornhub/REV_6.dds",
        pos = vec2(243, 258),
        size = vec2(75, 70),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }

	display.image {
        image = "cornhub/REV_5.dds",
        pos = vec2(239, 314),
        size = vec2(60, 59),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }

	display.image {
        image = "cornhub/REV_4.dds",
        pos = vec2(242, 360),
        size = vec2(77, 66),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }

	display.image {
        image = "cornhub/REV_3.dds",
        pos = vec2(269, 391),
        size = vec2(56, 59),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }

	display.image {
        image = "cornhub/REV_2.dds",
        pos = vec2(303, 403),
        size = vec2(38, 61),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }

	display.image {
        image = "cornhub/REV_1.dds",
        pos = vec2(335, 409),
        size = vec2(22, 58),
        uvStart = vec2(0, 0),
        uvEnd = vec2(1, 1)
    }

	end


end