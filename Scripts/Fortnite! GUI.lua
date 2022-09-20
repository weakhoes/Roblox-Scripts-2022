--Working
--loadstring(game:HttpGet("https://raw.githubusercontent.com/KryptoOnn/Update/main/Scripts/Fortnite!%20GUI.lua"))()

local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera

getgenv().TeamCheck = false
getgenv().Line_Size = 2
getgenv().Line = false
getgenv().Name_esp = false



local skins = {}
if game:GetService("ReplicatedStorage").Modules.Skins then
    local skin = require(game:GetService("ReplicatedStorage").Modules.Skins)
    skins = {}
    for key, _ in pairs(skin) do
        table.insert(skins,key)
    end
end


for i, v in pairs(game.Players:GetPlayers()) do
    -- tracer
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1, 0, 0)
    Tracer.Thickness = getgenv().Line_Size
    Tracer.Transparency = 1

    -- name eps
    local nameText = Drawing.new("Text")
    nameText.Text = tostring(v.DisplayName)
    nameText.Size = 5
    nameText.Center = true
    nameText.Outline = true
    nameText.Color = Color3.new(0.149019, 1, 0)
    nameText.OutlineColor = Color3.new(0, 0, 0)
    nameText.Font = 1

    function lineEsp()
        game:GetService("RunService").RenderStepped:Connect(
            function()
                if v.Character and v ~= lplr and v.Character.Humanoid.Health > 0 then
                    local Vector, OnScreen = camera:WorldToViewportPoint(v.Character.Head.Position)
                    local Distance = (camera.CFrame.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if OnScreen then
                        Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                        Tracer.To = Vector2.new(Vector.X, Vector.Y)
                        nameText.Position = Vector2.new(Vector.X, Vector.Y)
                        if getgenv().TeamCheck and v.TeamColor ~= lplr.TeamColor then
                            Tracer.Visible = false
                            nameText.Visible = false
                        else
                            if getgenv().Line then
                                Tracer.Visible = true
                                Tracer.Thickness = getgenv().Line_Size
                                Tracer.Color = v.TeamColor.Color
                            else
                                Tracer.Visible = false
                            end
                            if getgenv().Name_esp then
                                nameText.Visible = true
                            else
                                nameText.Visible = false
                            end
                            
                            
                            nameText.Color = Color3.fromHSV(math.clamp(Distance / 5, 0, 125) / 255, 0.75, 1)
                            nameText.Size = math.clamp(30 - Distance / 10, 20, 30)
                            nameText.Text = string.format("[%s sd] [%s]", tostring(math.floor(Distance)), v.DisplayName)
                        end
                    else
                        Tracer.Visible = false
                        nameText.Visible = false
                    end
                else
                    Tracer.Visible = false
                    nameText.Visible = false
                end
            end
        )
    end
    coroutine.wrap(lineEsp)()
end

game.Players.PlayerAdded:Connect(
    function(v)
            -- tracer
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1, 0, 0)
    Tracer.Thickness = getgenv().Line_Size
    Tracer.Transparency = 1

    -- name eps
    local nameText = Drawing.new("Text")
    nameText.Text = tostring(v.DisplayName)
    nameText.Size = 5
    nameText.Center = true
    nameText.Outline = true
    nameText.Color = Color3.new(0.149019, 1, 0)
    nameText.OutlineColor = Color3.new(0, 0, 0)
    nameText.Font = 1

    function lineEsp()
        game:GetService("RunService").RenderStepped:Connect(
            function()
                if v.Character and v ~= lplr and v.Character.Humanoid.Health > 0 then
                    local Vector, OnScreen = camera:WorldToViewportPoint(v.Character.Head.Position)
                    local Distance = (camera.CFrame.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if OnScreen then
                        Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
                        Tracer.To = Vector2.new(Vector.X, Vector.Y)
                        nameText.Position = Vector2.new(Vector.X, Vector.Y)
                        if getgenv().TeamCheck and v.TeamColor ~= lplr.TeamColor then
                            Tracer.Visible = false
                            nameText.Visible = false
                        else
                            if getgenv().Line then
                                Tracer.Visible = true
                                Tracer.Thickness = getgenv().Line_Size
                                Tracer.Color = v.TeamColor.Color
                            else
                                Tracer.Visible = false
                            end
                            if getgenv().Name_esp then
                                nameText.Visible = true
                            else
                                nameText.Visible = false
                            end
                            
                            
                            nameText.Color = Color3.fromHSV(math.clamp(Distance / 5, 0, 125) / 255, 0.75, 1)
                            nameText.Size = math.clamp(30 - Distance / 10, 20, 30)
                            nameText.Text = string.format("[%s sd] [%s]", tostring(math.floor(Distance)), v.DisplayName)
                        end
                    else
                        Tracer.Visible = false
                        nameText.Visible = false
                    end
                else
                    Tracer.Visible = false
                    nameText.Visible = false
                end
            end
        )
    end
    coroutine.wrap(lineEsp)()
    end
)


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name), HidePremium = false, SaveConfig = false})

local Tab = Window:MakeTab({
        Name = "Visual",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
})

local AimTab = Window:MakeTab({
    Name = "Aim",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Tab2 = Window:MakeTab({
    Name = "Customize",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Mic = Window:MakeTab({
    Name = "Mic",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


function ctrl_teleport()
    local player = game:GetService("Players").LocalPlayer
    local UIS = game:GetService("UserInputService")
    local Mouse = player:GetMouse()

    local deb = false
    local opos = player.Character.HumanoidRootPart.CFrame

    local OldIndex = nil

    OldIndex =
        hookmetamethod(
        game,
        "__index",
        function(Self, Key)
            if
                not checkcaller() and self == "HumanoidRootPart" and self.Parent == player.Character and key == "CFrame" and
                    deb
             then
                return opos
            end
            return OldIndex(Self, Key)
        end
    )

    local function tp(newpos)
        if player.Character ~= nil and player.Character:FindFirstChild("HumanoidRootPart") ~= nil then
            opos = player.Character.HumanoidRootPart.CFrame
            deb = true
            player.Character.HumanoidRootPart.CFrame = CFrame.new(newpos)
            deb = false
        end
    end

    UIS.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
                if (Mouse.Hit.p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 900 then
                    tp(Mouse.Hit.p + Vector3.new(0, 3, 0))
                end
            end
        end
    )
end


Mic:AddButton({
	Name = "Click Ctrl Teleport!",
	Callback = function()
      		ctrl_teleport()
  	end    
})


function SendNote(message : string, time)
    OrionLib:MakeNotification({
        Name = "Title!",
        Content = message,
        Image = "rbxassetid://4483345998",
        Time = time or 3
    })
end


Tab2:AddDropdown({
	Name = "Select skin",
	Default = "IDK",
	Options = skins,
	Callback = function(Value)
        game:GetService("ReplicatedStorage").Remotes.Skin:FireServer(Value)
        SendNote("Skin my not show up until you join/deploy!")
	end    
})






Tab:AddToggle({
        Name = "TeamCheck",
        Default = getgenv().TeamCheck,
        Callback = function(Value)
                getgenv().TeamCheck = Value
        end
})


Tab:AddToggle({
    Name = "Show name",
    Default = getgenv().Name_esp,
    Callback = function(Value)
            getgenv().Name_esp = Value
    end    
})

Tab:AddToggle({
        Name = "Tracers",
        Default = getgenv().Line,
        Callback = function(Value)
                getgenv().Line = Value
        end    
})



AimTab:AddColorpicker({
	Name = "Fov Color",
	Default = Color3.fromRGB(255, 0, 68),
	Callback = function(Value)
		getgenv().fov_color = Value
	end	  
})


local Line_Size = Tab:AddSlider({
    Name = "Line Size",
    Min = 0.5,
    Max = 16,
    Default = 1.2,
    Color = Color3.fromRGB(255, 0, 123),
    Increment = 1,
    Callback = function(Value)
        getgenv().Line_Size = Value
    end
})



getgenv().SilentAim = {
    Enabled = false,
    FOVRep = true,
    TeamCheck = false,
    VisibleCheck = false,
    FOV = 150,
    HitChance = 100,
}

getgenv().sile_loaded = false
AimTab:AddToggle({
	Name = "Silent aim",
	Default = getgenv().SilentAim.Enabled,
	Callback = function(Value)
		getgenv().SilentAim.Enabled = Value
        
        if getgenv().sile_loaded == false and Value == true then
            getgenv().sile_loaded = true
            SendNote("Press -C- to teleport to target!",10)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/skatbr/Roblox-Releases/main/Battle_Royale_Simulator_Silent_Aim.lua", true))()
        end
	end    
})


AimTab:AddToggle({
	Name = "Visible Check",
	Default = getgenv().SilentAim.VisibleCheck,
	Callback = function(Value)
		getgenv().SilentAim.VisibleCheck = Value
	end    
})


AimTab:AddSlider({
    Name = "Fov",
    Min = 10,
    Max = 300,
    Default = getgenv().SilentAim.FOV,
    Color = Color3.fromRGB(0, 170, 255),
    Increment = 1,
    Callback = function(Value)
        getgenv().SilentAim.FOV = Value
    end
})

AimTab:AddSlider({
    Name = "Hit Chance",
    Min = 0,
    Max = 100,
    Default = getgenv().SilentAim.HitChance,
    Color = Color3.fromRGB(255, 251, 0),
    Increment = 1,
    Callback = function(Value)
        getgenv().SilentAim.HitChance = Value
    end
})




local orionion = game:GetService("CoreGui"):FindFirstChild("Orion")

local destroygui = Tab:AddButton({
    Name = "Destroy GUI",
    Callback = function()
        orionion:Destroy()
        OrionLib:Destroy()
        
        wait(1)
        
        OrionLib:MakeNotification({
            Name = "Removing GUI...",
            Content = "GUI is removed!",
            Time = 3
        })
    end    
})



OrionLib:Init()
