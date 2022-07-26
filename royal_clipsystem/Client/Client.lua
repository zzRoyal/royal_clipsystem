ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('royal_clipsystem:clip')
AddEventHandler('royal_clipsystem:clip', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      exports['progressBar']:startUI(5000, "Reloading weapon...")
      Citizen.Wait(5000)
      TriggerServerEvent('royal_clipsystem:remove')
      AddAmmoToPed(GetPlayerPed(-1), hash,25)
      ESX.ShowNotification("You used a charger.")
     -- TriggerServerEvent('royal_clipsystem:addclipfree')
    else
      ESX.ShowNotification("You don't have a weapon equipped")
    end
  else
    ESX.ShowNotification("This type of weapon is not compatible with this clip")
  end
end)

RegisterNetEvent('royal_clipsystem:checkclipno')
AddEventHandler('royal_clipsystem:checkclipno', function()
  PlayerData = GetPlayerPed(-1)
  ESX.TriggerServerCallback('royal:checkinventory', function(royal)
    if royal then 
      exports['progressBar']:startUI(8000, "Riding charger...")
      Citizen.Wait(8000)
      ESX.ShowNotification("You assembled a charger, here it is.")
      TriggerServerEvent('royal_clipsystem:addclip')
      print("[royal_clipsystem] Mounted charger")
        end
    end)
end)

RegisterNetEvent('royal_clipsystem:semiclip')
AddEventHandler('royal_clipsystem:semiclip', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      exports['progressBar']:startUI(4000, "Reloading weapon...")
      Citizen.Wait(4000)
      TriggerServerEvent('royal_clipsystem:removesemi')
      AddAmmoToPed(GetPlayerPed(-1), hash,15)
      ESX.ShowNotification("You used a semi-charger")
     -- TriggerServerEvent('royal_clipsystem:addclipfree')
    else
      ESX.ShowNotification("You don't have a weapon equipped")
    end
  else
    ESX.ShowNotification("This type of weapon is not compatible with this clip")
  end
end)

RegisterNetEvent('royal_clipsystem:checkclipnosemi')
AddEventHandler('royal_clipsystem:checkclipnosemi', function()
  PlayerData = GetPlayerPed(-1)
  ESX.TriggerServerCallback('royal:checkinventory2', function(royal)
    if royal then 
      exports['progressBar']:startUI(6000, "Mounting semi charger...")
      Citizen.Wait(6000)
      ESX.ShowNotification("You built a semi-charger, here it is.")
      TriggerServerEvent('royal_clipsystem:addsemiclip')
      print("[royal_clipsystem] Semi-charger built")
        end
    end)
end)
