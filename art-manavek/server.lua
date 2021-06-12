ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("art-manavc")
AddEventHandler("art-manavc", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addInventoryItem(Config.domates, 1)
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		print('[^2art-manav^0] - Baslatildi!')
	end
end)