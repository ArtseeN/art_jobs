ESX = nil
PlayerData = {}
menu = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    PlayerData = ESX.GetPlayerData()
    
    local blip = AddBlipForCoord( -326.108, -1295.85, 31.378, - 1)
    SetBlipSprite(blip, 374)
    SetBlipColour(blip, 69)
    SetBlipScale  (blip, 0.50)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Toptancı')
    EndTextCommandSetBlipName(blip)
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local toptancicoords = {
    [1] = {x = 1441.167, y = 1137.965, z = 114.32}
}

function DrawText3D(x,y,z,text,size)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.28, 0.28)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y +0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
end

RegisterCommand('menukapat', function()
    ESX.UI.Menu.CloseAll()
end)

function menuac()
    ESX.UI.Menu.CloseAll()
    local elements = {}

    for k,v in pairs(Config.Recipes) do
        table.insert(elements, {label = v.GiveItem.label, value = k})
    end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gps', {
		title = 'Toptancı',
		align = 'right',
        elements = elements
    },function(data, menu)
		if data.current.value ~= nil then
            -- recipeItem(data.current.value)
            TriggerServerEvent('kagan-toptanci:item', data.current.value) 
            ESX.UI.Menu.CloseAll()
        else
            ESX.UI.Menu.CloseAll()
		end
	end)
end

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        if IsControlJustPressed(0, 194) then 
            if menu == true then
                ESX.UI.Menu.CloseAll()
                menu = false
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do 
        local sleep = 1000
        if Vdist2(GetEntityCoords(PlayerPedId(), false), -326.108, -1295.85, 31.378) < 5 then
            sleep = 1
            DrawText3D(-326.108, -1295.85, 31.378, '~g~E~w~ - Toptanci')
            if IsControlJustPressed(0, 38) then
                menuac()
                menu = true
            end
        end
        Citizen.Wait(sleep)
    end
end)


Citizen.CreateThread(function()
    if Config.NPCEnable == true then
        RequestModel(Config.NPCHash)
        while not HasModelLoaded(Config.NPCHash) do
            Wait(1)
        end
    
        stanley = CreatePed(1, Config.NPCHash, Config.NPCShop.x, Config.NPCShop.y, Config.NPCShop.z, Config.NPCShop.h, false, true)
        SetBlockingOfNonTemporaryEvents(stanley, true)
        SetPedDiesWhenInjured(stanley, false)
        SetPedCanPlayAmbientAnims(stanley, true)
        SetPedCanRagdollFromPlayerImpact(stanley, false)
        SetEntityInvincible(stanley, true)
        FreezeEntityPosition(stanley, true)
        TaskStartScenarioInPlace(stanley, "WORLD_HUMAN_CLIPBOARD", 0, true);
    end
end)

Citizen.CreateThread(function()
    if Config.NPCEnable == true then
        RequestModel(0xA8683715)
        while not HasModelLoaded(0xA8683715) do
            Wait(1)
        end
    
        aizen = CreatePed(1, 0xA8683715, 2416.722, 4992.867, 44.963, 111.07, false, true)
        SetBlockingOfNonTemporaryEvents(aizen, true)
        SetPedDiesWhenInjured(aizen, false)
        SetPedCanPlayAmbientAnims(aizen, true)
        SetPedCanRagdollFromPlayerImpact(aizen, false)
        SetEntityInvincible(aizen, true)
        FreezeEntityPosition(aizen, true)
        -- TaskStartScenarioInPlace(aizen, "WORLD_HUMAN_CLIPBOARD", 0, true);
    end
end)
