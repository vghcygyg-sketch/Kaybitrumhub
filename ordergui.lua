local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local AccBox = Instance.new("TextBox")
local DonBox = Instance.new("TextBox")
local Button = Instance.new("TextButton")
local Label = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")

Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0,300,0,200)
Frame.Position = UDim2.new(0.5,-150,0.5,-100)
Frame.BackgroundColor3 = Color3.fromRGB(40,40,40)

AccBox.Parent = Frame
AccBox.Size = UDim2.new(0,260,0,35)
AccBox.Position = UDim2.new(0,20,0,20)
AccBox.PlaceholderText = "Tên Acc"

DonBox.Parent = Frame
DonBox.Size = UDim2.new(0,260,0,35)
DonBox.Position = UDim2.new(0,20,0,65)
DonBox.PlaceholderText = "Tên Đơn"

Button.Parent = Frame
Button.Size = UDim2.new(0,260,0,35)
Button.Position = UDim2.new(0,20,0,110)
Button.Text = "OK"

Label.Parent = Frame
Label.Size = UDim2.new(0,260,0,50)
Label.Position = UDim2.new(0,20,0,150)
Label.TextWrapped = true
Label.Text = ""

Button.MouseButton1Click:Connect(function()
    Label.Text = "ACC: "..AccBox.Text.."\nĐƠN: "..DonBox.Text
end)
