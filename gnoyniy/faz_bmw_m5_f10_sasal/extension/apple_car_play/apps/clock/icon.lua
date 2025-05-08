local needleHoursColor = rgbm(0, 0, 0, 1)
local needleMinutesColor = rgbm(0, 0, 0, 1)

return function (pos, size)
  ui.drawImage(system.appIcon(), pos, pos + size)

  local h = sim.timeTotalSeconds / 60 / 60 / 12 * math.pi * 2
  local s, c = math.sin(h), -math.cos(h)
  local p = vec2(size * 0.485, size * 0.485):add(pos)
  ui.drawLine(p, p + vec2((size * 0.22) * s, (size * 0.22) * c), needleHoursColor, 2,5)

  h = sim.timeTotalSeconds / 60 / 60 * math.pi * 2
  s, c = math.sin(h), -math.cos(h)
  ui.drawLine(p, p + vec2((size * 0.265) * s, (size * 0.265) * c), needleMinutesColor, 2.0)
end
