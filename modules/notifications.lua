local notificationUI = {}

function notificationUI:Create()
    local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    local base: ImageLabel = Instance.new("ImageLabel", screenGui)
    local info: Frame = Instance.new("Frame", base)
    local color: Frame = Instance.new("Frame", base)
    local icon: ImageLabel = Instance.new("ImageLabel", base)
    base.AnchorPoint = UDim.new(0.5, 0)
    base.BackgroundTransparency = 1
    base.Position = UDim2.new(0.5, 0, -0.26, 0)
    base.Size = UDim2.new(0.2, 0, 0.13, 0)
    base.Image = "rbxassetid://3570695787"
    base.ImageColor3 = Color3(47, 47, 47)
    base.ScaleType = Enum.ScaleType.Slice
    base.SliceCenter = UDim2.new(100, 100, 100, 100)
    base.SliceScale = 0.1


end