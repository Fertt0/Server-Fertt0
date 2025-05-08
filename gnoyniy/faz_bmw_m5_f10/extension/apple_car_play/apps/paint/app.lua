local vcolor = rgb(0, 0, 0)
local padding = system.narrowMode and 80 or 160
return function(dt)
    ui.childWindow('ColorPicker', vec2(ui.availableSpaceX() / 2, ui.availableSpaceY()), function()
        ui.offsetCursorY(30)
        ui.indent(padding)
        local color = ui.colorPicker("color", vcolor, ui.ColorPickerFlags.PickerHueWheel +
            ui.ColorPickerFlags.NoSidePreview + ui.ColorPickerFlags.NoLabel)
        if (color) then
            ac.findMeshes("AmbientLEDFront"):setMaterialTexture('txDetail', vcolor:rgbm(1)) -- white_map.dds
        end
        ui.unindent(padding)
        ui.offsetCursorY(40)
    end)
    ui.setCursor(vec2(0, ui.windowHeight() / 2))
    ui.childWindow('defaultcolor', vec2(ui.availableSpaceX() / 9, ui.availableSpaceY()), function()
        if touchscreen.iconButton(ui.Icons.Stay, 120) then
            ac.findMeshes("AmbientLEDFront"):setMaterialTexture('txDetail', "white_map.dds") -- reset color
          end
    end)
    
end