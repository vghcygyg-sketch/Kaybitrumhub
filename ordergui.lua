local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = script.Parent

local function MaskName(name)
	return string.sub(name, 1, 3) .. "***"
end

local function Hover(btn)
	local normal = btn.Size

	btn.MouseEnter:Connect(function()
		TweenService:Create(
			btn,
			TweenInfo.new(0.15),
			{
				Size = UDim2.new(
					normal.X.Scale,
					normal.X.Offset + 5,
					normal.Y.Scale,
					normal.Y.Offset + 3
				)
			}
		):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(
			btn,
			TweenInfo.new(0.15),
			{Size = normal}
		):Play()
	end)
end

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,340,0,220)
frame.Position = UDim2.new(0.5,-170,0.5,-110)
frame.BackgroundColor3 = Color3.fromRGB(15,15,15)

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,14)

local frameStroke = Instance.new("UIStroke")
frameStroke.Parent = frame
frameStroke.Color = Color3.fromRGB(255,215,0)
frameStroke.Thickness = 3

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "⭐ ORDER HUB ⭐"
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,215,0)

local accBox = Instance.new("TextBox")
accBox.Parent = frame
accBox.Size = UDim2.new(0,300,0,40)
accBox.Position = UDim2.new(0,20,0,55)
accBox.PlaceholderText = "Tên Acc"
accBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
accBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", accBox)

local donBox = Instance.new("TextBox")
donBox.Parent = frame
donBox.Size = UDim2.new(0,300,0,40)
donBox.Position = UDim2.new(0,20,0,105)
donBox.PlaceholderText = "Tên Đơn"
donBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
donBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", donBox)

local btn = Instance.new("TextButton")
btn.Parent = frame
btn.Size = UDim2.new(0,140,0,40)
btn.Position = UDim2.new(0.5,-70,0,160)
btn.Text = "XÁC NHẬN"
btn.Font = Enum.Font.GothamBold
btn.BackgroundColor3 = Color3.fromRGB(255,215,0)
btn.TextColor3 = Color3.fromRGB(0,0,0)
Instance.new("UICorner", btn)

Hover(btn)

btn.MouseButton1Click:Connect(function()

	local acc = MaskName(accBox.Text)
	local don = donBox.Text

	frame:Destroy()

	local mini = Instance.new("Frame")
	mini.Parent = gui
	mini.Size = UDim2.new(0,320,0,140)
	mini.Position = UDim2.new(0.5,-160,0.5,-70)
	mini.BackgroundColor3 = Color3.fromRGB(15,15,15)

	Instance.new("UICorner", mini).CornerRadius = UDim.new(0,14)

	local miniStroke = Instance.new("UIStroke")
	miniStroke.Parent = mini
	miniStroke.Color = Color3.fromRGB(255,215,0)
	miniStroke.Thickness = 3

	local header = Instance.new("TextLabel")
	header.Parent = mini
	header.Size = UDim2.new(1,0,0,30)
	header.BackgroundTransparency = 1
	header.Text = "⭐ ORDER INFO ⭐"
	header.Font = Enum.Font.GothamBold
	header.TextScaled = true
	header.TextColor3 = Color3.fromRGB(255,215,0)

	local info = Instance.new("TextLabel")
	info.Parent = mini
	info.Size = UDim2.new(1,-10,0,70)
	info.Position = UDim2.new(0,5,0,30)
	info.BackgroundTransparency = 1
	info.Font = Enum.Font.GothamBold
	info.TextScaled = true
	info.TextColor3 = Color3.new(1,1,1)
	info.Text = "👤 "..acc.."\n📌 "..don

	local done = Instance.new("TextButton")
	done.Parent = mini
	done.Size = UDim2.new(0,90,0,28)
	done.Position = UDim2.new(0,10,1,-35)
	done.Text = "DONE"
	done.Font = Enum.Font.GothamBold
	done.TextColor3 = Color3.new(1,1,1)
	done.BackgroundColor3 = Color3.fromRGB(0,170,0)
	Instance.new("UICorner", done)

	local close = Instance.new("TextButton")
	close.Parent = mini
	close.Size = UDim2.new(0,22,0,22)
	close.Position = UDim2.new(1,-26,0,4)
	close.Text = "X"
	close.BackgroundTransparency = 1
	close.Font = Enum.Font.GothamBold
	close.TextColor3 = Color3.fromRGB(255,80,80)

	Hover(done)

	done.MouseButton1Click:Connect(function()

		info.Text =
			"👤 "..acc..
			"\n📌 "..don..
			"\n✅ Đơn đã hoàn thành"

		done.Text = "✓ DONE"
		done.BackgroundColor3 = Color3.fromRGB(70,70,70)
		done.Active = false

		task.wait(2)

		player:Kick("Đơn đã hoàn thành")
	end)

	close.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)

end)
