
local farbe = rgb(0, 0, 0)
local abstand = system.narrowMode and 80 or 160
return function(dt)

    

    local Light1_1="door_lf_emissive1"
    local Light1_2="torpeda_emissive"
    local Light1_3="foot_light_l"
    local Light1_4="ambiente_3"
    local Light1_5="ambiente_4"
    local Light1_6="ambiente_5"
    local Light1_7="ambiente_6"
    local Light1_8="ambiente_7"
    local Light1_9="ambiente_8"
    local Light1_10="ambiente_9"
    local Light1_11="ambiente_10"
    local Light1_12="ambiente_11"
    local Light1_13="ambiente_12"
    local Light1_14="ambiente_13"
    local Light1_15="ambiente_14"
    local Light1_16="ambiente_15"
    local Light1_17="ambiente_16"
    local Light1_18="ambiente_17"
    local Light1_19="ambiente_18"
    local Light1_20="ambiente_19"

    local Light2_1="paint"
    local Light2_2="light2_1"
    local Light2_3="light2_2"
    local Light2_4="light2_3"
    local Light2_5="light2_4"
    local Light2_6="light2_5"
    local Light2_7="light2_6"
    local Light2_8="light2_7"
    local Light2_9="light2_8"
    local Light2_10="light2_9"
    local Light2_11="light2_10"
    local Light2_12="light2_11"
    local Light2_13="light2_12"
    local Light2_14="light2_13"
    local Light2_15="light2_14"
    local Light2_16="light2_15"
    local Light2_17="light2_16"
    local Light2_18="light2_17"
    local Light2_19="light2_18"
    local Light2_20="light2_19"

    local Rim_lf_1 ="Wheel_01_LF005"
    local Rim_lr_1 ="Wheel_01_LR006"
    local Rim_rf_1 ="Wheel_01_LR002"
    local Rim_rr_1 ="Wheel_01_LF001"

    local carpaint_1="paint"
    local carpaint_2="carpaint_1"
    local carpaint_3="carpaint_2"
    local carpaint_4="carpaint_3"
    local carpaint_5="carpaint_4"
    local carpaint_6="carpaint_5"
    local carpaint_7="carpaint_6"
    local carpaint_8="carpaint_7"
    local carpaint_9="carpaint_8"
    local carpaint_10="carpaint_9"
    local carpaint_11="carpaint_10"
    local carpaint_12="carpaint_11"
    local carpaint_13="carpaint_12"
    local carpaint_14="carpaint_13"
    local carpaint_15="carpaint_14"
    local carpaint_16="carpaint_15"
    local carpaint_17="carpaint_16"
    local carpaint_18="carpaint_17"
    local carpaint_19="carpaint_18"
    local carpaint_20="carpaint_19"


    color=100
    ui.drawCircle(vec2(550, 190), 10, color, 25, 10)
    if ui.rectHovered (vec2 (530,180), vec2(560, 200)) then
        ui.drawCircle(vec2(550, 190), 10, rgbm(1, 0, 1, 1), 25, 10)
        if ui.mouseClicked () then
            currentset1=Light1_1
            currentset2=Light1_2
            currentset3=Light1_3
            currentset4=Light1_4
            currentset5=Light1_5
            currentset6=Light1_6
            currentset7=Light1_7
            currentset8=Light1_8
            currentset9=Light1_9
            currentset10=Light1_10
            currentset11=Light1_11
            currentset12=Light1_12
            currentset13=Light1_13
            currentset14=Light1_14
            currentset15=Light1_15
            currentset16=Light1_16
            currentset17=Light1_17
            currentset18=Light1_18
            currentset19=Light1_19
            currentset20=Light1_20
            currentstatus="Light1"

        end
    end

    --Light2
    ui.drawCircle(vec2(770, 190), 10, color, 25, 10)
    if ui.rectHovered (vec2 (750,180), vec2(780, 200)) then
        ui.drawCircle(vec2(770, 190), 10, rgbm(1, 0, 1, 1), 25, 10)
        if ui.mouseClicked () then
            currentset1=Light2_1
            currentset2=Light2_2
            currentset3=Light2_3
            currentset4=Light2_4
            currentset5=Light2_5
            currentset6=Light2_6
            currentset7=Light2_7
            currentset8=Light2_8
            currentset9=Light2_9
            currentset10=Light2_10
            currentset11=Light2_11
            currentset12=Light2_12
            currentset13=Light2_13
            currentset14=Light2_14
            currentset15=Light2_15
            currentset16=Light2_16
            currentset17=Light2_17
            currentset18=Light2_18
            currentset19=Light2_19
            currentset20=Light2_20
            currentstatus="Light2"

        end
    end

    --untenrechts
    ui.drawCircle(vec2(770, 390), 10, color, 25, 10)
    if ui.rectHovered (vec2 (750,380), vec2(780, 400)) then
        ui.drawCircle(vec2(770, 390), 10, rgbm(1, 0, 1, 1), 25, 10)
        if ui.mouseClicked () then
            currentset1=Rim_lf_1
            currentset2=Rim_lr_1
            currentset3=Rim_rf_1
            currentset4=Rim_rr_1
            currentstatus="Rim"

        end
    end



    
    ui.drawCircle(vec2(550, 390), 10, color, 25, 10)
    if ui.rectHovered (vec2 (540,380), vec2(560, 400)) then
        ui.drawCircle(vec2(550, 390), 10, rgbm(1, 0, 1, 1), 25, 10)
        if ui.mouseClicked () then
            currentset1=carpaint_1
            currentset2=carpaint_2
            currentset3=carpaint_3
            currentset4=carpaint_4
            currentset5=carpaint_5
            currentset6=carpaint_6
            currentset7=carpaint_7
            currentset8=carpaint_8
            currentset9=carpaint_9
            currentset10=carpaint_10
            currentset11=carpaint_11
            currentset12=carpaint_12
            currentset13=carpaint_13
            currentset14=carpaint_14
            currentset15=carpaint_15
            currentset16=carpaint_16
            currentset18=carpaint_17
            currentset19=carpaint_18
            currentset20=carpaint_19

            currentstatus="Carpaint"

        end
    end

    ui.childWindow('ColorPicker', vec2(ui.availableSpaceX() / 2, ui.availableSpaceY()), function()
        ui.offsetCursorY(30)
        ui.indent(abstand)
        local color = ui.colorPicker("Color : ", farbe, ui.ColorPickerFlags.PickerHueWheel +
            ui.ColorPickerFlags.NoSidePreview + ui.ColorPickerFlags.NoLabel)
        if (color) then
            ac.findMeshes(currentset1):setMaterialTexture('txDiffuse', 'txDetail', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset2):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset3):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset4):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset5):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset6):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset7):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset8):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset9):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset10):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset11):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset12):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset13):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset14):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset15):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset16):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset17):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset18):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset19):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset20):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
        end
        ui.unindent(abstand)
        ui.offsetCursorY(40)
    end)
    ui.setCursor(vec2(0, ui.windowHeight() / 2))
    ui.childWindow('defaultcolor', vec2(ui.availableSpaceX() / 9, ui.availableSpaceY()), function()
        if (color) then
            ac.findMeshes(currentset1):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset2):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset3):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset4):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset5):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset6):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset7):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset8):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset9):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset10):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset11):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset12):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset13):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset14):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset15):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset16):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset17):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset18):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset19):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
            ac.findMeshes(currentset20):setMaterialTexture('txDiffuse', farbe:rgbm(1))-- Sucht nach den namen der meshes und ändert die farbe von txdetail
         end
    end)




    -- Ignore
    display.text {
        text = "Light 2",
        pos = vec2(700, 105),
        letter = vec2(20, 30),
        font = "c7_new",
        width = 1,
        alignment = 1,
        spacing = -4,
        color = rgbm(90,90,90,90)
    }

    display.text {
        text = "Light 1",
        pos = vec2(500, 105),
        letter = vec2(20, 30),
        font = "c7_new",
        width = 1,
        alignment = 1,
        spacing = -4,
        color = rgbm(90,90,90,90)
    }

    display.text {
        text = "Rims",
        pos = vec2(740, 305),
        letter = vec2(20, 30),
        font = "c7_new",
        width = 1,
        alignment = 1,
        spacing = -4,
        color = rgbm(90,90,90,90)
    }

    display.text {
        text = "Carpaint",
        pos = vec2(500, 305),
        letter = vec2(20, 30),
        font = "c7_new",
        width = 1,
        alignment = 1,
        spacing = -4,
        color = rgbm(90,90,90,90)
    }

    display.text {
        text = "by MNBA",
        pos = vec2(900, 425),
        letter = vec2(20, 30),
        font = "c7_new",
        width = 1,
        alignment = 1,
        spacing = -5,
        color = rgbm(90,90,90,90)
    }

    if currentstatus == "Carpaint" then
        ui.drawCircle(vec2(550, 390), 10, rgbm(1, 0, 1, 1), 25, 10)
    end

    if currentstatus == "Rim" then
        ui.drawCircle(vec2(770, 390), 10, rgbm(1, 0, 1, 1), 25, 10)
    end

    if currentstatus == "Light2" then
        ui.drawCircle(vec2(770, 190), 10, rgbm(1, 0, 1, 1), 25, 10)
    end

    if currentstatus == "Light1" then
        ui.drawCircle(vec2(550, 190), 10, rgbm(1, 0, 1, 1), 25, 10)
    end

    
end