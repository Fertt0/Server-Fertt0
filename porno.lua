Settings = ac.storage({
	KeyValue = 999, --значение клавиши для ac
	KeyName = "", --название клавиши для пользователя
	TPtoCam = false,
	ShowKeyTP = false,
	tpDistance = 8,
	SpectatePlayer = false,
})

local timer = {
	running = 0,	--переносим length/blength сюда
	length = 0,		--обычная длительность после телепортации
	blength = 0.5,	--длительность после нажатия кнопки
}

--#region [Меню]
local function Teleportation()
	--отображение таймера здесь кажется логичным
	ui.text("Перезарядка: " .. math.round(timer.running, 1))

	ui.tabBar("Atabbar", function()
		ui.tabItem("Машина к камере", KeybindTP_UI)
		ui.tabItem("Карта", MapTest)
		ui.tabItem("Телепорт к игроку", function()
			ui.text('Выбрать игрока для телепорта:')
			ui.childWindow('##drivers', vec2(ui.availableSpaceX(), 120), function ()
				for i = 1, sim.carsCount - 1 do
					local car = ac.getCar(i)
					local driverName = ac.getDriverName(i)
					if car.isConnected and not car.isAIControlled and not string.find(driverName, "Traffic") then
						if ui.selectable(driverName, selectedCar == car) then
							selectedCar = car
						end
					end
				end
			end)
			if ui.button("Телепортироваться", vec2(ui.availableSpaceX(), 25)) and selectedCar then
				-- Преобразуем скорость из м/с в км/ч (1 м/с = 3.6 км/ч)
				local speedKmh = selectedCar.velocity:length() * 3.6
				if speedKmh > 40 then
					ac.setMessage("Нельзя телепортироваться к игроку!", "Для телепорта игрок должен ехать не более 40 км/ч!")
				else
					local dir = selectedCar.look
					physics.setCarVelocity(0, vec3(0, 0, 0))
					physics.setCarPosition(0, selectedCar.position + vec3(0, 0.1, 0) - dir * 8, -dir)
				end
			end
		end)
	end)
end
--#endregion

--#region [Телепорт к камере]

function KeybindTP_UI() --первая вкладка
	ui.text("Телепорт к камере")

	if ui.checkbox("Включить", Settings.TPtoCam) then
		Settings.TPtoCam = not Settings.TPtoCam
	end

	local distanceslider , tpbool = ui.slider("###tpdist", Settings.tpDistance, 0, 20, "Дистанция телепорта: %.0f метров", 1)
	if tpbool then
		Settings.tpDistance = distanceslider
	end

	if ui.checkbox("Показывать место телепорта при удержании кнопки", Settings.ShowKeyTP) then
		Settings.ShowKeyTP = not Settings.ShowKeyTP
	end

	--Кнопка для выбора клавиши и начало прослушивания клавиш
	if
		ui.button(
			Settings.KeyValue == 0 and "Нажмите клавишу."
			or (Settings.KeyValue == 999 and "Нажмите, чтобы выбрать клавишу" 
			or (Settings.KeyValue >= 1 and "Выбранная клавиша: " .. Settings.KeyName)))
	then
		Settings.KeyValue = 0
	end
	ui.sameLine() --делает 🔼🔽 на одной линии
	--Сброс клавиши
	if ui.button("Сбросить клавишу") then
		Settings.KeyValue = 999
		Settings.KeyName = "null"
	end
	--Показывает таймер перезарядки через script.drawUI
	if ui.checkbox("Показывать перезарядку и клавишу", OverlayTimerKey) then
		OverlayTimerKey = not OverlayTimerKey
	end

	--Начинает прослушивание клавиш при нажатии кнопки
	if Settings.KeyValue == 0 then
		for key, value in pairs(ui.KeyIndex) do -- нужно разобраться, как добавить поддержку других входов, возможно, потребуется ручной выбор
			if ui.keyboardButtonDown(value) then
				if timer.running <= 0.5 then
					timer.running = timer.blength
				else
				end --анти-обход "перезарядки" LOL
				Settings.KeyValue = value
				Settings.KeyName = tostring(key)
			end
		end
	end
end

function TPtoCam_Update()
	if Settings.TPtoCam == true and Settings.KeyValue ~= 999 then
		if ui.keyboardButtonReleased(Settings.KeyValue) and timer.running <= 0 then
			local teleportPoint = ac.getCameraPosition()
			local TeleportAngle = ac.getCameraForward()
			physics.setCarVelocity(0, vec3(0, 0, 0))
			physics.setCarPosition(0, teleportPoint + vec3(0,-1,0) + TeleportAngle * Settings.tpDistance, -TeleportAngle * vec3(1,0,1))
			timer.running = timer.length
		end
	end
end

function TPtoCam_draw3D()
	if Settings.TPtoCam == true then
		if Settings.ShowKeyTP and ui.keyboardButtonDown(Settings.KeyValue) then
			render.setBlendMode(render.BlendMode.Opaque)
			render.setCullMode(render.CullMode.Wireframe)
			render.setDepthMode(render.DepthMode.ReadOnlyLessEqual)
			local campos = ac.getCameraPosition():clone()
			local camlook = ac.getCameraForward():clone():normalize()
			local camside = ac.getCameraSide():clone()
			campos:set(vec3(campos + vec3(0,-1,0) + camlook * Settings.tpDistance))
	
			local FrontBack = vec3()
			local Sides = vec3()
			local Top_Left = vec3()
			local Top_Right = vec3()
			local Rear_Left = vec3()
			local Rear_Right= vec3()
			local LookArrow = vec3()
	
			FrontBack	:set((camlook):mul(vec3(1, 0, 1))):scale(ac.getCar(0).aabbSize.x):normalize():scale(1.75)
			Sides		:set(camside):scale(ac.getCar(0).aabbSize.x):scale(0.5)
			Top_Left	:set(campos):add( FrontBack - Sides)
			Top_Right	:set(campos):add( FrontBack + Sides)
			Rear_Left	:set(campos):add(-FrontBack - Sides)
			Rear_Right	:set(campos):add(-FrontBack + Sides)
			render.debugLine(Top_Left,Top_Right,rgbm(1, 1, 1, 1))
			render.debugLine(Rear_Left,Rear_Right,rgbm(1, 1, 1, 1))
			render.debugLine(Top_Left,Rear_Left,rgbm(1, 1, 1, 1))
			render.debugLine(Top_Right,Rear_Right,rgbm(1, 1, 1, 1))
			render.debugLine(Top_Left, Rear_Right, rgbm(1, 1, 1, 1))
			render.debugLine(Top_Right, Rear_Left, rgbm(1, 1, 1, 1))
	
			LookArrow:set(camlook):mul(vec3(1,0,1)):normalize():scale(2.5)
			render.debugArrow(campos+vec3(0,1,0),campos,rgbm(1, 1, 1, 1),2)
			render.debugArrow(campos,campos+LookArrow,rgbm(1, 1, 1, 1),2)
		end
	end
end
--#endregion

local selectedCar = nil ---@type ac.StateCar

--#region [Карта, экспериментально и нестабильно]
local mapstuff = {}
local pos3, dir3, pos2, dir2, dir2x = vec3(), vec3(), vec2(), vec2(), vec2()
local padding = vec2(30*3, 50*3)
local offsets = -padding * 0.5
local ts = 10
local first = true

if ac.getPatchVersionCode() >= 2000 then
	map = ac.getFolder(ac.FolderID.ContentTracks) .. '/' .. ac.getTrackFullID('/') .. '/map.png'
	current_map = map
	ui.decodeImage(map)

	--ini stuff size
	ini = ac.getFolder(ac.FolderID.ContentTracks) .. "/" .. ac.getTrackFullID("/") .. "/data/map.ini"
	for a, b in ac.INIConfig.load(ini):serialize():gmatch("([_%a]+)=([-%d.]+)") do -- ◀ я не понимаю "([_%a]+)=([-%d.]+)"
		mapstuff[a] = tonumber(b)
	end
	image_size = ui.imageSize(map)
	config_offset = vec2(mapstuff.X_OFFSET, mapstuff.Z_OFFSET)
end

function MapTest()
	ui.text([[
Нажмите Пробел на карте, чтобы телепортировать камеру | Вы можете перемещать и масштабировать карту. (полное отдаление может вызвать баги)
Зеленый = Камера/Вы
Красный = другие игроки.]])
	ui.childWindow("##mapforcamera", vec2(ui.availableSpaceX(), ui.availableSpaceY()),
	function()
		if ac.getPatchVersionCode() < 2000 then ui.text("работает только на версии выше 2000") return end

		if first then --устанавливаем масштаб карты, если не здесь, он сохранит размер и не будет масштабироваться с колесом прокрутки
			map_scale = math.min((ui.windowWidth() - padding.x) / image_size.x, (ui.windowHeight() - padding.y) / image_size.y)
			config_scale = map_scale / mapstuff.SCALE_FACTOR
			size = image_size * map_scale
			if ui.isImageReady(current_map) then
				first = false
			end
		end

		ui.drawImage(current_map, -offsets, -offsets + size)

		if ui.windowHovered() then --масштабирование и перемещение
			if ac.getUI().mouseWheel ~= 0 then
			  if 
			  (	ac.getUI().mouseWheel < 0 and (size.x + padding.x > ui.windowWidth() and size.y + padding.y > ui.windowHeight())) 
				or ac.getUI().mouseWheel > 0 then
				local old = size
				map_scale = map_scale * (1 + ac.getUI().mouseWheel * 0.15)
				size = ui.imageSize(current_map) * map_scale
				config_scale = map_scale / mapstuff.SCALE_FACTOR
				offsets = (offsets + (size - old) * (offsets + ui.mouseLocalPos()) / old)
			  else
				offsets = -padding * 0.5
				map_scale = math.min((ui.windowWidth() - padding.x) / image_size.x,(ui.windowHeight() - padding.y) / image_size.y)
				size = ui.imageSize(current_map) * map_scale
				config_scale = map_scale / mapstuff.SCALE_FACTOR
			  end
			end
		  end

		--позиции других игроков
		for i = ac.getSim().carsCount - 1, 1, -1 do --рисуем объекты на карте
			local car = ac.getCar(i)
			if car.isConnected and (not car.isHidingLabels) then
				local pos3 = car.position
				local dir3 = car.look

				pos2:set(pos3.x, pos3.z):add(config_offset):scale(config_scale):add(-offsets)
				dir2:set(dir3.x, dir3.z) -- = vec2(dir3.x, dir3.z)
				dir2x:set(dir3.z, -dir3.x)
				ui.drawTriangleFilled(
					pos2 + dir2 * ts,
					pos2 - dir2 * ts - dir2x * ts * 0.75,
					pos2 - dir2 * ts + dir2x * ts * 0.75,
					rgbm(255,0,0,255))
				ui.dwriteDrawText(ac.getDriverName(i),10,pos2 + vec2(25,5) - ui.measureText(ac.getDriverName(i)) * 0.5,rgbm.colors.white)
			end
		end

		--позиция камеры и локального игрока
		pos3 = ac.getCameraPosition()
		pos2:set(pos3.x, pos3.z):add(config_offset):scale(config_scale):add(-offsets)
		dir3 = ac.getCameraForward()
		dir2 = vec2(dir3.x, dir3.z):normalize()
		dir2x:set(dir3.z, -dir3.x):normalize()
		ui.drawTriangleFilled(
			pos2 + dir2 * ts,
			pos2 - dir2 * ts - dir2x * ts * 0.75,
			pos2 - dir2 * ts + dir2x * ts * 0.75,
			rgbm(0, 255, 0, 255))
		if ui.keyPressed(ui.Key.Space) and ui.windowHovered() then
			local camerapos = (ui.mouseLocalPos() + offsets) / config_scale - config_offset
			local raycast = physics.raycastTrack(vec3(camerapos.x, 2000, camerapos.y), vec3(0, -1, 0), 3000)
			local cameraheight = 2000 - raycast + 3
			if raycast ~= -1 then
				ac.setCurrentCamera(ac.CameraMode.Free)
				ac.setCameraPosition(vec3(camerapos.x, cameraheight, camerapos.y))
			end
		end

		ui.invisibleButton('###mapforcamera4242', ui.windowSize())
		if ui.mouseDown() and ui.itemHovered() then offsets = offsets - ui.mouseDelta() end
	end)
end
--endregion

function script.update(dt)
	--#region [Таймер]
	if timer.running >= 0 then -- таймер для чего угодно
		timer.running = timer.running - dt
	end
	--#endregion

	--#region[Функции]
	TPtoCam_Update()
	--#endregion
end

function script.drawUI()
	if OverlayTimerKey == true then
		ui.transparentWindow("Keyandabindandacooldown", vec2(-15, -5), vec2(150, 150), false, function()
			ui.text("Клавиша: " .. Settings.KeyName .. "\nПерезарядка: " .. math.round(timer.running, 1))
		end)
	end
end

function script.draw3D()
end

ui.registerOnlineExtra(	ui.Icons.Compass,
						"Телепорт меню",
						nil,
						Teleportation,
						nil,
						ui.OnlineExtraFlags.Tool,
						ui.WindowFlags.NoScrollWithMouse)