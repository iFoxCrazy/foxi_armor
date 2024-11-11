function SetArmor(type)
    local ped = PlayerPedId()
    if type == 'GetArmor' then
        currentArmor = Config.Options.SuperArmor
        if(GetEntityModel(ped) == GetHashKey("mp_m_freemode_01")) then
            SetPedComponentVariation(ped, Config.Options.ArmorComponent[1][1], Config.Options.ArmorComponent[1][2], Config.Options.ArmorComponent[1][3], Config.Options.ArmorComponent[1][4])
        elseif(GetEntityModel(ped) == GetHashKey("mp_f_freemode_01")) then
            SetPedComponentVariation(ped, Config.Options.ArmorComponent[2][1],Config.Options.ArmorComponent[2][2], Config.Options.ArmorComponent[2][3], Config.Options.ArmorComponent[2][4])
        end
        SetPedArmour(ped, 100)
    else
        currentArmor = 0
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedArmour(ped, 0)
    end
end

helpText = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end