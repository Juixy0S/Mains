local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Novaware | Tapping Legends X", HidePremium = false, IntroText = "Novaware", SaveConfig = true, ConfigFolder = "NovawareConfigs"})




-- Values
_G.autoTap = true
_G.autoHatch = true
_G.selectEgg = "Basic Egg"
_G.autoRebirth = true
_G.autoEquipBest = true
_G.autoBuyClickMulti = true
_G.autoBuyMoreRebirths = true
_G.autoBuyMorePetStorage = true




-- Functions

function autoBuyMorePetStorage()
    while _G.autoBuyMorePetStorage == true do
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer("Ruby","PetStorage")
        wait(.0000000000001)
    end
end

function autoBuyMoreRebirths()
    while _G.autoBuyMoreRebirths == true do
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer("Ruby","RebirthsUpgrade")
        wait(.0000000000001)
    end
end

function autoBuyClickMulti()
    while _G.autoBuyClickMulti == true do
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer("Ruby","TapMultiplier")
        wait(.0001)
    end
end

function autoTap()
    while _G.autoTap == true do
        game:GetService("ReplicatedStorage").Remotes.Tap:FireServer()
        wait(.000000000000000000000000000000000000000000000000000001)
    end
end

function autoRebirth()
    while _G.autoRebirth == true do
        game:GetService("ReplicatedStorage").Remotes.Rebirth:FireServer(1) -- Change the number in the () to the number of the current rebirth level your on
        wait (.0000000000000000000000000000000000000000000000000000000001)
    end
end


function autoHatch()
    while _G.autoHatch == true do
        game:GetService("ReplicatedStorage").Remotes.BuyEgg:InvokeServer(_G.selectEgg,1)
        wait (.0000000000000000000000000000000000000000000000000000000001)
    end
end

function equipBest()
        game:GetService("ReplicatedStorage").Remotes.UnequipAll:InvokeServer()
        game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
    end

function autoEquipBest()
    while _G.autoEquipBest == true do
        game:GetService("ReplicatedStorage").Remotes.UnequipAll:InvokeServer()
        game:GetService("ReplicatedStorage").Remotes.EquipBest:InvokeServer()
        wait(30)
    end
end


-- Tabs

local FarmTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local UpgradesTab = Window:MakeTab({
    Name = "Upgrades",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local TeleportTab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local PlayerTab = Window:MakeTab({
    Name = "Player",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})



-- Toggles

FarmTab:AddToggle({
	Name = "Auto Tap",
	Default = false,
	Callback = function(Value)
		_G.autoTap = Value
        autoTap()
	end    
})

FarmTab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		_G.autoRebirth = Value
        autoRebirth()
	end    
})

FarmTab:AddLabel("You need to be near the egg in order for AutoHatch to work.")

FarmTab:AddDropdown({
	Name = "Select Egg",
	Default = "Basic Egg",
	Options = {"Basic Egg", "Rare Egg", "Forest Egg", "Desert Egg", "Winter Egg", "Lava Egg", "Aqua Egg", "Mine Egg", "Galaxy Egg"},
	Callback = function(Value)
        _G.selectEgg = Value
        print(_G.selectEgg)
	end    
})

FarmTab:AddToggle({
	Name = "Auto Hatch",
	Default = false,
	Callback = function(Value)
        _G.autoHatch = Value
        autoHatch()
	end    
})

MiscTab:AddToggle({
	Name = "Auto Equip Best Pets",
	Default = false,
	Callback = function(Value)
        _G.autoEquipBest = Value
        autoEquipBest()
	end    
})

UpgradesTab:AddToggle({
	Name = "Auto Ruby Buy Tap Multiplyer",
	Default = false,
	Callback = function(Value)
        _G.autoBuyClickMulti = Value
        autoBuyClickMulti()
	end    
})

UpgradesTab:AddToggle({
	Name = "Auto Ruby Buy More Rebirths",
	Default = false,
	Callback = function(Value)
        _G.autoBuyMoreRebirths = Value
        autoBuyMoreRebirths()
	end    
})

UpgradesTab:AddToggle({
	Name = "Auto Ruby Buy More Pet Storage",
	Default = false,
	Callback = function(Value)
        _G.autoBuyMorePetStorage = Value
        autoBuyMorePetStorage()
	end    
})


-- Dropdowns

-- Buttons

MiscTab:AddButton({
	Name = "Equip Best Pets",
	Callback = function()
      		equipBest()
  	end    
})

MiscTab:AddButton({
	Name = "Get Gampasses",
	Callback = function()
      		
  	end    
})

MiscTab:AddButton({
	Name = "Headless",
	Callback = function()
      		
  	end    
})

UpgradesTab:AddButton({
	Name = "Buy Free Auto Clicker",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer("Ruby","FreeAutoClicker")
  	end    
})

UpgradesTab:AddButton({
	Name = "Buy Achievement Luck",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer("Ruby","AchievementLuck")
  	end    
})
UpgradesTab:AddButton({
	Name = "Buy ReEnchant",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.Upgrade:InvokeServer("Ruby","ReEnchant")
  	end    
})

SettingsTab:AddButton({
	Name = "Join Discord",
	Callback = function()
    
  	end    
})

SettingsTab:AddButton({
	Name = "Anti-AFK",
	Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:connect(function()
           vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
           wait(1)
           vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
  	end    
})

SettingsTab:AddButton({
	Name = "Destroy UI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})

TeleportTab:AddButton({
	Name = "Teleport To Spawn",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.TeleportToArea:FireServer(1)
        game:GetService("ReplicatedStorage").Remotes.EquipEquippedPets:FireServer(game:GetService("Players").LocalPlayer)
  	end    
})

TeleportTab:AddButton({
	Name = "Teleport To Forest",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.TeleportToArea:FireServer(2)
        game:GetService("ReplicatedStorage").Remotes.EquipEquippedPets:FireServer(game:GetService("Players").LocalPlayer)
  	end    
})


TeleportTab:AddButton({
	Name = "Teleport To Desert",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.TeleportToArea:FireServer(3)
        game:GetService("ReplicatedStorage").Remotes.EquipEquippedPets:FireServer(game:GetService("Players").LocalPlayer)
  	end    
})


TeleportTab:AddButton({
	Name = "Teleport To Winter",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.TeleportToArea:FireServer(4)
        game:GetService("ReplicatedStorage").Remotes.EquipEquippedPets:FireServer(game:GetService("Players").LocalPlayer)
  	end    
})

TeleportTab:AddButton({
	Name = "Teleport To Lava",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.TeleportToArea:FireServer(5)
        game:GetService("ReplicatedStorage").Remotes.EquipEquippedPets:FireServer(game:GetService("Players").LocalPlayer)
  	end    
})

TeleportTab:AddButton({
	Name = "Teleport To Aqua",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.TeleportToArea:FireServer(6)
        game:GetService("ReplicatedStorage").Remotes.EquipEquippedPets:FireServer(game:GetService("Players").LocalPlayer)
  	end    
})

TeleportTab:AddButton({
	Name = "Teleport To Sakura",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.TeleportToArea:FireServer(7)
        game:GetService("ReplicatedStorage").Remotes.EquipEquippedPets:FireServer(game:GetService("Players").LocalPlayer)
  	end    
})

TeleportTab:AddButton({
	Name = "Teleport To Mines",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.TeleportToArea:FireServer(8)
        game:GetService("ReplicatedStorage").Remotes.EquipEquippedPets:FireServer(game:GetService("Players").LocalPlayer)
  	end    
})

TeleportTab:AddButton({
	Name = "Teleport To Galaxy",
	Callback = function()
        game:GetService("ReplicatedStorage").Remotes.TeleportToArea:FireServer(9)
        game:GetService("ReplicatedStorage").Remotes.EquipEquippedPets:FireServer(game:GetService("Players").LocalPlayer)
  	end    
})


SettingsTab:AddLabel("Need Support? discord.gg/UBZ8dyZ6Ew")
SettingsTab:AddLabel("Made By: Juixy")
-- Slider
PlayerTab:AddSlider({
	Name = "Walkspeed",
	Min = 0,
	Max = 250,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(s)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
	end    
})
PlayerTab:AddSlider({
	Name = "Jump Height",
	Min = 0,
	Max = 250,
	Default = 45,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(vs)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = vs
	end    
})





OrionLib:Init()