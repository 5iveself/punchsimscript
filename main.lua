_G.autotap = true
_G.autorebirth = true
_G.autoopen = true

function eggs(Value)
	while _G.autoopen == true do
		local args = {
    		[1] = Value
		}
		game:GetService("ReplicatedStorage").Events.PlayerPressedKeyOnEgg:FireServer(unpack(args))
		wait(0)
	end
end


function speed(Value)
    local plyr = game.Players.LocalPlayer
    if plyr.Character then
        plyr.Character.Humanoid.WalkSpeed = Value
    end
end

function autorebirth()
    while _G.autorebirth == true do
        local args = {
            [1] = true
        }
        game:GetService("ReplicatedStorage").Events.AscendEvent:FireServer(unpack(args))
        wait(0)
    end
end

function autofarm()
    while _G.autotap == true do
        game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer();
        wait(0);
    end
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Punch Simulator", HidePremium = false, SaveConfig = true, ConfigFolder = "5iveSelf Scripts"})

local Tab = Window:MakeTab({
	Name = "Autofarm",
	Icon = "rbxassetid://10586142459",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "AutoFarm",
	Default = false,
	Callback = function(bool)
		_G.autotap = bool
        if bool then
            autofarm()
        end
    end
	  
})

Tab:AddToggle({
	Name = "AutoRebirth",
	Default = false,
	Callback = function(bool)
		_G.autorebirth = bool
        if bool then
            autorebirth()
        end
	end
})

local Section = Tab:AddSection({
	Name = "AutoOpen"
})

Tab:AddDropdown({
	Name = "Enter the egg stage number",
	Default = "None",
	Options = {" ", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"},
	Callback = function(Value)
		eggs(Value)
	end    
})

Tab:AddLabel("Made by 5iveSelf")

local Tab = Window:MakeTab({
	Name = "Fun",
	Icon = "rbxassetid://4700049612",
	PremiumOnly = false
})

Tab:AddSlider({
	Name = "Speed",
	Min = 0,
	Max = 10000,
	Default = 25,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "speed",
	Callback = function(Value)
		speed(Value)
	end    
})

OrionLib:Init()
