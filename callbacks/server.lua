Armor = {}
Armor.ServerCallbacks = {}

RegisterServerEvent('Armor:triggerServerCallback')
AddEventHandler('Armor:triggerServerCallback', function(name, requestId, ...)
	local _source = source

	Armor.TriggerServerCallback(name, requestID, _source, function(...)
		TriggerClientEvent('Armor:serverCallback', _source, requestId, ...)
	end, ...)
end)

Armor.RegisterServerCallback = function(name, cb)
	Armor.ServerCallbacks[name] = cb
end

Armor.TriggerServerCallback = function(name, requestId, source, cb, ...)
	if Armor.ServerCallbacks[name] ~= nil then
		Armor.ServerCallbacks[name](source, cb, ...)
	else
		print('Armor.TriggerServerCallback => [' .. name .. '] does not exist')
	end
end