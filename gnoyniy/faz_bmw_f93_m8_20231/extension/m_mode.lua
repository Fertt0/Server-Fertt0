

Config = {
    ADU1 = {},
    ADU2 = {
        -- config options for ADU2
        ShiftWarn = 80 -- % of RPM (of Limiter) when RPM Bar should turn Red
    },
    ADU3 = {
        -- config options for ADU3
        ShiftWarn = 85 -- % of RPM (of Limiter) when RPM Bar should turn Red
    }
}


sim = ac.getSim()
SmoothedAccel = {x = 0, z = 0} -- global default value definition for x and z axis of vec() car.acceleration.

function modeA(dt) -- first screem of the ADU, part of the switching function at the very bottom
    display.image {
        pos = vec2(0, 0), -- coordinates of top left corner
        size = vec2(1700, 645)
        
    }

-- gforce dot with smoothing
SmoothedAccel.x = math.applyLag(SmoothedAccel.x, car.acceleration.x, 0.92, dt)
SmoothedAccel.z = math.applyLag(SmoothedAccel.z, car.acceleration.z, 0.92, dt)
local gDotPos = vec2(902, 350.1) -- define the center of our dotStart = "2009.5, 420", Size = "37.3, 39.7"
local gDotMovementScaleX = 100 -- just a scale parameter, 100 is fine here
local gDotMovementScaleZ = 100
-- make sure our dot doesnt move past bounds
gDotPos.x = gDotPos.x + (math.max(math.min(SmoothedAccel.x, 2), -2) * gDotMovementScaleX)
gDotPos.y = gDotPos.y + (math.max(math.min(SmoothedAccel.z, 2), -2) * gDotMovementScaleZ)
display.image {
    image = "assets/GF.dds",
    pos = vec2(gDotPos.x, gDotPos.y),
    size = vec2(27.3, 27.7),
    color = rgbm(1, 0, 0, 1),
}
end
-- didplay switch
local listOfModes = {modeA, modeB, modeC} -- you can add infinite displays, their elements need to be inside function modeN(dt)
local currentMode = tonumber(ac.loadDisplayValue("displayMode", 1))
local lastExtraCState = false

function update(dt)
    ac.debug("Update Delta", dt)
    if car.extraC ~= lastExtraCState then -- switching is bound to extraC key, this tracks the state of extraC
        currentMode = currentMode + 0 -- you start at mode 1 and each extraC press adds +1 to the mode count
        if currentMode > #listOfModes then -- as soon as your mode counter exceeds the number of modes inside listOfModes it defaults back to mode 1
            currentMode = 0 -- should be the same as local currentMode =
        end
        ac.saveDisplayValue("displayMode", currentMode)
    end
    ac.debug("Current Page", currentMode)
    lastExtraCState = car.extraC
    listOfModes[currentMode](dt)
end
