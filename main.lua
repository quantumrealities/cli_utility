local ContextActionService = game:GetService("ContextActionService")
local RunService = game:GetService("RunService")

local screenUI = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local base = Instance.new("Frame", screenUI)

local main = Instance.new("Frame", screenUI)
local input = Instance.new("TextBox", main)
local autofill = Instance.new("TextLabel", main)
local caret = Instance.new("TextLabel", main)
local mode = Instance.new("TextLabel", main)

local commands = Instance.new("Frame", input)
local container = Instance.new("ScrollingFrame", commands)
local containerLayout = Instance.new("UIListLayout", container)
local containerPadding = Instance.new("UIPadding", container)

local focusPrefix = Enum.KeyCode.Semicolon

--// styling
base.AnchorPoint = Vector2.new(0, 1)
base.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
base.BorderSizePixel = 0
base.Position = UDim2.new(0, 0, 1, 0)
base.Size = UDim2.new(1, 0, 0, 5)

main.AnchorPoint = Vector2.new(0, 1)
main.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
main.BackgroundTransparency = 0.5
main.Position = UDim2.new(0, 0, 1, -5)
main.Size = UDim2.new(1, 0, 0, 20)
main.ZIndex = 2

local inputTextConstraint = Instance.new("UITextSizeConstraint", input)
input.BackgroundTransparency = 1
input.Position = UDim2.new(0, 15, 0, 0)
input.Size = UDim2.new(0.985, -15, 1, 0)
input.ZIndex = 2
input.Font = Enum.Font.Gotham
input.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
input.PlaceholderText = "Enter a command"
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.TextSize = 12
input.TextTruncate = Enum.TextTruncate.AtEnd
input.TextXAlignment = Enum.TextXAlignment.Left
input.Text = ""

inputTextConstraint.MaxTextSize = 12

autofill.BackgroundTransparency = 1
autofill.Position = UDim2.new(0, 15, 0, 0)
autofill.Size = UDim2.new(0.985, -15, 1, 0)
autofill.Font = Enum.Font.GothamSemibold
autofill.TextColor3 = Color3.fromRGB(182, 182, 182)
autofill.TextSize = 12
autofill.TextXAlignment = Enum.TextXAlignment.Left
autofill.Text = ""

caret.BackgroundTransparency = 1
caret.Size = UDim2.new(0, 15, 1, 0)
caret.Font = Enum.Font.GothamSemibold
caret.Text = ">"
caret.TextColor3 = Color3.fromRGB(255, 255, 255)
caret.TextSize = 14
caret.ZIndex = 2

mode.AnchorPoint = Vector2.new(1, 0)
mode.BackgroundTransparency = 1
mode.Position = UDim2.new(1, 0, 0, 0)
mode.Size = UDim2.new(0.015, 0, 1, 0)
mode.ZIndex = 2
mode.Font = Enum.Font.GothamBlack
mode.Text = "C"
mode.TextColor3 = Color3.fromRGB(52, 174, 255)
mode.TextSize = 14

commands.Visible = false
commands.AnchorPoint = Vector2.new(0, 1)
commands.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
commands.BorderSizePixel = 0
commands.Size = UDim2.new(0.1, 0, 0, 155)

local containerLayout, containerPadding = Instance.new("UIListLayout", container), Instance.new("UIPadding", container)
container.AnchorPoint = Vector2.new(0, 1)
container.BackgroundTransparency = 1
container.Position = UDim2.new(0, 0, 1, 0)
container.Size = UDim2.new(1, 0, 1, -5)
container.AutomaticCanvasSize = Enum.AutomaticSize.Y
container.CanvasSize = UDim2.new(0, 0, 0, 0)
container.ScrollBarThickness = 10

containerLayout.Padding = UDim.new(0, 1)
containerLayout.SortOrder = Enum.SortOrder.Name
containerPadding.PaddingLeft = UDim.new(0, 5)

ContextActionService:BindAction("focusCmdBar",
	function()
		input:CaptureFocus()
		RunService.RenderStepped:Wait()
		input.Text = ""
	end,
	true,
	focusPrefix
)
