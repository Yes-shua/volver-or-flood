-- [[

Closed Source
Créditos: Josuel - Yes_shua - Yes-shua
Versão: Alfa 0.1

]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local ToggleGui = Instance.new("ScreenGui")
ToggleGui.Name = "ToggleGui_MS"
ToggleGui.Parent = game.CoreGui

local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = ToggleGui
Toggle.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
Toggle.BackgroundTransparency = 0.660
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0.0650164187, 0, 0.0888099447, 0)
Toggle.Font = Enum.Font.SourceSans
Toggle.Text = "MSender"
Toggle.TextScaled = true
Toggle.TextColor3 = Color3.fromRGB(40, 40, 40)
Toggle.TextSize = 24.000
Toggle.TextXAlignment = Enum.TextXAlignment.Left
Toggle.Active = true
Toggle.Draggable = true

Toggle.MouseButton1Click:Connect(function()
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/MyUILib(Unamed).lua"))();
    local Window = Library:Create("MSender")
    
    local frame = Window:Tab("Message", "rbxassetid://10888331510")
    
    frame:InfoLabel("Type a message and send it to all players.")
    
    frame:Section("Message Settings")
    
    local messageTextBox = frame:TextBox("Message", function(value)
        getgenv().message = value
    end)
    
    local quantityTextBox = frame:TextBox("Quantity", function(value)
        getgenv().quantity = tonumber(value) or 1
    end)
    
    local delayTextBox = frame:TextBox("Delay (s)", function(value)
        getgenv().delay = tonumber(value)
    end)
    
    local sendButton = frame:Button("Send Message", function()
        local message = getgenv().message or ""
        local quantity = getgenv().quantity or 1
        local delay = getgenv().delay
    
        for i = 1, quantity do
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
            wait(delay)
        end
    end)
    
    sendButton.MouseButton1Click:Connect(function()
        local message = messageTextBox.Text
        local quantity = tonumber(quantityTextBox.Text)
        local delay = tonumber(delayTextBox.Text)
    
        for i = 1, quantity do
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
            wait(delay)
        end
    end)
end)
