_G.autotap = true
_G.autorebirth = true
_G.autoopen = true
_G.egg = 0

function open(ValueEgg)
	while _G.autoopen == true do

		local args = {
    		[1] = ValueEgg
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
        game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()
        wait(0)
    end
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Punch Simulator", HidePremium = false, SaveConfig = false, ConfigFolder = "5iveSelf Scripts"})

local Tab = Window:MakeTab({
	Name = "AutoFarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Main"
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
	Name = "Stage",
	Default = "0",
	Options = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"},
	Callback = function(ValueEgg)
		_G.egg = ValueEgg
	end    
})

Tab:AddToggle({
	Name = "Start Open",
	Default = false,
	Callback = function(bool)
		_G.autoopen = bool
        if bool then
           open(_G.egg)
        end
    end
})

Tab:AddLabel("<u>Made by @Amkoine</u>")

local Tab = Window:MakeTab({
    Name = "Fun",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddSlider({
    Name = "Speed",
    Min = 25,
    Max = 10000,
    Default = 25,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "speed",
    Callback = function(Value)
        speed(Value)
    end    
})
