
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
else
  Citizen.CreateThread(function()
      if NetworkIsSessionStarted() then
        TriggerEvent("chat:addSuggestion", "/togglewatermark or /twm", "help text", {
          { help='Toggle the watermark' }
        })
        return
      end
    end)
    
    AddEventHandler('onClientMapStart', function ()
      Citizen.CreateThread(function ()
        isUiOpen = true
        TriggerEvent('DisplayWM', true) 
      end)
    end)
    
    RegisterNetEvent('DisplayWM', function (status)
      if status then 
        SendNUIMessage({displayWindow = 'true'})
        isUiOpen = true
        userTurnedOff = false
      else
        SendNUIMessage({displayWindow = 'false'})
        isUiOpen = false
        userTurnedOff = true
      end
    end)
    
    RegisterCommand('togglewm', function()
      if config.allowoff then
        if not isUiOpen then
          TriggerEvent('DisplayWM', true)
        else
          TriggerEvent('DisplayWM', false) 
        end
      else 
        TriggerEvent('chat:addMessage', {
          color = { 255, 0, 0},
          multiline = false,
          args = {"^9[Logo-WM] ^1This server has disabled the option for you to toggle the watermark!"}
        })    
      end
    end)
    RegisterCommand('twm', function()
      if config.allowoff then
        if not isUiOpen then
          TriggerEvent('DisplayWM', true)
        else
          TriggerEvent('DisplayWM', false) 
        end
      else 
        TriggerEvent('chat:addMessage', {
          color = { 255, 0, 0},
          multiline = false,
          args = {"^9[Logo-WM] ^1This server has disabled the option for you to toggle the watermark!"}
        })    
      end
    end)
end
