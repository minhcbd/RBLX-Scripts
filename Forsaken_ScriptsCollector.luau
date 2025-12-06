local TARGET_PLACE_ID = 18687417158
local currentPlaceId = game.PlaceId


if currentPlaceId ~= TARGET_PLACE_ID then

    game.Players.LocalPlayer:Kick("You are permanently banned for cheating")
    return
end

local Decimals = 4
local Clock = os.clock()
local ValueText = "Value Is Now: "

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/drillygzzly/Roblox-UI-Libs/main/1%20Tokyo%20Lib%20(FIXED)/Tokyo%20Lib%20Source.lua"))({
    cheatname = "Forsaken Exclusive",  -- watermark text
    gamename = "Forsaken Only",  -- watermark text
})

library:init()


local Window1 = library.NewWindow({
    title = "Forsaken Script Hub | Tokyo Lib",  -- Mainwindow Text
    size = UDim2.new(0, 510, 0, 450)
})


local NoticeTab = Window1:AddTab("📢 Notice")
local ForsakenTab = Window1:AddTab("⚔️ Forsaken")
local UniversalTab = Window1:AddTab("🌐 Universal")
local ConfigTab = library:CreateSettingsTab(Window1)  

local Section1 = NoticeTab:AddSection("Important Notices", 1)


Section1:AddLabel({
    enabled = true,
    text = "Thanks for using",
    tooltip = "Appreciation message",
    risky = false
})


Section1:AddLabel({
    enabled = true,
    text = "Some scripts may not work.",
    tooltip = "Compatibility warning",
    risky = false
})

local GameInfoSection = NoticeTab:AddSection("Game Verification", 2)

GameInfoSection:AddLabel({
    enabled = true,
    text = "✅ Verified: Forsaken Game",
    tooltip = "Game compatibility verified"
})

GameInfoSection:AddLabel({
    enabled = true,
    text = "PlaceId: " .. tostring(currentPlaceId),
    tooltip = "Current game ID"
})

GameInfoSection:AddButton({
    enabled = true,
    text = "Verify Game Again",
    tooltip = "Double-check game compatibility",
    confirm = false,
    risky = false,
    callback = function()
        if game.PlaceId == TARGET_PLACE_ID then
            library:SendNotification("✅ Still in Forsaken - PlaceId: " .. game.PlaceId, 4)
        else
            library:SendNotification("⚠️ Game changed! PlaceId: " .. game.PlaceId, 4)
        end
    end
})

local ForsakenMainSection = ForsakenTab:AddSection("Forsaken Scripts", 1)


ForsakenMainSection:AddButton({
    enabled = true,
    text = "Auto Block-Hub",
    tooltip = "Rayfield Auto Block script for Forsaken",
    confirm = true,
    risky = true,
    callback = function()
        library:SendNotification("Loading Auto Block-Hub...", 3)
        print("[FORSAKEN] Executing Auto Block-Hub script...")
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidi399/Auto-block-script/refs/heads/main/Rayfield", true))()
        end)
        
        if success then
            library:SendNotification("✅ Auto Block-Hub loaded!", 5)
        else
            library:SendNotification("❌ Failed to load Auto Block-Hub!", 5)
            warn("[ERROR] Auto Block-Hub:", errorMessage)
        end
    end
})


ForsakenMainSection:AddButton({
    enabled = true,
    text = "Some-one's hub?",
    tooltip = "RINGTABUBLIK loader for Forsaken",
    confirm = true,
    risky = true,
    callback = function()
        library:SendNotification("Loading Some-one's hub...", 3)
        print("[FORSAKEN] Executing Some-one's hub script...")
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/forsakenloader.github.io/refs/heads/main/RINGTABUBLIK.lua"))()
        end)
        
        if success then
            library:SendNotification("✅ Some-one's hub loaded!", 5)
        else
            library:SendNotification("❌ Failed to load Some-one's hub!", 5)
            warn("[ERROR] Some-one's hub:", errorMessage)
        end
    end
})


ForsakenMainSection:AddButton({
    enabled = true,
    text = "Fartsaken",
    tooltip = "Key: syruppy",
    confirm = true,
    risky = true,
    callback = function()
        library:SendNotification("Loading Fartsaken...", 3)
        print("[FORSAKEN] Executing Fartsaken script...")
        
        local success, errorMessage = pcall(function()
            if getgenv then
                getgenv().BloxtrapRPC = "true"
                getgenv().DebugNotifications = "false"
                getgenv().TrackMePlease = "true"
            end
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/forsaken.lua"))()
        end)
        
        if success then
            library:SendNotification("✅ Fartsaken loaded with config!", 5)
        else
            library:SendNotification("❌ Failed to load Fartsaken!", 5)
            warn("[ERROR] Fartsaken:", errorMessage)
        end
    end
})

ForsakenMainSection:AddButton({
    enabled = true,
    text = "Gens farm",
    tooltip = "Key: syruppy",
    confirm = true,
    risky = true,
    callback = function()
        library:SendNotification("Loading Gens farm...", 3)
        print("[FORSAKEN] Executing Gens farm script...")
        
        local success, errorMessage = pcall(function()
            if getgenv then 
                getgenv().LoadTime = "5" -- Delay before loading the script
                getgenv().DiscordWebhook = "" -- Add your webhook for notifications
                getgenv().GeneratorTime = "2.5" -- Going below 2.5 may kick you from the game
            end
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ivannetta/ShitScripts/main/PathfindGens.lua'))()
        end)
        
        if success then
            library:SendNotification("✅ Gens farm loaded!", 5)
        else
            library:SendNotification("❌ Failed to load Gens farm!", 5)
            warn("[ERROR] Gens farm:", errorMessage)
        end
    end
})

ForsakenMainSection:AddButton({
    enabled = true,
    text = "Exclusive emotes",
    tooltip = "Unlock all exclusive emotes in Forsaken",
    confirm = true,
    risky = true,
    callback = function()
        library:SendNotification("Loading Exclusive emotes...", 3)
        print("[FORSAKEN] Executing Exclusive emotes script...")
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/minhcbd/RBLX-Scripts/refs/heads/main/ForsakenEmote.luau'))()
        end)
        
        if success then
            library:SendNotification("✅ Exclusive emotes unlocked!", 5)
        else
            library:SendNotification("❌ Failed to load emotes!", 5)
            warn("[ERROR] Exclusive emotes:", errorMessage)
        end
    end
})

local UniversalMainSection = UniversalTab:AddSection("Universal Tools", 1)


UniversalMainSection:AddButton({
    enabled = true,
    text = "Dex explorer",
    tooltip = "Roblox Lua Dex Explorer tool",
    confirm = false,
    risky = false,
    callback = function()
        library:SendNotification("Loading Dex explorer...", 3)
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/minhcbd/RBLX-Scripts/refs/heads/main/DexExplorer.luau"))()
        end)
        
        if success then
            library:SendNotification("✅ Dex explorer loaded!", 5)
        else
            library:SendNotification("❌ Failed to load Dex explorer!", 5)
            warn("[ERROR] Dex explorer:", errorMessage)
        end
    end
})


UniversalMainSection:AddButton({
    enabled = true,
    text = "Fly",
    tooltip = "Toggle fly mode in any game",
    confirm = false,
    risky = false,
    callback = function()
        library:SendNotification("Loading Fly script...", 3)
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
        end)
        
        if success then
            library:SendNotification("✅ Fly script loaded! Press key to fly", 5)
        else
            library:SendNotification("❌ Failed to load Fly script!", 5)
            warn("[ERROR] Fly:", errorMessage)
        end
    end
})


UniversalMainSection:AddButton({
    enabled = true,
    text = "NoClip",
    tooltip = "Walk through walls (toggle)",
    confirm = false,
    risky = true,
    callback = function()
        library:SendNotification("Loading NoClip script...", 3)
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Noclip.lua"))()
        end)
        
        if success then
            library:SendNotification("✅ NoClip loaded! Check console for controls", 5)
        else
            library:SendNotification("❌ Failed to load NoClip!", 5)
            warn("[ERROR] NoClip:", errorMessage)
        end
    end
})


UniversalMainSection:AddButton({
    enabled = true,
    text = "UNC Checker",
    tooltip = "Check for uncopylocked games",
    confirm = false,
    risky = false,
    callback = function()
        library:SendNotification("Loading UNC Checker...", 3)
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/UNC%20Checker.lua"))()
        end)
        
        if success then
            library:SendNotification("✅ UNC Checker loaded!", 5)
        else
            library:SendNotification("❌ Failed to load UNC Checker!", 5)
            warn("[ERROR] UNC Checker:", errorMessage)
        end
    end
})


UniversalMainSection:AddButton({
    enabled = true,
    text = "Infinite Yield",
    tooltip = "Advanced admin commands",
    confirm = false,
    risky = true,
    callback = function()
        library:SendNotification("Loading Infinite Yield...", 3)
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Yield.lua"))()
        end)
        
        if success then
            library:SendNotification("✅ Infinite Yield loaded! Type 'iy' in chat", 5)
        else
            library:SendNotification("❌ Failed to load Infinite Yield!", 5)
            warn("[ERROR] Infinite Yield:", errorMessage)
        end
    end
})

local UniversalSecondarySection = UniversalTab:AddSection("Additional Tools", 2)

UniversalSecondarySection:AddButton({
    enabled = true,
    text = "ESP",
    tooltip = "Player ESP (wallhack)",
    confirm = true,
    risky = true,
    callback = function()
        library:SendNotification("Loading ESP...", 3)
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/WRD%20ESP.lua"))()
        end)
        
        if success then
            library:SendNotification("✅ ESP loaded! Players will be highlighted", 5)
        else
            library:SendNotification("❌ Failed to load ESP!", 5)
            warn("[ERROR] ESP:", errorMessage)
        end
    end
})


UniversalSecondarySection:AddButton({
    enabled = true,
    text = "Inf Jump",
    tooltip = "Infinite jump (toggle)",
    confirm = false,
    risky = false,
    callback = function()
        library:SendNotification("Loading Infinite Jump...", 3)
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Jump.lua"))()
        end)
        
        if success then
            library:SendNotification("✅ Inf Jump loaded! Check controls", 5)
        else
            library:SendNotification("❌ Failed to load Inf Jump!", 5)
            warn("[ERROR] Infinite Jump:", errorMessage)
        end
    end
})

local Time = (string.format("%." .. tostring(Decimals) .. "f", os.clock() - Clock))
library:SendNotification(("✅ Forsaken Script Hub loaded in " .. tostring(Time) .. " seconds"), 6)


print("========================================")
print("FORSAKEN SCRIPT HUB")
print("========================================")
print("Total scripts available: 12+")
print("========================================")


coroutine.wrap(function()
    while true do
        wait(10)  -- Kiểm tra mỗi 10 giây
        
        if game.PlaceId ~= TARGET_PLACE_ID then
            -- Thông báo và kick nếu game bị thay đổi
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "GAME CHANGED",
                Text = "You left Forsaken! Script disabled.",
                Duration = 3,
            })
            
            wait(2)
            game.Players.LocalPlayer:Kick("⚠️ Game changed - This script only works with Forsaken")
            break
        end
    end
end)()

-- Kết thúc script
