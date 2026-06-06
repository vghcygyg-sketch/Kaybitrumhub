local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer

pcall(function()
    CoreGui.NameDonUI:Destroy()
end)

local gui = Instance.new("ScreenGui")
gui.Name = "NameDonUI"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Position = UDim2.new(0.5,0,0.5,0)
frame.Size = UDim2.new(0,300,0,80)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.25
frame.BorderSizePixel = 3
frame.BorderColor3 = Color3.fromRGB(255,215,0)

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,0)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Color = Color3.fromRGB(255,215,0)
stroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,25)
title.BackgroundTransparency = 1
title.Text = "NAME ĐƠN"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,215,0)

local nameLabel = Instance.new("TextLabel")
nameLabel.Parent = frame
nameLabel.Position = UDim2.new(0,0,0,25)
nameLabel.Size = UDim2.new(1,0,1,-25)
nameLabel.BackgroundTransparency = 1
nameLabel.Font = Enum.Font.GothamBold
nameLabel.TextScaled = true
nameLabel.TextColor3 = Color3.fromRGB(255,255,255)

local function UpdateName()
	local name = player.Name

	if #name > 3 then
		nameLabel.Text = string.sub(name,1,3) .. "***"
	else
		nameLabel.Text = name
	end
end

UpdateName()

player:GetPropertyChangedSignal("Name"):Connect(UpdateName)
