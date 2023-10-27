
repeat wait() until game:IsLoaded()
task.wait(1)
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local VIM = game:GetService("VirtualInputManager")


local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3",HidePremium = false,SaveConfig = false,ConfigFolder = "TurtleFi"})

function Attack()
    VirtualUser:CaptureController()
    wait()
    VirtualUser:Button1Down(Vector2.new(1280, 672))
end

local function rconsolenotify(str1,str2,str3,str4)
OrionLib:MakeNotification({Name = str1,Content = str2,Image = "rbxassetid://" .. str3,Time = str4})
end

if game.PlaceId == 10515146389 then
    local Main = Window:MakeTab({Name = "Main",Icon = "rbxassetid://",PremiumOnly = false})
    -- local Dungeon = Main_sec:Section("Dungeon")

    Main:AddToggle({Name = "Chest Farm",Default = false,Callback = function(Value)
        Auto_Chest = Value
    end})

    spawn(function()
        while task.wait() do
            if Auto_Chest then
                pcall(function()
                    for i,v in pairs(game:GetService("Workspace").Chests:GetDescendants()) do
                        if v:IsA("ProximityPrompt") then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                            task.wait(.1)
                            fireproximityprompt(v)
                            task.wait(.5)
                        end
                    end
                end)
            end
        end
    end)

    -- local Dungeons = {}
    -- for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Party.Main.AllStuffFrame.CreateMenu.SelectDungeon.Frame:GetChildren()) do
    --     if v:IsA("Frame") and v.Name ~= "DungeonTemplate" then
    --         table.insert(Dungeons, v.Name)
    --     end
    -- end

    -- if game:GetService("Players").LocalPlayer.PlayerGui.Party.Main.AllStuffFrame:FindFirstChild("Back") then
    --     game:GetService("Players").LocalPlayer.PlayerGui.Party.Main.AllStuffFrame.Back:Destroy()
    -- end

    -- Dungeon:Dropdown("Dungeon", Dungeons, function(t)
    --     Selected_Dungeon = t
    -- end)

    -- local Mode = {
    --     'Easy',
    --     'Medium',
    --     'Hard',
    --     'Hell',
    --     'Hardcore',
    --     'Infinite'
    -- }

    -- Dungeon:Dropdown("Mode", Mode, function(t)
    --     Selected_Mode = t
    -- end)

    -- Dungeon:Toggle("Private", function(t)
    --     Is_Private = t
    -- end)

    -- Dungeon:Button("Play", function()
    --     local ohString1 = Selected_Dungeon
    --     local ohString2 = Selected_Mode
    --     local ohString3
    --     if Is_Private then
    --         ohString3 = "Private"
    --     else
    --         ohString3 = "All"
    --     end

    --     local ohString4 = "Normal"

    --     game:GetService("ReplicatedStorage").ReplicatedStorage.Packages.Knit.Services.PartyService.RF.CreateParty:InvokeServer(ohString1, ohString2, ohString3, ohString4)
    --     task.wait(.8)
    --     local ohString1 = game:GetService('HttpService'):GenerateGUID(false)

    --     game:GetService("ReplicatedStorage").ReplicatedStorage.Packages.Knit.Services.PartyService.RF.StartParty:InvokeServer(ohString1)
    -- end)

else

local Main = Window:MakeTab({Name = "Main",Icon = "rbxassetid://",PremiumOnly = false})
local Other = Window:MakeTab({Name = "Misc",Icon = "rbxassetid://",PremiumOnly = false})

Main:AddToggle({Name = "TP Farm",Default = false,Callback = function(t)
    Tp_Farm = t
end})

Main:AddToggle({Name = "Element Farm",Default = false,Callback = function(t)
    Element_Farm = t
    if not Tp_Farm then
        rconsolenotify("TH","You must Enable TP Farming!","",5)
    end
end})

Main:AddToggle({Name = "Bring Mobs",Default = false,Callback = function(t)
    Bring_Mobs = t
end})

Main:AddToggle({Name = "Hit Aura",Default = false,Callback = function(t)
    StartFarm = t
end})

Main:AddToggle({Name = "Auto Collect Drops",Default = false,Callback = function(t)
    Auto_Collect_Drops = t
end})

Main:AddToggle({Name = "Collect Potions",Default = false,Callback = function(t)
    Auto_Get_Potions = t
end})

Main:AddToggle({Name = "Auto Heal",Default = false,Callback = function(t)
    Auto_Heal = t
end})

Main:AddToggle({Name = "Auto Chest",Default = false,Callback = function(t)
    Auto_Chest = t
end})

spawn(function()
    while task.wait() do
        if Auto_Chest then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Chests:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                        task.wait(.1)
                        fireproximityprompt(v)
                        task.wait(.5)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", math.huge)
            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
        end)
    end
end)

Other:AddToggle({Name = "Auto Retry",Default = false,Callback = function(t)
    Auto_Retry = t
end})
Other:AddToggle({Name = "Auto Start",Default = false,Callback = function(t)
    Auto_Start = t
end})

spawn(function()
    while task.wait() do
        if Auto_Retry then
            pcall(function()
                if game:GetService("Players").LocalPlayer.PlayerGui.DungeonComplete.Main.Frame.Visible then
                    game:GetService("ReplicatedStorage").ReplicatedStorage.Packages.Knit.Services.PartyService.RF.VoteOn:InvokeServer("Retry")
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if Auto_Start then
            pcall(function()
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.StartBtn.Visible then
                    game:GetService("ReplicatedStorage").ReplicatedStorage.Packages.Knit.Services.DungeonService.RF.StartDungeon:InvokeServer()
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if Auto_Collect_Drops then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Camera.Drops:GetDescendants()) do
                    if v:IsA("ProximityPrompt") then
                        fireproximityprompt(v)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if Auto_Get_Potions then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Camera.Drops:GetChildren()) do
                    if v:FindFirstChild("Potion") then
                        fireproximityprompt(v.Center.ProximityPrompt)
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if Auto_Heal then
            pcall(function()
                if game.Players.LocalPlayer.Character.Humanoid.Health <= game.Players.LocalPlayer.Character.Humanoid.MaxHealth/2 then
                    game:GetService("ReplicatedStorage").ReplicatedStorage.Packages.Knit.Services.HealingService.RF.UseHeal:InvokeServer()
                    task.wait(.5)
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if StartFarm then
            pcall(function()
                local ohTable1 = {
                    ["Direction"] = nil,
                    ["Position"] = nil,
                    ["Origin"] = nil
                }
                game:GetService("ReplicatedStorage").ReplicatedStorage.Packages.Knit.Services.WeaponService.RF.UseSword:InvokeServer(ohTable1)
                if Element_Farm then
                    for i = 1,2 do
                        for i,v in pairs(game:GetService("ReplicatedStorage").ReplicatedStorage.Abilities.Elements.Lightning:GetChildren()) do
                            local ohInstance1 = game:GetService("ReplicatedStorage").ReplicatedStorage.Abilities.Elements.Lightning[v.Name]
                            local ohPosition1 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                            local ohTable2 = {
                                ["Direction"] = nil,
                                ["Position"] = nil,
                                ["Origin"] = nil
                            }
                            local ohString3 = "Start"

                            game:GetService("ReplicatedStorage").ReplicatedStorage.Abilities.Templates.ToolTemplate.RemoteEvent:FireServer(ohInstance1, ohTable2, ohString3)
                        end
                      end
                end
            end)
        end
    end
end)

local Allowed = true
spawn(function()
    while task.wait() do
        if Tp_Farm then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v and v.Parent then
                        PosMon = v.HumanoidRootPart.CFrame
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.BossHealthBars:FindFirstChild("HealthBar") then
                            Allowed = false
                            local Boss_Name = game:GetService("Players").LocalPlayer.PlayerGui.Main.BossHealthBars.HealthBar.BossName.Text
                            if game:GetService("Workspace").Mobs[Boss_Name].HumanoidRootPart:FindFirstChild("Immune") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Mobs[Boss_Name].HumanoidRootPart.CFrame * CFrame.new(0, 20, 30)
                            else
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Mobs[Boss_Name].HumanoidRootPart.CFrame * CFrame.new(0, 8, 5)
                            end
                        else
                            Allowed = true
                        end

                        if Allowed then
                            if v.HumanoidRootPart:FindFirstChild("Immune") then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 20, 30)
                            else
                                if Element_Farm then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0)
                                else
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                                end
                                    -- v.HitPart.Size = Vector3.new(5, 5, 5)
                            end
                        end
                        -- v.Humanoid.WalkSpeed = 0
                        -- if v.Humanoid:FindFirstChild("Animator") then
                        --     v.Humanoid.Animator:Destroy()
                        -- end
                    end
                end
            end)
        end
    end
end)

spawn(function()
    while task.wait() do
        if Bring_Mobs then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
                        if v.Humanoid.Health > 0 then
                            if Allowed then
                                if (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 50 then
                                    v.HumanoidRootPart.CFrame = PosMon
                                    v.HumanoidRootPart.CanCollide = false
                                    -- v.HumanoidRootPart.Size = Vector3.new(5,5,5)
                                end
                            end
                    end
                end
                task.wait()
            end)
        end
    end
end)
end
