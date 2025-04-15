--------------------------------------
------Created By Whit3Xlightning------
--https://github.com/Whit3XLightning--
--------------------------------------

RegisterNetEvent("wld:delallveh")
AddEventHandler("wld:delallveh", function ()
    local totalvehc = 0
    local notdelvehc = 0
        exports['doble_Notify']:Alert("SUCCESS", "Borrado de coches en 1 minuto", 5000, 'success')
    Citizen.Wait(30000)
        exports['doble_Notify']:Alert("SUCCESS", "Borrado de coches en 30 segundos", 5000, 'success')
    Citizen.Wait(20000)
        exports['doble_Notify']:Alert("SUCCESS", "Borrado de coches en 10 segundos", 5000, 'success')
    Citizen.Wait(10000)
    exports['doble_Notify']:Alert("SUCCESS", "Borrado de vehiculos realizado", 5000, 'success')
    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
            SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then DeleteVehicle(vehicle) end
            if (DoesEntityExist(vehicle)) then notdelvehc = notdelvehc + 1 end
        end
        totalvehc = totalvehc + 1 
    end
    local vehfrac = totalvehc - notdelvehc .. " / " .. totalvehc
    Citizen.Trace("Se han borrado "..vehfrac.." vehículos!")
    TriggerEvent('esx:showNotification',"Borrado de coches realizado")
end)

-- Ejecutar automáticamente cada 15 minutos con avisos
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(720000) -- 12 minutos en milisegundos
        TriggerEvent('esx:showNotification', "Borrado de coches en 3 minutos")
        Citizen.Wait(120000) -- 2 minutos
        TriggerEvent('esx:showNotification', "Borrado de coches en 1 minuto")
        Citizen.Wait(30000) -- 30 segundos
        TriggerEvent('esx:showNotification', "Borrado de coches en 30 segundos")
        Citizen.Wait(20000) -- 20 segundos
        TriggerEvent('esx:showNotification', "Borrado de coches en 10 segundos")
        Citizen.Wait(10000) -- 10 segundos
        TriggerEvent("wld:delallveh")
        TriggerEvent('esx:showNotification', "Borrado de coches realizado")
    end
end)
