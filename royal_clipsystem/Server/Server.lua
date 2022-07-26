ESX = nil


TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

print("[royal_clipsystem] Loaded")


RegisterServerEvent('royal_clipsystem:remove')
AddEventHandler('royal_clipsystem:remove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clip', 1)
    xPlayer.addInventoryItem('clipno', 1)
end)

RegisterServerEvent('royal_clipsystem:removesemi')
AddEventHandler('royal_clipsystem:removesemi', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('semiclip', 1)
    xPlayer.addInventoryItem('clipnosemi', 1)
end)

ESX.RegisterUsableItem('clip', function(source) --cargador normal
	TriggerClientEvent('royal_clipsystem:clip', source)
end)

ESX.RegisterUsableItem('semiclip', function(source) --semi cargador
	TriggerClientEvent('royal_clipsystem:semiclip', source)
end)

ESX.RegisterUsableItem('clipno', function(source) --cargador normal
	TriggerClientEvent('royal_clipsystem:checkclipno', source)
end)

ESX.RegisterUsableItem('clipnosemi', function(source) --semi cargador
	TriggerClientEvent('royal_clipsystem:checkclipnosemi', source)
end)

RegisterServerEvent('royal_clipsystem:addsemiclip')
AddEventHandler('royal_clipsystem:addsemiclip', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clipnosemi', 1)
    xPlayer.removeInventoryItem('bullets', 1)
    xPlayer.addInventoryItem('semiclip', 1) -- add the item to the inventory
end)


RegisterServerEvent('royal_clipsystem:addclip')
AddEventHandler('royal_clipsystem:addclip', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('clipno', 1)
    xPlayer.removeInventoryItem('bullets', 1)
    xPlayer.addInventoryItem('clip', 1) -- add the item to the inventory
end)

ESX.RegisterServerCallback('royal:checkinventory', function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getInventoryItem('bullets').count >= 25 then
        cb(true)
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('royal:checkinventory2', function(src, cb)
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.getInventoryItem('bullets').count >= 15 then
        cb(true)
    else
        cb(false)
    end
end)