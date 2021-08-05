function addPlayerToRadio(channel, netId)
	local serverID = netId or source

	if channel then
		local radioChannel = Config.Channels[channel]

		exports["vRost"]:SetPlayerRadioPowerState(source, true)

		if radioChannel then
			exports["vRost"]:AddPlayerToRadio(serverID, radioChannel.frequency)
		else
			exports["vRost"]:AddPlayerToRadio(serverID, tostring(channel))
		end
	end
end

exports("addPlayerToRadio", addPlayerToRadio)

RegisterNetEvent("TokoVoip:addPlayerToRadio")
AddEventHandler("TokoVoip:addPlayerToRadio", addPlayerToRadio)

function removePlayerFromRadio(channel, netId)
	local serverID = netId or source

	if channel then
		local radioChannel = Config.Channels[channel]

		if radioChannel then
			exports["vRost"]:RemovePlayerFromRadio(serverID, radioChannel.frequency)
		else
			exports["vRost"]:RemovePlayerFromRadio(serverID, tostring(channel))
		end
	end
end

exports("removePlayerFromRadio", removePlayerFromRadio)

RegisterServerEvent("TokoVoip:removePlayerFromRadio")
AddEventHandler("TokoVoip:removePlayerFromRadio", removePlayerFromRadio)

function removePlayerFromAllRadio(netId)
	local serverID = netId or source

	exports["vRost"]:RemovePlayerFromAllRadios(serverID)
end

exports("removePlayerFromAllRadio", removePlayerFromAllRadio)

RegisterServerEvent("TokoVoip:removePlayerFromAllRadio")
AddEventHandler("TokoVoip:removePlayerFromAllRadio", removePlayerFromAllRadio)

RegisterCommand(
	"radio",
	function(source, args)
		local action = string.lower(args[1])
		local value = args[2]

		if action == "on" then
			exports["vRost"]:SetPlayerRadioPowerState(source, true)
		elseif action == "off" then
			exports["vRost"]:SetPlayerRadioPowerState(source, false)
		elseif action == "freq" then
			local frequency = tonumber(value)

			if frequency and frequency >= 100.0 and frequency <= 999.9 then
				exports["vRost"]:AddPlayerToRadio(source, value)
			end
		elseif action == "vol" then
			local volume = tonumber(value)

			if volume then
				exports["vRost"]:SetPlayerRadioVolume(volume)
			end
		end
	end,
	false
)
