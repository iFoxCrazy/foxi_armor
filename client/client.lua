local currentArmor = 0
local isPolice = false


--[[
    /* Get/Remove Armor in world */
]]

Citizen.CreateThread(function()
    while true do
        Armor.TriggerServerCallback('foxi_armor:CheckJob', function(hasJob)
            if hasJob then
                isPolice = true
            else
                isPolice = false
            end
        end)
        Citizen.Wait(Config.Options.JobCheckTime)
    end
end)


Citizen.CreateThread(function()
    local sleepTime = 500
    while true do
        if isPolice then
            for k,v in pairs(Config.Options.Locations) do
                for i = 1, #v do
                    if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v[i], true) <= Config.Options.DrawDistance then
                        sleepTime = 1
                        DrawMarker(Config.Options.MarkerType, v[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 255, 255, 50, false, false, 2, nil, nil, false)
                        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v[i], true)  <= Config.Options.InteractionDistance then
                            if tostring(k) == 'GetArmor' then
                                helpText(Config.Options.Strings['Interact']:format(Config.Options.Strings['GetArmor']))
                            else
                                helpText(Config.Options.Strings['Interact']:format(Config.Options.Strings['RemoveArmor']))
                            end
                            if IsControlJustReleased(1, Config.Options.InteractionKey) then
                                SetArmor(tostring(k))
                            end
                        end
                    end
                end
            end
        end
        Wait(sleepTime)
    end
end)

Citizen.CreateThread(function()
    while true do
        if currentArmor > 100 then
            if GetPedArmour(PlayerPedId()) < 100 then
                local removedArmor = math.abs(GetPedArmour(PlayerPedId()) - 100)
                currentArmor = currentArmor - removedArmor
                SetPedArmour(PlayerPedId(), 100)
            end
        elseif currentArmor < 100 and currentArmor > 0 then
            if GetPedArmour(PlayerPedId()) ~= currentArmor then
                local removedArmor = math.abs(GetPedArmour(PlayerPedId()) - currentArmor)
                currentArmor = currentArmor - removedArmor
                if currentArmor > 0 then
                    SetPedArmour(PlayerPedId(), currentArmor)
                else
                    SetArmor("RemoveArmor")
                end
            end
        else
            SetArmor("RemoveArmor")
        end
        Wait(Config.Options.CheckTime)
    end
end)