local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Advanced Emote System",
   LoadingTitle = "Multi-Emote Interface",
   LoadingSubtitle = "by CongKa",
   ConfigurationSaving = {
      Enabled = true,
      FileName = "EmoteConfig"
   },
})

local Tab = Window:CreateTab("Emotes", "smile")

-- Khai báo các service
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
local head = character:WaitForChild("Head")
local camera = Workspace.CurrentCamera

local originalCameraSubject = camera.CameraSubject
local cameraFollowing = false

local defaultWalkSpeed = humanoid.WalkSpeed
local defaultJumpPower = humanoid.JumpPower

-- Biến toàn cục
local activeAnimationTrack
local activeSound
local isEmotePlaying = false
local currentEmote = ""

-- Danh sách animation và sound
local animations = {
    HakariDance = "rbxassetid://138019937280193",
    Subterfuge = "rbxassetid://87482480949358",
    MissTheQuiet = "rbxassetid://100986631322204",
    Shucks = "rbxassetid://74238051754912",
    SillyBilly = "rbxassetid://107464355830477"
}

local sounds = {
    HakariDance = "rbxassetid://87166578676888",
    Subterfuge = "rbxassetid://132297506693854",
    MissTheQuiet = "rbxassetid://131936418953291",
    Shucks = "rbxassetid://123236721947419",
    SillyBilly = "rbxassetid://77601084987544"
}

-- Tạo animation objects
local animationObjects = {}
for name, id in pairs(animations) do
    local anim = Instance.new("Animation")
    anim.AnimationId = id
    animationObjects[name] = anim
end

-- Tạo sound objects
local soundObjects = {}
for name, id in pairs(sounds) do
    local sound = Instance.new("Sound")
    sound.SoundId = id
    sound.Volume = 2
    sound.Looped = true
    sound.RollOffMode = Enum.RollOffMode.Linear
    sound.MaxDistance = 50
    soundObjects[name] = sound
end

-- Hàm theo dõi camera
local function startFollowingHead()
    if not cameraFollowing then
        cameraFollowing = true
        originalCameraSubject = camera.CameraSubject
        camera.CameraSubject = head
    end
end

local function stopFollowingHead()
    if cameraFollowing then
        cameraFollowing = false
        camera.CameraSubject = originalCameraSubject
    end
end

-- Hàm vô hiệu hóa/kích hoạt di chuyển
local function disableMovement()
    humanoid.WalkSpeed = 0
    humanoid.JumpPower = 0
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
    
    -- Chặn input di chuyển
    if not movementConnection then
        movementConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.A or
               input.KeyCode == Enum.KeyCode.S or input.KeyCode == Enum.KeyCode.D or
               input.KeyCode == Enum.KeyCode.Space then
                -- Ngăn không cho di chuyển
            end
        end)
    end
end

local function enableMovement()
    humanoid.WalkSpeed = defaultWalkSpeed
    humanoid.JumpPower = defaultJumpPower
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
    
    -- Ngắt kết nối input
    if movementConnection then
        movementConnection:Disconnect()
        movementConnection = nil
    end
end

-- Hàm chính để chơi emote
local function playEmote(emoteName)
    if animator and animationObjects[emoteName] then
        -- Dừng emote hiện tại nếu có
        if isEmotePlaying then
            stopEmote()
        end
        
        isEmotePlaying = true
        currentEmote = emoteName
        
        -- Vô hiệu hóa di chuyển
        disableMovement()
        startFollowingHead()

        -- Tải và phát animation
        activeAnimationTrack = animator:LoadAnimation(animationObjects[emoteName])
        activeAnimationTrack:Play()
        
        -- Tạo và phát sound
        activeSound = soundObjects[emoteName]:Clone()
        activeSound.Parent = head
        activeSound:Play()

        -- Kết nối sự kiện khi animation kết thúc
        activeAnimationTrack.Stopped:Connect(function()
            if isEmotePlaying then
                stopEmote()
            end
        end)

        Rayfield:Notify({
            Title = "Started",
            Content = emoteName .. "!",
            Duration = 2,
            Image = "play"
        })
    end
end

-- Hàm dừng emote
local function stopEmote()
    if isEmotePlaying then
        if activeAnimationTrack then
            activeAnimationTrack:Stop()
            activeAnimationTrack = nil
        end
        if activeSound then
            activeSound:Stop()
            activeSound:Destroy()
            activeSound = nil
        end
        
        enableMovement()
        stopFollowingHead()
        isEmotePlaying = false
        
        Rayfield:Notify({
            Title = "Stopped",
            Content = currentEmote .. " has been stopped!",
            Duration = 2,
            Image = "stop"
        })
        
        currentEmote = ""
    end
end

-- Hàm toggle emote (dùng cho phím nhanh)
local function toggleEmote()
    if isEmotePlaying then
        stopEmote()
    else
        playEmote("HakariDance")
    end
end

-- Section chính cho emotes
local MainSection = Tab:CreateSection("Dance Emotes")

-- Nút cho Hakari Dance
local HakariButton = Tab:CreateButton({
   Name = "Hakari Dance",
   Callback = function()
      playEmote("HakariDance")
   end,
})

-- Nút cho Subterfuge
local SubterfugeButton = Tab:CreateButton({
   Name = "Subterfuge",
   Callback = function()
      playEmote("Subterfuge")
   end,
})

-- Nút cho Miss The Quiet
local MissTheQuietButton = Tab:CreateButton({
   Name = "Miss The Quiet",
   Callback = function()
      playEmote("MissTheQuiet")
   end,
})

-- Nút cho Shucks
local ShucksButton = Tab:CreateButton({
   Name = "Shucks",
   Callback = function()
      playEmote("Shucks")
   end,
})

-- Nút cho Silly Billy
local SillyBillyButton = Tab:CreateButton({
   Name = "Silly Billy",
   Callback = function()
      playEmote("SillyBilly")
   end,
})

-- Divider
Tab:CreateDivider()

-- Section điều khiển
local ControlSection = Tab:CreateSection("Controls")

-- Nút dừng tất cả emotes
local StopButton = Tab:CreateButton({
   Name = "Stop All Emotes",
   Callback = function()
      stopEmote()
   end,
})

-- Divider
Tab:CreateDivider()

-- Section cài đặt
local SettingsSection = Tab:CreateSection("Settings")

-- Toggle cho camera follow
local CameraToggle = Tab:CreateToggle({
   Name = "Camera Follow Head",
   CurrentValue = true,
   Flag = "CameraFollow",
   Callback = function(Value)
      if not Value and isEmotePlaying then
         stopFollowingHead()
      end
   end,
})

-- Slider cho âm lượng
local VolumeSlider = Tab:CreateSlider({
   Name = "Sound Volume",
   Range = {0, 10},
   Increment = 0.5,
   Suffix = "Level",
   CurrentValue = 2,
   Flag = "Volume",
   Callback = function(Value)
      for _, sound in pairs(soundObjects) do
          sound.Volume = Value
      end
   end,
})

-- Keybind để kích hoạt nhanh (toggle)
local EmoteKeybind = Tab:CreateKeybind({
   Name = "Quick Emote Key (Hakari)",
   CurrentKeybind = "`",
   HoldToInteract = false,
   Flag = "EmoteKeybind",
   Callback = function()
      toggleEmote()
   end,
})

-- Keybind để dừng emote (Space)
local StopKeybind = Tab:CreateKeybind({
   Name = "Stop Emote Key",
   CurrentKeybind = "Space",
   HoldToInteract = false,
   Flag = "StopKeybind",
   Callback = function()
      stopEmote()
   end,
})

-- Paragraph hướng dẫn
Tab:CreateParagraph({
    Title = "Instructions", 
    Content = "Press the Play button to start emote. The camera will automatically follow the character's head and movement is disabled during the emote. Use the ` key to turn the Hakari Dance emote on/off, the Space key to stop."
})

-- Label
local CreditLabel = Tab:CreateLabel("Made by: CongKa", "heart")

-- Biến cho kết nối input
local movementConnection = nil

-- Xử lý khi nhân vật respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    head = character:WaitForChild("Head")
    animator = humanoid:FindFirstChildOfClass("Animator") or humanoid:WaitForChild("Animator")
    
    -- Cập nhật giá trị mặc định
    defaultWalkSpeed = humanoid.WalkSpeed
    defaultJumpPower = humanoid.JumpPower
    
    -- Reset trạng thái emote
    isEmotePlaying = false
    activeAnimationTrack = nil
    activeSound = nil
    currentEmote = ""
    
    -- Ngắt kết nối input cũ
    if movementConnection then
        movementConnection:Disconnect()
        movementConnection = nil
    end
    
    -- Gắn lại sound objects vào head mới
    for _, sound in pairs(soundObjects) do
        sound.Parent = head
    end
end)

-- Xử lý khi script kết thúc
game:GetService("UserInputService").WindowFocused:Connect(function()
    if isEmotePlaying then
        disableMovement()
    end
end)

-- Tải cấu hình
Rayfield:LoadConfiguration()
