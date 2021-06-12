ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('art_madenjobs:server:getConfig', function(source, cb, itemName) 
    while Jobs == nil do 
        Citizen.Wait(100)
    end
    cb(Jobs)
end)

RegisterServerEvent("art_madenjobs:server:process")
AddEventHandler("art_madenjobs:server:process", function(coords, k, v, id)
    local player = ESX.GetPlayerFromId(source)
    if not player or k == nil or coords == nil or id == nil or v == nil then return TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'error', text = "An error occurred. Please try again."}) end
    local jobData = Jobs[k].location[id]
    if #(jobData.coords - coords) <= 10 then
        local item = player.getInventoryItem(jobData.item["itemName"])
        local requiredItem = player.getInventoryItem(jobData.item["requiredItem"])
        if item or jobData.item["process"] == "sell" then
            local retval = false
            if jobData.item["process"] ~= "sell" and WeightSystem then
                if jobData.item["process"] == "kexchange" or jobData.item["process"] == "kpackage" then
                    if player.canSwapItem(jobData.item["requiredItem"], jobData.item["removeCount"], jobData.item["itemName"], jobData.item["addCount"]) then
                        retval = true
                    end
                else
                    if player.canCarryItem(jobData.item["itemName"], jobData.item["addCount"]) then
                        retval = true                        
                    end  
                end
            else
                retval = true
            end
            if jobData.item["process"] == "kpickup" then
                if retval then
                    player.addInventoryItem(jobData.item["itemName"], jobData.item["addCount"])
                    TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'inform', text = "You collected "..jobData.item["addCount"].."x ".. ESX.GetItemLabel(jobData.item["itemName"])})
                else
                    TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'error', text = "You reached the weight limit!"})
                end
            elseif jobData.item["process"] == "kexchange" then
                if requiredItem.count >= jobData.item["removeCount"] then
                    if retval then
                        player.removeInventoryItem(jobData.item["requiredItem"], jobData.item["removeCount"])
                        TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'inform', text = "You processed "..jobData.item["addCount"].."x ".. ESX.GetItemLabel(jobData.item["itemName"])})
                        player.addInventoryItem(jobData.item["itemName"], jobData.item["addCount"])
                    else
                        TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'error', text = "You reached the weight limit!"})
                    end
                else
                    TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'error', text = "You don't have enough item!"})
                end
            elseif jobData.item["process"] == "kpackage" then
                if requiredItem.count >= jobData.item["removeCount"] then
                    if retval then
                        player.removeInventoryItem(jobData.item["requiredItem"], jobData.item["removeCount"])
                        player.addInventoryItem(jobData.item["itemName"], jobData.item["addCount"])
                        TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'inform', text = "You packaged "..jobData.item["addCount"].."x "..ESX.GetItemLabel(jobData.item["itemName"])})
                    else
                        TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'error', text = "You reached the weight limit!"})
                    end
                else
                    TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'error', text = "You don't have enough item!"})
                end
            elseif jobData.item["process"] == "sell" then
                if requiredItem.count >= jobData.item["removeCount"] then
                    player.removeInventoryItem(jobData.item["requiredItem"], jobData.item["removeCount"])
                    player.addMoney(jobData.item["price"])
                    TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'inform', text = "You selled "..jobData.item["removeCount"].."x "..ESX.GetItemLabel(jobData.item["requiredItem"]).. " for $"..jobData.item["price"]})
                else
                    TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'error', text = "You don't have enough item!"})
                end
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', player.source, { type = 'error', text = "An error occurred."})
            print("[art_madenjobs] - ERROR - art_madenjobs:server:process Tried to query an item that isn't included in the 'items' table.") 
            print("[art_madenjobs] Item must be "..jobData.item["itemName"])
        end
    else
        print("[art_madenjobs] - WARNING - art_madenjobs:server:process event called without close to the process coords. User Identifier:"..player.identifier)
        DropPlayer(player.source, "Kicked for using exploit!")
    end
end)
ESX.RegisterServerCallback('art_madenjobs:checkCount', function(source, cb, itemName) 
    local player = ESX.GetPlayerFromId(source)
    local item = player.getInventoryItem(itemName)
    if item then
        cb(item.count)
    else
        cb(0)
    end
end)
