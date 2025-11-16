-- Hecho por Siuuuuu19880
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local square = Instance.new("Part")
square.Size = Vector3.new(4,4,4)
square.Position = Vector3.new(0, 5, 0)
square.Anchored = false
square.Color = Color3.fromRGB(0, 200, 120)
square.Name = "CuadradoMovible"
square.Parent = workspace

local gui = Instance.new("ScreenGui")
gui.Name = "MenuTeleportGui"
gui.Parent = player:WaitForChild("PlayerGui")

local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 80, 0, 36)
openButton.Position = UDim2.new(0, 20, 0, 20)
openButton.BackgroundColor3 = Color3.fromRGB(40,40,40)
openButton.Text = "Menú"
openButton.TextColor3 = Color3.new(1,1,1)
openButton.TextScaled = true
openButton.Parent = gui
Instance.new("UICorner", openButton).CornerRadius = UDim.new(0,10)

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 230)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true
frame.Visible = false
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,18)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(35,35,35)
title.Text = "Hecho por Siuuuuu19880"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Parent = frame
Instance.new("UICorner", title).CornerRadius = UDim.new(0,12)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 34, 0, 26)
closeButton.Position = UDim2.new(1, -36, 0, 2)
closeButton.Text = "✖"
closeButton.TextScaled = true
closeButton.BackgroundColor3 = Color3.fromRGB(200,50,50)
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Parent = frame
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0,8)

local codeBox = Instance.new("TextBox")
codeBox.Size = UDim2.new(0, 200, 0, 36)
codeBox.Position = UDim2.new(0, 30, 0, 50)
codeBox.PlaceholderText = "Escribe el código"
codeBox.BackgroundColor3 = Color3.fromRGB(240,240,240)
codeBox.TextColor3 = Color3.new(0,0,0)
codeBox.TextScaled = true
codeBox.Parent = frame
Instance.new("UICorner", codeBox).CornerRadius = UDim.new(0,10)

local saveButton = Instance.new("TextButton")
saveButton.Size = UDim2.new(0, 160, 0, 36)
saveButton.Position = UDim2.new(0, 50, 0, 100)
saveButton.Text = "Salvar posición"
saveButton.BackgroundColor3 = Color3.fromRGB(0,120,255)
saveButton.TextColor3 = Color3.new(1,1,1)
saveButton.TextScaled = true
saveButton.Visible = false
saveButton.Parent = frame
Instance.new("UICorner", saveButton).CornerRadius = UDim.new(0,12)

local tpButton = Instance.new("TextButton")
tpButton.Size = UDim2.new(0, 160, 0, 36)
tpButton.Position = UDim2.new(0, 50, 0, 142)
tpButton.Text = "Teletransportar"
tpButton.BackgroundColor3 = Color3.fromRGB(255,120,0)
tpButton.TextColor3 = Color3.new(1,1,1)
tpButton.TextScaled = true
tpButton.Visible = false
tpButton.Parent = frame
Instance.new("UICorner", tpButton).CornerRadius = UDim.new(0,12)

local noclipButton = Instance.new("TextButton")
noclipButton.Size = UDim2.new(0, 160, 0, 36)
noclipButton.Position = UDim2.new(0, 50, 0, 184)
noclipButton.Text = "Noclip OFF"
noclipButton.BackgroundColor3 = Color3.fromRGB(150,150,150)
noclipButton.TextColor3 = Color3.new(1,1,1)
noclipButton.TextScaled = true
noclipButton.Visible = false
noclipButton.Parent = frame
Instance.new("UICorner", noclipButton).CornerRadius = UDim.new(0,12)

local savedMsg = Instance.new("TextLabel")
savedMsg.Size = UDim2.new(0, 210, 0, 44)
savedMsg.Position = UDim2.new(0.5, -105, 0.12, 0)
savedMsg.Text = "Posición salvada"
savedMsg.BackgroundColor3 = Color3.fromRGB(40,40,40)
savedMsg.TextColor3 = Color3.fromRGB(0,255,0)
savedMsg.TextScaled = true
savedMsg.Visible = false
savedMsg.Parent = gui
Instance.new("UICorner", savedMsg).CornerRadius = UDim.new(0,14)

local codigoCorrecto = "Yahia"
local acceso = false

codeBox.FocusLost:Connect(function()
    if codeBox.Text == codigoCorrecto then
        acceso = true
        codeBox.Text = "✔ Correcto"
        codeBox.BackgroundColor3 = Color3.fromRGB(120,255,120)
        saveButton.Visible = true
        tpButton.Visible = true
        noclipButton.Visible = true
    else
        acceso = false
        codeBox.Text = "✘ Incorrecto"
        codeBox.BackgroundColor3 = Color3.fromRGB(255,120,120)
        saveButton.Visible = false
        tpButton.Visible = false
        noclipButton.Visible = false
    end
end)

local savedPosition = nil
saveButton.MouseButton1Click:Connect(function()
    if not acceso then return end
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        savedPosition = root.Position
        savedMsg.Visible = true
        task.delay(2,function() savedMsg.Visible = false end)
    end
end)

tpButton.MouseButton1Click:Connect(function()
    if not acceso then return end
    if savedPosition then
        local char = player.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = CFrame.new(savedPosition)
        end
    end
end)

local noclipActive = false
local noclipConnection = nil

local function toggleNoclip()
    noclipActive = not noclipActive
    if noclipActive then
        noclipButton.Text = "Noclip ON"
        noclipButton.BackgroundColor3 = Color3.fromRGB(0,200,255)
        noclipConnection = RunService.Stepped:Connect(function()
            local char = player.Character
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end)
    else
        noclipButton.Text = "Noclip OFF"
        noclipButton.BackgroundColor3 = Color3.fromRGB(150,150,150)
        if noclipConnection then noclipConnection:Disconnect() noclipConnection = nil end
        local char = player.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = true end
            end
        end
    end
end

noclipButton.MouseButton1Click:Connect(function()
    if not acceso then return end
    toggleNoclip()
end)

openButton.MouseButton1Click:Connect(function() frame.Visible = true end)
closeButton.MouseButton1Click:Connect(function() frame.Visible = false end)
