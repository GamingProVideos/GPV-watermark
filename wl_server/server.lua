updatePath = "/GamingProVideos/GPV-watermark" -- your git user/repo path
-- Console stuff
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "GPV-watermark" then
        print("-----------------------------------------------------")
        print("Please Dont Change the resource name to avoid errors.")
        print("-----------------------------------------------------")
    end
    if GetCurrentResourceName() == 'GPV-watermark' then
        function checkVersion(_, responseText)
            curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("║                   Hey there! Yeah you, thanks for using GPV-watermark")
                print("║")
                print("║")
                print("║")
                print("║                       Uh Oh! Looks like GPV-watermark is outdated")
                print("║ Should be: "..responseText..", currently is: "..curVersion..". Please update it from https://github.com"..updatePath.."")
            elseif tonumber(curVersion) > tonumber(responseText) then
                print("║                   Hey there! Yeah you, thanks for using my GPV-watermark!")
                print("║")
                print("║")
                print("║")
                print("║                Uh Oh! You somehow skipped a few versions of GPV-watermark")
                print("║  or the git went offline, if it's still online I advise you to update (or downgrade?)")
            else
                print("║                   Hey there! Yeah you, thanks for using my GPV-watermark!")
                print("║")
                print("║")
                print("║")
                print("║                   It looks like GPV-watermark is up to date, have fun!")
            end
        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/GPV-watermark/version", checkVersion, "GET")
end)