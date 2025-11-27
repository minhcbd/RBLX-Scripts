-- Dont know how to use? Watch tut here --> https://www.youtube.com/watch?v=nggVERw_BuU
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GodMode = false
local KillAll = false
local Library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/theneutral0ne/wally-modified/refs/heads/main/wally-modified.lua")))()
local Window = Library:CreateWindow('Credit: Neutral')
Window:Toggle("God Mode", {}, function(value)
    GodMode = value
end)
Window:Toggle("Kill All", {}, function(value)
    KillAll = value
    if KillAll then
        for _,v in workspace:GetChildren() do
            if v:GetAttribute("State") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                ReplicatedStorage.Packages["_Index"]["sleitnick_net@0.1.0"]["net"]["RF/Damage"]:InvokeServer(v,v.Humanoid.Health)
            end
        end
    end
end)

Character.Humanoid.HealthChanged:Connect(function()
    if GodMode then
        ReplicatedStorage.Packages["_Index"]["sleitnick_net@0.1.0"]["net"]["RE/Damage"]:FireServer(Character,-1)
    end
end)

LocalPlayer.CharacterAdded:Connect(function(Character)
    Character.Humanoid.HealthChanged:Connect(function()
        if GodMode then
            ReplicatedStorage.Packages["_Index"]["sleitnick_net@0.1.0"]["net"]["RE/Damage"]:FireServer(Character,-1)
        end
    end)
end)

workspace.ChildAdded:Connect(function(Child)
    task.wait(1)
    if KillAll and Child:GetAttribute("State") and Child:FindFirstChild("Humanoid") and Child.Humanoid.Health > 0 then
        ReplicatedStorage.Packages["_Index"]["sleitnick_net@0.1.0"]["net"]["RF/Damage"]:InvokeServer(Child,Child.Humanoid.Health)
    end
end)
