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
        local sleep = 9000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.hurda1.x, Config.hurda1.y, Config.hurda1.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.hurda1.x, Config.hurda1.y, Config.hurda1.z, true)
        if dst2 < 40 then
            sleep = 10
            DrawMarker(2, Config.hurda1.x, Config.hurda1.y, Config.hurda1.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 5 then
                DrawText3Ds(Config.hurda1.x, Config.hurda1.y, Config.hurda1.z + 0.5, '[E] Makina`yı Kontrol Et')
                if IsControlJustReleased(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                        name = "makinakontrol",
                        duration = 25000,
                        label = "Makina Kontrol Ediliyor",
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
                            model = "prop_ld_scrap",
                            bone = -0,
                            coords = { x = -0, y = -0, z = -0 },
                            rotation = { x = 100.0, y = 150.00, z = 140.0 },
                        },
                    }, function(status)
                        if not status then
                            TriggerServerEvent("art-hurda") 
                            exports['mythic_notify']:SendAlert('inform', 'Makina`yı Kontrol Ederek 250$ Bahşiş Aldın!!', 5000)
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
        local sleep = 9000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.hurda2.x, Config.hurda2.y, Config.hurda2.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.hurda2.x, Config.hurda2.y, Config.hurda2.z, true)
        if dst2 < 40 then
            sleep = 10
            DrawMarker(2, Config.hurda2.x, Config.hurda2.y, Config.hurda2.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 5 then
                DrawText3Ds(Config.hurda2.x, Config.hurda2.y, Config.hurda2.z + 0.5, '[E] Tuğlaları Paketle')
                if IsControlJustReleased(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                        name = "tuglapaket",
                        duration = 25000,
                        label = "Tuğlalar Paketleniyor",
                        useWhileDead = false,
                        canCancel = false,
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
                            model = "prop_ld_scrap",
                            bone = -0,
                            coords = { x = -0.00, y = -0.00, z = -0.00 },
                            rotation = { x = 100.0, y = 150.00, z = 140.0 },
                        },
                    }, function(status)
                        if not status then
                            TriggerServerEvent("art-tuglapaket") 
                            exports['mythic_notify']:SendAlert('inform', "Tuğlayı Paketleyerek 350$ Bahşiş Aldın!", 5000)
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
        local sleep = 9000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local dst = GetDistanceBetweenCoords(playercoords, Config.hurda3.x, Config.hurda3.y, Config.hurda3.z, true)
        local dst2 = GetDistanceBetweenCoords(playercoords, Config.hurda3.x, Config.hurda3.y, Config.hurda3.z, true)
        if dst2 < 40 then
            sleep = 10
            DrawMarker(2, Config.hurda3.x, Config.hurda3.y, Config.hurda3.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.7, 0.7, 0.7, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            if dst2 < 5 then
                DrawText3Ds(Config.hurda3.x, Config.hurda3.y, Config.hurda3.z + 0.5, '[E] Tahtaları Boya')
                if IsControlJustReleased(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                        name = "tahtaboya",
                        duration = 28000,
                        label = "Tahtalar Boyanıyor",
                        useWhileDead = false,
                        canCancel = false,
                        controlDisables = {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        },
                        animation = {
                            animDict = "mini@repair",
                            anim = "fixing_a_ped",
                            flags = 49,
                        },
                        prop = {
                            model = "prop_paint_spray01a",
                            bone = 57005,
                            coords = { x = -0.00, y = -0.00, z = -0.00 },
                            rotation = { x = 100.0, y = 150.00, z = 140.0 },
                        },
                    }, function(status)
                        if not status then
                            TriggerServerEvent("art-tahtaboya") 
                            exports['mythic_notify']:SendAlert('inform', "Tahtaları Boyadığın İçin 450$ Bahşiş Aldın!", 5000)
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

-- Blip
local blip = AddBlipForCoord( -190.54, 6290.19, 31.4205, - 1)
SetBlipSprite(blip, 488)
SetBlipColour(blip, 1)
SetBlipScale  (blip, 0.50)
SetBlipAsShortRange(blip, true)

BeginTextCommandSetBlipName('STRING')
AddTextComponentString('Red`s Machine Supplies')
EndTextCommandSetBlipName(blip)

-- GİRİŞ`DEKİ GÜVENLİK GÖREVLİSİ
Citizen.CreateThread(function()
    if Config.NPCEnable == true then
        RequestModel(-681004504)
        while not HasModelLoaded(-681004504) do
            Wait(1)
        end
    
        art = CreatePed(1, -681004504, -198.92, 6315.28, 30.5307, 40.07, false, true)
        SetBlockingOfNonTemporaryEvents(art, true)
        SetPedDiesWhenInjured(art, false)
        SetPedCanPlayAmbientAnims(art, true)
        SetPedCanRagdollFromPlayerImpact(art, false)
        SetEntityInvincible(art, true)
        FreezeEntityPosition(art, true)
        TaskStartScenarioInPlace(art, "WORLD_HUMAN_DRUG_DEALER", 0, true);
    end
end)

--HURDA KARIŞTIRAN NPC
Citizen.CreateThread(function()
    if Config.NPCEnable == true then
        RequestModel(349680864)
        while not HasModelLoaded(349680864) do
            Wait(1)
        end
    
        art2 = CreatePed(1, 349680864, -206.10, 6299.39, 30.49, 102.07, false, true)
        SetBlockingOfNonTemporaryEvents(art2, true)
        SetPedDiesWhenInjured(art2, false)
        SetPedCanPlayAmbientAnims(art2, true)
        SetPedCanRagdollFromPlayerImpact(art2, false)
        SetEntityInvincible(art2, true)
        FreezeEntityPosition(art2, true)
        TaskStartScenarioInPlace(art2, "WORLD_HUMAN_BUM_WASH", 0, true);
    end
end)

--DURAN NPC
Citizen.CreateThread(function()
    if Config.NPCEnable == true then
        RequestModel(-673538407)
        while not HasModelLoaded(-673538407) do
            Wait(1)
        end
    
        art3 = CreatePed(1, -673538407, -184.23, 6274.87, 30.4893, 39.14, false, true)
        SetBlockingOfNonTemporaryEvents(art3, true)
        SetPedDiesWhenInjured(art3, false)
        SetPedCanPlayAmbientAnims(art3, true)
        SetPedCanRagdollFromPlayerImpact(art3, false)
        SetEntityInvincible(art3, true)
        FreezeEntityPosition(art3, true)
        TaskStartScenarioInPlace(art3, "WORLD_HUMAN_CLIPBOARD", 0, true);
    end
end)

