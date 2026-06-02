local CoreGui = game:GetService("CoreGui")

pcall(function()
    CoreGui.OrderHub:Destroy()
end)

local gui = Instance.new("ScreenGui")
gui.Name = "OrderHub"
gui.ResetOnSpawn = false
gui.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,320,0,190)
frame.Position = UDim2.new(0.5,-160,0.5,-95)
frame.BackgroundColor3 = Color3.fromRGB(15,15,15)

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0,12)
frameCorner.Parent = frame

local frameStroke = Instance.new("UIStroke")
frameStroke.Parent = frame
frameStroke.Color = Color3.fromRGB(255,215,0)
frameStroke.Thickness = 3

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,35)
title.BackgroundTransparency = 1
title.Text = "⭐ ORDER HUB ⭐"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,215,0)
title.TextScaled = true

local accBox = Instance.new("TextBox")
accBox.Parent = frame
accBox.Size = UDim2.new(0,280,0,40)
accBox.Position = UDim2.new(0,20,0,50)
accBox.PlaceholderText = "Tên Acc"
accBox.Text = ""
accBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
accBox.TextColor3 = Color3.new(1,1,1)

local accCorner = Instance.new("UICorner")
accCorner.Parent = accBox

local donBox = Instance.new("TextBox")
donBox.Parent = frame
donBox.Size = UDim2.new(0,280,0,40)
donBox.Position = UDim2.new(0,20,0,100)
donBox.PlaceholderText = "Tên Đơn"
donBox.Text = ""
donBox.BackgroundColor3 = Color3.fromRGB(30,30,30)
donBox.TextColor3 = Color3.new(1,1,1)

local donCorner = Instance.new("UICorner")
donCorner.Parent = donBox

local btn = Instance.new("TextButton")
btn.Parent = frame
btn.Size = UDim2.new(0,120,0,35)
btn.Position = UDim2.new(0.5,-60,0,150)
btn.Text = "OK"
btn.BackgroundColor3 = Color3.fromRGB(255,215,0)
btn.TextColor3 = Color3.fromRGB(0,0,0)

local btnCorner = Instance.new("UICorner")
btnCorner.Parent = btn

btn.MouseButton1Click:Connect(function()

    local accRaw = accBox.Text
    local don = donBox.Text

    local acc
    if #accRaw > 3 then
        acc = string.sub(accRaw,1,3) .. "***"
    else
        acc = accRaw .. "***"
    end

    frame:Destroy()

    local mini = Instance.new("Frame")
    mini.Parent = gui
    mini.Size = UDim2.new(0,280,0,110)
    mini.Position = UDim2.new(1,-300,0,20)
    mini.BackgroundColor3 = Color3.fromRGB(15,15,15)

    local miniCorner = Instance.new("UICorner")
    miniCorner.Parent = mini
    miniCorner.CornerRadius = UDim.new(0,12)

    local miniStroke = Instance.new("UIStroke")
    miniStroke.Parent = mini
    miniStroke.Color = Color3.fromRGB(255,215,0)
    miniStroke.Thickness = 3

    local header = Instance.new("TextLabel")
    header.Parent = mini
    header.Size = UDim2.new(1,0,0,25)
    header.BackgroundTransparency = 1
    header.Text = "⭐ ORDER INFO ⭐"
    header.Font = Enum.Font.GothamBold
    header.TextScaled = true
    header.TextColor3 = Color3.fromRGB(255,215,0)

    local info = Instance.new("TextLabel")
    info.Parent = mini
    info.Size = UDim2.new(1,-10,0,35)
    info.Position = UDim2.new(0,5,0,25)
    info.BackgroundTransparency = 1
    info.TextColor3 = Color3.new(1,1,1)
    info.Font = Enum.Font.GothamBold
    info.TextScaled = false
    info.Textsize = 14
    info.TextWrapped
    info.Text = "👤 " .. acc .. "\n📌 " .. don

    local close = Instance.new("TextButton")
    close.Parent = mini
    close.Size = UDim2.new(0,20,0,20)
    close.Position = UDim2.new(1,-25,0,3)
    close.Text = "X"
    close.BackgroundTransparency = 1
    close.TextColor3 = Color3.fromRGB(255,80,80)

    close.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
    local done = Instance.new("TextButton")
    done.Parent = mini
    done.Size = UDim2.new(0,80,0,25)
    done.Position = UDim2.new(0.5,-40,0,70)
    done.BackgroundColor3 =         Color3.fromRGB(0,200,0)
    done.TextColor3 = Color3.new(1,1,1)
    done.Font = Enum.Font.GothamBold
    done.TextScaled = true
    done.Text = "DONE"

    local doneCorner =    Instance.new("UICorner")
    doneCorner.Parent = done

    done.MouseButton1Click:Connect(function()
    done.Text = "HOÀN THÀNH ✓"
    done.Active = false

    task.wait(3)

       game:GetService("Players").LocalPlayer:Kick("Đơn hàng đã hoàn thành")
     end)
end)
