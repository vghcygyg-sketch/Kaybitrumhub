local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

pcall(function()
	local old = CoreGui:FindFirstChild("NameDonUI")
	if old then
		old:Destroy()
	end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "NameDonUI"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

-- Khung nhập tên đơn
local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,280,0,140)
frame.Position = UDim2.new(0.5,-140,0.5,-70)
frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0,10)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(255,215,0)
stroke.Thickness = 2

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.Text = "NAME ĐƠN"
title.TextColor3 = Color3.fromRGB(255,215,0)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local box = Instance.new("TextBox")
box.Parent = frame
box.Size = UDim2.new(0.85,0,0,35)
box.Position = UDim2.new(0.075,0,0,45)
box.BackgroundColor3 = Color3.fromRGB(25,25,25)
box.TextColor3 = Color3.fromRGB(255,255,255)
box.PlaceholderText = "Nhập tên đơn..."
box.Font = Enum.Font.Gotham
box.TextScaled = true

local boxCorner = Instance.new("UICorner", box)
boxCorner.CornerRadius = UDim.new(0,8)

local ok = Instance.new("TextButton")
ok.Parent = frame
ok.Size = UDim2.new(0.4,0,0,30)
ok.Position = UDim2.new(0.3,0,0,95)
ok.BackgroundColor3 = Color3.fromRGB(255,215,0)
ok.Text = "OK"
ok.TextColor3 = Color3.fromRGB(0,0,0)
ok.Font = Enum.Font.GothamBold
ok.TextScaled = true

local okCorner = Instance.new("UICorner", ok)
okCorner.CornerRadius = UDim.new(0,8)

-- Hiển thị phía trên giữa màn hình
local display = Instance.new("Frame")
display.Parent = gui
display.Size = UDim2.new(0,220,0,55)
display.Position = UDim2.new(0.5,-110,0,10)
display.BackgroundColor3 = Color3.fromRGB(15,15,15)
display.BackgroundTransparency = 0.15
display.Visible = false
display.BorderSizePixel = 0

local displayCorner = Instance.new("UICorner", display)
displayCorner.CornerRadius = UDim.new(0,8)

local displayStroke = Instance.new("UIStroke", display)
displayStroke.Color = Color3.fromRGB(255,215,0)
displayStroke.Thickness = 1.5

local label = Instance.new("TextLabel")
label.Parent = display
label.Size = UDim2.new(1,0,1,0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255,255,255)
label.Font = Enum.Font.GothamBold
label.TextScaled = true

ok.MouseButton1Click:Connect(function()
	local don = box.Text
	if don == "" then
		don = "Chưa nhập"
	end

	local acc = string.sub(player.Name,1,3) .. "***"

	label.Text = "Đơn: "..don.."\nAcc: "..acc

	frame.Visible = false
	display.Visible = true
end)
