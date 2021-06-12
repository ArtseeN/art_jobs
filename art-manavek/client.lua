ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(250)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 300
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.domates1.x, Config.domates1.y, Config.domates1.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.domates1.x, Config.domates1.y, Config.domates1.z, true)
        if dst2 < 10 then
            sleep = 10
            DrawMarker(2, Config.domates1.x, Config.domates1.y, Config.domates1.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 10 then
                DrawText3Ds(Config.domates1.x, Config.domates1.y, Config.domates1.z + 0.5, '[E] Domates Topla')
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("mythic_progbar:client:progress", {
                        name = "domatestopla",
                        duration = 1500,
                        label = "Domates Toplanıyor...",
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "amb@prop_human_bum_bin@idle_a",
                            anim = "idle_a",
                            flags = 49,
                        },
                        prop = {
                            model = "x",
                            bone = 57005,
                            coords = { x = 0.18, y = -0.02, z = -0.02 },
                            rotation = { x = 100.0, y = 150.00, z = 140.0 },
                        },
                    }, function(status)
                        if not status then
                            TriggerServerEvent("art-manavc")
                        end
                    end)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 300
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.domates2.x, Config.domates2.y, Config.domates2.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.domates2.x, Config.domates2.y, Config.domates2.z, true)
        if dst2 < 12 then
            sleep = 10
            DrawMarker(2, Config.domates2.x, Config.domates2.y, Config.domates2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 12 then
                DrawText3Ds(Config.domates2.x, Config.domates2.y, Config.domates2.z + 0.5, '[E] Domates Topla')
                if IsControlJustReleased(0, 38) then
                    TriggerEvent("mythic_progbar:client:progress", {
                        name = "domatestopla",
                        duration = 1500,
                        label = "Domates Toplanıyor...",
                        useWhileDead = false,
                        canCancel = true,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "amb@prop_human_bum_bin@idle_a",
                            anim = "idle_a",
                            flags = 49,
                        },
                        prop = {
                            model = "x",
                            bone = 57005,
                            coords = { x = 0.18, y = -0.02, z = -0.02 },
                            rotation = { x = 100.0, y = 150.00, z = 140.0 },
                        },
                    }, function(status)
                        if not status then
                            TriggerServerEvent("art-manavc")
                        end
                    end)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end