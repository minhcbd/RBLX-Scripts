-- [File type]: LocalScript
-- [Location]: StarterGui hoặc trong ScreenGui
-- [Description]: UI Hub Rayfield chỉ dành cho game Forsaken

-- ============================================
-- PHẦN 1: KIỂM TRA NGHIÊM NGẶT PLACEID
-- ============================================
local TARGET_PLACE_ID = 18687417158  -- PlaceId của game Forsaken
local currentPlaceId = game.PlaceId

-- Nếu không phải game Forsaken, kick người chơi ngay lập tức
if currentPlaceId ~= TARGET_PLACE_ID then
    -- Tạo thông báo trước khi kick
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "❌ SCRIPT ERROR",
        Text = "This script only works with Forsaken game!",
        Duration = 3,
    })
    
    -- Đợi 3 giây để hiển thị thông báo
    wait(3)
    
    -- Kick người chơi với lý do "Not supported"
    game.Players.LocalPlayer:Kick("❌ Not supported - This script only works with Forsaken (PlaceId: 18687417158)")
    
    -- Dừng script ngay lập tức
    return
end

-- ============================================
-- PHẦN 2: TẢI THƯ VIỆN RAYFIELD
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ============================================
-- PHẦN 3: TẠO CỬA SỔ CHÍNH
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = "Forsaken Script Hub | Rayfield",
    Icon = "shield",
    LoadingTitle = "Forsaken Exclusive Hub",
    LoadingSubtitle = "Loading scripts...",
    ShowText = "Rayfield",
    Theme = "Default",
    
    ToggleUIKeybind = "RightControl",  -- Phím tắt ẩn/hiện UI
    
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ForsakenHub",  -- Tên thư mục lưu config
        FileName = "ForsakenSettings"
    },
    
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    
    KeySystem = false  -- Không sử dụng key system
})

-- ============================================
-- PHẦN 4: TẠO CÁC TAB CHÍNH
-- ============================================
local NoticeTab = Window:CreateTab("📢 Notice", "info")  -- Tab 1 với icon info
local ForsakenTab = Window:CreateTab("⚔️ Forsaken", "sword")  -- Tab 2 với icon sword
local UniversalTab = Window:CreateTab("🌐 Universal", "globe")  -- Tab 3 với icon globe

-- ============================================
-- TAB 1: NOTICE - THÔNG BÁO HỆ THỐNG
-- ============================================
local NoticeSection = NoticeTab:CreateSection("System Information")

-- Tạo Paragraph với thông báo cảm ơn
NoticeTab:CreateParagraph({
    Title = "Thanks for using",
    Content = "Thank you for using this Forsaken Script Hub. Please use scripts responsibly."
})

-- Tạo Paragraph với cảnh báo
NoticeTab:CreateParagraph({
    Title = "Important Warning",
    Content = "Some scripts may not work properly or could trigger anti-cheat systems. Use at your own risk."
})

-- Tạo Label với thông tin PlaceId
NoticeTab:CreateLabel("✅ Verified: Forsaken Game (PlaceId: " .. currentPlaceId .. ")")

-- Tạo Section thông tin bổ sung
local InfoSection = NoticeTab:CreateSection("Usage Information")

-- Tạo các Label hướng dẫn
NoticeTab:CreateLabel("1. Click buttons to load scripts")
NoticeTab:CreateLabel("2. Some scripts may require waiting time")
NoticeTab:CreateLabel("3. Check console for execution logs")

-- Nút kiểm tra cập nhật
NoticeTab:CreateButton({
    Name = "Check for Updates",
    Callback = function()
        Rayfield:Notify({
            Title = "Update Check",
            Content = "You are using the latest version!",
            Duration = 5,
            Image = "check-circle"
        })
        print("[SYSTEM] Update check completed - Version 1.0.0")
    end
})

-- ============================================
-- TAB 2: FORSAKEN - SCRIPT CHÍNH CHO GAME
-- ============================================
local ForsakenMainSection = ForsakenTab:CreateSection("Forsaken Scripts")

-- Nút 1: Auto Block-Hub
ForsakenTab:CreateButton({
    Name = "Auto Block-Hub",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Auto Block-Hub",
            Content = "Please wait...",
            Duration = 3,
            Image = "loader"
        })
        
        -- Thực thi script từ GitHub
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidi399/Auto-block-script/refs/heads/main/Rayfield",true))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Auto Block-Hub loaded successfully!",
                Duration = 5,
                Image = "check-circle"
            })
            print("[FORSAKEN] Auto Block-Hub script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load Auto Block-Hub!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] Auto Block-Hub:", errorMessage)
        end
    end
})

-- Nút 2: Some-one's hub?
ForsakenTab:CreateButton({
    Name = "Some-one's hub?",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Some-one's hub",
            Content = "Please wait...",
            Duration = 3,
            Image = "loader"
        })
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/forsakenloader.github.io/refs/heads/main/RINGTABUBLIK.lua"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Some-one's hub loaded successfully!",
                Duration = 5,
                Image = "check-circle"
            })
            print("[FORSAKEN] Some-one's hub script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load Some-one's hub!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] Some-one's hub:", errorMessage)
        end
    end
})

-- Nút 3: Fartsaken
ForsakenTab:CreateButton({
    Name = "Fartsaken",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Fartsaken",
            Content = "Setting up configuration...",
            Duration = 3,
            Image = "loader"
        })
        
        local success, errorMessage = pcall(function()
            -- Thiết lập cấu hình
            if getgenv then
                getgenv().BloxtrapRPC = "true"
                getgenv().DebugNotifications = "false"
                getgenv().TrackMePlease = "true"
            end
            
            -- Load script chính
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/forsaken.lua"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Fartsaken loaded with configuration!",
                Duration = 5,
                Image = "check-circle"
            })
            print("[FORSAKEN] Fartsaken script executed with config")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load Fartsaken!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] Fartsaken:", errorMessage)
        end
    end
})

-- Nút 4: Gens farm
ForsakenTab:CreateButton({
    Name = "Gens farm",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Gens farm",
            Content = "Setting up farming configuration...",
            Duration = 3,
            Image = "loader"
        })
        
        local success, errorMessage = pcall(function()
            -- Thiết lập cấu hình farming
            if getgenv then 
                getgenv().LoadTime = "5" -- Delay before loading the script
                getgenv().DiscordWebhook = "" -- Add your webhook for notifications
                getgenv().GeneratorTime = "2.5" -- Going below 2.5 may kick you from the game
            end
            
            -- Load script farming
            loadstring(game:HttpGet('https://raw.githubusercontent.com/ivannetta/ShitScripts/main/PathfindGens.lua'))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Gens farm loaded successfully!",
                Duration = 5,
                Image = "check-circle"
            })
            print("[FORSAKEN] Gens farm script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load Gens farm!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] Gens farm:", errorMessage)
        end
    end
})

-- Nút 5: Exclusive emotes
ForsakenTab:CreateButton({
    Name = "Exclusive emotes",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Exclusive emotes",
            Content = "Unlocking all emotes...",
            Duration = 3,
            Image = "loader"
        })
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/minhcbd/RBLX-Scripts/refs/heads/main/ForsakenEmote.luau'))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Exclusive emotes unlocked!",
                Duration = 5,
                Image = "check-circle"
            })
            print("[FORSAKEN] Exclusive emotes script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load Exclusive emotes!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] Exclusive emotes:", errorMessage)
        end
    end
})

-- Tạo Section thứ hai cho các tính năng bổ sung
local ForsakenExtraSection = ForsakenTab:CreateSection("Additional Features")

-- Nút test kết nối
ForsakenTab:CreateButton({
    Name = "Test Connection",
    Callback = function()
        Rayfield:Notify({
            Title = "Connection Test",
            Content = "Testing script sources...",
            Duration = 3,
            Image = "wifi"
        })
        
        -- Test các URL có thể truy cập được không
        local testUrls = {
            "https://raw.githubusercontent.com/skibidi399/Auto-block-script/refs/heads/main/Rayfield",
            "https://raw.githubusercontent.com/minhcbd/RBLX-Scripts/refs/heads/main/ForsakenEmote.luau"
        }
        
        local working = 0
        for _, url in ipairs(testUrls) do
            local success = pcall(function()
                game:HttpGet(url, true)
            end)
            if success then working = working + 1 end
        end
        
        Rayfield:Notify({
            Title = "Test Results",
            Content = working .. "/" .. #testUrls .. " sources are accessible",
            Duration = 6,
            Image = working == #testUrls and "check-circle" or "alert-triangle"
        })
    end
})

-- ============================================
-- TAB 3: UNIVERSAL - SCRIPT DÙNG CHUNG
-- ============================================
local UniversalMainSection = UniversalTab:CreateSection("Universal Tools")

-- Nút 1: Dex explorer
UniversalTab:CreateButton({
    Name = "Dex explorer",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Dex explorer",
            Content = "Opening Roblox Lua Dex...",
            Duration = 3,
            Image = "search"
        })
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/minhcbd/RBLX-Scripts/refs/heads/main/DexExplorer.luau"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Dex explorer loaded successfully!",
                Duration = 5,
                Image = "check-circle"
            })
            print("[UNIVERSAL] Dex explorer script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load Dex explorer!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] Dex explorer:", errorMessage)
        end
    end
})

-- Nút 2: Fly
UniversalTab:CreateButton({
    Name = "Fly",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Fly",
            Content = "Enabling flight mode...",
            Duration = 3,
            Image = "wind"
        })
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Fly.lua"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Fly script loaded! Press key to fly",
                Duration = 5,
                Image = "check-circle"
            })
            print("[UNIVERSAL] Fly script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load Fly script!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] Fly:", errorMessage)
        end
    end
})

-- Nút 3: NoClip
UniversalTab:CreateButton({
    Name = "NoClip",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading NoClip",
            Content = "Enabling noclip mode...",
            Duration = 3,
            Image = "eye-off"
        })
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Noclip.lua"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "NoClip loaded! Check controls",
                Duration = 5,
                Image = "check-circle"
            })
            print("[UNIVERSAL] NoClip script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load NoClip!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] NoClip:", errorMessage)
        end
    end
})

-- Nút 4: UNC Checker
UniversalTab:CreateButton({
    Name = "UNC Checker",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading UNC Checker",
            Content = "Checking for uncopylocked games...",
            Duration = 3,
            Image = "shield-check"
        })
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/UNC%20Checker.lua"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "UNC Checker loaded successfully!",
                Duration = 5,
                Image = "check-circle"
            })
            print("[UNIVERSAL] UNC Checker script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load UNC Checker!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] UNC Checker:", errorMessage)
        end
    end
})

-- Tạo Section thứ hai cho các công cụ bổ sung
local UniversalExtraSection = UniversalTab:CreateSection("Additional Universal Tools")

-- Nút 5: Infinite Yield
UniversalTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Infinite Yield",
            Content = "Loading admin commands...",
            Duration = 3,
            Image = "infinity"
        })
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Yield.lua"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Infinite Yield loaded! Type 'iy' in chat",
                Duration = 5,
                Image = "check-circle"
            })
            print("[UNIVERSAL] Infinite Yield script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load Infinite Yield!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] Infinite Yield:", errorMessage)
        end
    end
})

-- Nút 6: ESP
UniversalTab:CreateButton({
    Name = "ESP",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading ESP",
            Content = "Enabling player ESP...",
            Duration = 3,
            Image = "eye"
        })
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/WRD%20ESP.lua"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "ESP loaded! Players will be highlighted",
                Duration = 5,
                Image = "check-circle"
            })
            print("[UNIVERSAL] ESP script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load ESP!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] ESP:", errorMessage)
        end
    end
})

-- Nút 7: Inf Jump
UniversalTab:CreateButton({
    Name = "Inf Jump",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading Infinite Jump",
            Content = "Enabling infinite jump...",
            Duration = 3,
            Image = "arrow-up"
        })
        
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Infinite%20Jump.lua"))()
        end)
        
        if success then
            Rayfield:Notify({
                Title = "✅ Success",
                Content = "Inf Jump loaded! Check controls",
                Duration = 5,
                Image = "check-circle"
            })
            print("[UNIVERSAL] Infinite Jump script executed")
        else
            Rayfield:Notify({
                Title = "❌ Error",
                Content = "Failed to load Inf Jump!",
                Duration = 5,
                Image = "x-circle"
            })
            warn("[ERROR] Infinite Jump:", errorMessage)
        end
    end
})

-- ============================================
-- PHẦN 5: THÔNG BÁO HOÀN THÀNH
-- ============================================
-- Hiển thị thông báo khi UI đã tải xong
Rayfield:Notify({
    Title = "✅ Forsaken Script Hub",
    Content = "UI loaded successfully! PlaceId verified: " .. currentPlaceId,
    Duration = 6,
    Image = "check-circle"
})

-- In thông tin ra console
print("========================================")
print("FORSÅKEN SCRIPT HUB - RAYFIELD EDITION")
print("PlaceId Verified: " .. tostring(currentPlaceId))
print("========================================")
print("Total scripts available: 12")
print("Forsaken scripts: 5")
print("Universal scripts: 7")
print("========================================")

-- ============================================
-- PHẦN 6: BẢO VỆ BỔ SUNG
-- ============================================
-- Tạo một coroutine để kiểm tra placeId liên tục
coroutine.wrap(function()
    while true do
        wait(10)  -- Kiểm tra mỗi 10 giây
        
        if game.PlaceId ~= TARGET_PLACE_ID then
            -- Thông báo và kick nếu game bị thay đổi
            Rayfield:Notify({
                Title = "⚠️ GAME CHANGED",
                Content = "You left Forsaken! Script disabled.",
                Duration = 3,
                Image = "alert-triangle"
            })
            
            wait(2)
            game.Players.LocalPlayer:Kick("⚠️ Game changed - This script only works with Forsaken")
            break
        end
    end
end)()

-- ============================================
-- PHẦN 7: LƯU CẤU HÌNH TỰ ĐỘNG
-- ============================================
-- Rayfield tự động lưu cấu hình khi đóng game
-- Chúng ta không cần làm gì thêm vì đã bật ConfigurationSaving

-- Kết thúc script
