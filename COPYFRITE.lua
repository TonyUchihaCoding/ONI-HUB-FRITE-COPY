-- // Rewrite by FRITE for mobile support FRITE IS GAy
-- // Services
local CoreGui = game:GetService('CoreGui')
local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')
local RunService = game:GetService('RunService')
local TextService = game:GetService('TextService')
local Players = game:GetService('Players')
local HttpService = game:GetService('HttpService')

-- // Variables
getgenv().kms = false
local Ihatethisui = {}
local UIName = 'FRITE HUB (base on onihub)'
local Amount = 0
local ConfigF
local BreakAllLoops = false
local ChangeTheme = false
local NotificationTransparency = 0
local Utility = {}
local Library = {}
local Config = {}
local ConfigUpdates = {}
local Themes = {
    ['Default'] = {
        BackgroundColor = Color3.fromRGB(25, 25, 25),
        SidebarColor = Color3.fromRGB(30, 30, 30),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(60, 60, 60),
        PrimaryElementColor = Color3.fromRGB(30, 30, 30),
        SecondaryElementColor = Color3.fromRGB(50, 50, 50),
        OtherElementColor = Color3.fromRGB(25, 25, 25),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(40, 40, 40),
        NotificationColor = Color3.fromRGB(25, 25, 25),
        NotificationUIStrokeColor = Color3.fromRGB(125, 125, 125)
    },
    ['Lighter'] = {
        BackgroundColor = Color3.fromRGB(40, 40, 40),
        SidebarColor = Color3.fromRGB(45, 45, 45),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(80, 80, 80),
        PrimaryElementColor = Color3.fromRGB(45, 45, 45),
        SecondaryElementColor = Color3.fromRGB(65, 65, 65),
        OtherElementColor = Color3.fromRGB(40, 40, 40),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(60, 60, 60),
        NotificationColor = Color3.fromRGB(40, 40, 40),
        NotificationUIStrokeColor = Color3.fromRGB(125, 125, 125)
    },
    ['Light'] = {
        BackgroundColor = Color3.fromRGB(255, 255, 255),
        SidebarColor = Color3.fromRGB(200, 200, 200),
        PrimaryTextColor = Color3.fromRGB(0, 0, 0),
        SecondaryTextColor = Color3.fromRGB(75, 75, 75),
        UIStrokeColor = Color3.fromRGB(0, 0, 0),
        PrimaryElementColor = Color3.fromRGB(200, 200, 200),
        SecondaryElementColor = Color3.fromRGB(150, 150, 150),
        OtherElementColor = Color3.fromRGB(255, 255, 255),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(200, 200, 200),
        NotificationColor = Color3.fromRGB(255, 255, 255),
        NotificationUIStrokeColor = Color3.fromRGB(0, 0, 0)
    },
    ['Light+'] = {
        BackgroundColor = Color3.fromRGB(255, 255, 255),
        SidebarColor = Color3.fromRGB(255, 255, 255),
        PrimaryTextColor = Color3.fromRGB(0, 0, 0),
        SecondaryTextColor = Color3.fromRGB(75, 75, 75),
        UIStrokeColor = Color3.fromRGB(0, 0, 0),
        PrimaryElementColor = Color3.fromRGB(255, 255, 255),
        SecondaryElementColor = Color3.fromRGB(200, 200, 200),
        OtherElementColor = Color3.fromRGB(255, 255, 255),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(255, 255, 255),
        NotificationColor = Color3.fromRGB(255, 255, 255),
        NotificationUIStrokeColor = Color3.fromRGB(0, 0, 0)
    },
    ['Discord'] = {
        BackgroundColor = Color3.fromRGB(54, 57, 63),
        SidebarColor = Color3.fromRGB(44, 49, 54),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(110, 110, 115),
        UIStrokeColor = Color3.fromRGB(75, 75, 75),
        PrimaryElementColor = Color3.fromRGB(48, 52, 57),
        SecondaryElementColor = Color3.fromRGB(59, 65, 72),
        OtherElementColor = Color3.fromRGB(54, 57, 63),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(74, 77, 83),
        NotificationColor = Color3.fromRGB(54, 57, 63),
        NotificationUIStrokeColor = Color3.fromRGB(75, 75, 75)
    },
    ['Red And Black'] = {
        BackgroundColor = Color3.fromRGB(0, 0, 0),
        SidebarColor = Color3.fromRGB(0, 0, 0),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(255, 0, 0),
        PrimaryElementColor = Color3.fromRGB(34, 31, 31),
        SecondaryElementColor = Color3.fromRGB(50, 50, 50),
        OtherElementColor = Color3.fromRGB(25, 25, 25),
        ScrollBarColor = Color3.fromRGB(255, 0, 0),
        PromptColor = Color3.fromRGB(40, 40, 40),
        NotificationColor = Color3.fromRGB(255, 0, 0),
        NotificationUIStrokeColor = Color3.fromRGB(255, 0, 0)
    },
    ['Nordic Dark'] = {
        BackgroundColor = Color3.fromRGB(25, 30, 35),
        SidebarColor = Color3.fromRGB(20, 25, 30),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(50, 60, 70),
        PrimaryElementColor = Color3.fromRGB(30, 35, 40),
        SecondaryElementColor = Color3.fromRGB(50, 55, 60),
        OtherElementColor = Color3.fromRGB(25, 30, 35),
        ScrollBarColor = Color3.fromRGB(100, 105, 110),
        PromptColor = Color3.fromRGB(45, 50, 55),
        NotificationColor = Color3.fromRGB(25, 30, 35),
        NotificationUIStrokeColor = Color3.fromRGB(50, 60, 70)
    },
    ['Nordic Light'] = {
        BackgroundColor = Color3.fromRGB(67, 75, 94),
        SidebarColor = Color3.fromRGB(62, 67, 86),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(92, 97, 116),
        PrimaryElementColor = Color3.fromRGB(62, 67, 86),
        SecondaryElementColor = Color3.fromRGB(82, 87, 106),
        OtherElementColor = Color3.fromRGB(67, 75, 94),
        ScrollBarColor = Color3.fromRGB(100, 105, 110),
        PromptColor = Color3.fromRGB(62, 67, 86),
        NotificationColor = Color3.fromRGB(67, 75, 94),
        NotificationUIStrokeColor = Color3.fromRGB(67, 75, 94)
    },
    ['Purple'] = {
        BackgroundColor = Color3.fromRGB(30, 30, 45),
        SidebarColor = Color3.fromRGB(40, 40, 60),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(60, 60, 80),
        PrimaryElementColor = Color3.fromRGB(40, 40, 60),
        SecondaryElementColor = Color3.fromRGB(60, 60, 80),
        OtherElementColor = Color3.fromRGB(30, 30, 45),
        ScrollBarColor = Color3.fromRGB(100, 105, 110),
        PromptColor = Color3.fromRGB(50, 50, 65),
        NotificationColor = Color3.fromRGB(30, 30, 45),
        NotificationUIStrokeColor = Color3.fromRGB(60, 60, 80)
    },
    ['Sentinel'] = {
        BackgroundColor = Color3.fromRGB(30, 30, 30),
        SidebarColor = Color3.fromRGB(25, 25, 25),
        PrimaryTextColor = Color3.fromRGB(130, 190, 130),
        SecondaryTextColor = Color3.fromRGB(230, 35, 70),
        UIStrokeColor = Color3.fromRGB(50, 50, 50),
        PrimaryElementColor = Color3.fromRGB(25, 25, 25),
        SecondaryElementColor = Color3.fromRGB(35, 35, 35),
        OtherElementColor = Color3.fromRGB(30, 30, 30),
        ScrollBarColor = Color3.fromRGB(70, 70, 70),
        PromptColor = Color3.fromRGB(50, 50, 50),
        NotificationColor = Color3.fromRGB(30, 30, 30),
        NotificationUIStrokeColor = Color3.fromRGB(50, 50, 50)
    },
    ['Synapse X'] = {
        BackgroundColor = Color3.fromRGB(50, 50, 50),
        SidebarColor = Color3.fromRGB(50, 50, 50),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(125, 125, 125),
        UIStrokeColor = Color3.fromRGB(70, 70, 70),
        PrimaryElementColor = Color3.fromRGB(60, 60, 60),
        SecondaryElementColor = Color3.fromRGB(80, 80, 80),
        OtherElementColor = Color3.fromRGB(50, 50, 50),
        ScrollBarColor = Color3.fromRGB(70, 70, 70),
        PromptColor = Color3.fromRGB(70, 70, 70),
        NotificationColor = Color3.fromRGB(50, 50, 50),
        NotificationUIStrokeColor = Color3.fromRGB(70, 70, 70)
    },
    ['Krnl'] = {
        BackgroundColor = Color3.fromRGB(40, 40, 40),
        SidebarColor = Color3.fromRGB(30, 30, 30),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(125, 125, 125),
        UIStrokeColor = Color3.fromRGB(60, 60, 60),
        PrimaryElementColor = Color3.fromRGB(30, 30, 30),
        SecondaryElementColor = Color3.fromRGB(40, 40, 40),
        OtherElementColor = Color3.fromRGB(40, 40, 40),
        ScrollBarColor = Color3.fromRGB(60, 60, 60),
        PromptColor = Color3.fromRGB(60, 60, 60),
        NotificationColor = Color3.fromRGB(40, 40, 40),
        NotificationUIStrokeColor = Color3.fromRGB(60, 60, 60)
    },
    ['Script-Ware'] = {
        BackgroundColor = Color3.fromRGB(30, 30, 30),
        SidebarColor = Color3.fromRGB(35, 35, 35),
        PrimaryTextColor = Color3.fromRGB(0, 125, 255),
        SecondaryTextColor = Color3.fromRGB(255, 255, 255),
        UIStrokeColor = Color3.fromRGB(50, 50, 50),
        PrimaryElementColor = Color3.fromRGB(35, 35, 35),
        SecondaryElementColor = Color3.fromRGB(45, 45, 45),
        OtherElementColor = Color3.fromRGB(30, 30, 30),
        ScrollBarColor = Color3.fromRGB(50, 50, 50),
        PromptColor = Color3.fromRGB(50, 50, 50),
        NotificationColor = Color3.fromRGB(30, 30, 30),
        NotificationUIStrokeColor = Color3.fromRGB(50, 50, 50)
    },
    ['Kiriot'] = {
        BackgroundColor = Color3.fromRGB(35, 35, 35),
        SidebarColor = Color3.fromRGB(30, 30, 30),
        PrimaryTextColor = Color3.fromRGB(255, 255, 255),
        SecondaryTextColor = Color3.fromRGB(135, 135, 135),
        UIStrokeColor = Color3.fromRGB(255, 170, 60),
        PrimaryElementColor = Color3.fromRGB(30, 30, 30),
        SecondaryElementColor = Color3.fromRGB(50, 50, 50),
        OtherElementColor = Color3.fromRGB(25, 25, 25),
        ScrollBarColor = Color3.fromRGB(125, 125, 125),
        PromptColor = Color3.fromRGB(40, 40, 40),
        NotificationColor = Color3.fromRGB(25, 25, 25),
        NotificationUIStrokeColor = Color3.fromRGB(255, 170, 60)
    }
}

local function IsMobile()
    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

local function GetUIScale()
    return IsMobile() and 0.8 or 1
end

-- // Utility Functions
do
    function Utility:Tween(Instance, Properties, Duration, ...)
        local TweenInfo = TweenInfo.new(Duration, ...)
        TweenService:Create(Instance, TweenInfo, Properties):Play()
    end

    function Utility:DestroyUI()
        ChangeTheme = true
        BreakAllLoops = true
        writefile('fml.txt', 'true')
        for Index, Value in next, Ihatethisui do
            print(Index, Value)
            Ihatethisui[Index]:Break()
        end
        if CoreGui:FindFirstChild(UIName) ~= nil then
            CoreGui:FindFirstChild(UIName):Destroy()
        end
    end

    function Utility:Darken(Color)
        local H, S, V = Color:ToHSV()

        V = math.clamp(V - 0.03, 0, 1)

        return Color3.fromHSV(H, S, V)
    end

    function Utility:Lighten(Color)
        local H, S, V = Color:ToHSV()

        V = math.clamp(V + 0.03, 0, 1)

        return Color3.fromHSV(H, S, V)
    end

    function Utility:SplitColor(Color)
        local R, G, B = math.floor(Color.R * 255), math.floor(Color.G * 255), math.floor(Color.B * 255)
        return {R, G, B}
    end

    function Utility:JoinColor(Table)
        local R, G, B = Table[1], Table[2], Table[3]
        return Color3.fromRGB(R, G, B)
    end

    function Utility:ToggleUI()
        if CoreGui:FindFirstChild(UIName) ~= nil then
            CoreGui:FindFirstChild(UIName).Enabled = not CoreGui:FindFirstChild(UIName).Enabled
        end
    end

    function Utility:EnableDragging(Frame)
        local Dragging, DraggingInput, DragStart, StartPosition
        
        local function Update(Input)
            local Delta = Input.Position - DragStart
            Frame.Position = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
        end
        
        Frame.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = Input.Position
                StartPosition = Frame.Position
        
                Input.Changed:Connect(function()
                    if Input.UserInputState == Enum.UserInputState.End then
                        Dragging = false
                    end
                end)
            end
        end)
        
        Frame.InputChanged:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
                DraggingInput = Input
            end
        end)
        
        UserInputService.InputChanged:Connect(function(Input)
            if Input == DraggingInput and Dragging then
                Update(Input)
            end
        end)
    end

    function Utility:BindClick(GuiObject, Callback)
        local Callback = Callback or function() end

        if GuiObject:IsA('GuiButton') and not UserInputService.TouchEnabled then
            GuiObject.MouseButton1Click:Connect(function()
                task.spawn(function()
                    pcall(Callback)
                end)
            end)
        end

        GuiObject.InputBegan:Connect(function(Input)
            if Input.UserInputType ~= Enum.UserInputType.Touch then
                return
            end

            local startPos = Input.Position
            local startTime = os.clock()
            local moved = false
            local moveThreshold = 14
            local timeThreshold = 0.45

            local changedConn, endedConn
            changedConn = UserInputService.InputChanged:Connect(function(Changed)
                if Changed ~= Input then
                    return
                end

                local delta = Changed.Position - startPos
                if (math.abs(delta.X) > moveThreshold) or (math.abs(delta.Y) > moveThreshold) then
                    moved = true
                end
            end)

            endedConn = UserInputService.InputEnded:Connect(function(Ended)
                if Ended ~= Input then
                    return
                end

                if changedConn then
                    changedConn:Disconnect()
                end
                if endedConn then
                    endedConn:Disconnect()
                end

                local elapsed = os.clock() - startTime
                local delta = Ended.Position - startPos
                local isTap = (not moved)
                    and (elapsed <= timeThreshold)
                    and (math.abs(delta.X) <= moveThreshold)
                    and (math.abs(delta.Y) <= moveThreshold)

                if isTap then
                    task.spawn(function()
                        pcall(Callback)
                    end)
                end
            end)
        end)
    end

    function Utility:Create(_Instance, Properties, Children)
        local Object = Instance.new(_Instance)
        local Properties = Properties or {}
        local Children = Children or {}
        
        for Index, Property in next, Properties do
            Object[Index] = Property
        end

        for _, Child in next, Children do
            Child.Parent = Object
        end

        return Object
    end

    function Library:CreateNotification(Title, Text, Duration)
        local Theme = {}
        local File = readfile('VisualUILibraryCurrentTheme.json')
        local Table = HttpService:JSONDecode(File)
        for Index, Value in next, Table do
            Theme[Index] = Utility:JoinColor(Value)
        end

        task.spawn(function()
            local Title = Title or 'Title'
            local Text = Text or 'Text'
            local Duration = Duration or 5

            if not CoreGui:FindFirstChild('FRITE HUB | Notifications') then
                Utility:Create('ScreenGui', {
                    Name = 'FRITE HUB | Notifications',
                    Parent = CoreGui
                })
            else
                Utility:Create('Frame', {
                    Parent = CoreGui:FindFirstChild('FRITE HUB | Notifications'),
                    Name = 'Notification'..tostring(Amount + 1),
                    BackgroundColor3 = Theme.BackgroundColor,
                    BorderSizePixel = 0,
                    Position = UDim2.new(1, 300, 1, -30),
                    Size = UDim2.new(0, 300, 0, 50),
                    BackgroundTransparency = NotificationTransparency,
                    AnchorPoint = Vector2.new(1, 1)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = 'NotificationCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = 'NotificationStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.NotificationUIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = 'NotificationTitle',
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, -1),
                        Size = UDim2.new(0, 300, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Title,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Utility:Create('UIPadding', {
                            Name = 'NotificationTitlePadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    }),
                    Utility:Create('TextLabel', {
                        Name = 'NotificationText',
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 25),
                        Size = UDim2.new(0, 300, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Text,
                        TextWrapped = true,
                        TextColor3 = Theme.SecondaryTextColor,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Utility:Create('UIPadding', {
                            Name = 'NotificationTextPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    })
                })

                Amount = Amount + 1
                local Holder = CoreGui:FindFirstChild('FRITE HUB | Notifications')['Notification'..tostring(Amount)]
                local TitleObj = Holder['NotificationTitle']
                local TextObj = Holder['NotificationText']
                local TextSize = TextService:GetTextSize(Text, 14, Enum.Font.Gotham, Vector2.new(300, math.huge))
                Holder.Size = UDim2.new(0, 300, 0, TextSize.Y + 30)
                TextObj.Size = UDim2.new(0, 300, 0, TextSize.Y)
                if Amount > 1 then
                    local PreviousSizes = 0
                    for _, Notification in next, Holder.Parent:GetChildren() do
                        if Notification ~= Holder.Parent['Notification'..tostring(Amount)] then
                            local AbsoluteY = Notification.AbsoluteSize.Y + 5
                            PreviousSizes = PreviousSizes + AbsoluteY
                        end
                    end
                    Holder.Position = UDim2.new(1, 300, 1, -30 - PreviousSizes)
                    Utility:Tween(Holder, {Position = UDim2.new(1, -30, 1, -30 - PreviousSizes)}, 0.5)
                else
                    Utility:Tween(Holder, {Position = UDim2.new(1, -30, 1, -30)}, 0.5)
                end
                task.wait(Duration - 1)
                Utility:Tween(Holder, {BackgroundTransparency = 0.8}, 0.25)
                Utility:Tween(TitleObj, {TextTransparency = 0.5}, 0.25)
                Utility:Tween(TextObj, {TextTransparency = 0.5}, 0.25)
                task.wait(0.5)
                Utility:Tween(Holder, {Position = UDim2.new(1, 300, 1, Holder.Position.Y.Offset)}, 0.5)
                task.wait(0.5)
                Holder:Destroy()
                Amount = Amount - 1
            end
        end)
    end

    function Library:CreatePrompt(Type, Title, Text, ...)
        local Title = Title or 'Title'
        local Text = Text or 'Text'

        for _, Item in next, CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder'):GetChildren() do
            if Item:IsA('Frame') then
                Item:Destroy()
            end
        end

        local Theme = {}
        local File = readfile('VisualUILibraryCurrentTheme.json')
        local Table = HttpService:JSONDecode(File)
        for Index, Value in next, Table do
            Theme[Index] = Utility:JoinColor(Value)
        end

        if Type == 'Text' then
            local ButtonText = ...
            Utility:Create('Frame', {
                Name = Title..'PromptFrame',
                Parent = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder'),
                BackgroundColor3 = Theme.PromptColor,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BorderSizePixel = 0,
                ZIndex = 101,
                BackgroundTransparency = NotificationTransparency,
                Size = UDim2.new(0, 0, 0, 0)
            }, {
                Utility:Create('UICorner', {
                    Name = Title..'PromptFrameCorner',
                    CornerRadius = UDim.new(0, 100)
                }),
                Utility:Create('UIStroke', {
                    Name = Title..'PromptFrameStroke',
                    ApplyStrokeMode = 'Contextual',
                    Color = Theme.UIStrokeColor,
                    LineJoinMode = 'Round',
                    Thickness = 1
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptTitle',
                    TextTransparency = 1,
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 5),
                    Size = UDim2.new(0, 0, 0, 20),
                    Font = Enum.Font.Gotham,
                    Text = Title,
                    TextColor3 = Theme.PrimaryTextColor,
                    TextSize = 20,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptText',
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 26),
                    Size = UDim2.new(0, 280, 0, 77),
                    Font = Enum.Font.Gotham,
                    Text = Text,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextSize = 15,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextButton', {
                    Name = Title..'Button',
                    BackgroundColor3 = Theme.SecondaryElementColor,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Text = ButtonText,
                    Font = Enum.Font.Gotham,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Position = UDim2.new(0, 10, 0, 110),
                    Size = UDim2.new(0, 280, 0, 30),
                    BorderSizePixel = 0,
                    TextSize = 15,
                    ZIndex = 103,
                    Visible = true,
                    AutoButtonColor = false
                }, {
                    Utility:Create('UIStroke', {
                        Name = Title..'ButtonStroke',
                        ApplyStrokeMode = 'Border',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 0
                    }),
                    Utility:Create('UICorner', {
                        Name = Title..'ButtonCorner',
                        CornerRadius = UDim.new(0, 5)
                    })
                })
            })

            local PromptHolder = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder')
            local PromptFrame = PromptHolder[Title..'PromptFrame']
            local PromptFrameCorner = PromptFrame[Title..'PromptFrameCorner']
            local Button = PromptFrame[Title..'Button']
            local ButtonStroke = Button[Title..'ButtonStroke']
            local PromptText = PromptFrame[Title..'PromptText']
            local PromptTitle = PromptFrame[Title..'PromptTitle']

            local TitleTextSize = TextService:GetTextSize(Title, 20, Enum.Font.Gotham, Vector2.new(280, 0))
            
            Utility:Tween(PromptTitle, {Size = UDim2.new(0, TitleTextSize.X, 0, TitleTextSize.Y)}, 0.25)

            Utility:Tween(PromptHolder, {BackgroundTransparency = 0.1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptFrame, {BackgroundTransparency = NotificationTransparency}, 0.25)
            Utility:Tween(PromptFrame, {Size = UDim2.new(0, 300, 0, 150)}, 0.25)
            Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 5)}, 0.25)
            task.wait(0.25)
            Utility:Tween(ButtonStroke, {Thickness = 1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptText, {TextTransparency = 0}, 0.25)
            Utility:Tween(PromptTitle, {TextTransparency = 0}, 0.25)
            Utility:Tween(Button, {BackgroundTransparency = 0}, 0.25)
            Utility:Tween(Button, {TextTransparency = 0}, 0.25)

            Button.MouseEnter:Connect(function(Input)
                Utility:Tween(Button, {TextColor3 = Utility:Lighten(Theme.PrimaryTextColor)}, 0.25)
            end)

            Button.MouseLeave:Connect(function(Input)
                Utility:Tween(Button, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
            end)
            
            Button.MouseButton1Down:Connect(function()
                Utility:Tween(Button, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
                task.wait(0.25)
                Utility:Tween(ButtonStroke, {Thickness = 0}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptFrame, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(PromptFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
                Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 100)}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptHolder, {BackgroundTransparency = 1}, 0.25)
                task.wait()
                PromptFrame:Destroy()
            end)

        elseif Type == 'OneButton' then
            local Args = ...
            local ButtonText = Args[1]
            local ButtonCallback = Args[2]
            Utility:Create('Frame', {
                Name = Title..'PromptFrame',
                Parent = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder'),
                BackgroundColor3 = Theme.PromptColor,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BorderSizePixel = 0,
                ZIndex = 101,
                BackgroundTransparency = NotificationTransparency,
                Size = UDim2.new(0, 0, 0, 0)
            }, {
                Utility:Create('UICorner', {
                    Name = Title..'PromptFrameCorner',
                    CornerRadius = UDim.new(0, 100)
                }),
                Utility:Create('UIStroke', {
                    Name = Title..'PromptFrameStroke',
                    ApplyStrokeMode = 'Contextual',
                    Color = Theme.UIStrokeColor,
                    LineJoinMode = 'Round',
                    Thickness = 1
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptTitle',
                    TextTransparency = 1,
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 5),
                    Size = UDim2.new(0, 0, 0, 20),
                    Font = Enum.Font.Gotham,
                    Text = Title,
                    TextColor3 = Theme.PrimaryTextColor,
                    TextSize = 20,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptText',
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 26),
                    Size = UDim2.new(0, 280, 0, 77),
                    Font = Enum.Font.Gotham,
                    Text = Text,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextSize = 15,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextButton', {
                    Name = Title..'Button',
                    BackgroundColor3 = Theme.SecondaryElementColor,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Text = ButtonText,
                    Font = Enum.Font.Gotham,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Position = UDim2.new(0, 10, 0, 110),
                    Size = UDim2.new(0, 280, 0, 30),
                    BorderSizePixel = 0,
                    TextSize = 15,
                    ZIndex = 103,
                    Visible = true,
                    AutoButtonColor = false
                }, {
                    Utility:Create('UIStroke', {
                        Name = Title..'ButtonStroke',
                        ApplyStrokeMode = 'Border',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 0
                    }),
                    Utility:Create('UICorner', {
                        Name = Title..'ButtonCorner',
                        CornerRadius = UDim.new(0, 5)
                    })
                })
            })

            local PromptHolder = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder')
            local PromptFrame = PromptHolder[Title..'PromptFrame']
            local PromptFrameCorner = PromptFrame[Title..'PromptFrameCorner']
            local Button = PromptFrame[Title..'Button']
            local ButtonStroke = Button[Title..'ButtonStroke']
            local PromptText = PromptFrame[Title..'PromptText']
            local PromptTitle = PromptFrame[Title..'PromptTitle']

            local TitleTextSize = TextService:GetTextSize(Title, 20, Enum.Font.Gotham, Vector2.new(280, 0))
            
            Utility:Tween(PromptTitle, {Size = UDim2.new(0, TitleTextSize.X, 0, TitleTextSize.Y)}, 0.25)

            Utility:Tween(PromptHolder, {BackgroundTransparency = 0.1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptFrame, {BackgroundTransparency = NotificationTransparency0}, 0.25)
            Utility:Tween(PromptFrame, {Size = UDim2.new(0, 300, 0, 150)}, 0.25)
            Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 5)}, 0.25)
            task.wait(0.25)
            Utility:Tween(ButtonStroke, {Thickness = 1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptText, {TextTransparency = 0}, 0.25)
            Utility:Tween(PromptTitle, {TextTransparency = 0}, 0.25)
            Utility:Tween(Button, {BackgroundTransparency = 0}, 0.25)
            Utility:Tween(Button, {TextTransparency = 0}, 0.25)

            Button.MouseEnter:Connect(function(Input)
                Utility:Tween(Button, {TextColor3 = Utility:Lighten(Theme.PrimaryTextColor)}, 0.25)
            end)

            Button.MouseLeave:Connect(function(Input)
                Utility:Tween(Button, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
            end)
            
            Button.MouseButton1Down:Connect(function()
                pcall(ButtonCallback)
                Utility:Tween(Button, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
                task.wait(0.25)
                Utility:Tween(ButtonStroke, {Thickness = 0}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptFrame, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(PromptFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
                Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 100)}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptHolder, {BackgroundTransparency = 1}, 0.25)
                task.wait()
                PromptFrame:Destroy()
            end)
            
        elseif Type == 'TwoButton' then
            local Args = ...
            local Button1Text = Args[1]
            local Button1Callback = Args[2]
            local Button2Text = Args[3]
            local Button2Callback = Args[4]
            Utility:Create('Frame', {
                Name = Title..'PromptFrame',
                Parent = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder'),
                BackgroundColor3 = Theme.PromptColor,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                BorderSizePixel = 0,
                ZIndex = 101,
                BackgroundTransparency = NotificationTransparency,
                Size = UDim2.new(0, 0, 0, 0)
            }, {
                Utility:Create('UICorner', {
                    Name = Title..'PromptFrameCorner',
                    CornerRadius = UDim.new(0, 100)
                }),
                Utility:Create('UIStroke', {
                    Name = Title..'PromptFrameStroke',
                    ApplyStrokeMode = 'Contextual',
                    Color = Theme.UIStrokeColor,
                    LineJoinMode = 'Round',
                    Thickness = 1
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptTitle',
                    TextTransparency = 1,
                    BackgroundTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 5),
                    Size = UDim2.new(0, 0, 0, 20),
                    Font = Enum.Font.Gotham,
                    Text = Title,
                    TextColor3 = Theme.PrimaryTextColor,
                    TextSize = 20,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextLabel', {
                    Name = Title..'PromptText',
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    TextWrapped = true,
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.new(0.5, 0, 0, 26),
                    Size = UDim2.new(0, 280, 0, 77),
                    Font = Enum.Font.Gotham,
                    Text = Text,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextSize = 15,
                    ZIndex = 102,
                    TextXAlignment = Enum.TextXAlignment.Center
                }),
                Utility:Create('TextButton', {
                    Name = Title..'Button1',
                    BackgroundColor3 = Theme.SecondaryElementColor,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Text = Button1Text,
                    Font = Enum.Font.Gotham,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Position = UDim2.new(0, 10, 0, 110),
                    Size = UDim2.new(0, 135, 0, 30),
                    BorderSizePixel = 0,
                    TextSize = 15,
                    ZIndex = 103,
                    Visible = true,
                    AutoButtonColor = false
                }, {
                    Utility:Create('UIStroke', {
                        Name = Title..'Button1Stroke',
                        ApplyStrokeMode = 'Border',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 0
                    }),
                    Utility:Create('UICorner', {
                        Name = Title..'Button1Corner',
                        CornerRadius = UDim.new(0, 5)
                    })
                }),
                Utility:Create('TextButton', {
                    Name = Title..'Button2',
                    BackgroundColor3 = Theme.SecondaryElementColor,
                    BackgroundTransparency = 1,
                    TextTransparency = 1,
                    Text = Button2Text,
                    Font = Enum.Font.Gotham,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    Position = UDim2.new(0, 155, 0, 110),
                    Size = UDim2.new(0, 135, 0, 30),
                    BorderSizePixel = 0,
                    TextSize = 15,
                    ZIndex = 103,
                    Visible = true,
                    AutoButtonColor = false
                }, {
                    Utility:Create('UIStroke', {
                        Name = Title..'Button2Stroke',
                        ApplyStrokeMode = 'Border',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 0
                    }),
                    Utility:Create('UICorner', {
                        Name = Title..'Button2Corner',
                        CornerRadius = UDim.new(0, 5)
                    })
                })
            })

            local PromptHolder = CoreGui:WaitForChild(UIName):WaitForChild('Main'):WaitForChild('PromptHolder')
            local PromptFrame = PromptHolder[Title..'PromptFrame']
            local PromptFrameCorner = PromptFrame[Title..'PromptFrameCorner']
            local Button1 = PromptFrame[Title..'Button1']
            local Button2 = PromptFrame[Title..'Button2']
            local Button1Stroke = Button1[Title..'Button1Stroke']
            local Button2Stroke = Button2[Title..'Button2Stroke']
            local PromptText = PromptFrame[Title..'PromptText']
            local PromptTitle = PromptFrame[Title..'PromptTitle']

            local TitleTextSize = TextService:GetTextSize(Title, 20, Enum.Font.Gotham, Vector2.new(280, 0))
            
            Utility:Tween(PromptTitle, {Size = UDim2.new(0, TitleTextSize.X, 0, TitleTextSize.Y)}, 0.25)

            Utility:Tween(PromptHolder, {BackgroundTransparency = 0.1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptFrame, {BackgroundTransparency = NotificationTransparency}, 0.25)
            Utility:Tween(PromptFrame, {Size = UDim2.new(0, 300, 0, 150)}, 0.25)
            Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 5)}, 0.25)
            task.wait(0.25)
            Utility:Tween(Button1Stroke, {Thickness = 1}, 0.25)
            Utility:Tween(Button2Stroke, {Thickness = 1}, 0.25)
            task.wait(0.25)
            Utility:Tween(PromptText, {TextTransparency = 0}, 0.25)
            Utility:Tween(PromptTitle, {TextTransparency = 0}, 0.25)
            Utility:Tween(Button1, {BackgroundTransparency = 0}, 0.25)
            Utility:Tween(Button1, {TextTransparency = 0}, 0.25)
            Utility:Tween(Button2, {BackgroundTransparency = 0}, 0.25)
            Utility:Tween(Button2, {TextTransparency = 0}, 0.25)

            Button1.MouseEnter:Connect(function(Input)
                Utility:Tween(Button1, {TextColor3 = Utility:Lighten(Theme.PrimaryTextColor)}, 0.25)
            end)

            Button1.MouseLeave:Connect(function(Input)
                Utility:Tween(Button1, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
            end)
            
            Button1.MouseButton1Down:Connect(function()
                pcall(Button1Callback)
                Utility:Tween(Button1, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button1, {TextTransparency = 1}, 0.25)
                Utility:Tween(Button2, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button2, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
                task.wait(0.25)
                Utility:Tween(Button1Stroke, {Thickness = 0}, 0.25)
                Utility:Tween(Button2Stroke, {Thickness = 0}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptFrame, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(PromptFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
                Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 100)}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptHolder, {BackgroundTransparency = 1}, 0.25)
                task.wait()
                PromptFrame:Destroy()
            end)

            Button2.MouseEnter:Connect(function(Input)
                Utility:Tween(Button2, {TextColor3 = Utility:Lighten(Theme.PrimaryTextColor)}, 0.25)
            end)

            Button2.MouseLeave:Connect(function(Input)
                Utility:Tween(Button2, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
            end)
            
            Button2.MouseButton1Down:Connect(function()
                pcall(Button2Callback)
                Utility:Tween(Button1, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button1, {TextTransparency = 1}, 0.25)
                Utility:Tween(Button2, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(Button2, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptText, {TextTransparency = 1}, 0.25)
                Utility:Tween(PromptTitle, {TextTransparency = 1}, 0.25)
                task.wait(0.25)
                Utility:Tween(Button1Stroke, {Thickness = 0}, 0.25)
                Utility:Tween(Button2Stroke, {Thickness = 0}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptFrame, {BackgroundTransparency = 1}, 0.25)
                Utility:Tween(PromptFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
                Utility:Tween(PromptFrameCorner, {CornerRadius = UDim.new(0, 100)}, 0.25)
                task.wait(0.25)
                Utility:Tween(PromptHolder, {BackgroundTransparency = 1}, 0.25)
                task.wait()
                PromptFrame:Destroy()
            end)
        end
    end
end

do 
    Utility:DestroyUI()
    BreakAllLoops = false
    task.spawn(function()
        while task.wait(1) do
            local x = readfile('fml.txt')
            if x == 'true' then
                for Index, Value in next, Ihatethisui do
                    print(Index, Value)
                    Ihatethisui[Index]:Break()
                end
                writefile('fml.txt', 'false')
            end
        end
    end)
end

function Utility:CreateMobileToggle()
    if not IsMobile() then return end
    
    local ToggleGui = Utility:Create('ScreenGui', {
        Name = 'MobileToggleButton',
        Parent = CoreGui,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    })
    
    local ToggleButton = Utility:Create('ImageButton', {
        Name = 'ToggleButton',
        Parent = ToggleGui,
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Position = UDim2.new(0, 10, 0.5, -25),
        Size = UDim2.new(0, 50, 0, 50),
        Image = 'rbxassetid://119789140771545',
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ScaleType = Enum.ScaleType.Fit
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 10)
        }),
        Utility:Create('UIStroke', {
            Color = Color3.fromRGB(60, 60, 60),
            Thickness = 2
        })
    })
    Utility:EnableDragging(ToggleButton)
    
    ToggleButton.MouseButton1Click:Connect(function()
        Utility:ToggleUI()
        if CoreGui:FindFirstChild(UIName) then
            local isEnabled = CoreGui:FindFirstChild(UIName).Enabled
            ToggleButton.ImageColor3 = isEnabled and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 150)
        end
    end)
    
    return ToggleButton
end

-- // Library Functions
function Library:DestroyUI()
    Utility:DestroyUI()
end

function Library:ToggleUI()
    Utility:ToggleUI()
end

function Library:SetTransparency(Transparency, NotificationBool)
    local UI = CoreGui:WaitForChild('FRITEHUB')
    local Blacklist = {
        'UIPadding',
        'UICorner',
        'UIStroke',
        'UIListLayout',
        'Folder'
    }

    for _, Item in next, UI:GetDescendants() do
        if not table.find(Blacklist, Item.ClassName) then
            if Item.BackgroundTransparency ~= 1 and Transparency < 0.95 then
                Utility:Tween(Item, {BackgroundTransparency = Transparency}, 0.25)
            end
        end
    end

    if NotificationBool then
        NotificationTransparency = Transparency
    end
end

function Library:SaveConfig(Name)
    if Name ~= '' then
        if isfolder(ConfigF) then
            if isfile(ConfigF..'/'..Name..'.json') then
                Library:CreatePrompt('TwoButton', 'Overwrite Config', 'A config already exists with this name, are you sure you want to overwrite it?', {
                    'Yes',
                    function()
                        local Json = HttpService:JSONEncode(Config)
                        local File = writefile(ConfigF..'/'..Name..'.json', Json)
                        Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
                    end,
                    'No',
                    function()
                        Library:CreateNotification('Config Not Saved', 'Config was not saved.', 5)
                    end
                })
            else
                local Json = HttpService:JSONEncode(Config)
                local File = writefile(ConfigF..'/'..Name..'.json', Json)
                Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
            end
        else
            makefolder(ConfigF)
            if isfile(ConfigF..'/'..Name..'.json') then
                Library:CreatePrompt('TwoButton', 'Overwrite Config', 'A config already exists with this name, are you sure you want to overwrite it?', {
                    'Yes',
                    function()
                        local Json = HttpService:JSONEncode(Config)
                        local File = writefile(ConfigF..'/'..Name..'.json', Json)
                        Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
                    end,
                    'No',
                    function()
                        Library:CreateNotification('Config Not Saved', 'Config was not saved.', 5)
                    end
                })
            else
                local Json = HttpService:JSONEncode(Config)
                local File = writefile(ConfigF..'/'..Name..'.json', Json)
                Library:CreateNotification('Saved Config', 'Successfully saved your config with the name, \''..Name..'.json'..'\'.', 5)
            end
        end
    else
        Library:CreateNotification('Config Not Saved', 'Please enter a name for the config.', 5)
    end
end

function Library:LoadConfig(Name)
    if isfile(ConfigF..'/'..Name..'.json') then
        Library:CreatePrompt('TwoButton', 'Load Config', 'Are you sure you want to load this config?', {
            'Yes',
            function()
                local Config = readfile(ConfigF..'/'..Name..'.json')
                local Table = HttpService:JSONDecode(Config)
                for Index, Value in next, Table do
                    if Index == 'Theme_4z3s4QrUhfqt703FmiAe' then
                        local DecodedTheme = HttpService:JSONDecode(Value)
                        local UpdatedTable = {}
                        for NewIndex, NewValue in next, DecodedTheme do
                            UpdatedTable[NewIndex] = Color3.fromRGB(NewValue[1], NewValue[2], NewValue[3])
                        end
                        Library:ChangeTheme(UpdatedTable)
                    elseif type(Value) == 'table' then
                        local New = Color3.fromRGB(Value[1] * 255, Value[2] * 255, Value[3] * 255)
                        ConfigUpdates[Index]:Set(New)
                    else
                        ConfigUpdates[Index]:Set(Value)
                    end
                end
                Library:CreateNotification('Config Loaded', 'Successfully loaded your config with the name, \''..Name..'.json'..'\'.', 5)
            end,
            'No',
            function()
                Library:CreateNotification('Config Not Loaded', 'Config was not loaded.', 5)
            end
        })
    else
        Library:CreateNotification('Config Not Loaded', 'Config doesn\'t exist.', 5)
    end
end

function Library:DeleteConfig(Name)
    if isfile(ConfigF..'/'..Name..'.json') then
        Library:CreatePrompt('TwoButton', 'Delete Config', 'Are you sure that you want to delete this config?', {
            'Yes',
            function()
                local Json = HttpService:JSONEncode(Config)
                local File = delfile(ConfigF..'/'..Name..'.json')
                Library:CreateNotification('Deleted Config', 'Successfully deleted config with the name, \''..Name..'.json'..'\'.', 5)
            end,
            'No',
            function()
                Library:CreateNotification('Config Not Deleted', 'Config was not deleted.', 5)
            end
        })
    end
end

function Library:GetConfigs()
    if isfolder(ConfigF) then
        local Configs = listfiles(ConfigF)
        local Table = {}
        for Index, Value in next, Configs do
            local New = Value:gsub(ConfigF..'\\', ''):gsub('.json', '')
            table.insert(Table, tostring(New))
        end
        return Table
    end
end 

function Library:CreateWindow(HubName, GameName, IntroText, IntroIcon, ImprovePerformance, ConfigFolder, Theme)
    local ImprovePerformance = ImprovePerformance or false
    local HasCustom = false
    local HubName = HubName or 'UI Name'
    local GameName = GameName or 'Game Name'
    local Theme = Theme
    if not Theme then
        Theme = Themes.Default
    elseif type(Theme) == 'table' then
        Theme = Theme
        Themes['Custom'] = Theme
        HasCustom = true
    elseif type(Theme) == 'string' then
        Theme = Theme:lower()
        if Theme == 'default' then
            Theme = Themes['Default']
        elseif Theme == 'lighter' then
            Theme = Themes['Lighter']
        elseif Theme == 'light' then
            Theme = Themes['Light']
        elseif Theme == 'light+' then
            Theme = Themes['Light+']
        elseif Theme == 'discord' then
            Theme = Themes['Discord']
        elseif Theme == 'red and black' then
            Theme = Themes['Red And Black']
        elseif Theme == 'nordic dark' then
            Theme = Themes['Nordic Dark']
        elseif Theme == 'nordic light' then
            Theme = Themes['Nordic Light']
        elseif Theme == 'purple' then
            Theme = Themes['Purple']
        elseif Theme == 'sentinel' then
            Theme = Themes['Sentinel']
        elseif Theme == 'synapse x' then
            Theme = Themes['Synapse X']
        elseif Theme == 'krnl' then
            Theme = Themes['Krnl']
        elseif Theme == 'script-ware' then
            Theme = Themes['Script-Ware']
        elseif Theme == 'kiriot' then
            Theme = Themes['Kiriot']
        end
    end
    local NewTable = {}

    for Index, Value in next, Theme do
        NewTable[Index] = Utility:SplitColor(Value)
    end

    if isfile('VisualUILibraryCurrentTheme.json') then
        delfile('VisualUILibraryCurrentTheme.json')
    end

    ConfigF = ConfigFolder

    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))

    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)

    local IsMobileDevice = IsMobile()
    local UIScaleValue = GetUIScale()
    local MainWidth = IsMobileDevice and 700 or 600
    local MainHeight = IsMobileDevice and 440 or 375
    local StartPos = IsMobileDevice and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0, 595, 0, 150)

    local Container = Utility:Create('ScreenGui', {
        Name = UIName,
        Parent = CoreGui,
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        Utility:Create('Frame', {
            Name = 'Main',
            BackgroundColor3 = Theme.BackgroundColor,
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Position = StartPos,
            Size = UDim2.new(0, 0, 0, 0),
            AnchorPoint = IsMobileDevice and Vector2.new(0.5, 0.5) or Vector2.new(0, 0)
        }, {
            Utility:Create('UICorner', {
                CornerRadius = UDim.new(0, 5),
                Name = 'MainCorner'
            }),
            Utility:Create('TextLabel', {
                Name = 'IntroText',
                BackgroundColor3 = Theme.BackgroundColor,
                BackgroundTransparency = 1,
                TextTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, -40),
                BorderSizePixel = 0,
                Size = UDim2.new(0, 170, 0, 20),
                Font = Enum.Font.Gotham,
                Text = IntroText,
                TextColor3 = Theme.PrimaryTextColor,
                TextSize = 18,
                ZIndex = 2,
                TextXAlignment = Enum.TextXAlignment.Center
            }),
            Utility:Create('ImageLabel', {
                Name = 'IntroImage',
                BackgroundColor3 = Theme.PrimaryElementColor,
                BackgroundTransparency = 1,
                ImageTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 20),
                ZIndex = 3,
                Size = UDim2.new(0, 100, 0, 100),
                Image = IntroIcon,
                ScaleType = Enum.ScaleType.Fit
            })
        }),
    })

    local Main = Container.Main

    Utility:Create('UIScale', {
        Name = 'UIScale',
        Parent = Main,
        Scale = UIScaleValue
    })
    
    if IsMobileDevice then
        Utility:CreateMobileToggle()
    end
    
    if not IsMobileDevice then
        Utility:EnableDragging(Container.Main)
    end

    Utility:Tween(Main, {BackgroundTransparency = 0}, 0.25)
    Utility:Tween(Main, {Size = UDim2.new(0, MainWidth, 0, 0)}, 0.25)
    task.wait(0.5)
    Utility:Tween(Main, {Size = UDim2.new(0, MainWidth, 0, MainHeight)}, 0.25)
    task.wait(0.5)
    Utility:Tween(Main['IntroText'], {TextTransparency = 0}, 0.25)
    task.wait(0.5)
    Utility:Tween(Main['IntroImage'], {ImageTransparency = 0}, 0.25)
    task.wait(3)
    Utility:Tween(Main['IntroText'], {TextTransparency = 1}, 0.25)
    task.wait(0.5)
    Utility:Tween(Main['IntroImage'], {ImageTransparency = 1}, 0.25)
    task.wait(0.5)
    Main['IntroText']:Destroy()
    Main['IntroImage']:Destroy()
    
    Utility:Create('Frame', {
        Name = 'PromptHolder',
        Parent = Main,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Parent = Main,
        BorderSizePixel = 0,
        Size = UDim2.new(0, MainWidth, 0, MainHeight),
        ZIndex = 100,
        Visible = true,
        BackgroundTransparency = 1,
        BackgroundColor3 = Theme.BackgroundColor
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 5),
            Parent = Main,
            Name = 'PromptHolderCorner'
        })
    })
    Utility:Create('Frame', {
        Name = 'Filler1',
        Position = UDim2.new(0, 170, 0, 0),
        Parent = Main,
        BorderSizePixel = 0,
        Size = UDim2.new(0, MainWidth - 171, 0, 9),
        ZIndex = 1,
        BackgroundColor3 = Theme.BackgroundColor
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 5),
            Name = 'Filler1Corner'
        })
    })
    Utility:Create('Frame', {
        Name = 'Filler2',
        Parent = Main,
        Position = UDim2.new(0, 170, 0, MainHeight - 11),
        BorderSizePixel = 0,
        Size = UDim2.new(0, MainWidth - 171, 0, 11),
        ZIndex = 1,
        BackgroundColor3 = Theme.BackgroundColor
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 5),
            Name = 'Filler2Corner'
        })
    })
    Utility:Create('Frame', {
        Name = 'Sidebar',
        BackgroundColor3 = Theme.SidebarColor,
        Parent = Main,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 170, 0, MainHeight)
    }, {
        Utility:Create('UICorner', {
            CornerRadius = UDim.new(0, 5),
            Name = 'SidebarCorner'
        }),
        Utility:Create('Frame', {
            Name = 'NamesBehind',
            Position = UDim2.new(0, 0, 0, 0),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 169, 0, 55),
            ZIndex = 1,
            BackgroundColor3 = Theme.SidebarColor
        }, {
            Utility:Create('UICorner', {
                CornerRadius = UDim.new(0, 5),
                Name = 'NamesBehindCorner'
            })
        }),
        Utility:Create('Frame', {
            Name = 'Filler3',
            Position = UDim2.new(0, 0, 0, MainHeight - 7),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 170, 0, 7),
            ZIndex = 1,
            BackgroundColor3 = Theme.SidebarColor
        }, {
            Utility:Create('UICorner', {
                CornerRadius = UDim.new(0, 5),
                Name = 'Filler3Corner'
            })
        }),
        Utility:Create('TextLabel', {
            Name = 'HubNameText',
            BackgroundColor3 = Theme.SidebarColor,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 6),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 170, 0, 20),
            Font = Enum.Font.Gotham,
            Text = HubName,
            TextColor3 = Theme.PrimaryTextColor,
            TextSize = 18,
            ZIndex = 2,
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            Utility:Create('UIPadding', {
                Name = 'HubNameTextPadding',
                PaddingLeft = UDim.new(0, 7)
            })
        }), 
        Utility:Create('TextLabel', {
            Name = 'GameNameText',
            BackgroundColor3 = Theme.SidebarColor,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0, 24),
            BorderSizePixel = 0,
            Size = UDim2.new(0, 170, 0, 20),
            Font = Enum.Font.Gotham,
            Text = GameName,
            TextColor3 = Theme.SecondaryTextColor,
            TextSize = 16,
            ZIndex = 2,
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            Utility:Create('UIPadding', {
                Name = 'GameNameTextPadding',
                PaddingLeft = UDim.new(0, 7)
            })
        }),
        Utility:Create('Frame', {
            Name = 'SidebarLine1',
            BackgroundColor3 = Theme.UIStrokeColor,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 170, 0, 0),
            Size = UDim2.new(0, 1, 0, MainHeight)
        }),
        Utility:Create('Frame', {
            Name = 'SidebarLine2',
            BackgroundColor3 = Theme.UIStrokeColor,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 0, 48),
            Size = UDim2.new(0, 170, 0, 1)
        }),
        Utility:Create('ScrollingFrame', {
            Name = 'TabButtonHolder',
            Active = true,
            BackgroundColor3 = Theme.SidebarColor,
            BorderSizePixel = 0,
            Position = UDim2.new(0, 0, 0, 55),
            Size = UDim2.new(0, 170, 0, MainHeight - 62),
            ScrollBarThickness = IsMobileDevice and 5 or 0
        }, {
            Utility:Create('UIListLayout', {
                Name = 'TabButtonHolderListLayout',
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 3)
            })
        })
    })
    Utility:Create('Frame', {
        Name = 'TabContainer',
        BackgroundColor3 = Theme.BackgroundColor,
        Parent = Main,
        BorderSizePixel = 0,
        Position = UDim2.new(0, 171, 0, 9),
        Size = UDim2.new(0, MainWidth - 171, 0, MainHeight - 20)
    }, {
        Utility:Create('Folder', {
            Name = 'TabsFolder'
        })
    })

    local HubNameObj = Container.Main.Sidebar.HubNameText
    local GameNameObj = Container.Main.Sidebar.GameNameText
    local TabButtonHolder = Container.Main.Sidebar.TabButtonHolder
    local TabButtonHolderListLayout = TabButtonHolder['TabButtonHolderListLayout']
    local PromptHolder = Container.Main.PromptHolder

    local HubNameTextSize = TextService:GetTextSize(HubNameObj.Text, 18, Enum.Font.Gotham, Vector2.new(410, math.huge))
    local GameNameTextSize = TextService:GetTextSize(GameNameObj.Text, 16, Enum.Font.Gotham, Vector2.new(410, math.huge))

    if HubNameTextSize.X >= 165 then
        local NewText = HubNameObj.Text
        local X = 0
        repeat 
            NewText = NewText:sub(0, -2)
            local HubNameTextSize = TextService:GetTextSize(NewText, 18, Enum.Font.Gotham, Vector2.new(410, math.huge))
            X = HubNameTextSize.X
        until X < 165
        for _ = 1, 2 do
            NewText = NewText:sub(0, -2)
        end
        HubNameObj.Text = NewText..'...'
    end

    if GameNameTextSize.X >= 175 then
        local NewText = GameNameObj.Text
        local X = 0
        repeat 
            NewText = NewText:sub(0, -2)
            local GameNameTextSize = TextService:GetTextSize(NewText, 18, Enum.Font.Gotham, Vector2.new(410, math.huge))
            X = GameNameTextSize.X
        until X < 175
        for _ = 1, 2 do
            NewText = NewText:sub(0, -2)
        end
        GameNameObj.Text = NewText..'...'
    end

    HubNameObj.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Library:CreatePrompt('Text', 'Hub Name', HubName, 'Close')
        end
    end)

    GameNameObj.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
            Library:CreatePrompt('Text', 'Game Name', GameName, 'Close')
        end
    end)

    function UpdateTabButtonHolderSize()
        local ContentSize = TabButtonHolderListLayout.AbsoluteContentSize.Y

        TabButtonHolder.CanvasSize = UDim2.new(0, 170, 0, ContentSize)
    end
    
    TabButtonHolder.ChildAdded:Connect(UpdateTabButtonHolderSize)

    if not ImprovePerformance then
        task.spawn(function()
            while task.wait() do
                if ChangeTheme then
                    if not BreakAllLoops then
                        Utility:Tween(Container.Main, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                        Utility:Tween(Container.Main.PromptHolder, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                        Utility:Tween(Container.Main.Filler1, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                        Utility:Tween(Container.Main.Filler2, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.NamesBehind, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.Filler3, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.HubNameText, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.HubNameText, {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.GameNameText, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.GameNameText, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.SidebarLine1, {BackgroundColor3 = Theme.UIStrokeColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.SidebarLine2, {BackgroundColor3 = Theme.UIStrokeColor}, 0.25)
                        Utility:Tween(Container.Main.Sidebar.TabButtonHolder, {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        Utility:Tween(Container.Main.TabContainer, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                    else 
                        break
                    end
                end
            end
        end)
    end

    function ChangeThemeValue()
        task.spawn(function()
            ChangeTheme = true
            task.wait()
            ChangeTheme = false
        end)
    end

    function Library:ChangeTheme(NewTheme)
        if not ImprovePerformance then
            if type(NewTheme) == 'table' then
                Theme = NewTheme
                local NewTable = {}
                for Index, Value in next, Theme do
                    NewTable[Index] = Utility:SplitColor(Value)
                end
                writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                ChangeThemeValue()
            elseif type(NewTheme) == 'string' then
                NewTheme = NewTheme:lower()
                if NewTheme == 'custom' then
                    Theme = Themes['Custom']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'default' then
                    Theme = Themes['Default']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'lighter' then
                    Theme = Themes['Lighter']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'light' then
                    Theme = Themes['Light']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'light+' then
                    Theme = Themes['Light+']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'discord' then
                    Theme = Themes['Discord']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'red and black' then
                    Theme = Themes['Red And Black']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'nordic dark' then
                    Theme = Themes['Nordic Dark']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'nordic light' then
                    Theme = Themes['Nordic Light']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'purple' then
                    Theme = Themes['Purple']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'sentinel' then
                    Theme = Themes['Sentinel']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'synapse x' then
                    Theme = Themes['Synapse X']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'krnl' then
                    Theme = Themes['Krnl']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'script-ware' then
                    Theme = Themes['Script-Ware']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                elseif NewTheme == 'kiriot' then
                    Theme = Themes['Kiriot']
                    local NewTable = {}
                    for Index, Value in next, Theme do
                        NewTable[Index] = Utility:SplitColor(Value)
                    end
                    writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
                    Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
                    ChangeThemeValue()
                end
            end
        end
    end

    function Library:ChangeColor(Index, Color)
        if not ImprovePerformance then
            Theme[Index] = Color
            local NewTable = {}
            for Index, Value in next, Theme do
                NewTable[Index] = Utility:SplitColor(Value)
            end
            writefile('VisualUILibraryCurrentTheme.json', HttpService:JSONEncode(NewTable))
            Config['Theme_4z3s4QrUhfqt703FmiAe'] = HttpService:JSONEncode(NewTable)
            ChangeThemeValue()
        end
    end

    function Library:ReturnTheme()
        return Theme
    end

    function Library:GetThemes()
        local Table = {}
        for Index, Value in next, Themes do
            table.insert(Table, Index)
        end
        return Table
    end

    local Tabs = {}

    function Tabs:CreateTab(TabName, DefaultVisibility, Icon, RectOffset, RectSize)
        local TabName = TabName or 'Tab'
        local RectOffset = RectOffset or Vector2.new(0, 0)
        local RectSize = RectSize or Vector2.new(0, 0)

        Utility:Create('ScrollingFrame', {
            Name = TabName,
            Parent = Container.Main.TabContainer.TabsFolder,
            Active = true,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Theme.BackgroundColor,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 1, 0),
            BorderSizePixel = 0,
            ScrollBarImageColor3 = Theme.ScrollBarColor,
            ScrollBarThickness = IsMobileDevice and 5 or 3
        }, {
            Utility:Create('UIPadding', {
                Name = TabName..'Padding',
                PaddingLeft = UDim.new(0, IsMobileDevice and 8 or 6),
                PaddingRight = UDim.new(0, IsMobileDevice and 8 or 6),
                PaddingTop = UDim.new(0, IsMobileDevice and 8 or 6),
                PaddingBottom = UDim.new(0, IsMobileDevice and 12 or 6)
            }),
            Utility:Create('UIListLayout', {
                Name = TabName..'ListLayout',
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 3)
            })
        })
        Utility:Create('Frame', {
            Name = TabName..'ButtonFrame',
            Parent = Container.Main.Sidebar.TabButtonHolder,
            BackgroundColor3 = Theme.SidebarColor,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.new(0, 170, 0, 30)
        }, {
            Utility:Create('TextButton', {
                Name = TabName..'Button',
                BackgroundColor3 = Theme.SidebarColor,
                BackgroundTransparency = 1,
                Text = '',
                Size = UDim2.new(0, 170, 0, 30),
                BorderSizePixel = 0,
                ZIndex = 2
            }),
            Utility:Create('ImageLabel', {
                Name = TabName..'ButtonImage',
                BackgroundColor3 = Theme.SidebarColor,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 10, 0, 5),
                Size = UDim2.new(0, 20, 0, 20),
                Image = Icon,
                ImageRectOffset = RectOffset,
                ImageRectSize = RectSize
            }),
            Utility:Create('TextLabel', {
                Name = TabName..'ButtonText',
                BackgroundColor3 = Theme.SidebarColor,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Position = UDim2.new(0, 30, 0, 3),
                Size = UDim2.new(0, 140, 0, 24),
                Font = Enum.Font.Gotham,
                Text = TabName,
                TextColor3 = Theme.PrimaryTextColor,
                TextSize = 16,
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                Utility:Create('UIPadding', {
                    Name = TabName..'ButtonTextPadding',
                    PaddingLeft = UDim.new(0, 5)
                })
            })
        })
        
        local TabFolder = Container.Main.TabContainer.TabsFolder
        local Tab = TabFolder[TabName]
        local TabButtonHolder = Container.Main.Sidebar.TabButtonHolder
        local TabButton = TabButtonHolder[TabName..'ButtonFrame'][TabName..'Button']
        local TabListLayout = Tab[TabName..'ListLayout']

        if not ImprovePerformance then
            task.spawn(function()
                while task.wait() do
                    if ChangeTheme then
                        if not BreakAllLoops then
                            if Tab.Visible then
                                Utility:Tween(TabButtonHolder[TabName..'ButtonFrame'][TabName..'ButtonText'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                Utility:Tween(TabButtonHolder[TabName..'ButtonFrame'][TabName..'ButtonImage'], {ImageColor3 = Theme.PrimaryTextColor}, 0.25)
                            else
                                Utility:Tween(TabButtonHolder[TabName..'ButtonFrame'][TabName..'ButtonText'], {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                                Utility:Tween(TabButtonHolder[TabName..'ButtonFrame'][TabName..'ButtonImage'], {ImageColor3 = Theme.SecondaryTextColor}, 0.25)
                            end
                            Utility:Tween(Tab, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                            Utility:Tween(Tab, {ScrollBarImageColor3 = Theme.ScrollBarColor}, 0.25)
                            Utility:Tween(TabButtonHolder[TabName..'ButtonFrame'], {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                            Utility:Tween(TabButton, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                            Utility:Tween(TabButtonHolder[TabName..'ButtonFrame'][TabName..'ButtonImage'], {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                            Utility:Tween(TabButtonHolder[TabName..'ButtonFrame'][TabName..'ButtonText'], {BackgroundColor3 = Theme.SidebarColor}, 0.25)
                        else
                            break
                        end
                    end
                end
            end)
        end
        
        if DefaultVisibility then
            TabButton.Parent[TabName..'ButtonText'].TextColor3 = Theme.PrimaryTextColor
            TabButton.Parent[TabName..'ButtonImage'].ImageColor3 = Theme.PrimaryTextColor
            Tab.Visible = true

            for _, ITab in next, TabFolder:GetChildren()do 
                if ITab:IsA('ScrollingFrame') and ITab ~= Tab then
                    ITab.Visible = false
                end
            end
        else
            Tab.Visible = false
            TabButton.Parent[TabName..'ButtonText'].TextColor3 = Theme.SecondaryTextColor
            TabButton.Parent[TabName..'ButtonImage'].ImageColor3 = Theme.SecondaryTextColor
        end

        Utility:BindClick(TabButton, function()
            for _, ITab in next, TabFolder:GetChildren() do
                ITab.Visible = false
            end

            Tab.Visible = true
                
            for _, Item in next, TabButtonHolder:GetDescendants() do
                if Item:IsA('TextLabel') then 
                    Utility:Tween(Item, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                elseif Item:IsA('ImageLabel') then
                    Utility:Tween(Item, {ImageColor3 = Theme.SecondaryTextColor}, 0.25)
                end
            end

            Utility:Tween(TabButton.Parent[TabName..'ButtonText'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
            Utility:Tween(TabButton.Parent[TabName..'ButtonImage'], {ImageColor3 = Theme.PrimaryTextColor}, 0.25)
        end)

        local Sections = {}
        local NextSectionOrder = 0

        function Sections:CreateSection(Name)
            local Name = Name or 'Section'
            
            Utility:Create('Frame', {
                Name = Name..'Section',
                Parent = Tab,
                BackgroundColor3 = Theme.BackgroundColor,
                BorderSizePixel = 0,
                Size = UDim2.new(1, 0, 0, 30),
                LayoutOrder = NextSectionOrder,
            }, {
                Utility:Create('TextLabel', {
                    Name = Name..'SectionLabel',
                    BackgroundColor3 = Theme.BackgroundColor,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.new(1, 0, 0, 30),
                    Font = Enum.Font.Gotham,
                    Text = Name,
                    TextColor3 = Theme.SecondaryTextColor,
                    TextSize = 14,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextTruncate = Enum.TextTruncate.AtEnd,
                    LayoutOrder = 0
                }, {
                    Utility:Create('UIPadding', {
                        Name = Name..'SectionLabelPadding',
                        PaddingLeft = UDim.new(0, 3)
                    })
                }),
                Utility:Create('UICorner', {
                    Name = 'SectionCorner',
                    CornerRadius = UDim.new(0, 5)
                }),
                Utility:Create('UIPadding', {
                    Name = Name..'SectionPadding',
                    PaddingLeft = UDim.new(0, IsMobileDevice and 4 or 2),
                    PaddingRight = UDim.new(0, IsMobileDevice and 4 or 2),
                    PaddingBottom = UDim.new(0, IsMobileDevice and 10 or 6)
                }),
                Utility:Create('UIListLayout', {
                    Name = Name..'ListLayout',
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(0, IsMobileDevice and 10 or 6)
                })
            })
            NextSectionOrder = NextSectionOrder + 1

            local Section = Tab[Name..'Section']

            if not ImprovePerformance then
                task.spawn(function()
                    while task.wait() do
                        if ChangeTheme then
                            if not BreakAllLoops then
                                Utility:Tween(Section, {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                                Utility:Tween(Section[Name..'SectionLabel'], {BackgroundColor3 = Theme.BackgroundColor}, 0.25)
                                Utility:Tween(Section[Name..'SectionLabel'], {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                            else
                                break
                            end
                        end
                    end
                end)
            end
            
            function UpdateSectionSize()
                local ListLayout = Section[Name..'ListLayout']
                local ContentSize = ListLayout.AbsoluteContentSize
                local ExtraBottom = IsMobileDevice and 10 or 6

                Section.Size = UDim2.new(1, 0, 0, ContentSize.Y + ExtraBottom)
            end

            local ListLayout = Section[Name..'ListLayout']
            ListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                task.defer(UpdateSectionSize)
            end)
            Section.ChildAdded:Connect(function()
                task.defer(UpdateSectionSize)
            end)
            Section.ChildRemoved:Connect(function()
                task.defer(UpdateSectionSize)
            end)

            task.defer(UpdateSectionSize)

            local Elements = {}
            local NextElementOrder = 1
            local function AssignElementOrder(Instance)
                if Instance and Instance:IsA('GuiObject') then
                    Instance.LayoutOrder = NextElementOrder
                    NextElementOrder = NextElementOrder + 1
                end
            end
            
            function Elements:CreateLabel(LabelText)
                local LabelText = LabelText or 'Label'
                local LabelFunctions = {}

                Utility:Create('Frame', {
                    Name = LabelText..'LabelHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.OtherElementColor,
                    Size = UDim2.new(1, 0, 0, 30)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = LabelText..'LabelHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = LabelText..'LabelStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = LabelText..'Label',
                        BackgroundColor3 = Theme.OtherElementColor,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 30),
                        Font = Enum.Font.Gotham,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        Text = LabelText,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = LabelText..'LabelCorner'
                        }),
                        Utility:Create('UIPadding', {
                            Name = LabelText..'LabelPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    })
                })

                AssignElementOrder(Section[LabelText..'LabelHolder'])
                UpdateSectionSize()

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    Utility:Tween(Section[LabelText..'LabelHolder'], {BackgroundColor3 = Theme.OtherElementColor}, 0.25)
                                    Utility:Tween(Section[LabelText..'LabelHolder'][LabelText..'LabelStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(Section[LabelText..'LabelHolder'][LabelText..'Label'], {BackgroundColor3 = Theme.OtherElementColor}, 0.25)
                                    Utility:Tween(Section[LabelText..'LabelHolder'][LabelText..'Label'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                function LabelFunctions:UpdateLabel(NewText)
                    Section[LabelText..'LabelHolder'][LabelText..'Label'].Text = NewText
                end
                return LabelFunctions
            end

            function Elements:CreateParagraph(Title, Paragraph)
                local Title = Title or 'Title'
                local Paragraph = Paragraph or 'Text'
                local ParagraphFunctions = {}

                Utility:Create('Frame', {
                    Name = Title..'ParagraphHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.PrimaryElementColor,
                    Size = UDim2.new(1, 0, 0, 37)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = Title..'ParagraphHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = Title..'ParagraphStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = Title..'ParagraphTitle',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 0),
                        Size = UDim2.new(1, 0, 0, 20),
                        Font = Enum.Font.Gotham,
                        Text = Title,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Title..'ParagraphTitleCorner'
                        }),
                        Utility:Create('UIPadding', {
                            Name = Title..'ParagraphTitlePadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    }),
                    Utility:Create('TextLabel', {
                        Name = Title..'ParagraphContent',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 20),
                        Size = UDim2.new(1, 0, 0, 20),
                        Font = Enum.Font.Gotham,
                        Text = Paragraph,
                        TextColor3 = Theme.SecondaryTextColor,
                        TextWrapped = true,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Title..'ParagraphContentCorner'
                        }),
                        Utility:Create('UIPadding', {
                            Name = Title..'ParagraphContentPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    })
                })
                local Old

                local ParagraphHolder = Section[Title..'ParagraphHolder']
                local ParagraphContent = Section[Title..'ParagraphHolder'][Title..'ParagraphContent']
                local ParagraphTitle = Section[Title..'ParagraphHolder'][Title..'ParagraphTitle']
                AssignElementOrder(ParagraphHolder)

                local function RecalcParagraphHeight()
                    local wrapWidth = ParagraphContent.AbsoluteSize.X
                    if wrapWidth <= 0 then
                        wrapWidth = ParagraphHolder.AbsoluteSize.X
                    end
                    if wrapWidth <= 0 then
                        wrapWidth = 410
                    end

                    local textSize = TextService:GetTextSize(ParagraphContent.Text, 14, Enum.Font.Gotham, Vector2.new(wrapWidth, math.huge))
                    ParagraphContent.Size = UDim2.new(1, 0, 0, textSize.Y)
                    ParagraphHolder.Size = UDim2.new(1, 0, 0, textSize.Y + 25)
                    UpdateSectionSize()
                end

                task.defer(RecalcParagraphHeight)
                ParagraphContent:GetPropertyChangedSignal('Text'):Connect(RecalcParagraphHeight)
                ParagraphHolder:GetPropertyChangedSignal('AbsoluteSize'):Connect(RecalcParagraphHeight)

                UpdateSectionSize()

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    Utility:Tween(ParagraphHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ParagraphHolder[Title..'ParagraphStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(ParagraphTitle, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ParagraphTitle, {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                    Utility:Tween(ParagraphContent, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ParagraphContent, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                function ParagraphFunctions:UpdateParagraph(NewTitle, NewParagraph)
                    Old = ParagraphContent.Text
                    ParagraphTitle.Text = NewTitle
                    ParagraphContent.Text = NewParagraph
                    task.defer(function()
                        local wrapWidth = ParagraphContent.AbsoluteSize.X
                        if wrapWidth <= 0 then
                            wrapWidth = ParagraphHolder.AbsoluteSize.X
                        end
                        if wrapWidth <= 0 then
                            wrapWidth = 410
                        end

                        local newSize = TextService:GetTextSize(ParagraphContent.Text, 14, Enum.Font.Gotham, Vector2.new(wrapWidth, math.huge))
                        ParagraphContent.Size = UDim2.new(1, 0, 0, newSize.Y)
                        ParagraphHolder.Size = UDim2.new(1, 0, 0, newSize.Y + 25)
                        UpdateSectionSize()
                    end)
                end
                return ParagraphFunctions
            end

            function Elements:CreateButton(Name, Callback)
                local Name = Name or 'Button'
                local Callback = Callback or function() end
                local Hovering = false

                Utility:Create('Frame', {
                    Name = Name..'ButtonHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.PrimaryElementColor,
                    Size = UDim2.new(1, 0, 0, 30)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = Name..'ButtonHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = Name..'ButtonHolderStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextButton', {
                        Name = Name..'Button',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 30),
                        Font = Enum.Font.Gotham,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        Text = Name
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = 'ButtonCorner'
                        }),
                        Utility:Create('UIPadding', {
                            Name = 'ButtonPadding',
                            PaddingLeft = UDim.new(0, 7)
                        }),
                        Utility:Create('ImageLabel', {
                            Name = 'ButtonImage',
                            BackgroundColor3 = Theme.PrimaryElementColor,
                            BackgroundTransparency = 1,
                            AnchorPoint = Vector2.new(1, 0),
                            Position = UDim2.new(1, -6, 0, 3),
                            Size = UDim2.new(0, 25, 0, 25),
                            Image = 'rbxassetid://3926307971',
                            ImageColor3 = Theme.SecondaryTextColor,
                            ImageRectOffset = Vector2.new(564, 364),
                            ImageRectSize = Vector2.new(36, 36)
                        })
                    })
                })

                UpdateSectionSize()

                local ButtonHolder = Section[Name..'ButtonHolder']
                local Button = ButtonHolder[Name..'Button']
                AssignElementOrder(ButtonHolder)

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    if not Hovering then
                                        Utility:Tween(ButtonHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    end
                                    Utility:Tween(ButtonHolder[Name..'ButtonHolderStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(Button, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(Button, {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                    Utility:Tween(Button['ButtonImage'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(Button['ButtonImage'], {ImageColor3 = Theme.SecondaryTextColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                Button.MouseButton1Down:Connect(function()
                    Hovering = true
                    Utility:Tween(ButtonHolder, {BackgroundColor3 = Utility:Darken(Theme.PrimaryElementColor)}, 0.25)
                    task.spawn(function()
                        Callback()
                    end)
                    task.wait(0.25)
                    Utility:Tween(ButtonHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                    Hovering = false
                end)

                Button.MouseEnter:Connect(function()
                    Hovering = true
                    Utility:Tween(ButtonHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                end)

                Button.MouseLeave:Connect(function()
                    Utility:Tween(ButtonHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                    Hovering = false
                end)
            end

            function Elements:CreateSlider(Name, MinimumValue, MaximumValue, DefaultValue, SliderColor, Callback)
                local Name = Name or 'Slider'
                local MinimumValue = MinimumValue or 1
                local MaximumValue = MaximumValue or 100
                local SliderColor = SliderColor or Color3.fromRGB(0, 125, 255)
                local Callback = Callback or function() end
                local CurrentValue = DefaultValue
                local SliderFunctions = {}
                local Hovering = false

                Utility:Create('Frame', {
                    Name = Name..'SliderHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.PrimaryElementColor,
                    Size = UDim2.new(1, 0, 0, 50)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = Name..'SliderHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = Name..'SliderHolderStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = 'SliderText',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, -120, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Name,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'SliderTextCorner'
                        }),
                        Utility:Create('UIPadding', {
                            Name = Name..'SliderTextPadding',
                            PaddingLeft = UDim.new(0, 7)
                        }),
                    }),
                    Utility:Create('TextButton', {
                        Name = Name..'SliderButton',
                        BackgroundColor3 = Theme.SecondaryElementColor,
                        Position = UDim2.new(0, 7, 0, 29),
                        Size = UDim2.new(1, -14, 0, 10),
                        Text = '',
                        BorderSizePixel = 0,
                        AutoButtonColor = false
                    }, {
                        Utility:Create('UIStroke', {
                            Name = Name..'SliderButtonStroke',
                            ApplyStrokeMode = 'Contextual',
                            Color = Theme.UIStrokeColor,
                            LineJoinMode = 'Round',
                            Thickness = 1
                        }),
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'SliderButtonCorner'
                        }),
                        Utility:Create('Frame', {
                            Name = Name..'SliderTrail',
                            BackgroundColor3 = SliderColor,
                            Size = UDim2.new(0, 0, 0, 10),
                            BorderSizePixel = 0
                        }, {
                            Utility:Create('UICorner', {
                                CornerRadius = UDim.new(0, 5),
                                Name = Name..'SliderTrailCorner'
                            })
                        })
                    }),
                    Utility:Create('TextLabel', {
                        Name = Name..'SliderNumberText',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(1, 0),
                        Position = UDim2.new(1, -7, 0, 0),
                        Size = UDim2.new(0, 110, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = '0',
                        TextColor3 = Theme.SecondaryTextColor,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Right
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'SliderNumberTextCorner'
                        }),
                        Utility:Create('UIPadding', {
                            Name = Name..'SliderNumberTextPadding',
                            PaddingRight = UDim.new(0, 7)
                        })
                    })
                })

                local SliderHolder = Section[Name..'SliderHolder']
                local SliderButton = SliderHolder[Name..'SliderButton']
                local SliderNumber = SliderHolder[Name..'SliderNumberText']
                local SliderTrail = SliderButton[Name..'SliderTrail']

                UpdateSectionSize()
                AssignElementOrder(SliderHolder)

                Config[Name] = CurrentValue

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    if not Hovering then
                                        Utility:Tween(SliderHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    end
                                    Utility:Tween(SliderHolder[Name..'SliderHolderStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(SliderHolder['SliderText'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(SliderHolder['SliderText'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                    Utility:Tween(SliderButton, {BackgroundColor3 = Theme.SecondaryElementColor}, 0.25)
                                    Utility:Tween(SliderButton[Name..'SliderButtonStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(SliderNumber, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(SliderNumber, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                local function Clamp01(x)
                    return math.clamp(x, 0, 1)
                end

                local function SetFromRatio(ratio, noCallback)
                    local minV = tonumber(MinimumValue) or 0
                    local maxV = tonumber(MaximumValue) or 0
                    if maxV == minV then
                        ratio = 0
                    end
                    ratio = Clamp01(ratio)

                    local value = minV + ((maxV - minV) * ratio)
                    value = math.floor(value + 0.5)
                    CurrentValue = value
                    SliderNumber.Text = tostring(value)
                    Config[Name] = value
                    Utility:Tween(SliderTrail, {Size = UDim2.new(ratio, 0, 0, 10)}, 0.1)
                    if not noCallback then
                        task.spawn(function()
                            Callback(value)
                        end)
                    end
                end

                local function SetFromX(x, noCallback)
                    local w = SliderButton.AbsoluteSize.X
                    if w <= 0 then return end
                    local rel = math.clamp(x - SliderButton.AbsolutePosition.X, 0, w)
                    SetFromRatio(rel / w, noCallback)
                end

                if DefaultValue ~= nil then
                    local minV = tonumber(MinimumValue) or 0
                    local maxV = tonumber(MaximumValue) or 0
                    local v = tonumber(DefaultValue) or minV
                    v = math.clamp(v, math.min(minV, maxV), math.max(minV, maxV))
                    local ratio = (maxV == minV) and 0 or ((v - minV) / (maxV - minV))
                    SetFromRatio(ratio, true)
                    task.spawn(function()
                        Callback(CurrentValue)
                    end)
                else
                    task.defer(function()
                        local minV = tonumber(MinimumValue) or 0
                        SetFromRatio(0, true)
                        SliderNumber.Text = tostring(minV)
                    end)
                end

                local Dragging = false
                local ActiveInput = nil
                local InputChangedConn = nil
                local InputEndedConn = nil

                local function EndDrag()
                    Dragging = false
                    ActiveInput = nil
                    if InputChangedConn then InputChangedConn:Disconnect() InputChangedConn = nil end
                    if InputEndedConn then InputEndedConn:Disconnect() InputEndedConn = nil end
                end

                SliderButton.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                        Dragging = true
                        ActiveInput = Input
                        SetFromX(Input.Position.X, false)

                        InputChangedConn = UserInputService.InputChanged:Connect(function(ChangedInput)
                            if not Dragging then return end
                            if ActiveInput and ChangedInput == ActiveInput then
                                SetFromX(ChangedInput.Position.X, false)
                            elseif ChangedInput.UserInputType == Enum.UserInputType.MouseMovement and ActiveInput.UserInputType == Enum.UserInputType.MouseButton1 then
                                SetFromX(ChangedInput.Position.X, false)
                            end
                        end)

                        InputEndedConn = UserInputService.InputEnded:Connect(function(EndedInput)
                            if not Dragging then return end
                            if EndedInput.UserInputType == Enum.UserInputType.MouseButton1 or EndedInput.UserInputType == Enum.UserInputType.Touch then
                                EndDrag()
                            end
                        end)
                    end
                end)

                SliderHolder.MouseEnter:Connect(function()
                    Hovering = true
                    Utility:Tween(SliderHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                end)

                SliderHolder.MouseLeave:Connect(function()
                    Utility:Tween(SliderHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                    Hovering = false
                end)

                function SliderFunctions:Set(Value)
                    local minV = tonumber(MinimumValue) or 0
                    local maxV = tonumber(MaximumValue) or 0
                    local v = tonumber(Value) or minV
                    v = math.clamp(v, math.min(minV, maxV), math.max(minV, maxV))
                    local ratio = (maxV == minV) and 0 or ((v - minV) / (maxV - minV))
                    SetFromRatio(ratio, false)
                end
                ConfigUpdates[Name] = SliderFunctions
                return SliderFunctions
            end

            function Elements:CreateTextbox(Name, Placeholder, Callback)
                local Name = Name or 'Textbox'
                local Placeholder = Placeholder or 'Input'
                local Callback = Callback or function() end
                local Length = nil
                local Hovering = false

                Utility:Create('Frame', {
                    Name = Name..'TextboxHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.PrimaryElementColor,
                    Size = UDim2.new(1, 0, 0, 40)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = Name..'TextboxHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = Name..'TextboxHolderStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = Name..'TextboxText',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 5),
                        Size = UDim2.new(1, -90, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Name,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Utility:Create('UIPadding', {
                            Name = Name..'TextboxTextPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    }),
                    Utility:Create('TextBox', {
                        Name = Name..'Textbox',
                        BackgroundColor3 = Theme.SecondaryElementColor,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -10, 0, 20),
                        Size = UDim2.new(0, 50, 0, 25),
                        Font = Enum.Font.Gotham,
                        PlaceholderColor3 = Theme.SecondaryTextColor,
                        Text = Placeholder,
                        TextColor3 = Theme.SecondaryTextColor,
                        TextSize = 14,
                        ClearTextOnFocus = false
                    }, {
                        Utility:Create('UIStroke', {
                            Name = Name..'TextboxStroke',
                            ApplyStrokeMode = 'Border',
                            Color = Theme.UIStrokeColor,
                            LineJoinMode = 'Round',
                            Thickness = 1
                        }),
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'TextboxCorner'
                        })
                    })
                })

                local TextboxHolder = Section[Name..'TextboxHolder']
                local Textbox = TextboxHolder[Name..'Textbox']

                UpdateSectionSize()
                AssignElementOrder(TextboxHolder)

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    if not Hovering then
                                        Utility:Tween(TextboxHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    end
                                    Utility:Tween(TextboxHolder[Name..'TextboxHolderStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(TextboxHolder[Name..'TextboxText'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(TextboxHolder[Name..'TextboxText'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                    Utility:Tween(Textbox, {BackgroundColor3 = Theme.SecondaryElementColor}, 0.25)
                                    Utility:Tween(Textbox, {PlaceholderColor3 = Theme.SecondaryTextColor}, 0.25)
                                    Utility:Tween(Textbox, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                                    Utility:Tween(Textbox[Name..'TextboxStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                local function RecalcTextboxWidth(text)
                    local t = text or ''
                    local textSize = TextService:GetTextSize(t, 14, Enum.Font.Gotham, Vector2.new(1000, 40))
                    local desired = math.max(60, textSize.X + 14)
                    local maxAllowed = math.max(60, math.floor((TextboxHolder.AbsoluteSize.X) * 0.55))
                    Utility:Tween(Textbox, {Size = UDim2.new(0, math.clamp(desired, 60, maxAllowed), 0, 25)}, 0.15)
                end

                task.defer(function()
                    RecalcTextboxWidth(Placeholder)
                end)

                Textbox.Focused:Connect(function()
                    Hovering = true
                    Utility:Tween(Textbox, {BackgroundColor3 = Utility:Lighten(Theme.SecondaryElementColor)}, 0.25)
                    Utility:Tween(TextboxHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                end)
                
                Textbox.FocusLost:Connect(function()
                    Utility:Tween(Textbox, {BackgroundColor3 = Theme.SecondaryElementColor}, 0.25)
                    Utility:Tween(TextboxHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                    task.spawn(function()
                        Callback(Textbox.Text)
                    end)
                    Hovering = false
                end)

                TextboxHolder.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Textbox:CaptureFocus()
                    end
                end)

                Textbox.Changed:Connect(function(Property)
                    if Property == 'Text' then
                        Utility:Tween(Textbox, {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                        RecalcTextboxWidth(Textbox.Text)
                    end
                end)

                TextboxHolder.MouseEnter:Connect(function()
                    Hovering = true
                    Utility:Tween(TextboxHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                end)

                TextboxHolder.MouseLeave:Connect(function()
                    Utility:Tween(TextboxHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                    Hovering = false
                end)
            end

            function Elements:CreateKeybind(Name, Key, Callback)
                local Name = Name or 'Keybind'
                local Key = Key or 'E'
                local Callback = Callback or function() end
                local Current = Key
                local KeybindFunctions = {}
                local Hovering = false

                Utility:Create('Frame', {
                    Name = Name..'KeybindHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.PrimaryElementColor,
                    Size = UDim2.new(1, 0, 0, 40)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = Name..'KeybindHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = Name..'KeybindHolderStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = Name..'KeybindText',
                        Parent = KeybindHolder,
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 5),
                        Size = UDim2.new(1, -70, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Name,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Utility:Create('UIPadding', {
                            Name = Name..'KeybindTextPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    }), 
                    Utility:Create('TextButton', {
                        Name = Name..'Keybind',
                        Parent = KeybindHolder,
                        BackgroundColor3 = Theme.SecondaryElementColor,
                        Position = UDim2.new(0, 376, 0, 8),
                        Size = UDim2.new(0, 25, 0, 25),
                        Font = Enum.Font.Gotham,
                        Text = Current,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(0, 400, 0, 20),
                        TextColor3 = Theme.SecondaryTextColor,
                        TextSize = 14,
                        AutoButtonColor = false
                    }, {
                        Utility:Create('UIStroke', {
                            Name = Name..'KeybindStroke',
                            ApplyStrokeMode = 'Border',
                            Color = Theme.UIStrokeColor,
                            LineJoinMode = 'Round',
                            Thickness = 1
                        }),
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'KeybindCorner'
                        })
                    })
                })
                
                local KeybindHolder = Section[Name..'KeybindHolder']
                local Keybind = KeybindHolder[Name..'Keybind']
                AssignElementOrder(KeybindHolder)
                
                UpdateSectionSize()

                Config[Name] = Current

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    if not Hovering then
                                        Utility:Tween(KeybindHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    end
                                    Utility:Tween(KeybindHolder[Name..'KeybindHolderStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(KeybindHolder[Name..'KeybindText'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(KeybindHolder[Name..'KeybindText'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                    Utility:Tween(KeybindHolder[Name..'Keybind'], {BackgroundColor3 = Theme.SecondaryElementColor}, 0.25)
                                    Utility:Tween(KeybindHolder[Name..'Keybind'], {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                                    Utility:Tween(KeybindHolder[Name..'Keybind'][Name..'KeybindStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                local function RecalcKeybindWidth(text)
                    local t = tostring(text or '')
                    local ts = TextService:GetTextSize(t, 14, Enum.Font.Gotham, Vector2.new(1000, 40))
                    local desired = math.max(30, ts.X + 14)
                    local maxAllowed = math.max(30, math.floor((KeybindHolder.AbsoluteSize.X) * 0.45))
                    Utility:Tween(Keybind, {Size = UDim2.new(0, math.clamp(desired, 30, maxAllowed), 0, 25)}, 0.15)
                end

                task.defer(function()
                    RecalcKeybindWidth(Current)
                end)

                Keybind.MouseButton1Click:Connect(function()
                    Keybind.Text = '. . .'
                    Utility:Tween(KeybindHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                    local Input, _ = UserInputService.InputBegan:wait();

                    if Input.KeyCode.Name ~= 'Unknown' then
                        Keybind.Text = Input.KeyCode.Name
                        RecalcKeybindWidth(Input.KeyCode.Name)
                        Current = Input.KeyCode.Name;
                        Utility:Tween(KeybindHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                    end
                end)

                local Con = UserInputService.InputBegan:Connect(function(Input, GameProcessedEvent)
                    if not GameProcessedEvent then 
                        if Input.KeyCode.Name == Current then
                            task.spawn(function()
                                Callback()
                            end)
                        end
                    end
                end)

                function KeybindFunctions:Break()
                    Con:Disconnect()
                    print('x')
                end
                Ihatethisui[Name] = KeybindFunctions

                KeybindHolder.MouseEnter:Connect(function()
                    Hovering = true
                    Utility:Tween(KeybindHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                end)

                KeybindHolder.MouseLeave:Connect(function()
                    Utility:Tween(KeybindHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                    Hovering = false
                end)

                function KeybindFunctions:Set(Value)
                    Current = Value
                    Keybind.Text = Value
                end
                ConfigUpdates[Name] = KeybindFunctions
                return KeybindFunctions
            end

            function Elements:CreateToggle(Name, Default, ToggleColor, DebounceAmount, Callback)
                local Name = Name or 'Toggle'
                local Default = Default or false
                local Callback = Callback or function() end
                local Toggled = Default
                local ToggleColor = ToggleColor or Color3.fromRGB(0, 255, 100)
                local Debounce = false
                local DebounceAmount = DebounceAmount or 0.25
                local ToggleFunctions = {}
                local Hovering = false

                Utility:Create('Frame', {
                    Name = Name..'ToggleHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.PrimaryElementColor,
                    Size = UDim2.new(1, 0, 0, 40)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = Name..'ToggleHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = Name..'ToggleHolderStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = Name..'ToggleText',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 0),
                        Size = UDim2.new(1, -70, 1, 0),
                        Font = Enum.Font.Gotham,
                        Text = Name,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Center,
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, {
                        Utility:Create('UIPadding', {
                            Name = Name..'ToggleTextPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    }),
                    Utility:Create('Frame', {
                        Name = Name..'Toggle',
                        BackgroundColor3 = Theme.SecondaryElementColor,
                        AnchorPoint = Vector2.new(0, 0.5),
                        Position = UDim2.new(1, -58, 0.5, 0),
                        Size = UDim2.new(0, 50, 0, 25)        
                    }, {
                        Utility:Create('UIStroke', {
                            Name = Name..'ToggleStroke',
                            ApplyStrokeMode = 'Contextual',
                            Color = Theme.UIStrokeColor,
                            LineJoinMode = 'Round',
                            Thickness = 1
                        }),
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 25),
                            Name = Name..'ToggleCorner'
                        }),
                        Utility:Create('ImageLabel', {
                            Name = Name..'ToggleCircle',
                            BackgroundColor3 = Theme.PrimaryElementColor,
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 5, 0, 5),
                            Size = UDim2.new(0, 15, 0, 15),
                            Image = 'rbxassetid://3570695787',
                            ScaleType = Enum.ScaleType.Slice,
                            SliceCenter = Rect.new(100, 100, 100, 100),
                            SliceScale = 0.120,
                        })
                    }),
                    Utility:Create('TextButton', {
                        Name = Name..'ToggleButton',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 0, 0, 0),
                        Size = UDim2.new(1, 0, 1, 0),
                        Font = Enum.Font.SourceSans,
                        Text = '',
                        TextColor3 = Color3.fromRGB(0, 0, 0),
                        TextSize = 14
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'ToggleButtonCorner'
                        })
                    })
                })

                local ToggleHolder = Section[Name..'ToggleHolder']
                local ToggleButton = ToggleHolder[Name..'ToggleButton']
                local Toggle = ToggleHolder[Name..'Toggle']
                local Circle = Toggle[Name..'ToggleCircle']

                UpdateSectionSize()

                Config[Name] = Toggled

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    if not Hovering then
                                        Utility:Tween(ToggleHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    end
                                    Utility:Tween(ToggleHolder[Name..'ToggleHolderStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(ToggleHolder[Name..'ToggleText'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ToggleHolder[Name..'ToggleText'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                    Utility:Tween(ToggleHolder[Name..'Toggle'][Name..'ToggleCircle'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ToggleHolder[Name..'Toggle'][Name..'ToggleStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(ToggleHolder[Name..'ToggleButton'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    if Toggled == true then
                                        Utility:Tween(Toggle, {BackgroundColor3 = ToggleColor}, 0.25)
                                    else
                                        Utility:Tween(ToggleHolder[Name..'Toggle'], {BackgroundColor3 = Theme.SecondaryElementColor}, 0.25)
                                    end
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                if Default then
                    task.spawn(function()                    
                        pcall(Callback, Default)
                    end)
                    Utility:Tween(Toggle, {BackgroundColor3 = ToggleColor}, 0.25)
                    Utility:Tween(Circle, {Position = UDim2.new(0, 30, 0, 5)}, 0.25)
                end

                Utility:BindClick(ToggleButton, function()
                    if Debounce then
                        return
                    end

                    Toggled = not Toggled
                    task.spawn(function()
                        pcall(Callback, Toggled)
                    end)

                    Debounce = true
                    if Toggled then
                        Utility:Tween(Toggle, {BackgroundColor3 = ToggleColor}, 0.25)
                        Utility:Tween(Circle, {Position = UDim2.new(0, 30, 0, 5)}, 0.25)
                    else
                        Utility:Tween(Toggle, {BackgroundColor3 = Theme.SecondaryElementColor}, 0.25)
                        Utility:Tween(Circle, {Position = UDim2.new(0, 5, 0, 5)}, 0.25)
                    end

                    task.delay(DebounceAmount, function()
                        Debounce = false
                    end)
                end)

                ToggleHolder.MouseEnter:Connect(function()
                    Hovering = true
                    Utility:Tween(ToggleHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.5)
                end)

                ToggleHolder.MouseLeave:Connect(function()
                    Utility:Tween(ToggleHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.5)
                    Hovering = false
                end)

                function ToggleFunctions:Set(Value)
                    Toggled = Value
                    task.spawn(function()
                        pcall(Callback, Toggled)
                    end)
                    if Toggled then
                        Utility:Tween(Toggle, {BackgroundColor3 = ToggleColor}, 0.25)
                        Utility:Tween(Circle, {Position = UDim2.new(0, 30, 0, 5)}, 0.25)
                    else
                        Utility:Tween(Toggle, {BackgroundColor3 = Theme.SecondaryElementColor}, 0.25)
                        Utility:Tween(Circle, {Position = UDim2.new(0, 5, 0, 5)}, 0.25)
                    end
                end
                ConfigUpdates[Name] = ToggleFunctions
                return ToggleFunctions
            end

            function Elements:CreateDropdown(Name, List, Default, DebounceAmount, Callback)
                local Name = Name or 'Dropdown'
                local List = List or {}
                local Callback = Callback or function() end
                local DebounceAmount = DebounceAmount or 0.25
                local Default = Default or nil
                local SelectedItem = 'None'
                local Opened = false
                local Debounce = false
                local DropdownFunctions = {}
                local Hovering = false

                Utility:Create('Frame', {
                    Name = Name..'DropdownHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.PrimaryElementColor,
                    Size = UDim2.new(1, 0, 0, 40),
                    ClipsDescendants = false
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = Name..'DropdownHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = Name..'DropdownHolderStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = Name..'DropdownText',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 5),
                        Size = UDim2.new(1, -140, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Name,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, {
                        Utility:Create('UIPadding', {
                            Name = Name..'DropdownTextPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    }),
                    Utility:Create('ImageLabel', {
                        Name = Name..'DropdownIcon',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -8, 0.5, 0),
                        Rotation = 270,
                        Size = UDim2.new(0, 25, 0, 25),
                        Image = 'rbxassetid://3926305904',
                        ImageColor3 = Theme.SecondaryTextColor,
                        ImageRectOffset = Vector2.new(964, 284),
                        ImageRectSize = Vector2.new(36, 36)
                    }),
                    Utility:Create('TextLabel', {
                        Name = Name..'DropdownSelectedText',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        AnchorPoint = Vector2.new(1, 0.5),
                        Position = UDim2.new(1, -35, 0.5, 0),
                        Size = UDim2.new(0, 160, 0, 25),
                        Font = Enum.Font.Gotham,
                        Text = SelectedItem,
                        TextColor3 = Theme.SecondaryTextColor,
                        TextSize = 14,
                        TextXAlignment = Enum.TextXAlignment.Right,
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'DropdownSelectedTextCorner'
                        }),
                        Utility:Create('UIPadding', {
                            Name = Name..'DropdownSelectedTextPadding',
                            PaddingRight = UDim.new(0, 7)
                        })
                    }),
                    Utility:Create('TextButton', {
                        Name = Name..'DropdownButton',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 0, 0, 0),
                        Size = UDim2.new(1, 0, 0, 40),
                        Font = Enum.Font.SourceSans,
                        Text = '',
                        TextColor3 = Color3.fromRGB(0, 0, 0),
                        TextSize = 14,
                        ZIndex = 2
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'DropdownButtonCorner'
                        })
                    })
                })

                Utility:Create('Frame', {
                    Name = Name..'DropListContainer',
                    Parent = Section,
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 0, 0, 0),
                    Size = UDim2.new(1, 0, 0, 0),
                    Visible = false,
                    ZIndex = 100
                }, {
                    Utility:Create('ScrollingFrame', {
                        Name = Name..'DropList',
                        Active = true,
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 0, 0, 45),
                        Size = UDim2.new(1, 0, 0, 0),
                        ScrollBarImageColor3 = Theme.ScrollBarColor,
                        ScrollBarThickness = 3,
                        ZIndex = 101,
                        ClipsDescendants = true
                    }, {
                        Utility:Create('UIStroke', {
                            Name = Name..'DropListStroke',
                            ApplyStrokeMode = 'Contextual',
                            Color = Theme.UIStrokeColor,
                            LineJoinMode = 'Round',
                            Thickness = 1
                        }),
                        Utility:Create('UIListLayout', {
                            Name = Name..'DropListLayout',
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 0)
                        }),
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'DropdownListCorner'
                        })
                    })
                })

                Utility:Create('Frame', {
                    Name = Name..'DropdownFiller',
                    Parent = Section,
                    Visible = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 0)
                })

                local DropdownHolder = Section[Name..'DropdownHolder']
                local DropListContainer = Section[Name..'DropListContainer']
                local DropList = DropListContainer[Name..'DropList']
                local DropdownButton = DropdownHolder[Name..'DropdownButton']
                local DropdownIcon = DropdownHolder[Name..'DropdownIcon']
                local DropdownSelectedText = DropdownHolder[Name..'DropdownSelectedText']
                local DropListLayout = DropList[Name..'DropListLayout']
                local DropdownFiller = Section[Name..'DropdownFiller']

                AssignElementOrder(DropdownHolder)
                UpdateSectionSize()

                Config[Name] = Default

                local function GetDropdownOpenHeight()
                    local contentY = DropListLayout.AbsoluteContentSize.Y
                    if contentY <= 0 then
                        return 0, 0
                    end

                    local maxHeight
                    if IsMobile() then
                        maxHeight = math.floor(math.clamp(Tab.AbsoluteSize.Y * 0.75, 160, 260))
                    else
                        maxHeight = 230
                    end

                    local openHeight = math.min(contentY, maxHeight)
                    return openHeight, contentY
                end

                local function ApplyDropdownSizing(UseTween)
                    local openHeight, contentY = GetDropdownOpenHeight()
                    if contentY > 0 then
                        DropList.CanvasSize = UDim2.new(0, 0, 0, contentY)
                    end

                    if not Opened then
                        return
                    end

                    local sizeProps = {Size = UDim2.new(1, 0, 0, openHeight)}
                    if UseTween then
                        Utility:Tween(DropList, sizeProps, 0.25)
                        Utility:Tween(DropdownFiller, {Size = UDim2.new(1, 0, 0, openHeight + 10)}, 0.25)
                    else
                        DropList.Size = sizeProps.Size
                        DropdownFiller.Size = UDim2.new(1, 0, 0, openHeight + 10)
                    end
                    
                    task.defer(UpdateSectionSize)
                end

                local function CloseDropdown()
                    if not Opened then return end
                    
                    Opened = false
                    DropdownHolder.ZIndex = 1
                    DropListContainer.ZIndex = 1
                    DropdownFiller.ZIndex = 1
                    
                    Utility:Tween(DropList, {Size = UDim2.new(1, 0, 0, 0)}, 0.25)
                    Utility:Tween(DropdownFiller, {Size = UDim2.new(1, 0, 0, 0)}, 0.25)
                    Utility:Tween(DropdownIcon, {Rotation = 270}, 0.25)
                    
                    task.wait(0.25)
                    DropListContainer.Visible = false
                    DropdownFiller.Visible = false
                    UpdateSectionSize()
                end

                DropListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
                    task.defer(function()
                        ApplyDropdownSizing(false)
                    end)
                end)

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    if not Hovering then
                                        Utility:Tween(DropdownHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    end
                                    Utility:Tween(DropdownHolder[Name..'DropdownHolderStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(DropdownHolder[Name..'DropdownText'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(DropdownHolder[Name..'DropdownText'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                    Utility:Tween(DropdownIcon, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(DropdownIcon, {ImageColor3 = Theme.SecondaryTextColor}, 0.25)
                                    Utility:Tween(DropdownSelectedText, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(DropdownSelectedText, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                                    Utility:Tween(DropList, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(DropList, {ScrollBarImageColor3 = Theme.ScrollBarColor}, 0.25)
                                    Utility:Tween(DropList[Name..'DropListStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(DropdownButton, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                Utility:BindClick(DropdownButton, function()
                    if Debounce then
                        return
                    end

                    Debounce = true
                    Opened = not Opened

                    if Opened then
                        DropdownHolder.ZIndex = 100
                        DropListContainer.ZIndex = 100
                        DropdownFiller.ZIndex = 99
                        DropListContainer.Visible = true
                        DropdownFiller.Visible = true
                        Utility:Tween(DropdownIcon, {Rotation = 90}, 0.25)

                        task.defer(function()
                            ApplyDropdownSizing(true)
                        end)
                    else
                        CloseDropdown()
                    end

                    task.delay(DebounceAmount, function()
                        Debounce = false
                    end)
                end)

                for _, Item in next, List do
                    Utility:Create('TextButton', {
                        Name = Item..'OptionButton',
                        Parent = DropList,
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BorderSizePixel = 0,
                        Size = UDim2.new(1, 0, 0, 30),
                        Font = Enum.Font.Gotham,
                        TextColor3 = Theme.SecondaryTextColor,
                        TextSize = 16,
                        AutoButtonColor = false,
                        Text = Item,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        ZIndex = 1002
                    }, {
                        Utility:Create('UIPadding', {
                            Name = Item..'OptionButtonPadding',
                            PaddingLeft = UDim.new(0, 7)
                        }),
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Item..'OptionButtonCorner'
                        })
                    })

                    local OptionButton = DropList[Item..'OptionButton']

                    if not ImprovePerformance then
                        task.spawn(function()
                            while task.wait() do
                                if ChangeTheme then
                                    if not BreakAllLoops then
                                        Utility:Tween(OptionButton, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                        Utility:Tween(OptionButton, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                                    else
                                        break
                                    end
                                end
                            end
                        end)
                    end

                    OptionButton.MouseEnter:Connect(function()
                        Utility:Tween(OptionButton, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                    end)

                    OptionButton.MouseLeave:Connect(function()
                        Utility:Tween(OptionButton, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                    end)

                    Utility:BindClick(OptionButton, function()
                        for _, Button in next, DropList:GetChildren() do
                            if Button:IsA('TextButton') then
                                Utility:Tween(Button, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                            end
                        end
                        
                        Utility:Tween(OptionButton, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                        
                        DropdownSelectedText.Text = Item
                        SelectedItem = Item
                        Config[Name] = Item
                        
                        task.spawn(function()
                            pcall(Callback, Item)
                        end)
                        
                        task.wait(0.1)
                        CloseDropdown()
                    end)
                end

                if Default ~= nil then
                    local Option = DropList[Default..'OptionButton']
                    if Option then
                        Utility:Tween(Option, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                        DropdownSelectedText.Text = Default
                        SelectedItem = Default
                        task.spawn(function()
                            pcall(Callback, Default)
                        end)
                    end
                end

                DropdownHolder.MouseEnter:Connect(function()
                    Hovering = true
                    Utility:Tween(DropdownHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                end)

                DropdownHolder.MouseLeave:Connect(function()
                    Utility:Tween(DropdownHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                    Hovering = false
                end)

                function DropdownFunctions:Set(Value)
                    SelectedItem = tostring(Value)
                    DropdownSelectedText.Text = SelectedItem
                    Config[Name] = Value
                    task.spawn(function()
                        pcall(Callback, Value)
                    end)
                end
                
                ConfigUpdates[Name] = DropdownFunctions

                function DropdownFunctions:UpdateDropdown(NewList)
                    NewList = NewList or {}
                    
                    if Opened then
                        CloseDropdown()
                    end
                    
                    task.wait(0.3)
                    
                    for _, Item in next, DropList:GetChildren() do
                        if Item:IsA('TextButton') then
                            Item:Destroy()
                        end
                    end
                    
                    List = NewList

                    for _, Item in next, NewList do
                        Utility:Create('TextButton', {
                            Name = Item..'OptionButton',
                            Parent = DropList,
                            BackgroundColor3 = Theme.PrimaryElementColor,
                            BorderSizePixel = 0,
                            Size = UDim2.new(1, 0, 0, 30),
                            Font = Enum.Font.Gotham,
                            TextColor3 = Theme.SecondaryTextColor,
                            TextSize = 16,
                            AutoButtonColor = false,
                            Text = Item,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ZIndex = 1002
                        }, {
                            Utility:Create('UIPadding', {
                                Name = Item..'OptionButtonPadding',
                                PaddingLeft = UDim.new(0, 7)
                            }),
                            Utility:Create('UICorner', {
                                CornerRadius = UDim.new(0, 5),
                                Name = Item..'OptionButtonCorner'
                            })
                        })

                        local OptionButton = DropList[Item..'OptionButton']

                        if not ImprovePerformance then
                            task.spawn(function()
                                while task.wait() do
                                    if ChangeTheme then
                                        if not BreakAllLoops then
                                            Utility:Tween(OptionButton, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                            Utility:Tween(OptionButton, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                                        else
                                            break
                                        end
                                    end
                                end
                            end)
                        end

                        OptionButton.MouseEnter:Connect(function()
                            Utility:Tween(OptionButton, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                        end)

                        OptionButton.MouseLeave:Connect(function()
                            Utility:Tween(OptionButton, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                        end)

                        Utility:BindClick(OptionButton, function()
                            for _, Button in next, DropList:GetChildren() do
                                if Button:IsA('TextButton') then
                                    Utility:Tween(Button, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                end
                            end
                            Utility:Tween(OptionButton, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.25)
                            DropdownSelectedText.Text = tostring(Item)
                            SelectedItem = tostring(Item)
                            Config[Name] = Item
                            
                            task.spawn(function()
                                pcall(Callback, Item)
                            end)
                            
                            task.wait(0.1)
                            CloseDropdown()
                        end)
                    end
                    
                    if #List == 0 then
                        DropdownSelectedText.Text = 'None'
                        SelectedItem = 'None'
                    end
                end
                
                return DropdownFunctions
            end

            function Elements:CreateColorpicker(Name, DefaultColor, DebounceAmount, Callback, ...)
                local Name = Name or 'Colorpicker'
                local xArgs = ...
                local Args = xArgs or {}
                local Callback = Callback or function() end
                local DebounceAmount = DebounceAmount or 0.25
                local DefaultColor = DefaultColor or Color3.fromRGB(0, 125, 255)
                local Debounce = false
                local Opened = false
                local H, S, V = Color3.toHSV(DefaultColor)
                local ColorpickerFunctions = {}
                local Hovering = false

                Utility:Create('Frame', {
                    Name = Name..'ColorpickerHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.PrimaryElementColor,
                    Size = UDim2.new(1, 0, 0, 40)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = Name..'ColorpickerHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = Name..'ColorpickerHolderStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = Name..'ColorpickerText',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 5),
                        Size = UDim2.new(1, -50, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Name,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }, {
                        Utility:Create('UIPadding', {
                            Name = Name..'ColorpickerTextPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    }),
                    Utility:Create('TextButton', {
                        Name = Name..'ColorpickerButton',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Size = UDim2.new(1, 0, 0, 40),
                        ZIndex = 2,
                        Font = Enum.Font.Gotham,
                        Text = '',
                        TextColor3 = Theme.SecondaryTextColor,
                        TextSize = 14
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'ColorpickerButtonCorner'
                        })
                    }),
                    Utility:Create('Frame', {
                        Name = Name..'ColorpickerDropdown',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 0, 0, 40),
                        Size = UDim2.new(1, 0, 0, 114),
                        Visible = false
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'ColorpickerDropdownCorner'
                        }),
                        Utility:Create('UIStroke', {
                            Name = Name..'ColorpickerDropdownStroke',
                            ApplyStrokeMode = 'Contextual',
                            Color = Theme.UIStrokeColor,
                            LineJoinMode = 'Round',
                            Thickness = 1
                        }),
                        Utility:Create('ImageButton', {
                            Name = Name..'RGBPicker',
                            BackgroundColor3 = Theme.PrimaryElementColor,
                            Position = UDim2.new(0, 8, 0, 7),
                            Size = UDim2.new(1, -49, 0, 100),
                            Image = 'rbxassetid://6523286724'
                        }, {
                            Utility:Create('UICorner', {
                                CornerRadius = UDim.new(0, 5),
                                Name = Name..'RGBPickerCorner'
                            }),
                            Utility:Create('ImageLabel', {
                                Name = Name..'RGBPickerCircle',
                                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                Position = UDim2.new(0, 293, 0, -7),
                                Size = UDim2.new(0, 14, 0, 14),
                                Image = 'rbxassetid://3926309567',
                                ImageColor3 = Color3.fromRGB(0, 0, 0),
                                ImageRectOffset = Vector2.new(628, 420),
                                ImageRectSize = Vector2.new(48, 48)
                            }),
                            Utility:Create('UIStroke', {
                                Name = Name..'RGBPickerStroke',
                                ApplyStrokeMode = 'Contextual',
                                Color = Theme.UIStrokeColor,
                                LineJoinMode = 'Round',
                                Thickness = 1
                            }),
                        }),
                        Utility:Create('ImageButton', {
                            Name = Name..'DarknessPicker',
                            BackgroundColor3 = Theme.PrimaryElementColor,
                            AnchorPoint = Vector2.new(1, 0),
                            Position = UDim2.new(1, -8, 0, 7),
                            Size = UDim2.new(0, 25, 0, 100),
                            Image = 'rbxassetid://6523291212'
                        }, {
                            Utility:Create('UICorner', {
                                CornerRadius = UDim.new(0, 5),
                                Name = Name..'DarknessPickerCorner'
                            }),
                            Utility:Create('ImageLabel', {
                                Name = Name..'DarknessPickerCircle',
                                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                                BackgroundTransparency = 1,
                                AnchorPoint = Vector2.new(0.5, 0),
                                Position = UDim2.new(0.5, 0, 0, -6),
                                Size = UDim2.new(0, 14, 0, 14),
                                Image = 'rbxassetid://3926309567',
                                ImageColor3 = Color3.fromRGB(0, 0, 0),
                                ImageRectOffset = Vector2.new(628, 420),
                                ImageRectSize = Vector2.new(48, 48)
                            }),
                            Utility:Create('UIStroke', {
                                Name = Name..'DarknessPickerStroke',
                                ApplyStrokeMode = 'Contextual',
                                Color = Theme.UIStrokeColor,
                                LineJoinMode = 'Round',
                                Thickness = 1
                            }),
                        })
                    }),
                    Utility:Create('Frame', {
                        Name = Name..'ColorpickerPreview',
                        AnchorPoint = Vector2.new(1, 0),
                        Position = UDim2.new(1, -8, 0, 8),
                        Size = UDim2.new(0, 25, 0, 25)
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'ColorpickerPreviewCorner'
                        })
                    })
                })
                Utility:Create('Frame', {
                    Name = Name..'ColorpickerFiller',
                    Parent = Section,
                    Visible = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 0)
                })

                local ColorpickerHolder = Section[Name..'ColorpickerHolder']
                local ColorpickerButton = ColorpickerHolder[Name..'ColorpickerButton']
                local ColorpickerDropdown = ColorpickerHolder[Name..'ColorpickerDropdown']
                local RGBPicker = ColorpickerDropdown[Name..'RGBPicker']
                local RGBPickerCircle = RGBPicker[Name..'RGBPickerCircle']
                local DarknessPicker = ColorpickerDropdown[Name..'DarknessPicker']
                local DarknessPickerCircle = DarknessPicker[Name..'DarknessPickerCircle']
                local ColorpickerPreview = ColorpickerHolder[Name..'ColorpickerPreview']
                local ColorpickerFiller = Section[Name..'ColorpickerFiller']
                
                UpdateSectionSize()
                AssignElementOrder(ColorpickerHolder)

                if not Args[1] == true then
                    Config[Name] = Utility:SplitColor(DefaultColor)
                end

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    if not Hovering then
                                        Utility:Tween(ColorpickerHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    end
                                    Utility:Tween(ColorpickerHolder[Name..'ColorpickerHolderStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(ColorpickerHolder[Name..'ColorpickerText'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ColorpickerHolder[Name..'ColorpickerText'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                    Utility:Tween(ColorpickerButton, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ColorpickerButton, {TextColor3 = Theme.SecondaryTextColor}, 0.25)
                                    Utility:Tween(ColorpickerDropdown, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ColorpickerDropdown[Name..'ColorpickerDropdownStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(RGBPicker, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(RGBPicker[Name..'RGBPickerStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(DarknessPicker, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(DarknessPicker[Name..'DarknessPickerStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                if DefaultColor ~= nil then
                    Color = {H, S, V}
                    local FinalColor = Color3.fromHSV(Color[1], Color[2], Color[3])
                    ColorpickerPreview.BackgroundColor3 = FinalColor
                    Callback(FinalColor)
                end

                Utility:BindClick(ColorpickerButton, function()
                    if not Debounce then
                        if Opened then
                            Opened = false
                            ColorpickerHolder.ZIndex = 1
                            ColorpickerFiller.ZIndex = 1
                            Utility:Tween(ColorpickerFiller, {Size = UDim2.new(1, 0, 0, 0)}, 0.25)
                            Utility:Tween(RGBPicker, {Size = UDim2.new(1, -49, 0, 0)}, 0.25)
                            Utility:Tween(DarknessPicker, {Size = UDim2.new(0, 25, 0, 0)}, 0.25)
                            Utility:Tween(ColorpickerDropdown, {Size = UDim2.new(1, 0, 0, 0)}, 0.25)
                            UpdateSectionSize()
                            Debounce = true
                            task.wait(DebounceAmount)
                            Debounce = false
                            ColorpickerDropdown.Visible = false
                            ColorpickerFiller.Visible = false
                        else
                            Opened = true
                            ColorpickerHolder.ZIndex = 10
                            ColorpickerFiller.ZIndex = 9
                            ColorpickerFiller.Visible = true
                            ColorpickerDropdown.Visible = true
                            Utility:Tween(ColorpickerDropdown, {Size = UDim2.new(1, 0, 0, 114)}, 0.25)
                            Utility:Tween(RGBPicker, {Size = UDim2.new(1, -49, 0, 100)}, 0.25)
                            Utility:Tween(DarknessPicker, {Size = UDim2.new(0, 25, 0, 100)}, 0.25)
                            Utility:Tween(ColorpickerFiller, {Size = UDim2.new(1, 0, 0, 110)}, 0.25)
                            UpdateSectionSize()
                            Debounce = true
                            task.wait(DebounceAmount)
                            Debounce = false
                        end
                    end
                end)

                ColorpickerHolder.MouseEnter:Connect(function()
                    Hovering = true
                    Utility:Tween(ColorpickerHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.5)
                end)

                ColorpickerHolder.MouseLeave:Connect(function()
                    Utility:Tween(ColorpickerHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.5)
                    Hovering = false
                end)

                local Mouse = Players.LocalPlayer:GetMouse()
                local Color = {1, 1, 1}
                local RGBPicked = false
                local DarknessPicked = false

                -- // Based off xHeptc's functions | https://v3rmillion.net/member.php?action=profile&uid=1347047
                    
                Mouse.Move:Connect(function()
                    if RGBPicked then
                        local MouseXPosition = Mouse.X - RGBPicker.AbsolutePosition.X
                        local MouseYPosition = Mouse.Y - RGBPicker.AbsolutePosition.Y

                        local CircleXSize = RGBPickerCircle.AbsoluteSize.X / 2
                        local CircleYSize = RGBPickerCircle.AbsoluteSize.Y / 2

                        local MaximumXPosition = RGBPicker.AbsoluteSize.X
                        local MaximumYPosition = RGBPicker.AbsoluteSize.Y

                        if MouseXPosition < 0 then MouseXPosition = 0 end
                        if MouseYPosition < 0 then MouseYPosition = 0 end

                        if MouseXPosition > MaximumXPosition then MouseXPosition = MaximumXPosition end
                        if MouseYPosition > MaximumYPosition then MouseYPosition = MaximumYPosition end

                        MouseXPosition = MouseXPosition / MaximumXPosition
                        MouseYPosition = MouseYPosition / MaximumYPosition

                        RGBPickerCircle.Position = UDim2.new(MouseXPosition, -CircleXSize, MouseYPosition, -CircleYSize)

                        Color = {1 - MouseXPosition, 1 - tostring(MouseYPosition), Color[3]}

                        local HSVColor = Color3.fromHSV(Color[1], Color[2], Color[3])

                        ColorpickerPreview.BackgroundColor3 = HSVColor

                        Callback(HSVColor)

                        if not Args[1] == true then
                            Config[Name] = Utility:SplitColor(HSVColor)
                        end

                    elseif DarknessPicked then
                        local MouseYPosition = Mouse.Y - DarknessPicker.AbsolutePosition.Y

                        local CircleYSize = DarknessPickerCircle.AbsoluteSize.Y / 2

                        local MaximumYPosition = DarknessPicker.AbsoluteSize.Y

                        if MouseYPosition < 0 then MouseYPosition = 0 end
                        if MouseYPosition > MaximumYPosition then MouseYPosition = MaximumYPosition end

                        MouseYPosition = MouseYPosition / MaximumYPosition

                        DarknessPickerCircle.Position = UDim2.new(0.5, 0, MouseYPosition, -CircleYSize)

                        DarknessPickerCircle.ImageColor3 = Color3.fromHSV(0, 0, MouseYPosition)

                        Color = {Color[1], Color[2], 1 - MouseYPosition}

                        local HSVColor = Color3.fromHSV(Color[1], Color[2], Color[3])

                        ColorpickerPreview.BackgroundColor3 = HSVColor

                        Callback(HSVColor)

                        if not Args[1] == true then
                            Config[Name] = Utility:SplitColor(HSVColor)
                        end
                    end 
                end)

                UserInputService.InputEnded:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if DarknessPicked then 
                            DarknessPicked = false 
                        elseif RGBPicked then
                            RGBPicked = false
                        end
                    end
                end)
                -- // End

                RGBPicker.MouseButton1Down:Connect(function()
                    RGBPicked = true
                end)

                DarknessPicker.MouseButton1Down:Connect(function()
                    DarknessPicked = true
                end)
                
                function ColorpickerFunctions:Set(Value)
                    Color = Color3.fromRGB(Value.R, Value.G, Value.B)
                    ColorpickerPreview.BackgroundColor3 = Color
                    Callback(Color)
                end
                ConfigUpdates[Name] = ColorpickerFunctions
                return ColorpickerFunctions
            end

            function Elements:CreateImage(Name, URL, ImageSize)
                local Name = Name or 'Image'
                local URL = URL or 'rbxassetid://10579405264'
                local ImageSize = ImageSize or UDim2.new(0, 100, 0, 100)
                local ImageFunctions = {}
                local Debounce = false
                local DebounceAmount = 0.25
                local Opened = false
                local Debounce2 = false
                local Debounce2Amount = 0.5
                local Hovering = false

                Utility:Create('Frame', {
                    Name = Name..'ImageHolder',
                    Parent = Section,
                    BackgroundColor3 = Theme.PrimaryElementColor,
                    Size = UDim2.new(1, 0, 0, 40)
                }, {
                    Utility:Create('UICorner', {
                        CornerRadius = UDim.new(0, 5),
                        Name = Name..'ImageHolderCorner'
                    }),
                    Utility:Create('UIStroke', {
                        Name = Name..'ImageStroke',
                        ApplyStrokeMode = 'Contextual',
                        Color = Theme.UIStrokeColor,
                        LineJoinMode = 'Round',
                        Thickness = 1
                    }),
                    Utility:Create('TextLabel', {
                        Name = Name..'ImageText',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0, 0, 0, 5),
                        Size = UDim2.new(1, -50, 0, 30),
                        Font = Enum.Font.Gotham,
                        Text = Name,
                        TextColor3 = Theme.PrimaryTextColor,
                        TextSize = 16,
                        TextXAlignment = Enum.TextXAlignment.Left
                    }, {
                        Utility:Create('UIPadding', {
                            Name = Name..'ImageTextPadding',
                            PaddingLeft = UDim.new(0, 7)
                        })
                    }),
                    Utility:Create('ImageLabel', {
                        Name = Name..'ImageIcon',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        AnchorPoint = Vector2.new(1, 0),
                        Position = UDim2.new(1, -8, 0, 8),
                        Size = UDim2.new(0, 25, 0, 25),
                        Image = 'rbxassetid://3926305904',
                        ImageColor3 = Theme.SecondaryTextColor,
                        ImageRectOffset = Vector2.new(764, 124),
                        ImageRectSize = Vector2.new(36, 36)
                    }),
                    Utility:Create('ScrollingFrame', {
                        Name = Name..'ImageDropdown',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 0, 1, 0),
                        Size = UDim2.new(1, 0, 0, 30),
                        ClipsDescendants = true,
                        Visible = false,
                        ScrollBarImageColor3 = Theme.ScrollBarColor,
                        ScrollBarThickness = 3,
                        Active = true
                    }, {
                        Utility:Create('UIStroke', {
                            Name = Name..'ImageDropdownStroke',
                            ApplyStrokeMode = 'Contextual',
                            Color = Theme.UIStrokeColor,
                            LineJoinMode = 'Round',
                            Thickness = 1
                        }),
                        Utility:Create('UIListLayout', {
                            Name = Name..'ImageDropdownListLayout',
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            HorizontalAlignment = 'Center',
                            VerticalAlignment = 'Center'
                        }),
                        Utility:Create('ImageLabel', {
                            Name = Name..'Image',
                            BackgroundColor3 = Theme.PrimaryElementColor,
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            Image = URL,
                            ScaleType = 'Fit'
                        })
                    }),
                    Utility:Create('TextButton', {
                        Name = Name..'ImageButton',
                        BackgroundColor3 = Theme.PrimaryElementColor,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Position = UDim2.new(0, 0, 0, 0),
                        Size = UDim2.new(1, 0, 0, 40),
                        Font = Enum.Font.SourceSans,
                        Text = '',
                        TextColor3 = Color3.fromRGB(0, 0, 0),
                        TextSize = 14
                    }, {
                        Utility:Create('UICorner', {
                            CornerRadius = UDim.new(0, 5),
                            Name = Name..'ImageButtonCorner'
                        })
                    })
                })
                Utility:Create('Frame', {
                    Name = Name..'ImageFiller',
                    Parent = Section,
                    Visible = false,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(1, 0, 0, 0)
                })


                local ImageHolder = Section[Name..'ImageHolder']
                local ImageIcon = ImageHolder[Name..'ImageIcon']
                local ImageDropdown = ImageHolder[Name..'ImageDropdown']
                local Image = ImageDropdown[Name..'Image']
                local Button = ImageHolder[Name..'ImageButton']
                local ImageFiller = Section[Name..'ImageFiller']
                local ImageDropdownListLayout = ImageDropdown[Name..'ImageDropdownListLayout']

                UpdateSectionSize()
                AssignElementOrder(ImageHolder)

                if not ImprovePerformance then
                    task.spawn(function()
                        while task.wait() do
                            if ChangeTheme then
                                if not BreakAllLoops then
                                    if not Hovering then
                                        Utility:Tween(ImageHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    end
                                    Utility:Tween(ImageHolder[Name..'ImageStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(ImageHolder[Name..'ImageText'], {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ImageHolder[Name..'ImageText'], {TextColor3 = Theme.PrimaryTextColor}, 0.25)
                                    Utility:Tween(ImageIcon, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ImageIcon, {ImageColor3 = Theme.SecondaryTextColor}, 0.25)
                                    Utility:Tween(ImageDropdown, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(ImageDropdown, {ScrollBarImageColor3 = Theme.ScrollBarColor}, 0.25)
                                    Utility:Tween(ImageDropdown[Name..'ImageDropdownStroke'], {Color = Theme.UIStrokeColor}, 0.25)
                                    Utility:Tween(Image, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                    Utility:Tween(Button, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.25)
                                else
                                    break
                                end
                            end
                        end
                    end)
                end

                local function UpdateImageCanvas()
                    local ContentSize = ImageDropdownListLayout.AbsoluteContentSize

                    ImageDropdown.CanvasSize = UDim2.new(0, ContentSize.X, 0, ContentSize.Y)
                end

                UpdateImageCanvas()

                Utility:BindClick(Button, function()
                    if not Debounce then
                        if Opened then
                            Opened = false
                            ImageHolder.ZIndex = 1
                            ImageFiller.ZIndex = 1
                            Utility:Tween(ImageFiller, {Size = UDim2.new(1, 0, 0, 0)}, 0.25)
                            Utility:Tween(ImageDropdown, {Size = UDim2.new(1, 0, 0, 0)}, 0.25)
                            Utility:Tween(ImageIcon, {ImageColor3 = Theme.SecondaryTextColor}, 0.25)
                            Utility:Tween(Image, {Size = UDim2.new(0, 0, 0, 0)}, 0.25)
                            UpdateImageCanvas()
                            UpdateSectionSize()
                            Debounce = true
                            task.wait(DebounceAmount)
                            Debounce = false
                            ImageDropdown.Visible = false
                            ImageFiller.Visible = false
                        else
                            Opened = true
                            ImageHolder.ZIndex = 10
                            ImageFiller.ZIndex = 9
                            ImageFiller.Visible = true
                            ImageDropdown.Visible = true
                            Utility:Tween(ImageDropdown, {Size = UDim2.new(1, 0, 0, ImageSize.Y.Offset + 10)}, 0.25)
                            Utility:Tween(ImageFiller, {Size = UDim2.new(1, 0, 0, ImageSize.Y.Offset + 10 - 6)}, 0.25)
                            Utility:Tween(Image, {Size = ImageSize}, 0.25)
                            UpdateImageCanvas()
                            UpdateSectionSize()
                            Utility:Tween(ImageIcon, {ImageColor3 = Theme.PrimaryTextColor}, 0.25)
                            Debounce = true
                            task.wait(DebounceAmount)
                            Debounce = false
                        end
                    end
                end)

                Image.InputBegan:Connect(function(Input)
                    if not Debounce2 then
                        task.spawn(function()
                            Debounce2 = true
                            task.wait(Debounce2Amount)
                            Debounce2 = false
                        end)
                        UpdateImageCanvas()
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                            Utility:Tween(Image, {Size = UDim2.new(0, Image.Size.X.Offset * 2, 0, Image.Size.Y.Offset * 2)}, 0.25)
                            UpdateImageCanvas()
                        elseif Input.UserInputType == Enum.UserInputType.MouseButton2 and Image.Size ~= ImageSize then
                            Utility:Tween(Image, {Size = UDim2.new(0, Image.Size.X.Offset / 2, 0, Image.Size.Y.Offset / 2)}, 0.25)
                            UpdateImageCanvas()
                        end
                    end
                end)

                Image.Changed:Connect(function(Property)
                    if Property == 'Size' then
                        if Image.Size == ImageSize then
                            Utility:Tween(ImageDropdown, {CanvasSize = ImageSize}, 0.25)
                        end 
                    end
                end)

                ImageHolder.MouseEnter:Connect(function()
                    Hovering = true
                    Utility:Tween(ImageHolder, {BackgroundColor3 = Utility:Lighten(Theme.PrimaryElementColor)}, 0.5)
                end)

                ImageHolder.MouseLeave:Connect(function()
                    Hovering = false
                    Utility:Tween(ImageHolder, {BackgroundColor3 = Theme.PrimaryElementColor}, 0.5)
                    
                end)

                function ImageFunctions:UpdateImage(NewURL, NewSize)
                    ImageSize = NewSize
                    URL = NewURL
                    Image.Image = NewURL
                    UpdateImageCanvas()
                end
                return ImageFunctions
            end
            return Elements
        end
        return Sections
    end
    return Tabs
end
return Library
