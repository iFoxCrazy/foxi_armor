Armor = {}
Armor.CurrentRequestId          = 0
Armor.ServerCallbacks           = {}

Armor.TriggerServerCallback = function(name, cb, ...)
	Armor.ServerCallbacks[Armor.CurrentRequestId] = cb

	TriggerServerEvent('Armor:triggerServerCallback', name, Armor.CurrentRequestId, ...)

	if Armor.CurrentRequestId < 65535 then
		Armor.CurrentRequestId = Armor.CurrentRequestId + 1
	else
		Armor.CurrentRequestId = 0
	end
end

RegisterNetEvent('Armor:serverCallback')
AddEventHandler('Armor:serverCallback', function(requestId, ...)
	Armor.ServerCallbacks[requestId](...)
	Armor.ServerCallbacks[requestId] = nil
end)