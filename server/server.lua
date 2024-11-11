ESX = nil
TriggerEvent(Config.Options.ESXSharedObject, function(obj) ESX = obj end)

Armor.RegisterServerCallback("foxi_armor:CheckJob", function(source,cb)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(Config.Options.AllowedJobs) do
        if xPlayer ~= nil then
            if xPlayer.job.name == v then
                return cb(true)
            end
        end
    end

    return cb(false)
end)

ESX.RegisterUsableItem(Config.Options.ArmorItem, function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    xPlayer.removeInventoryItem(Config.Options.ArmorItem, 1)
    SetArmor("GetArmor")
end)