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
frame.Position = UDim2.new(0.5,0,0,60)
frame.Size = UDim2.new(0,420,0,140)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0

local stroke = Instance.new("UIStroke")
stroke.Parent = frame
stroke.Color = Color3.fromRGB(170,0,255)
stroke.Thickness = 3

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,35)
title.BackgroundTransparency = 1
title.Text = ""
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(255,215,0)

local textbox = Instance.new("TextBox")
textbox.Parent = frame
textbox.Size = UDim2.new(0.8,0,0,35)
textbox.Position = UDim2.new(0.1,0,0,45)
textbox.BackgroundColor3 = Color3.fromRGB(25,25,25)
textbox.TextColor3 = Color3.fromRGB(255,255,255)
textbox.PlaceholderText = "Nhập tên đơn..."
textbox.Text = LoadNameDon()
textbox.Font = Enum.Font.GothamBold
textbox.TextSize = 18

local boxStroke = Instance.new("UIStroke")
boxStroke.Parent = textbox
boxStroke.Color = Color3.fromRGB(255,215,0)

local ok = Instance.new("TextButton")
ok.Parent = frame
ok.Size = UDim2.new(0.35,0,0,30)
ok.Position = UDim2.new(0.325,0,0,88)
ok.Text = "OK"
ok.Font = Enum.Font.GothamBold
ok.TextSize = 18
ok.BackgroundColor3 = Color3.fromRGB(255,215,0)
ok.TextColor3 = Color3.fromRGB(0,0,0)

local result = Instance.new("TextLabel")
result.Parent = frame
result.Size = UDim2.new(1,0,0,85)
result.Position = UDim2.new(0,0,0,45)
result.BackgroundTransparency = 1
result.TextWrapped = true
result.Font = Enum.Font.GothamBold
result.TextSize = 28
result.TextColor3 = Color3.fromRGB(255,255,255)
result.Text = ""

local function ShowSaved()
	local tenDon = LoadNameDon()

	if tenDon ~= "" then
		result.Text = tenDon .. "\n" .. HideName(player.Name)
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

	textbox.Visible = false
	ok.Visible = false
end)
