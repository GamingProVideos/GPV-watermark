
local isUiOpen = false 
local userTurnedOff = false 
if Config.OLDUI then
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

  if not Config.OLDUI then
    CreateThread(function()
        Wait(1000)
        SendNuiMessage(json.encode {
            type = 'config',
            nametext = Config.name,
            linktext = Config.link,
            nameColor = Config.nameColor,
            linkColor = Config.linkColor,
            logoLink = Config.logoLink
        })
        Wait(2000)
        while true do
            if Config.logoEnabled then
                SendNuiMessage(json.encode {
                    type = 'show',
                    item = 'logo',
                    opacity = Config.logoOpacity
                })

                Wait(Config.cycleTime * 1000)
                Wait(1000)
            end

            if Config.nameEnabled then
                SendNuiMessage(json.encode {
                    type = 'show',
                    item = 'name',
                    opacity = Config.textOpacity
                })

                Wait(Config.cycleTime * 1000)
                Wait(1000)
            end

            if Config.linkEnabled then
                SendNuiMessage(json.encode {
                    type = 'show',
                    item = 'link',
                    opacity = Config.textOpacity
                })

                Wait(Config.cycleTime * 1000)
                Wait(1000)
            end

            SendNuiMessage(json.encode {
                type = 'show',
                item = 'none'
            })

            Wait(Config.restTime * 1000)
        end
    end)
end
