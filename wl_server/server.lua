--onStart
AddEventHandler('onResourceStart', function(ressourceName)
 
    if(GetCurrentResourceName() ~= ressourceName)then
        return
    end
 
    --Code
    print(ressourceName.." Started")
 
end)
 
--onStop
AddEventHandler('onResourceStop', function(ressourceName)
 
    if(GetCurrentResourceName() ~= ressourceName)then
        return
    end
 
    --Code
    print(ressourceName.." Stopped")
 
end)