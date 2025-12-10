
if game.PlaceId == 18687417158 then
    

    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


    local Window = Rayfield:CreateWindow({
       Name = "Collector Hub",
       Icon = 0,
       LoadingTitle = "Forsaken Script",
       LoadingSubtitle = "By Pizza scripter",
       Theme = "Default", 
       
       DisableRayfieldPrompts = false,
       DisableBuildWarnings = false,

       ConfigurationSaving = {
          Enabled = true,
          FolderName = "ForsakenHubConfig",
          FileName = "Manager"
       },

       KeySystem = false,
    })



    local NoticeTab = Window:CreateTab("Notice", "info")


    local ForsakenTab = Window:CreateTab("Forsaken", "swords")


    local UniversalTab = Window:CreateTab("Universal", "globe")

    
    NoticeTab:CreateLabel("Thanks for using")
    NoticeTab:CreateLabel("Some scripts may not work.")
    

    local ForsakenSection = ForsakenTab:CreateSection("Main Scripts")

    ForsakenTab:CreateButton({
       Name = "Auto Block-Hub",
       Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidi399/Auto-block-script/refs/heads/main/Rayfield",true))()
       end,
    })

    ForsakenTab:CreateButton({
       Name = "Some-one's hub?",
       Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/forsakenloader.github.io/refs/heads/main/RINGTABUBLIK.lua"))()
       end,
    })

    ForsakenTab:CreateButton({
       Name = "Fartsaken",
       Callback = function()
            if getgenv then
                getgenv().BloxtrapRPC = "true"
                getgenv().DebugNotifications = "false"
                getgenv().TrackMePlease = "true"
            end
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/forsaken.lua"))()
       end,
    })

    ForsakenTab:CreateButton({
       Name = "Gens farm",
       Callback = function()
            if getgenv then 
                getgenv().LoadTime = "5" -- Delay before loading the script
                getgenv().DiscordWebhook = "" -- Add your webhook for notifications
                getgenv().GeneratorTime = "2.5" -- Going below 2.5 may kick you from the game
            end
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ivannetta/ShitScripts/main/PathfindGens.lua'))()
       end,
    })

    ForsakenTab:CreateButton({
       Name = "Exclusive emotes",
       Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/minhcbd/RBLX-Scripts/refs/heads/main/ForsakenEmote.luau'))()
       end,
    })


    local UniversalSection = UniversalTab:CreateSection("Universal Tools")


    UniversalTab:CreateButton({
       Name = "Dex explorer",
       Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/minhcbd/RBLX-Scripts/refs/heads/main/DexExplorer.luau"))()
       end,
    })


    UniversalTab:CreateButton({
       Name = "Fly",
       Callback = function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
       end,
    })


    UniversalTab:CreateButton({
       Name = "NoClip",
       Callback = function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Noclip.lua"))()
       end,
    })


    UniversalTab:CreateButton({
       Name = "UNC Checker",
       Callback = function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/UNC%20Checker.lua"))()
       end,
    })

    UniversalTab:CreateButton({
       Name = "Infinite Yield",
       Callback = function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Yield.lua"))()
       end,
    })

    UniversalTab:CreateButton({
       Name = "ESP",
       Callback = function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/WRD%20ESP.lua"))()
       end,
    })

    UniversalTab:CreateButton({
       Name = "Inf Jump",
       Callback = function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Jump.lua"))()
       end,
    })
    Rayfield:Notify({
       Title = "Script Loaded",
       Content = "Collector Hub loaded successfully!",
       Duration = 5,
       Image = "check",
    })

else
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    Rayfield:Notify({
       Title = "Wrong Game",
       Content = "Are you kidding me?",
       Duration = 10,
       Image = "alert-triangle",
    })
end
