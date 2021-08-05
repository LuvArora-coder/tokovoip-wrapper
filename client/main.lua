function addPlayerToRadio(channel)
	TriggerServerEvent("TokoVoip:addPlayerToRadio", channel)
end

exports("addPlayerToRadio", addPlayerToRadio)

function removePlayerFromRadio(channel)
	TriggerServerEvent("TokoVoip:removePlayerFromRadio", channel)
end

exports("removePlayerFromRadio", removePlayerFromRadio)

TriggerEvent("chat:addSuggestion", "/radio", "Basic Radio", {{name = "action", help = "ON | OFF | FREQ | VOL"}, {name = "value", help = "Freq 100.0 - 999.9 | Vol: 1 - 10"}})
