local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local player = Players.LocalPlayer

pcall(function()
	local old = CoreGui:FindFirstChild("NameDonUI")
	if old then
		old:Destroy()
	end
end)

local LAST_ACC_FILE = "LastAccount.txt"
local currentUserId = tostring(player.UserId)

if readfile and writefile and isfile and delfile then
	if isfile(LAST_ACC_FILE) then
		local lastUserId = readfile(LAST_ACC_FILE)

		if lastUserId ~= currentUserId then
			local oldFile = "NameDon_" .. lastUserId .. ".txt"

			if isfile(oldFile) then
				delfile(oldFile)
			end
		end
	end

	writefile(LAST_ACC_FILE, currentUserId)
end

local SAVE_FILE = "NameDon_" .. currentUserId .. ".txt"

local function SaveNameDon(text)
	if writefile then
		writefile(SAVE_FILE, text)
	end
end

local function LoadNameDon()
	if readfile and isfile and isfile(SAVE_FILE) then
		return readfile(SAVE_FILE)
	end
	return ""
end

local function HideName(name)
	if #name > 3 then
		return string.sub(name,1,3) .. "***"
	end
	return name
end

local gui = Instance.new("ScreenGui")
gui.Name = "NameDonUI"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.AnchorPoint = Vector2.new(0.5,0)
frame.Position = UDim2.new(0.5,0,0,10)
frame.Size = UDim2.new(0,260,0,65)
frame.BackgroundColor3 = Color3.fromRGB(15,15,15)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner")
corner.Parent = frame
corner.CornerRadius = UDim.new(0,8)

local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Color = Color3.fromRGB(255,215,0)
stroke.Thickness = 2

local icon = Instance.new("ImageLabel")
icon.Parent = frame
icon.BackgroundTransparency = 1
icon.Size = UDim2.new(0,30,0,30)
icon.Position = UDim2.new(0,10,0.5,-15)
icon.Image = "rbxassetid://6031094678"

local title = Instance.new("TextLabel")
title.Parent = frame
title.BackgroundTransparency = 1
title.Position = UDim2.new(0,45,0,2)
title.Size = UDim2.new(1,-80,0,20)
title.Text = "⚡ SHOP KAYBI"
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextColor3 = Color3.fromRGB(255,215,0)
title.TextXAlignment = Enum.TextXAlignment.Left

local edit = Instance.new("TextButton")
edit.Parent = frame
edit.Size = UDim2.new(0,25,0,25)
edit.Position = UDim2.new(1,-30,0,5)
edit.Text = "✏️"
edit.Font = Enum.Font.GothamBold
edit.TextSize = 14
edit.BackgroundTransparency = 1
edit.TextColor3 = Color3.fromRGB(255,215,0)

local textbox = Instance.new("TextBox")
textbox.Parent = frame
textbox.Size = UDim2.new(0,180,0,25)
textbox.Position = UDim2.new(0,45,0,22)
textbox.BackgroundColor3 = Color3.fromRGB(25,25,25)
textbox.TextColor3 = Color3.fromRGB(255,255,255)
textbox.PlaceholderText = "Nhập tên đơn..."
textbox.Text = LoadNameDon()
textbox.Font = Enum.Font.GothamBold
textbox.TextSize = 14

local boxCorner = Instance.new("UICorner")
boxCorner.Parent = textbox
boxCorner.CornerRadius = UDim.new(0,6)

local boxStroke = Instance.new("UIStroke")
boxStroke.Parent = textbox
boxStroke.Color = Color3.fromRGB(255,215,0)

local ok = Instance.new("TextButton")
ok.Parent = frame
ok.Size = UDim2.new(0,45,0,25)
ok.Position = UDim2.new(0,225,0,22)
ok.Text = "OK"
ok.Font = Enum.Font.GothamBold
ok.TextSize = 14
ok.BackgroundColor3 = Color3.fromRGB(255,215,0)
ok.TextColor3 = Color3.fromRGB(0,0,0)

local okCorner = Instance.new("UICorner")
okCorner.Parent = ok
okCorner.CornerRadius = UDim.new(0,6)

local result = Instance.new("TextLabel")
result.Parent = frame
result.BackgroundTransparency = 1
result.Position = UDim2.new(0,45,0,15)
result.Size = UDim2.new(1,-50,0,40)
result.Font = Enum.Font.GothamBold
result.TextSize = 15
result.TextColor3 = Color3.fromRGB(255,255,255)
result.TextWrapped = true
result.TextXAlignment = Enum.TextXAlignment.Left
result.Text = ""

local function ShowSaved()
	local tenDon = LoadNameDon()

	if tenDon ~= "" then
		result.Text = tenDon .. "\n" .. HideName(player.Name)

		title.Visible = false
		textbox.Visible = false
		ok.Visible = false
	end
end

ShowSaved()

ok.MouseButton1Click:Connect(function()
	local tenDon = textbox.Text

	if tenDon == "" then
		return
	end

	SaveNameDon(tenDon)

	result.Text = tenDon .. "\n" .. HideName(player.Name)

	title.Visible = false
	textbox.Visible = false
	ok.Visible = false
end)

edit.MouseButton1Click:Connect(function()
	title.Visible = true
	textbox.Visible = true
	ok.Visible = true
	textbox.Text = LoadNameDon()
	result.Text = ""
end)
