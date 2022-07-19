local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Novaware | Tapping Simulator", HidePremium = false, IntroText = "Novaware", SaveConfig = true, ConfigFolder = "NovawareConfigs"})

-- Values
_G.autoTap = true
_G.autoRebirth = true
_G.selectRebirth = "1"
_G.autoHatch = true
_G.selectEgg = {}


-- Fucntions
function autoTap()
    while _G.autoTap == true do
        game:GetService("ReplicatedStorage").Events.Tap:FireServer()
        wait(.000000000000000000000000000000000000000000000000000001)
    end
end

function  autoRebirth()
    while _G.autoRebirth == true do
        game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(_G.selectRebirth, 1)
        wait(.000000000000000000000000000000000000000000000000000001)
    end
end

function autoHatch()
    while _G.autoHatch == true do
        game:GetService("ReplicatedStorage").Events.HatchEgg:InvokeServer({},_G.selectEgg,1)
        wait (.0000000000000000000000000000000000000000000000000000000001)
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

-- toggles
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

-- Dropdowns
FarmTab:AddDropdown({
	Name = "Select Rebirth",
	Default = "1",
	Options = {"1", "5", "10", "20", "100", "500", "2000"},
	Callback = function(Value)
        _G.selectRebirth = Value
        print(_G.selectRebirth)
	end    
})

FarmTab:AddDropdown({
	Name = "Select Egg",
	Default = "Starter",
	Options = {"Starter", "Wood Egg", "Jungle Egg", "Forest Egg"},
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

FarmTab:AddToggle({
	Name = "Triple Open Egg",
	Default = false,
	Callback = function(Value)

	end    
})

-- buttons
MiscTab:AddButton({
	Name = "Get Gampasses",
	Callback = function()
        
  	end    
})

MiscTab:AddButton({
	Name = "Redeem Codes",
	Callback = function()
        
  	end    
})




OrionLib:Init()