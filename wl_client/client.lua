Citizen.CreateThread(function()
	while true do
		Wait(1)

		if 	Config.RGBText then
			Config.rgb = RGBRainbow(1)
		end
		SetTextColour(Config.rgb.r, Config.rgb.g, Config.rgb.b, Config.alpha)

		SetTextFont(Config.font)
		SetTextScale(Config.scale, Config.scale)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString(Config.Name)
		DrawText(Config.offset.x, Config.offset.y)
	end
end)

function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end