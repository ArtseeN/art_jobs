ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("art-hurda")
AddEventHandler("art-hurda", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addMoney(250)
end)

RegisterNetEvent("art-tuglapaket")
AddEventHandler("art-tuglapaket", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addMoney(350)
end)

RegisterNetEvent("art-tahtaboya")
AddEventHandler("art-tahtaboya", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.addMoney(450)
end)