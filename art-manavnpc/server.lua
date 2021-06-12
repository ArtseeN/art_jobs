ESX = nil
webhook = ''
local DISCORDS_NAME = "Log System"
local DISCORDS_IMAGE = "" -- default is FiveM logo

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('art-manav:item')
AddEventHandler('art-manav:item', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(Config.Recipes[item].RequiredItems) do
        if xPlayer.getInventoryItem(v.Item).count > 0 then
            miktar = xPlayer.getInventoryItem(v.Item).count
            paramiktar = Config.Recipes[item].GiveItem.Count * miktar
            xItem = xPlayer.removeInventoryItem(v.Item, miktar)
            -- xPlayer.addInventoryItem(Config.Recipes[item].GiveItem.Item, Config.Recipes[item].GiveItem.Count)
            xPlayer.addMoney(paramiktar)
            -- TriggerClientEvent('sup-notif', source, item.. ' Sattın', 1)
            -- exports['mythic_notify']:SendAlert('success', 'x'.. miktar ..' '.. item .. ' sattın')
            sendToDiscord("Manav - Satış", " **"..getPlayerInfo(source).."** kişisi manav`a **".. miktar .. "x " ..item .."** sattı, **" .. paramiktar .. "$** kazandı.", 16744576, webhook)
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = ''.. miktar ..' Adet '.. item .. ' sattın, ' .. paramiktar .. '$ kazandın.', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
            -- dclog(xPlayer, 'Manavda eşya sattı eşya - ' ..v.Item.. ' miktarı - ' ..miktar.. '  Satışdan Aldıgı Para   ' ..paramiktar ..'$')
        else
          TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Üzerinizde satmak istediğiniz eşya yok.', length = 2500, style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
        end
    end


end)

function sendToDiscord(name, message, color, selam)
	local connect = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			--   ["url"] = "https://bulogsistemithermitetarafındanyapılmıstır.com",
			  ["description"] = message,
			  ["footer"] = {
			  ["text"] = os.date('!%Y-%m-%d - %H:%M:%S') .. " - vibeR Logs",
			  },
		  }
	  }
	PerformHttpRequest(selam, function(err, text, headers) end, 'POST', json.encode({username = DISCORDS_NAME, embeds = connect, avatar_url = DISCORDS_IMAGE}), { ['Content-Type'] = 'application/json' })
end

function getPlayerInfo(player)
	local _player = player
	local infoString = GetPlayerName(_player) .. " (" .. _player .. ")"
	-- if Config.BilgileriPaylas then
		for k,v in pairs(GetPlayerIdentifiers(_player)) do
			if string.sub(v, 1, string.len("discord:")) == "discord:" then
				infoString = infoString .. "\n<@" .. string.gsub(v,"discord:","") .. ">"
			else
				infoString = infoString .. "\n" .. v
			end
		end
	-- end
	return infoString
end
