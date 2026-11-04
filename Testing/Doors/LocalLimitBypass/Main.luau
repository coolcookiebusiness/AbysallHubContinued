
--	Functions.Notify({Title = "Used For Notifications."})
-- 	Disabled = not Functions.CheckCompatability({"require"}), DisabledTooltip = Globals.IncompatibleMessage
-- 	Risky = Floor ~= "Mines" (Means it only works on mines)

local G = {}
G.g1 = {}
G.g2 = {}
G.g3 = {}
G.g4 = {}
G.g5 = {}
G.g6 = {}
G.g7 = {}
G.g8 = {}
G.g9 = {}
G.g10 = {}
G.g11 = {}
G.g12 = {}
G.g13 = {}
G.g14 = {}
G.g15 = {}
G.g16 = {}
G.g17 = {}

local LoadStart = tick()

if shared.Hastelepasta then
    return 
end

shared.Hastelepasta = true


getgenv().Abysall = {
    Legit = true
}


local BaseUrl = "https://raw.githubusercontent.com/coolcookiebusiness/AbysallHubContinued/main/"

getgenv().Abysall = {
    Environment = loadstring(game:HttpGet(BaseUrl .. "Components/Environment.luau"))(),
    ESPLibrary = loadstring(game:HttpGet(BaseUrl .. "Components/ESP.luau"))(),
    ["16Notice"] = loadstring(game:HttpGet(BaseUrl .. "Components/16Notice.luau"))(),
    Legit = true
}

G.g1.Abysall = getgenv().Abysall

function G.g1.CloneReference(Object)
    if G.g1.Abysall and G.g1.Abysall.Environment.cloneref then
        return G.g1.Abysall.Environment.cloneref(Object)
    end
    return Object
end

G.g1.Services = setmetatable({}, {
    __index = function(Self, Name)
        return G.g1.CloneReference(game:GetService(Name))
    end
})

if G.g1.Abysall.Environment.writefile and G.g1.Abysall.Environment.readfile then
    if not G.g1.Abysall.Environment.isfile("Abysall/UserData.json") then
        local Data = {
            TotalExecutions = 0,
            UILibrary = "Obsidian"
        }

        G.g1.Abysall.Environment.writefile(
            "Abysall/UserData.json",
            G.g1.Services.HttpService:JSONEncode(Data)
        )
    end

    local UserData = G.g1.Abysall.Environment.readfile("Abysall/UserData.json")
    local Decoded = G.g1.Services.HttpService:JSONDecode(UserData)

    if not Decoded.TotalExecutions then
        Decoded.TotalExecutions = 0
    end

    Decoded.TotalExecutions = Decoded.TotalExecutions + 1

    if not Decoded.UILibrary then
        Decoded.UILibrary = "Obsidian"
    end

    G.g1.Abysall.TotalExecutions = Decoded.TotalExecutions
    G.g1.Abysall.UILibrary = Decoded.UILibrary

    G.g1.Abysall.Environment.writefile(
        "Abysall/UserData.json",
        G.g1.Services.HttpService:JSONEncode(Decoded)
    )
end

G.g1.Abysall.Interface = loadstring(game:HttpGet(
    BaseUrl .. "Components/Interface.luau"
))()

G.g1.Abysall.Analytics = loadstring(game:HttpGet(
    BaseUrl .. "Components/Analytics.luau"
))()


G.g1.Abysall.SavePath = "Doors/Game"

G.g2.Library = G.g1.Abysall.Interface.Library
G.g2.SaveManager = G.g1.Abysall.Interface.SaveManager
G.g2.ThemeManager = G.g1.Abysall.Interface.ThemeManager

G.g2.Toggles = G.g2.Library.Toggles
G.g2.Options = G.g2.Library.Options

function G.g2.CloneReference(Object)
	if G.g1.Abysall and G.g1.Abysall.Environment.cloneref then
		return G.g1.Abysall.Environment.cloneref(Object)
	end
	return Object
end

G.g2.Services = setmetatable({}, {
	__index = function(Self, Name)
		return G.g2.CloneReference(game:GetService(Name))
	end
})



-- archives and stairwell locals
G.g2.TimeShowerSourceLabel = nil
G.g2.TimeShowerToken = 0
G.g2.TimeShowerConnection = nil
G.g2.BypassDronesStampedeConnection = nil
G.g2.HonchoCorrectBoxConnection = nil
G.g2.HonchoAutoDepositConnection = nil
G.g2.HonchoESPObjects = {}
G.g2.HonchoProcessedRooms = {}
G.g2.HonchoDepositCache = {}
G.g2.AntiClosetTrash_Connection = nil
G.g2.AntiRansom_Connection = nil
G.g2.ForgetMeNotConnection = nil
G.g2.ForgetMeNotRunning = false
G.g2.ForgetMeNotProcessing = {}
G.g2.ForgetMeNotNotified = {}
G.g2.WaterBypassConnection = nil
G.g2.WaterParts = {}
G.g2.AlmaConnection = nil
G.g2.AntiScribbles_Connection = nil
G.g2.DroneConnection = nil
G.g2.DroneWalkedIntoParents = {}
G.g2.OrbitDroppedItemsConnection = nil
G.g2.OrbitDroppedItemsAngle = 0
G.g2.OrbitDroppedItemsLastTeleport = 0
G.g2.OrbitDroppedItemsPauseUntil = 0
G.g2.droppedItemsIntervalRunning = false
G.g2.Connections = {}



G.g2.Globals = {}
G.g2.Connections_2 = {}
G.g2.ESPConnections = {}
G.g2.Groupboxes = {}
G.g2.FakePrompts = {}
G.g2.Functions = {}
G.g2.PartProperties = {}

G.g2.Objects = {
	Prompts = {},
	Objectives = {},
	Doors = {},
	HidingSpots = {},
	Entities = {},
	SeekObstructions = {},
	Items = {},
	Chests = {},
	Currency = {},
	Ladders = {},
	Misc = {},
	Obstructions = {},
	EventTriggers = {},
	JumpscareModules = {},
	SeekHighlights = {},
	EyestalkHighlights = {},
	SeekNodes = {},
	SeekDuckBoards = {},
	SeekBridges = {},
	PathLights = {}
}

G.g2.Globals.IncompatibleMessage = "Your executor doesn't support this feature."

G.g2.Functions.CheckCompatability = function(Array)
	for _, Name in Array do
		if not G.g1.Abysall.Environment[Name] then
			return false
		end
	end
	return true
end


-- DontGroup
local LocalPlayer = G.g2.Services.Players.LocalPlayer



G.g3.PortraitName = "MirrorRig_Portrait_" .. LocalPlayer.Name


G.g3.Entities = {
	["Weaveling"] = {
		Alias = "Weaveling",
		NotifyMessage = { Title = "Weaveling has spawned", Body = "Try to grab it" }
	},
	["Creak-HALLOWEEN26"] = {
		Alias = "CreakHalloween",
		NotifyMessage = { Title = "Sir Abraham Creakstopher II spawned", Body = "He scary"}
	},
	["TV_Stand"] = {
		Alias = "Noise_TV",
		NotifyMessage = { Title = "Noise tv spawned.", Body = "Dont get near it" }
	},
	[G.g3.PortraitName] = {
		Alias = "Portrait",
		NotifyMessage = { Title = "Portrait' has spawned.", Body = "Use him to duplicate items." }
	},
	["StemsEntity"] = {
	    Alias = 'Balls',
		NotifyMessage = { Title = "Balls", Body = "Balls."}
	},
	["NoiseModel"] = {
		Alias = 'Noise',
		NotifyMessage = { Title = "Entity 'Noise' has spawned.", Body = "Dont let it touch you." }
	},
	["Creak"] = {
		Alias = "Creak",
		NotifyMessage = { Title = "Entity 'Creak' has spawned.", Body = "Dont touch him." }
	},
	["DronesStampede"] = {
		Alias = "DronesStampede",
		NotifyMessage = { Title = "Entity 'Drones Stampede' has spawned.", Body = "Find a hiding spot." }
	},
	["TellerRig"] = {
		Alias = "Teller",
		NotifyMessage = { Title = "Entity 'Teller' has spawned.", Body = "Dont worry, hes only annoying." }
	},
	["Scribbles"] = {
		Alias = "Scribbles",
		NotifyMessage = { Title = "Entity 'Scribbles' has spawned.", Body = "Find a hiding spot." }
	},
	["BashMoving"] = {
		Alias = "Bash",
		NotifyMessage = { Title = "Entity 'Bash' has spawned.", Body = "Find a hiding spot."}
	},
	["RushMoving"] = {
		Alias = "Rush",
		NotifyMessage = { Title = "Entity 'Rush' has spawned.", Body = "Find a hiding spot." }
	},
	["AmbushMoving"] = {
		Alias = "Ambush",
		NotifyMessage = { Title = "Entity 'Ambush' has spawned.", Body = "Find a hiding spot." }
	},
	["Eyes"] = {
		Alias = "Eyes",
		NotifyMessage = { Title = "Entity 'Eyes' has spawned.", Body = "Avoid looking at it." }
	},
	["Lookman"] = {
		Alias = "Eyes",
		NotifyMessage = { Title = "Entity 'Eyes' has spawned.", Body = "Avoid looking at it." }
	},
	["BackdoorRush"] = {
		Alias = "Blitz",
		NotifyMessage = { Title = "Entity 'Blitz' has spawned.", Body = "Find a hiding spot." }
	},
	["BackdoorLookman"] = {
		Alias = "Lookman",
		NotifyMessage = { Title = "Entity 'Lookman' has spawned.", Body = "Avoid looking at its eyes." }
	},
	["Groundskeeper"] = {
		Alias = "Groundskeeper",
		NotifyMessage = { Title = "Entity 'Groundskeeper' has spawned.", Body = "Avoid stepping on the grass." }
	},
	["A60"] = {
		Alias = "A-60",
		NotifyMessage = { Title = "Entity 'A-60' has spawned.", Body = "Find a hiding spot." }
	},
	["A120"] = {
		Alias = "A-120",
		NotifyMessage = { Title = "Entity 'A-120' has spawned.", Body = "Find a hiding spot." }
	},
	["GloombatSwarm"] = {
		Alias = "Gloombat Swarm",
		NotifyMessage = { Title = "Entity 'Gloombat Swarm' has spawned.", Body = "Keep all light sources turned off." }
	},
	["GlitchRush"] = {
		Alias = "RNIUSHCG==",
		NotifyMessage = { Title = "Entity 'RNIUSHCG==' has spawned.", Body = "Find a hiding spot." }
	},
	["GlitchAmbush"] = {
		Alias = "AR0xMBUSH",
		NotifyMessage = { Title = "Entity 'AR0xMBUSH' has spawned.", Body = "Find a hiding spot." }
	},
	["MonumentEntity"] = {
		Alias = "Monument",
		NotifyMessage = { Title = "Entity 'Monument' has spawned.", Body = "It can't move while you are looking at it." }
	},
	["JeffTheKiller"] = {
		Alias = "Jeff the Killer",
		NotifyMessage = { Title = "Entity 'Jeff the Killer' has spawned.", Body = "Avoid touching him." }
	},
	["CustomEntity"] = {
		Alias = "Custom Entity",
		NotifyMessage = { Title = "Entity 'Custom Entity' has spawned.", Body = "Find a hiding spot." }
	},
	["FrozenAmbush"] = {
		Alias = "Frozen Ambush",
		NotifyMessage = { Title = "Entity 'Frozen Ambush' has spawned.", Body = "Find a hiding spot." }
	},
	["SallyMoving"] = {
		Alias = "Sally",
		NotifyMessage = { Title = "Entity 'Sally' has spawned.", Body = "Find her horse and rop it." }
	}
}

G.g3.EntityIcons = {
	["RushMoving"]      = "rbxassetid://10716032262",
	["AmbushMoving"]    = "rbxassetid://10110576663",
	["A60"]             = "rbxassetid://12571092295",
	["A120"]            = "rbxassetid://12711591665",
	["BackdoorRush"]    = "rbxassetid://16602023490",
	["Eyes"]            = "rbxassetid://10183704772",
	["Lookman"]         = "rbxassetid://10183704772",
	["BackdoorLookman"] = "rbxassetid://16764872677",
	["GloombatSwarm"]   = "rbxassetid://79221203116470",
	["Halt"]            = "rbxassetid://11331795398",
	["JeffTheKiller"]   = "rbxassetid://94479432156278",
	["GlitchRush"]      = "rbxassetid://73859273102919",
	["GlitchAmbush"]    = "rbxassetid://88369678433359",
	["SallyMoving"]     = "rbxassetid://10840888070",
	["MonumentEntity"]  = "rbxassetid://88933556873017",
	["Groundskeeper"]   = "rbxassetid://114991380115557"
}

G.g3.ItemNames = {
    ["AbrahamHat"]       = "Hat",
    ["LargeScrew"]       = "Screw",
    ["KeyJewelry"]       = "Jewerly Key",
    ["Leftovers"]        = "Lunch Box",
    ["Haybale"]          = "Haybale",
    ["WizardHat"]        = "Wizard Hat",
    ["CandyBasket"]      = "Candy Basket",
    ["BrokenHeadstone"]  = "Broken Headstone",
    ["GiantGummyworm"]   = "Giant Gummyworm",
    ["ChocolateCrate"]   = "Crate of Chocolate",
    ["CandyBucket"]      = "Candy Bucket",
    ["LargeCandyBag"]    = "Large Candy Bag",
    ["SmallCauldron"]    = "Small Cauldron",
    ["ObjectScanner"]    = "Scanner",
    ["Drive"]            = "Drive",
	["DinkyLamp"]         = "Lamp",
	["BottleCrate"]       = "18+ Bottles",
	["GweenSodaPack"]     = "Gween Soda Pack",
	["BrokenMonitor"]     = "Broken Monitor",
	["JerryCan"]          = "Jerry Can",
 	["SallyToyObtain"]    = "Sally Toy",
	["Leftovers"]         = "Lunch Box",
	["HoneyPot"]          = "Honey Pot",
	["FihFlakes"]         = "Fih Food",
	["SecretCD"]          = "CD Disc",
	["Pizza"]             = "Pizza",
	["PaperPlanePickup"]  = "Paper Plane",
	["Lighter"]           = "Lighter",
	["Flashlight"]        = "Flashlight",
	["Lockpick"]          = "Lockpicks",
	["Vitamins"]          = "Vitamins",
	["Bandage"]           = "Bandage",
	["StarVial"]          = "Starlight Vial",
	["StarBottle"]        = "Starlight Bottle",
	["StarJug"]           = "Starlight Barrel",
	["Shakelight"]        = "Gummy Flashlight",
	["Straplight"]        = "Straplight",
	["Bulklight"]         = "Spotlight",
	["Battery"]           = "Battery",
	["Candle"]            = "Candle",
	["Crucifix"]          = "Crucifix",
	["CrucifixWall"]      = "Crucifix",
	["Glowsticks"]        = "Glowstick",
	["SkeletonKey"]       = "Skeleton Key",
	["Candy"]             = "Candy",
	["ShieldMini"]        = "Mini Shield Potion",
	["ShieldBig"]         = "Big Shield Potion",
	["BandagePack"]       = "Bandage Pack",
	["BatteryPack"]       = "Battery Pack",
	["RiftCandle"]        = "Moonlight Candle",
	["LaserPointer"]      = "Laser Pointer",
	["HolyGrenade"]       = "Holy Hand Grenade",
	["Shears"]            = "Shears",
	["Smoothie"]          = "Smoothie",
	["Cheese"]            = "Cheese",
	["Bread"]             = "Bread",
	["AlarmClock"]        = "Alarm Clock",
	["RiftSmoothie"]      = "Moonlight Smoothie",
	["GweenSoda"]         = "Gween Soda",
	["GlitchCube"]        = "Glitch Fragment",
	["Scanner"]           = "Tablet",
	["Bomb"]              = "Bomb",
	["Knockbomb"]         = "Knockbomb",
	["Nanner"]            = "Nanner",
	["BigBomb"]           = "Big Bomb",
	["SnakeBox"]          = "Hiding Box",
	["GoldGun"]           = "Golden Gun",
	["StopSign"]          = "Stop Sign",
	["TipJar"]            = "Tip Jar",
	["Lantern"]           = "Lantern",
	["IronKey"]           = "Iron Key",
	["LotusPetal"]        = "Lotus Petal",
	["Compass"]           = "Compass",
	["LotusPetalPickup"]  = "Lotus Petal",
	["LanternLitItem"]    = "Lantern",
	["KeyIron"]           = "Iron Key",
	["IronKeyForCrypt"]   = "Iron Key",
	["LotusHolder"]       = "Lotus Petal",
	["Multitool"]         = "Multitool",
	["RiftJar"]           = "Rift Jar",
	["AloeVera"]          = "Aloe Vera",
	["Donut"]             = "Donut",
	["Lotus"]             = "Lotus",
	["BoxingGloves"]      = "Boxing Gloves"
}

G.g3.CutsceneNames = {
    "Figure",
    "FigureEnd",
    "FigureHotelEnd",
    "FigureHotelFire",
    "SeekIntroFools",
    "SeekIntroHotel",
    "SeekIntroMines",
    "SeekIntroMines2",
    "SerewSeekDrain",
    "SewerSeekLower",
    "GrumbleNestEnd",
    "EyestalkIntro",
}

G.g3.Character = nil
G.g3.Humanoid = nil
G.g3.RootPart = nil

G.g3.Collision = nil
G.g3.CollisionClone = nil
G.g3.CollisionPart = nil
G.g3.CollisionPartClone = nil

G.g3.Camera = workspace:FindFirstChild("Camera")

G.g3.RemotesFolder   = G.g2.Services.ReplicatedStorage:FindFirstChild("RemotesFolder")
G.g3.LiveModifiers   = G.g2.Services.ReplicatedStorage:FindFirstChild("LiveModifiers")
G.g3.FloorReplicated = G.g2.Services.ReplicatedStorage:FindFirstChild("FloorReplicated")

G.g3.CurrentRooms    = G.g2.Services.Workspace:FindFirstChild("CurrentRooms")

G.g3.Drops           = G.g2.Services.Workspace:FindFirstChild("Drops")
G.g3.GameData        = G.g2.Services.ReplicatedStorage:WaitForChild("GameData")
G.g3.Floor           = G.g3.GameData:WaitForChild("Floor").Value
G.g3.LatestRoom      = G.g3.GameData:WaitForChild("LatestRoom")
G.g3.FinishedLoadingRoom = G.g3.GameData:FindFirstChild("FinishedLoadingRoom")
G.g3.RunService = game:GetService("RunService")

if G.g3.FinishedLoadingRoom then
	G.g3.FinishedLoadingRoom:Destroy()
end

function G.g4.GetHiddenContainer()
	if G.g2.Functions.CheckCompatability({"gethui"}) then
		return G.g1.Abysall.Environment.gethui()
	end
	return G.g2.Services.CoreGui
end

G.g4.NotificationLibrary = {
	LiveNotifications = 0,
	Notifications = 1
}

G.g4.Container = Instance.new("ScreenGui")
G.g4.Container.Name = G.g1.Abysall.ESPLibrary:GenerateRandomString()
G.g4.Container.Parent = G.g4.GetHiddenContainer()
G.g4.Container.DisplayOrder = 32767
G.g4.Container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if not G.g2.Library.Scheme then
	G.g2.Library.Scheme = setmetatable({}, {
		__index = function(Self, Name)
			return G.g2.Library[Name]
		end
	})
end

function G.g4.NotificationLibrary:Notify(TitleText, Desc, Delay)
	task.spawn(function()
		local Notification = Instance.new("Frame")
		local Line = Instance.new("Frame")
		local Warning = Instance.new("ImageLabel")
		local UICorner = Instance.new("UICorner")
		local UICorner2 = Instance.new("UICorner")
		local Title = Instance.new("TextLabel")
		local Description = Instance.new("TextLabel")

		Notification.Name = "Notification"
		Notification.Parent = G.g4.Container
		Notification.BackgroundColor3 = G.g2.Library.Scheme.BackgroundColor
		Notification.BackgroundTransparency = 0.4
		Notification.BorderSizePixel = 0
		Notification.Position = UDim2.new(1, 5, 0, 60 + (60 * G.g4.NotificationLibrary.LiveNotifications))
		Notification.Size = UDim2.new(0, 420, 0, 50)
		Notification:SetAttribute("ID", G.g4.NotificationLibrary.Notifications)
		Notification:SetAttribute("CurrentPosition", Notification.Position)

		Line.Name = "Line"
		Line.Parent = Notification
		Line.BackgroundColor3 = G.g2.Library.Scheme.AccentColor
		Line.BorderSizePixel = 0
		Line.Position = UDim2.new(0, 0, 1, -3)
		Line.Size = UDim2.new(0, 0, 0, 3)

		Warning.Name = "Warning"
		Warning.Parent = Notification
		Warning.BackgroundTransparency = 1
		Warning.Position = UDim2.new(0, 10, 0, 5)
		Warning.Size = UDim2.new(0, 40, 0, 40)
		Warning.Image = "rbxassetid://3944668821"
		Warning.ImageColor3 = G.g2.Library.Scheme.AccentColor
		Warning.ScaleType = Enum.ScaleType.Fit

		UICorner.CornerRadius = UDim.new(0, 20)
		UICorner.Parent = Warning

		UICorner2.CornerRadius = UDim.new(0, 4)
		UICorner2.Parent = Notification

		Title.Name = "Title"
		Title.Parent = Notification
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.Position = UDim2.new(0, 60, 0.155, 0)
		Title.Size = UDim2.new(0, 205, 0, 15)
		Title.Text = TitleText or "..."
		Title.TextColor3 = G.g2.Library.Scheme.FontColor
		Title.TextSize = 10
		Title.TextStrokeTransparency = 0.75
		Title.TextXAlignment = Enum.TextXAlignment.Left

		Description.Name = "Description"
		Description.Parent = Notification
		Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Description.BackgroundTransparency = 1
		Description.Position = UDim2.new(0, 60, 0.483, 0)
		Description.Size = UDim2.new(0, 205, 0, 18)
		Description.Text = Desc or "..."
		Description.TextColor3 = G.g2.Library.Scheme.FontColor
		Description.TextTransparency = 0.1
		Description.TextSize = 10
		Description.TextStrokeTransparency = 0.75
		Description.TextXAlignment = Enum.TextXAlignment.Left

		G.g4.NotificationLibrary.LiveNotifications += 1
		G.g4.NotificationLibrary.Notifications += 1

		G.g2.Services.TweenService:Create(
			Notification,
			TweenInfo.new(1, Enum.EasingStyle.Exponential),
			{ Position = UDim2.new(1, -370, 0, Notification.Position.Y.Offset) }
		):Play()

		task.wait(0.25)
		if typeof(Delay) == "Instance" then
			Delay.Destroying:Wait()
		else
			G.g2.Services.TweenService:Create(
				Line,
				TweenInfo.new(Delay - 0.25, Enum.EasingStyle.Linear),
				{ Size = UDim2.new(0, 400, 0, 3) }
			):Play()
			task.wait(Delay - 0.25)
		end

		Notification:SetAttribute("Destroying", true)

		G.g2.Services.TweenService:Create(
			Notification,
			TweenInfo.new(0.75, Enum.EasingStyle.Exponential, Enum.EasingDirection.In),
			{ Position = UDim2.new(1, 5, 0, Notification.Position.Y.Offset) }
		):Play()

		G.g4.NotificationLibrary.LiveNotifications -= 1

		local NotifId = Notification:GetAttribute("ID")
		local NotifY = Notification:GetAttribute("CurrentPosition").Y.Offset

		for _, Object in G.g4.Container:GetChildren() do
			if Object.Name == "Notification"
				and Object:GetAttribute("ID")
				and Object:GetAttribute("ID") > NotifId
				and Object:GetAttribute("Destroying") ~= true
				and Object.Position.Y.Offset ~= 60
			then
				local NewY = Object:GetAttribute("CurrentPosition").Y.Offset - 60
				Object:SetAttribute("CurrentPosition", UDim2.new(1, -450, 0, NewY))
				G.g2.Services.TweenService:Create(
					Object,
					TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut),
					{ Position = UDim2.new(1, -370, 0, NewY) }
				):Play()
			end
		end

		task.wait(0.75)
		Notification:Destroy()
	end)
end

G.g2.Globals.DoorsNotify = function(NotifyOptions)
	local function PlaySound(Parent, SoundId, Volume)
		local Sound = Instance.new("Sound")
		Sound.SoundId = SoundId
		Sound.Volume = Volume or 1
		Sound.Parent = Parent
		task.spawn(function()
			task.wait(0.1)
			Sound:Play()
			Sound.Ended:Wait()
			Sound:Destroy()
		end)
	end

	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
	local UIContainer = PlayerGui:FindFirstChild("GlobalUI") or PlayerGui:FindFirstChild("MainUI")
	if not UIContainer then return end

	local AchievementsHolder = UIContainer:FindFirstChild("AchievementsHolder")
	if not AchievementsHolder then return end

	local Achievement = AchievementsHolder.Achievement:Clone()
	Achievement.Size = UDim2.new(0, 0, 0, 0)
	Achievement.Frame.Position = UDim2.new(1.1, 0, 0, 0)
	Achievement.Name = "LiveAchievement"
	Achievement.Visible = true

	Achievement.Frame.TextLabel.Text = NotifyOptions.Style or "NOTIFICATION"
	Achievement.Frame.Details.Title.Text = NotifyOptions.Title or "Sem Título"
	Achievement.Frame.Details.Desc.Text = NotifyOptions.Description or "Sem Descrição"
	Achievement.Frame.Details.Reason.Text = NotifyOptions.Reason or ""
	Achievement.Frame.ImageLabel.Image = (NotifyOptions.Image ~= "" and NotifyOptions.Image) or "rbxassetid://6023426923"

	local Color = NotifyOptions.Color or Color3.new(1, 1, 1)
	Achievement.Frame.TextLabel.TextColor3 = Color
	Achievement.Frame.UIStroke.Color = Color
	Achievement.Frame.Glow.ImageColor3 = Color
	Achievement.Parent = AchievementsHolder

	PlaySound(AchievementsHolder, "rbxassetid://10469938989", 1)

	task.spawn(function()
		Achievement:TweenSize(UDim2.new(1, 0, 0.2, 0), "In", "Quad", 0.8, true)
		task.wait(0.8)
		Achievement.Frame:TweenPosition(UDim2.new(0, 0, 0, 0), "Out", "Quad", 0.5, true)
		G.g2.Services.TweenService:Create(
			Achievement.Frame.Glow,
			TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
			{ ImageTransparency = 1 }
		):Play()

		if typeof(NotifyOptions.Time) == "Instance" then
			NotifyOptions.Time.Destroying:Wait()
		else
			task.wait(NotifyOptions.Time or 5)
		end

		Achievement.Frame:TweenPosition(UDim2.new(1.1, 0, 0, 0), "In", "Quad", 0.5, true)
		task.wait(0.5)
		Achievement:TweenSize(UDim2.new(1, 0, -0.1, 0), "InOut", "Quad", 0.5, true)
		task.wait(0.5)
		Achievement:Destroy()
	end)
end

G.g2.Globals.STX = loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/Components/STX.luau"))()
G.g2.Functions.Notify = function(Settings)
	local HiddenContainer = G.g4.GetHiddenContainer()

	if not Settings.Body then
		Settings.Body = "..."
	end

	if not G.g2.Options.NotifyStyle or G.g2.Options.NotifyStyle.Value == "Abysall" then
		local Sound = Instance.new("Sound", HiddenContainer)
		Sound.SoundId = "rbxassetid://8784885431"
		Sound.Volume = (G.g2.Toggles.NotifyPlaySound and G.g2.Toggles.NotifyPlaySound.Value and G.g2.Options.NotifySoundVolume.Value) or (G.g2.Toggles.NotifyPlaySound and 0 or 3)
		Sound.PlayOnRemove = true
		Sound:Destroy()
		G.g4.NotificationLibrary:Notify(Settings.Title, Settings.Body, Settings.Time or 5)
	elseif G.g2.Options.NotifyStyle.Value == "Doors" then
		local IsEntity = false
		local EntityName = ""
		for Index, Object in pairs(G.g3.Entities) do
			if Object.NotifyMessage.Title == Settings.Title or Object.NotifyMessage.Body == Settings.Body then
				IsEntity = true
				EntityName = Index
			end
		end
		G.g2.Globals.DoorsNotify({
			Title = "Abysall Hub",
			Description = Settings.Title,
			Reason = Settings.Body,
			Style = IsEntity and "WARNING" or "NOTIFICATION",
			Color = IsEntity and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 222, 189),
			Image = Settings.Image,
			Time = Settings.Time
		})
	elseif G.g2.Options.NotifyStyle.Value == "STX" then
		local Sound = Instance.new("Sound", HiddenContainer)
		Sound.SoundId = "rbxassetid://4590657391"
		Sound.Volume = (G.g2.Toggles.NotifyPlaySound and G.g2.Toggles.NotifyPlaySound.Value and G.g2.Options.NotifySoundVolume.Value) or (G.g2.Toggles.NotifyPlaySound and 0 or 3)
		Sound.PlayOnRemove = true
		Sound:Destroy()

		if Settings.Image then
			G.g2.Globals.STX:Notify(
				{Title = "Abysall Hub", Description = Settings.Title .. "\n" .. Settings.Body},
				{OutlineColor = G.g2.Library.Scheme.AccentColor,Time = Settings.Time or 5, Type = "image"},
				{Image = Settings.Image, ImageColor = Color3.fromRGB(255, 255, 255)}
			)
		else
			G.g2.Globals.STX:Notify(
				{Title = "Abysall Hub", Description = Settings.Title .. "\n" .. Settings.Body},
				{OutlineColor = G.g2.Library.Scheme.AccentColor,Time = Settings.Time or 5, Type = "default"}
			)
		end
	else
		local Sound = Instance.new("Sound", HiddenContainer)
		Sound.SoundId = "rbxassetid://4590662766"
		Sound.Volume = (G.g2.Toggles.NotifyPlaySound and G.g2.Toggles.NotifyPlaySound.Value and G.g2.Options.NotifySoundVolume.Value) or (G.g2.Toggles.NotifyPlaySound and 0 or 3)
		Sound.PlayOnRemove = true
		Sound:Destroy()
		G.g2.Library:OldNotify({ Title = Settings.Title, Description = Settings.Body, Time = Settings.Time })
	end
end

G.g2.Functions.Caption = function(Text, PlaySound)
	if typeof(PlaySound) ~= "boolean" then
		PlaySound = true
	end
	local CaptionValue = Instance.new("NumberValue")
	local Caption = G.g2.Globals.MainUI:WaitForChild("MainFrame"):WaitForChild("Caption"):Clone()
	local CaptionSound = G.g2.Globals.MainUI:WaitForChild("Initiator"):WaitForChild("Main_Game"):WaitForChild("Reminder"):WaitForChild("Caption")
	local CaptionSoundClone = CaptionSound:Clone()
	CaptionSoundClone.Parent = CaptionSound.Parent
	CaptionSoundClone.Volume = 0.1

	Caption.Destroying:Connect(function()
		CaptionValue:Destroy()
	end)

	for _, Child in G.g2.Globals.MainUI:GetChildren() do
		if Child.Name == "LiveCaption" then
			Child:Destroy()
		end
	end

	Caption.Parent = G.g2.Globals.MainUI
	Caption.Visible = true
	Caption.Name = "LiveCaption"
	Caption.Text = Text

	if PlaySound then
		CaptionSoundClone:Play()
	end

	G.g2.Services.Debris:AddItem(CaptionSoundClone, 5)

	local HolderTween = G.g2.Services.TweenService:Create(CaptionValue, TweenInfo.new(3), { Value = 100 })
	HolderTween:Play()
	HolderTween.Completed:Connect(function()
		CaptionValue:Destroy()
		G.g2.Services.TweenService:Create(Caption, TweenInfo.new(4, Enum.EasingStyle.Linear), { TextTransparency = 1 }):Play()
		G.g2.Services.TweenService:Create(Caption, TweenInfo.new(4, Enum.EasingStyle.Linear), { TextStrokeTransparency = 1 }):Play()
	end)
end

G.g2.Functions.GetHasteTime = function()
	local TimeRemaining = G.g3.FloorReplicated.DigitalTimer.Value
	local Minutes = math.floor(TimeRemaining / 60)
	local Seconds = TimeRemaining - (Minutes * 60)
	local MinutesText = Minutes < 10 and ("0" .. tostring(Minutes)) or tostring(Minutes)
	local SecondsText = Seconds < 10 and ("0" .. tostring(Seconds)) or tostring(Seconds)
	return MinutesText .. ":" .. SecondsText
end

G.g2.Library.OldNotify = G.g2.Library.Notify
G.g2.Library.Notify = function(Data, Body, Time)
	G.g2.Functions.Notify({ Title = Body, Time = Time or 5 })
end

if not LocalPlayer.Character or not G.g3.CurrentRooms:FindFirstChildOfClass("Model") then
	G.g2.Functions.Notify({ Title = "Waiting for the game to load..." })
	while not LocalPlayer.Character or not G.g3.CurrentRooms:FindFirstChildOfClass("Model") do
		task.wait()
	end
	task.wait(4)
end

if not G.g3.RemotesFolder then
	if G.g2.Services.ReplicatedStorage:FindFirstChild("EntityInfo") then
		G.g3.RemotesFolder = G.g2.Services.ReplicatedStorage:FindFirstChild("EntityInfo")
	elseif G.g2.Services.ReplicatedStorage:FindFirstChild("Bricks") then
		G.g3.RemotesFolder = G.g2.Services.ReplicatedStorage:FindFirstChild("Bricks")
	end
end

if G.g3.Floor == "Hotel" and G.g3.RemotesFolder.Name == "Bricks" then
	G.g3.Floor = "OldHotel"
end

if not G.g3.LiveModifiers then
	G.g3.LiveModifiers = Instance.new("Folder")
end

if not G.g3.FloorReplicated then
	G.g3.FloorReplicated = Instance.new("Folder")
end

local FakeEvents = {
	Screech = Instance.new("RemoteEvent"),
	Shade   = Instance.new("RemoteEvent"),
	A90     = Instance.new("RemoteEvent"),
	Surge   = Instance.new("RemoteEvent"),
}

FakeEvents.Screech.Name  = "Screech"
FakeEvents.Shade.Name    = "ShadeResult"
FakeEvents.A90.Name      = "A90"
FakeEvents.Surge.Name    = "SurgeRemote"

FakeEvents.Screech_Real = G.g3.RemotesFolder:WaitForChild("Screech")
FakeEvents.Shade_Real   = G.g3.RemotesFolder:WaitForChild("ShadeResult")
FakeEvents.A90_Real     = G.g3.RemotesFolder:FindFirstChild("A90")
FakeEvents.Surge_Real   = G.g3.RemotesFolder:FindFirstChild("SurgeRemote")

if G.g3.RemotesFolder:FindFirstChild("FootstepRemoteThatWeNeed") then
    local RealRemote = G.g3.RemotesFolder:FindFirstChild("FootstepRemoteThatWeNeed")
    RealRemote:Destroy()

    local FakeRemote = Instance.new("RemoteEvent", G.g3.RemotesFolder)
    FakeRemote.Name = "FootstepRemoteThatWeNeed"
end

G.g2.Globals.FogInstances = {}
G.g2.Globals.OldFog = G.g2.Services.Lighting.FogEnd

for _, Object in G.g2.Services.Lighting:GetChildren() do
	if Object:IsA("Atmosphere") then
		Object:SetAttribute("Density_Old", Object.Density)

		local AtmoConnection = Object:GetPropertyChangedSignal("Density"):Connect(function()
			if Object.Density ~= 0 then
				Object:SetAttribute("Density_Old", Object.Density)
			end
			if G.g2.Toggles.RemoveCameraFog.Value then
				Object.Density = 0
			end
		end)

		Object.Destroying:Once(function()
			AtmoConnection:Disconnect()
		end)

		table.insert(G.g2.Connections_2, AtmoConnection)
		table.insert(G.g2.Globals.FogInstances, Object)
	end
end

G.g2.Globals.SeekNodesFolder = Instance.new("Folder", G.g2.Services.Workspace)
G.g2.Globals.SeekNodesFolder.Name = G.g1.Abysall.ESPLibrary:GenerateRandomString()

G.g2.Globals.RoomsNodesFolder = Instance.new("Folder", G.g2.Services.Workspace)
G.g2.Globals.RoomsNodesFolder.Name = G.g1.Abysall.ESPLibrary:GenerateRandomString()

G.g2.Functions.SendChat = function(Message)
	local Folder = G.g2.Services.ReplicatedStorage:FindFirstChild("DefaultChatSystemEvents") or Instance.new("Folder")
	local Event = Folder:FindFirstChild("SayMessageRequest") or Instance.new("RemoteEvent")
	Event:FireServer(Message, "All")
	local Channel = (G.g2.Services.TextChatService:FindFirstChild("TextChannels") and G.g2.Services.TextChatService.TextChannels:FindFirstChild("RBXGeneral")) or Instance.new("TextChannel")
	Channel:SendAsync(Message)
end

G.g2.Functions.IsCrouching = function()
	if G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel" then
		return G.g3.Character:GetAttribute("Crouching")
	end
	return G.g3.CollisionPart.CollisionGroup == "PlayerCrouching"
end

G.g2.Functions.GetInjuriesSpeed = function()
	return 0.075 * (G.g3.Humanoid.MaxHealth - G.g3.Humanoid.Health)
end

G.g2.Functions.GetCurrentSpeed = function()
	local Speed = 15
	Speed += G.g3.Character:GetAttribute("SpeedBoost") or 0
	Speed += G.g3.Character:GetAttribute("SpeedBoostBehind") or 0
	Speed += G.g3.Character:GetAttribute("SpeedBoostExtra") or 0
	Speed += (G.g3.Floor == "Party" and 10 or 0)
	Speed += (G.g3.LiveModifiers:FindFirstChild("PlayerFast") and 3 or 0)
	Speed += (G.g3.LiveModifiers:FindFirstChild("PlayerFaster") and 6 or 0)
	Speed += (G.g3.LiveModifiers:FindFirstChild("PlayerFastest") and 20 or 0)
	Speed -= (G.g3.LiveModifiers:FindFirstChild("PlayerSlow") and 3 or 0)
	Speed -= (G.g3.LiveModifiers:FindFirstChild("PlayerSlowHealth") and G.g2.Functions.GetInjuriesSpeed() or 0)
	if G.g2.Functions.IsCrouching() then
		if G.g3.LiveModifiers:FindFirstChild("PlayerCrouchSlow") then
			Speed -= 8
		elseif G.g3.LiveModifiers:FindFirstChild("PlayerSlow") then
			Speed -= 8
		else
			Speed -= 5
		end
	end
	return Speed
end

G.g2.Functions.GetMousePosition = function()
	if G.g2.Library.IsMobile then
		return Vector2.new(G.g3.Camera.ViewportSize.X / 2, G.g3.Camera.ViewportSize.Y / 2)
	end
	local MouseLocation = G.g2.Services.UserInputService:GetMouseLocation()
	return Vector2.new(MouseLocation.X, MouseLocation.Y)
end

G.g2.Functions.FormatOxygen = function(Oxygen)
	return "Oxygen: " .. (math.floor(Oxygen * 10) / 10) .. "%"
end

G.g2.Functions.IsHidePersistent = function()
	return G.g3.Floor == "Mines"
		or G.g3.Floor == "Ripple"
		or G.g3.Floor == "Party"
		or G.g3.LiveModifiers:FindFirstChild("HideLevel2") ~= nil
end

G.g2.Functions.GetPlayerFromMouse = function(TargetPart, MaxDistance)
	local Closest
	local ClosestDistance = math.huge

	for _, Player in G.g2.Services.Players:GetPlayers() do
		local Char = Player.Character
		if Char then
			local Target = Char:FindFirstChild(TargetPart)
			if Target then
				local Result = G.g3.Camera:WorldToViewportPoint(Target.Position)
				local ScreenPos = Vector2.new(Result.X, Result.Y)
				local Distance = (G.g2.Functions.GetMousePosition() - ScreenPos).Magnitude
				if Player.Name ~= LocalPlayer.Name and Distance < ClosestDistance and Distance < MaxDistance then
					Closest = Target
					ClosestDistance = Distance
				end
			end
		end
	end
	return Closest
end

local EntityDistances = {
	["RushMoving"]    = 85,
	["Scribbles"]	  = 100,
	["BashMoving"]    = 150,
	["DronesStampede"] = 100,
	["AmbushMoving"]  = 150,
	["A60"]           = 125,
	["A120"]          = 85,
	["GlitchRush"]    = 90,
	["GlitchAmbush"]  = 175,
	["BackdoorRush"]  = 85,
	["CustomEntity"]  = 85,
}

G.g2.Functions.GetNearestEntity = function(CheckDisabled, List, UseRaycasting)
	local Nearest = { Distance = math.huge, Object = nil }

	for _, Entity in G.g2.Objects.Entities do
		if not Entity or not Entity:IsA("Model") or not Entity:IsDescendantOf(G.g2.Services.Workspace) then continue end
		if not EntityDistances[Entity.Name] or not Entity.PrimaryPart then continue end

		local EntityData = G.g3.Entities[Entity.Name]
		if not EntityData then continue end
		if List and List[EntityData.Alias] then continue end

		local Distance = LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position)
		if Distance < EntityDistances[Entity.Name] and Distance < Nearest.Distance then
			if not CheckDisabled or Entity:GetAttribute("Inactive") ~= true then
				Nearest.Distance = Distance
				Nearest.Object = Entity
			end
		end
	end
	return Nearest.Object
end

G.g2.Functions.GetNearestFigure = function()
	local Nearest = { Distance = math.huge, Object = nil }
	local FigureNames = { FigureRig = true, FigureRagdoll = true, Figure = true }

	for _, Object in G.g2.Objects.Entities do
		if Object:IsA("Model") and Object.PrimaryPart and FigureNames[Object.Name] then
			local Distance = LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)
			if Distance < Nearest.Distance and Distance < 25 then
				Nearest.Distance = Distance
				Nearest.Object = Object
			end
		end
	end
	return Nearest.Object
end

G.g2.Functions.GetNearestHidingSpot = function()
	local Nearest = { Distance = math.huge, Object = nil }
	local LastHideSpot = G.g3.Character:FindFirstChild("LastHideSpot")

	local function IsHidingSpotName(Name)
		if typeof(Name) ~= "string" then return false end
		return string.find(string.lower(Name), "hidingspot") or string.find(string.lower(Name), "hiding_spot")
	end

	local function GetHidePrompt(Object)
	if not Object then return nil end

	local Prompt = Object:FindFirstChild("HidePrompt") or Object:FindFirstChild("HidingPrompt")
	if Prompt then return Prompt end

	for _, Child in Object:GetDescendants() do
		if (Child:IsA("ProximityPrompt") or Child:IsA("InteractPrompt"))
			and (Child.Name == "HidePrompt" or Child.Name == "HidingPrompt" or IsHidingSpotName(Child.Name))
		then
			return Child
		end
	end

	if IsHidingSpotName(Object.Name) or IsHidingSpotName(Object.Parent and Object.Parent.Name) then
		return Object:FindFirstChild("HidePrompt") or Object:FindFirstChild("HidingPrompt")
	end

	return nil
	end

	local function TryObject(Object)
		if not Object or not Object:IsDescendantOf(G.g2.Services.Workspace) then return end
		if not Object.PrimaryPart and not Object:FindFirstChildOfClass("BasePart") then return end
		local Prompt = GetHidePrompt(Object)
		if not Prompt then return end
		local PrimaryPart = Object.PrimaryPart or Object:FindFirstChildOfClass("BasePart")
		if not PrimaryPart then return end
		local Distance = LocalPlayer:DistanceFromCharacter(PrimaryPart.Position)
		if Distance < Prompt.MaxActivationDistance and Distance < Nearest.Distance then
			local Persistent = G.g2.Functions.IsHidePersistent()
			if not Persistent or (LastHideSpot and LastHideSpot.Value ~= Object) or not LastHideSpot then
				Nearest.Distance = Distance
				Nearest.Object = Object
			end
		end
	end

	for _, Object in G.g2.Objects.HidingSpots do
		TryObject(Object)
	end

	return Nearest.Object
end

G.g2.Functions.GetNearestTurnNode = function()
	local Nearest = { Distance = math.huge, Object = nil }

	for _, Node in G.g2.Objects.SeekNodes do
		local Distance = LocalPlayer:DistanceFromCharacter(Node.Position)
		if Distance < G.g2.Options.AutoSteerMinecartTurnDistance.Value and Distance < Nearest.Distance then
			Nearest.Distance = Distance
			Nearest.Object = Node
		end
	end
	return Nearest.Object
end

G.g2.Functions.GetNearestDuckBoard = function()
	local Nearest = { Distance = math.huge, Object = nil }

	for _, Board in G.g2.Objects.SeekDuckBoards do
		if Board.PrimaryPart then
			local Distance = LocalPlayer:DistanceFromCharacter(Board.PrimaryPart.Position)
			if Distance < G.g2.Options.AutoSteerMinecartDuckDistance.Value and Distance < Nearest.Distance then
				Nearest.Distance = Distance
				Nearest.Object = Board
			end
		end
	end
	return Nearest.Object
end

G.g2.Functions.GetCurrentAnchor = function()
	local AnchorCode = G.g2.Globals.MainUI.AnchorHintFrame.AnchorCode.Text
	for _, Anchor in G.g2.Objects.Objectives do
		if Anchor.Name == "MinesAnchor" and Anchor:FindFirstChild("Sign") then
			if Anchor.Sign.TextLabel.Text == AnchorCode then
				return Anchor
			end
		end
	end
end

G.g2.Functions.GetMinecart = function()
	return G.g3.Camera:FindFirstChild("MinecartRig") ~= nil
end

G.g2.Functions.HasItem = function(Name, OnlyCharacter)
	if not OnlyCharacter and LocalPlayer.Backpack:FindFirstChild(Name) then
		return LocalPlayer.Backpack:FindFirstChild(Name)
	elseif G.g3.Character:FindFirstChild(Name) then
		return G.g3.Character:FindFirstChild(Name)
	end
end

G.g2.Functions.GetFlyVelocity = function()
	if G.g3.Humanoid.MoveDirection == Vector3.zero then
		return G.g3.Humanoid.MoveDirection
	end
	local LookFlat = Vector3.new(G.g3.Camera.CFrame.LookVector.X, 0, G.g3.Camera.CFrame.LookVector.Z)
	local FlatFrame = CFrame.new(G.g3.Camera.CFrame.Position, G.g3.Camera.CFrame.Position + LookFlat)
	local Velocity = (G.g3.Camera.CFrame * CFrame.new(FlatFrame:VectorToObjectSpace(G.g3.Humanoid.MoveDirection))).Position - G.g3.Camera.CFrame.Position
	if Velocity == Vector3.zero then
		return Velocity
	end
	return Velocity.Unit
end

G.g2.Globals.PromptContainer = Instance.new("Folder")
G.g2.Globals.PromptContainer.Name = "PromptContainer"
G.g2.Globals.PromptContainer.Parent = G.g4.GetHiddenContainer()

local ESPBlacklist = {}

G.g2.Functions.AddESP = function(ESPOptions, RoomBased)
	local Object = ESPOptions.Object

	if table.find(ESPBlacklist, Object) then
		return
	end

	if RoomBased then
		local CurrentRoom = tonumber(LocalPlayer:GetAttribute("CurrentRoom"))
		local ObjectRoom = tonumber(Object:GetAttribute("ParentRoom"))

		if ObjectRoom == CurrentRoom or (table.find(G.g2.Objects.Doors, Object) and ObjectRoom == CurrentRoom + 1) then
			G.g1.Abysall.ESPLibrary:AddESP(ESPOptions)
		end

		local RoomConnection = LocalPlayer:GetAttributeChangedSignal("CurrentRoom"):Connect(function()
			if G.g1.Abysall.ESPLibrary.ColorTable[Object] then
				ESPOptions.Color = G.g1.Abysall.ESPLibrary.ColorTable[Object]
			end

			local NewCurrentRoom = tonumber(LocalPlayer:GetAttribute("CurrentRoom"))
			local ObjRoom = tonumber(Object:GetAttribute("ParentRoom"))

			if ObjRoom == NewCurrentRoom or (table.find(G.g2.Objects.Doors, Object) and ObjRoom == NewCurrentRoom + 1) then
				G.g1.Abysall.ESPLibrary:AddESP(ESPOptions)
			else
				G.g1.Abysall.ESPLibrary:RemoveESP(Object)
			end
		end)

		table.insert(G.g2.Connections_2, RoomConnection)
		G.g2.ESPConnections[Object] = RoomConnection

		Object.Destroying:Once(function()
			RoomConnection:Disconnect()
			if G.g1.Abysall then
				G.g1.Abysall.ESPLibrary:RemoveESP(Object)
			end
			local Pos = table.find(G.g2.Connections_2, RoomConnection)
			if Pos then table.remove(G.g2.Connections_2, Pos) end
		end)
	else
		G.g1.Abysall.ESPLibrary:AddESP(ESPOptions)
	end
end

G.g2.Functions.RemoveESP = function(Object)
	local Conn = G.g2.ESPConnections[Object]
	if Conn then
		Conn:Disconnect()
		G.g2.ESPConnections[Object] = nil
		local Pos = table.find(G.g2.Connections_2, Conn)
		if Pos then table.remove(G.g2.Connections_2, Pos) end
	end
	G.g1.Abysall.ESPLibrary:RemoveESP(Object)
end

G.g2.Functions.BlacklistESP = function(Object)
	table.insert(ESPBlacklist, Object)
end

G.g2.Functions.GetDoorNumber = function(Object)
	local DoorNumber = tonumber(Object.Parent.Name) or tonumber(Object.Parent.Parent.Name)
	if DoorNumber then
		DoorNumber = DoorNumber + 1
	end
	if G.g3.Floor == "Mines" then
		DoorNumber = DoorNumber + 100
	end
	if G.g3.Floor == "Backdoor" then
		DoorNumber = DoorNumber - 50
	end

	return tostring(DoorNumber)
end

G.g2.Functions.GetLibraryCode = function()
	local Paper = G.g3.Character:FindFirstChild("LibraryHintPaper")
		or G.g3.Character:FindFirstChild("LibraryHintPaperHard")
		or LocalPlayer.Backpack:FindFirstChild("LibraryHintPaper")
		or LocalPlayer.Backpack:FindFirstChild("LibraryHintPaperHard")

	if Paper and Paper:FindFirstChild("UI") then
		local Code = {}
		local CodeLength = G.g3.Floor == "Fools" and 10 or 5
		for I = 1, CodeLength do Code[I] = "_" end

		local HintChildren = LocalPlayer.PlayerGui.PermUI.Hints:GetChildren()
		local UIChildren = Paper.UI:GetChildren()

		for _, Hint in HintChildren do
			for _, UIChild in UIChildren do
				if Hint:IsA("ImageLabel") and UIChild:IsA("ImageLabel")
					and Hint.ImageRectOffset == UIChild.ImageRectOffset
					and Code[tonumber(UIChild.Name)]
				then
					Code[tonumber(UIChild.Name)] = Hint.TextLabel.Text
				end
			end
		end
		return table.concat(Code)
	end
	return G.g3.Floor == "Fools" and "__________" or "_____"
end

G.g2.Globals.UsedRandomCodes = {}
G.g2.Functions.GetRandomCode = function()
    local CodeTemplate = G.g2.Functions.GetLibraryCode()
    if not CodeTemplate then
        return nil
    end

    local NewCode
    local Tries = 0
    repeat
        NewCode = CodeTemplate:gsub("_", function()
            return tostring(math.random(0, 9))
        end)
        Tries = Tries + 1
    until not G.g2.Globals.UsedRandomCodes[NewCode] or Tries >= 10

    G.g2.Globals.UsedRandomCodes[NewCode] = true
    return NewCode
end

local Window = G.g2.Library:CreateWindow({
	Title = "Abysall Hub Continued",
	Footer = "dsc.gg/abysallhubcontinued",
	NotifySide = "Right",
	ShowCustomCursor = false,
	AutoShow = true,
	Center = true,
	TabPadding = 3,
	MenuFadeTime = 0,
	CornerRadius = 6,
})


G.g1.Abysall.Interface.ApplyInfoTab(Window)

local Tabs = {
	General = Window:AddTab("General", "house"),
	Exploits = Window:AddTab("Exploits", "shield"),
	Visuals = Window:AddTab("Visuals", "eye"),
	Floors = Window:AddTab("Floors", "earth"),
	Archives = Window:AddTab("Archives", "rbxassetid://104508835882225"),
	Stairwell = Window:AddTab("Stairwell", "rbxassetid://80017304328364"),
	Halloween = Window:AddTab("New - Halloween", "rbxassetid://101034055693026"),
}


G.g2.Groupboxes.General_Character = Tabs.General:AddLeftGroupbox("Character")
G.g2.Groupboxes.General_Character:AddSlider("SpeedBoostSlider", {
	Text = "Speed Boost", Min = 0, Max = 100, Default = 0, Rounding = 0, Compact = true
})
G.g2.Groupboxes.General_Character:AddToggle("SpeedBoostToggle", {
	Text = "Enable Speed Boost", Default = false, Tooltip = "Increases your walkspeed by the specified amount."
})
G.g2.Groupboxes.General_Character:AddToggle("FlyToggle", {
	Text = "Fly", Default = false, Tooltip = "Allows you to freely fly around the map."
})
G.g2.Toggles.FlyToggle:AddKeyPicker("FlyKeybind", {
	Text = "Fly", Default = "F", Mode = "Toggle", SyncToggleState = true
})
G.g2.Groupboxes.General_Character:AddSlider("FlySpeed", {
	Text = "Fly Speed", Min = 0, Max = 115, Default = 20, Rounding = 0, Compact = true
})
G.g2.Groupboxes.General_Character:AddDivider()
G.g2.Groupboxes.General_Character:AddToggle("NoclipToggle", {
	Text = "Noclip", Default = false, Tooltip = "Allows your character to pass through solid objects."
})
G.g2.Groupboxes.General_Character:AddToggle("RemoveClosetDelay", {
	Text = "Remove Closet Delay", Default = false,
	Tooltip = "Removes the short window where you can't exit out of a closet after the animation finishes."
})
G.g2.Groupboxes.General_Character:AddToggle("RemoveAcceleration", {
	Text = "Remove Acceleration", Default = false, Tooltip = "Prevents your character from sliding while moving."
})

local CustomPhysics

G.g2.Options.SpeedBoostSlider:OnChanged(function(Value)
	if G.g3.RemotesFolder:FindFirstChild("Crouch") then
		G.g3.RemotesFolder.Crouch:FireServer(Value and true or G.g2.Functions.IsCrouching(), true)
	end
end)

G.g2.Toggles.NoclipToggle:AddKeyPicker("NoclipKeybind", {
	Text = "Noclip", Default = "N", Mode = "Toggle", SyncToggleState = true
})
G.g2.Toggles.RemoveAcceleration:OnChanged(function(Value)
	for Index, Old in G.g2.PartProperties do
		Index.CustomPhysicalProperties = Value and CustomPhysics or Old
	end
end)

G.g2.Groupboxes.General_Character:AddDivider()
G.g2.Groupboxes.General_Character:AddToggle("EnableCharacterJump", {
	Text = "Enable Jumping", Default = false, Tooltip = "Allows your character to jump."
})
G.g2.Groupboxes.General_Character:AddToggle("EnableCharacterSlide", {
	Text = "Enable Sliding", Default = false, Tooltip = "Allows your character to slide."
})
G.g2.Groupboxes.General_Character:AddToggle("InfiniteJumps", {
	Text = "Infinite Jumps", Default = false, Tooltip = "Allows you to jump while in the air."
})

G.g5.OldJump = false
G.g5.OldSlide = false

G.g2.Toggles.SpeedBoostToggle:OnChanged(function(Value)
	if G.g3.Humanoid then
		G.g3.Humanoid.WalkSpeed = G.g2.Functions.GetCurrentSpeed() + (Value and G.g2.Options.SpeedBoostSlider.Value or 0)
	end
end)
G.g2.Toggles.EnableCharacterJump:OnChanged(function(Value)
	if G.g3.Character then
		G.g3.Character:SetAttribute("CanJump", Value and true or G.g5.OldJump)
	end
end)
G.g2.Toggles.EnableCharacterSlide:OnChanged(function(Value)
	if G.g3.Character then
		G.g3.Character:SetAttribute("CanSlide", Value and true or G.g5.OldSlide)
	end
end)

G.g2.Groupboxes.General_Self = Tabs.General:AddLeftGroupbox("Self")
G.g2.Groupboxes.General_Self:AddToggle("DoorReachToggle", {
	Text = "Door Reach", Default = false, Tooltip = "Allows you to open doors from further away."
})
G.g2.Groupboxes.General_Self:AddToggle("DisableIdleKick", {
	Text = "Disable Idle Kick", Default = false, Tooltip = "Prevents the kick from being idle for 20 minutes."
})
G.g2.Toggles.DisableIdleKick:OnChanged(function(Value)
	if G.g2.Functions.CheckCompatability({"getconnections"}) then
		for _, Conn in G.g1.Abysall.Environment.getconnections(LocalPlayer.Idled) do
			if Value then Conn:Disable() else Conn:Enable() end
		end
	end
end)
LocalPlayer.Idled:Connect(function()
	if G.g2.Toggles.DisableIdleKick.Value then
		G.g2.Services.VirtualUser:CaptureController()
		G.g2.Services.VirtualUser:ClickButton2(Vector2.new())
	end
end)

G.g2.Groupboxes.General_Self:AddDivider()
G.g2.Groupboxes.General_Self:AddSlider("PromptReachSlider", {
	Text = "Prompt Reach Multiplier", Min = 1, Max = 2, Default = 1, Rounding = 1, Compact = true
})
G.g2.Groupboxes.General_Self:AddToggle("InstantPrompts", {
	Text = "Instant Prompts", Default = false, Tooltip = "Allows you to trigger all prompts instantly."
})
G.g2.Groupboxes.General_Self:AddToggle("PromptClip", {
	Text = "Prompt Clip", Default = false, Tooltip = "Allows you to interact with prompts through walls."
})

G.g2.Options.PromptReachSlider:OnChanged(function(Value)
	for _, Prompt in G.g2.Objects.Prompts do
		Prompt.MaxActivationDistance = Prompt:GetAttribute("MaxActivationDistance_Old") * Value
	end
end)
G.g2.Toggles.InstantPrompts:OnChanged(function(Value)
	for _, Prompt in G.g2.Objects.Prompts do
		Prompt.HoldDuration = Value and 0 or Prompt:GetAttribute("HoldDuration_Old")
	end
end)
G.g2.Toggles.PromptClip:OnChanged(function(Value)
	for _, Prompt in G.g2.Objects.Prompts do
		Prompt.RequiresLineOfSight = Value and false or Prompt:GetAttribute("RequiresLineOfSight_Old")
	end
end)

G.g2.Groupboxes.Self_Automation = Tabs.General:AddRightGroupbox("Automation")
G.g2.Groupboxes.Self_Automation:AddToggle("AutoBreakerBox", {
	Text = "Auto Breaker Box", Default = false, Tooltip = "Automatically solves the breaker box."
})
G.g2.Groupboxes.Self_Automation:AddToggle("AutoSolveAnchors", {
	Text = "Auto Solve Anchors", Default = false,
	Tooltip = "Automatically enters the correct code into anchors when you are near them."
})
G.g2.Toggles.AutoBreakerBox:OnChanged(function(Value)
	if Value and G.g3.CurrentRooms:FindFirstChild("ElevatorBreaker", true) then
		if not G.g2.Globals.BreakerBoxInteracted then
			if not G.g2.Globals.BreakerBoxNotified then
				G.g2.Functions.Notify({ Title = "Interact with the breaker box.", Body = "It will be automatically solved." })
				G.g2.Globals.BreakerBoxInteracted = true
			end
		else
			G.g3.RemotesFolder.EBF:FireServer()
		end
	end
end)

G.g2.Groupboxes.Self_Automation:AddToggle("AutoHeartbeatMinigame", { Text = "Auto Heartbeat Minigame", Default = false, Tooltip = "Prevents the 'Figure' minigame from ever failing.", Disabled = not G.g2.Functions.CheckCompatability({"hookmetamethod", "newcclosure", "getnamecallmethod"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage })
G.g2.Groupboxes.Self_Automation:AddDivider()
G.g2.Groupboxes.Self_Automation:AddToggle("AutoUnlockPadlockToggle", {
	Text = "Auto Unlock Padlock", Default = false, Tooltip = "Automatically enters the code into the library padlock."
})
G.g2.Groupboxes.Self_Automation:AddSlider("AutoUnlockPadlockSlider", {
	Text = "Unlock Distance", Min = 1, Max = 50, Default = 10, Rounding = 0, Compact = true
})
G.g2.Groupboxes.Self_Automation:AddToggle("AutoLibraryGuessCode", {
	Text = "Guess Library Code", Default = false,
	Tooltip = "Attempts to guess the library code, but collecting some books is also necessary."
})
G.g2.Groupboxes.Self_Automation:AddDivider()
G.g2.Groupboxes.Self_Automation:AddToggle("AutoLibrary", {
	Text = "Auto Library", Default = false,
	Tooltip = "Automatically gets books and paper."
})
G.g2.Groupboxes.Self_Automation:AddToggle("SkipSeekHotel", {
	Text = "Skip Seek (Hotel)",
	Default = false,
	Tooltip = "Skips the entire Seek sections.",
})
G.g2.Groupboxes.Self_Automation:AddToggle("AutoBreakerRoom", {
	Text = "Auto Breaker Room",
	Default = false,
	Tooltip = "Automatically completes the breaker sequence in Hotel Room 100.",
})
G.g2.Groupboxes.Self_Automation:AddDivider()
G.g2.Toggles.AutoHotel = G.g2.Groupboxes.Self_Automation:AddToggle("AutoHotel", {
	Text = "Auto Hotel",
	Tooltip = "Automatically progresses through the hotel floor.",
	Risky = G.g3.Floor ~= "Ballz",
	Default = false
})
G.g2.Toggles.AutoHotelIgnoreEntities = G.g2.Groupboxes.Self_Automation:AddToggle("AutoHotelIgnoreEntities", {
	Text = "Ignore Entities",
	Tooltip = "Skip all entity waits and pauses.",
	Default = false
})
G.g2.Groupboxes.Self_Automation:AddDivider()
G.g2.Groupboxes.Self_Automation:AddToggle("AutoInteractToggle", {
	Text = "Auto Interact", Default = false, Tooltip = "Automatically triggers nearby prompts."
})
G.g2.Toggles.AutoInteractToggle:AddKeyPicker("AutoInteractKeybind", {
    Text = "Auto Interact",
    Default = "R",
    Mode = "Toggle",
    SyncToggleState = true
})
G.g2.Groupboxes.Self_Automation:AddDropdown("AutoInteractIgnoreList", {
	Text = "Ignore List",
	Values = { "Glitch Fragments", "Jeff Items", "Dropped Items", "Currency", "Minecarts", "Locks" },
	Default = { "Glitch Fragments", "Jeff Items", "Dropped Items" },
	Multi = true, AllowNull = true
})
G.g2.Groupboxes.Self_Automation:AddDivider()
G.g2.Groupboxes.Self_Automation:AddToggle("AutoClosetToggle", {
	Text = "Auto Closet", Default = false,
	Tooltip = "Automatically hides in a nearby closet when an entity is near."
})
G.g2.Toggles.AutoClosetToggle:AddKeyPicker("AutoClosetKeybind", {
	Text = "Auto Closet", Default = "Q", Mode = "Toggle", SyncToggleState = true
})
G.g2.Groupboxes.Self_Automation:AddDropdown("AutoClosetEntityList", {
	Text = "Ignore List",
	Values = { "Rush", "Ambush", "Blitz", "DronesStampede", "Scribbles", "A-60", "A-120", "AR0xMBUSH", "RNIUSHCG==" },
	Multi = true, AllowNull = true
})
G.g2.Groupboxes.Self_Automation:AddToggle("SpectateEntityToggle", {
	Text = "Spectate Entity",
	Default = false,
	Tooltip = "Spectates the entity while auto hiding."
})
G.g2.Groupboxes.Self_Automation:AddDropdown("SpecateEntityMode", {
	Values = {"Player to Entity", "Entity to Player"},
	Default = 1,
	AllowNull = true
})

G.g2.Groupboxes.Self_Misc = Tabs.General:AddRightGroupbox("Miscellaneous")
G.g2.Groupboxes.Self_Misc:AddButton({
	Text = "Play Again", Tooltip = "Makes you join a new run, click again to cancel.", DoubleClick = true,
	Func = function() G.g3.RemotesFolder.PlayAgain:FireServer() end
})
G.g2.Groupboxes.Self_Misc:AddButton({
	Text = "Return to Lobby", Tooltip = "Makes you teleport back to the lobby.", DoubleClick = true,
	Func = function() G.g3.RemotesFolder.Lobby:FireServer() end
})
G.g2.Groupboxes.Self_Misc:AddButton({
	Text = "Revive",
	Tooltip = "Makes you revive, if you have a revive and haven't already revived in this run.",
	DoubleClick = true,
	Func = function() G.g3.RemotesFolder.Revive:FireServer() end
})
G.g2.Groupboxes.Self_Misc:AddButton({
	Text = "Reset Character",
	Tooltip = "Kills your character on the server. (takes around 20 seconds if replicatesignal isn't supported)",
	DoubleClick = true,
	Func = function()
		G.g2.Globals.SelfKilled = true
		if G.g2.Functions.CheckCompatability({"replicatesignal"}) then
			G.g1.Abysall.Environment.replicatesignal(LocalPlayer.Kill)
		else
			if G.g3.RemotesFolder:FindFirstChild("Underwater") then
				G.g3.RemotesFolder.Underwater:FireServer(true)
			else
				G.g3.Humanoid.Health = 0
			end
		end
	end
})


Tabs.General:UpdateWarningBox({
	Visible = true,
	Title = "Risk Warning",
	Text = "Features highlighted in red are risky.",
})


G.g2.Toggles.SkipSeekHotel:OnChanged(function(Value)
	if not Value then return end
	if G.g3.Floor ~= "Hotel" then return end

	task.spawn(function()
		print("started")

		local currentRooms

		repeat
			if not G.g2.Toggles.SkipSeekHotel.Value or G.g3.Floor ~= "Hotel" then
				return
			end
			currentRooms = workspace:FindFirstChild("CurrentRooms")
			task.wait()
		until currentRooms

		print("got currentrooms")

		local lastTriggerRoom = nil

		while G.g2.Toggles.SkipSeekHotel.Value and G.g3.Floor == "Hotel" do
			local triggerRoom = nil

			print("waiting for trigger")

			repeat
				if not G.g2.Toggles.SkipSeekHotel.Value or G.g3.Floor ~= "Hotel" then
					return
				end

				currentRooms = workspace:FindFirstChild("CurrentRooms")
				local currentRoomNum = tonumber(LocalPlayer:GetAttribute("CurrentRoom"))

				if currentRoomNum and currentRoomNum ~= lastTriggerRoom then
					local room = currentRooms and currentRooms:FindFirstChild(tostring(currentRoomNum))
					if room then
						local trigger = room:WaitForChild("TriggerEventCollision", 0.5)
						if trigger then
							triggerRoom = currentRoomNum
							print("found trigger in", triggerRoom)
						end
					end
				end

				task.wait()
			until triggerRoom

			lastTriggerRoom = triggerRoom

			local roomNum = triggerRoom

			while G.g2.Toggles.SkipSeekHotel.Value and G.g3.Floor == "Hotel" do
				roomNum += 1
				print("looking for room", roomNum)

				local room
				repeat
					if not G.g2.Toggles.SkipSeekHotel.Value or G.g3.Floor ~= "Hotel" then
						return
					end
					currentRooms = workspace:FindFirstChild("CurrentRooms")
					room = currentRooms and currentRooms:FindFirstChild(tostring(roomNum))
					task.wait()
				until room

				print("found room", roomNum)

				local hasSeekArm = false
				local assets = room:FindFirstChild("Assets")
				if assets then
					for _, child in ipairs(assets:GetChildren()) do
						if child.Name == "Seek_Arm" then
							hasSeekArm = true
							print("found seek arm")
							break
						end
					end
				end

				local door
				repeat
					if not G.g2.Toggles.SkipSeekHotel.Value or G.g3.Floor ~= "Hotel" then
						return
					end
					door = room:FindFirstChild("Door", true)
					task.wait()
				until door

				print("found door, teleporting")

				repeat
					if not G.g2.Toggles.SkipSeekHotel.Value or G.g3.Floor ~= "Hotel" then
						return
					end
					if G.g3.Character then
						G.g3.Character:PivotTo(door:GetPivot())
					end
					task.wait()
				until door:GetAttribute("Opened") == true

				print("door opened")

				if hasSeekArm then
					if not G.g3.Character then
						return
					end

					print("voiding")

					local voidCFrame = G.g3.Character:GetPivot() + Vector3.new(0, -2500, 0)

					task.wait(0.25)

					for _ = 1, 20 do
						G.g3.Character:PivotTo(voidCFrame)
						task.wait()
					end

					task.wait(0.3)

					for _ = 1, 15 do
						G.g3.Character:PivotTo(voidCFrame)
						task.wait()
					end

					task.wait(0.2)

					for _ = 1, 10 do
						G.g3.Character:PivotTo(voidCFrame)
						task.wait()
					end

					print("done voiding")
					break
				end
			end
		end
	end)
end)

G.g2.Toggles.AutoLibrary:OnChanged(function(AutoLibraryEnabled)
	if AutoLibraryConnection then
		task.cancel(AutoLibraryConnection)
		AutoLibraryConnection = nil
	end

	if AutoLibraryRoomConnection then
		AutoLibraryRoomConnection:Disconnect()
		AutoLibraryRoomConnection = nil
	end

	if not AutoLibraryEnabled then
		return
	end

	AutoLibraryConnection = task.spawn(function()
		local AutoLibraryPlayers = game:GetService("Players")
		local AutoLibraryLocalPlayer = AutoLibraryPlayers.LocalPlayer
		local AutoLibraryCharacter = AutoLibraryLocalPlayer.Character or AutoLibraryLocalPlayer.CharacterAdded:Wait()
		local AutoLibraryHumanoidRootPart = AutoLibraryCharacter:WaitForChild("HumanoidRootPart")

		local AutoLibraryCurrentRooms = workspace:WaitForChild("CurrentRooms")
		local AutoLibraryRoom50 = AutoLibraryCurrentRooms:WaitForChild("50")
		local AutoLibraryLiveHintBooks = {}
		local AutoLibraryHintPaperObtained = false

		local function AutoLibraryIsInRoom50(AutoLibraryObject)
			return AutoLibraryObject
				and AutoLibraryObject:IsDescendantOf(AutoLibraryRoom50)
				and AutoLibraryObject:IsDescendantOf(AutoLibraryCurrentRooms)
				and AutoLibraryObject:IsDescendantOf(workspace)
		end

		local function AutoLibraryIsActuallyInRoom50()
			return tonumber(AutoLibraryLocalPlayer:GetAttribute("CurrentRoom")) == 50
		end

		while AutoLibraryEnabled and not AutoLibraryIsActuallyInRoom50() do
			task.wait(0.05)
		end

		if not AutoLibraryEnabled then
			return
		end

		local function AutoLibraryHasHintPaper()
			AutoLibraryCharacter = AutoLibraryLocalPlayer.Character

			if not AutoLibraryCharacter then
				return false
			end

			local AutoLibraryBackpackPaper = AutoLibraryLocalPlayer.Backpack:FindFirstChild("LibraryHintPaper", true)
			local AutoLibraryCharacterPaper = AutoLibraryCharacter:FindFirstChild("LibraryHintPaper", true)

			return AutoLibraryBackpackPaper ~= nil or AutoLibraryCharacterPaper ~= nil
		end

		local function AutoLibraryGetObjectCFrame(AutoLibraryObject)
			if not AutoLibraryIsActuallyInRoom50() then
				return nil
			end

			if not AutoLibraryIsInRoom50(AutoLibraryObject) then
				return nil
			end

			if AutoLibraryObject:IsA("Model") then
				return AutoLibraryObject:GetPivot()
			elseif AutoLibraryObject:IsA("BasePart") then
				return AutoLibraryObject.CFrame
			end

			local AutoLibraryObjectPart = AutoLibraryObject:FindFirstChildWhichIsA("BasePart", true)

			if AutoLibraryObjectPart then
				return AutoLibraryObjectPart.CFrame
			end

			return nil
		end

		local function AutoLibraryFindBooks(AutoLibraryObject)
			if not AutoLibraryIsActuallyInRoom50() then
				return
			end

			if not AutoLibraryIsInRoom50(AutoLibraryObject) then
				return
			end

			if AutoLibraryObject.Name == "LiveHintBook" then
				if not table.find(AutoLibraryLiveHintBooks, AutoLibraryObject) then
					table.insert(AutoLibraryLiveHintBooks, AutoLibraryObject)
				end
			end

			for _, AutoLibraryDescendant in ipairs(AutoLibraryObject:GetDescendants()) do
				if AutoLibraryDescendant.Name == "LiveHintBook"
					and AutoLibraryIsInRoom50(AutoLibraryDescendant) then

					if not table.find(AutoLibraryLiveHintBooks, AutoLibraryDescendant) then
						table.insert(AutoLibraryLiveHintBooks, AutoLibraryDescendant)
					end
				end
			end
		end

		for _, AutoLibraryDescendant in ipairs(AutoLibraryRoom50:GetDescendants()) do
			if not AutoLibraryEnabled or not AutoLibraryIsActuallyInRoom50() then
				return
			end

			if AutoLibraryDescendant.Name == "LiveHintBook"
				and AutoLibraryIsInRoom50(AutoLibraryDescendant) then

				if not table.find(AutoLibraryLiveHintBooks, AutoLibraryDescendant) then
					table.insert(AutoLibraryLiveHintBooks, AutoLibraryDescendant)
				end
			end
		end

		AutoLibraryRoomConnection = AutoLibraryRoom50.DescendantAdded:Connect(function(AutoLibraryAddedObject)
			if not AutoLibraryEnabled then
				return
			end

			if not AutoLibraryIsActuallyInRoom50() then
				return
			end

			if not AutoLibraryIsInRoom50(AutoLibraryAddedObject) then
				return
			end

			AutoLibraryFindBooks(AutoLibraryAddedObject)
		end)

		while AutoLibraryEnabled
			and AutoLibraryIsActuallyInRoom50()
			and #AutoLibraryLiveHintBooks < 3 do

			for _, AutoLibraryDescendant in ipairs(AutoLibraryRoom50:GetDescendants()) do
				if not AutoLibraryEnabled or not AutoLibraryIsActuallyInRoom50() then
					return
				end

				if AutoLibraryDescendant.Name == "LiveHintBook"
					and AutoLibraryIsInRoom50(AutoLibraryDescendant)
					and not table.find(AutoLibraryLiveHintBooks, AutoLibraryDescendant) then

					table.insert(AutoLibraryLiveHintBooks, AutoLibraryDescendant)
				end
			end

			if #AutoLibraryLiveHintBooks >= 3 then
				break
			end

			task.wait(0.05)
		end

		while AutoLibraryEnabled
			and AutoLibraryIsActuallyInRoom50()
			and not AutoLibraryHintPaperObtained do

			if AutoLibraryHasHintPaper() then
				AutoLibraryHintPaperObtained = true
				break
			end

			for AutoLibraryIndex = #AutoLibraryLiveHintBooks, 1, -1 do
				if not AutoLibraryIsActuallyInRoom50() then
					return
				end

				local AutoLibraryLiveHintBook = AutoLibraryLiveHintBooks[AutoLibraryIndex]

				if not AutoLibraryIsInRoom50(AutoLibraryLiveHintBook) then
					table.remove(AutoLibraryLiveHintBooks, AutoLibraryIndex)
					continue
				end

				while AutoLibraryEnabled
					and AutoLibraryIsActuallyInRoom50()
					and not AutoLibraryHintPaperObtained
					and AutoLibraryLiveHintBook.Parent
					and AutoLibraryIsInRoom50(AutoLibraryLiveHintBook) do

					if AutoLibraryHasHintPaper() then
						AutoLibraryHintPaperObtained = true
						break
					end

					AutoLibraryCharacter = AutoLibraryLocalPlayer.Character or AutoLibraryLocalPlayer.CharacterAdded:Wait()
					AutoLibraryHumanoidRootPart = AutoLibraryCharacter:FindFirstChild("HumanoidRootPart")

					if not AutoLibraryHumanoidRootPart then
						task.wait()
						continue
					end

					local AutoLibraryBookCFrame = AutoLibraryGetObjectCFrame(AutoLibraryLiveHintBook)

					if AutoLibraryBookCFrame
						and AutoLibraryIsActuallyInRoom50()
						and AutoLibraryIsInRoom50(AutoLibraryLiveHintBook) then

						AutoLibraryHumanoidRootPart.CFrame = AutoLibraryBookCFrame
					end

					for _, AutoLibraryPromptDescendant in ipairs(AutoLibraryLiveHintBook:GetDescendants()) do
						if AutoLibraryPromptDescendant:IsA("ProximityPrompt")
							and AutoLibraryIsInRoom50(AutoLibraryPromptDescendant)
							and AutoLibraryIsActuallyInRoom50() then

							fireproximityprompt(AutoLibraryPromptDescendant)
						end
					end

					task.wait(0.05)
				end

				if AutoLibraryHintPaperObtained then
					break
				end
			end

			if AutoLibraryHasHintPaper() then
				AutoLibraryHintPaperObtained = true
				break
			end

			local AutoLibraryHintPaper = AutoLibraryRoom50:FindFirstChild("LibraryHintPaper", true)

			if AutoLibraryHintPaper
				and AutoLibraryIsInRoom50(AutoLibraryHintPaper)
				and AutoLibraryIsActuallyInRoom50() then

				while AutoLibraryEnabled
					and AutoLibraryIsActuallyInRoom50()
					and not AutoLibraryHintPaperObtained
					and AutoLibraryHintPaper.Parent
					and AutoLibraryIsInRoom50(AutoLibraryHintPaper) do

					if AutoLibraryHasHintPaper() then
						AutoLibraryHintPaperObtained = true
						break
					end

					AutoLibraryCharacter = AutoLibraryLocalPlayer.Character or AutoLibraryLocalPlayer.CharacterAdded:Wait()
					AutoLibraryHumanoidRootPart = AutoLibraryCharacter:FindFirstChild("HumanoidRootPart")

					if not AutoLibraryHumanoidRootPart then
						task.wait()
						continue
					end

					local AutoLibraryPaperCFrame = AutoLibraryGetObjectCFrame(AutoLibraryHintPaper)

					if AutoLibraryPaperCFrame
						and AutoLibraryIsActuallyInRoom50()
						and AutoLibraryIsInRoom50(AutoLibraryHintPaper) then

						AutoLibraryHumanoidRootPart.CFrame = AutoLibraryPaperCFrame * CFrame.new(0, 5, 0)
					end

					for _, AutoLibraryPromptDescendant in ipairs(AutoLibraryHintPaper:GetDescendants()) do
						if AutoLibraryPromptDescendant:IsA("ProximityPrompt")
							and AutoLibraryIsInRoom50(AutoLibraryPromptDescendant)
							and AutoLibraryIsActuallyInRoom50() then

							fireproximityprompt(AutoLibraryPromptDescendant)
						end
					end

					task.wait(0.05)
				end
			end

			task.wait(0.05)
		end
	end)
end)

G.g2.Toggles.AutoBreakerRoom:OnChanged(function(AutoBreakerRoomEnabled)
	if AutoBreakerRoomConnection then
		task.cancel(AutoBreakerRoomConnection)
		AutoBreakerRoomConnection = nil
	end

	if AutoBreakerRoomRoomConnection then
		AutoBreakerRoomRoomConnection:Disconnect()
		AutoBreakerRoomRoomConnection = nil
	end

	if not AutoBreakerRoomEnabled then
		return
	end

	local AutoBreakerRoomGateFireTime = 5
	local AutoBreakerRoomWaitAfterLever = 5
	local AutoBreakerRoomBreakerSecondTime = 10
	local AutoBreakerRoomWaitBeforeWeb = 4
	local AutoBreakerRoomWebDuration = 20

	AutoBreakerRoomConnection = task.spawn(function()
		local AutoBreakerRoomPlayers = game:GetService("Players")
		local AutoBreakerRoomCurrentRooms = workspace:WaitForChild("CurrentRooms")
		local AutoBreakerRoom100 = AutoBreakerRoomCurrentRooms:WaitForChild("100")

		local function AutoBreakerRoomIsActuallyInRoom100()
			return tonumber(AutoBreakerRoomPlayers.LocalPlayer:GetAttribute("CurrentRoom")) == 100
		end

		local function AutoBreakerRoomIsInRoom100(AutoBreakerRoomObject)
			return AutoBreakerRoomObject
				and AutoBreakerRoomObject.Parent
				and AutoBreakerRoomObject:IsDescendantOf(AutoBreakerRoom100)
				and AutoBreakerRoomObject:IsDescendantOf(AutoBreakerRoomCurrentRooms)
		end

		local function AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomObject)
			if not AutoBreakerRoomIsActuallyInRoom100() or not AutoBreakerRoomIsInRoom100(AutoBreakerRoomObject) then
				return nil
			end

			if AutoBreakerRoomObject:IsA("Model") then
				return AutoBreakerRoomObject:GetPivot()
			elseif AutoBreakerRoomObject:IsA("BasePart") then
				return AutoBreakerRoomObject.CFrame
			end

			local AutoBreakerRoomPart = AutoBreakerRoomObject:FindFirstChildWhichIsA("BasePart", true)
			return AutoBreakerRoomPart and AutoBreakerRoomPart.CFrame
		end

		local function AutoBreakerRoomGetHRP()
			local AutoBreakerRoomCharacter = AutoBreakerRoomPlayers.LocalPlayer.Character
			return AutoBreakerRoomCharacter and AutoBreakerRoomCharacter:FindFirstChild("HumanoidRootPart")
		end

		local function AutoBreakerRoomActivate(AutoBreakerRoomObject)
			if not AutoBreakerRoomObject then
				return
			end

			if AutoBreakerRoomObject:IsA("ProximityPrompt") then
				fireproximityprompt(AutoBreakerRoomObject)
				return
			end

			for _, AutoBreakerRoomDescendant in ipairs(AutoBreakerRoomObject:GetDescendants()) do
				if AutoBreakerRoomDescendant:IsA("ProximityPrompt") then
					fireproximityprompt(AutoBreakerRoomDescendant)
				end
			end
		end

		local function AutoBreakerRoomConstantTPAndActivate(AutoBreakerRoomTarget, AutoBreakerRoomDuration, AutoBreakerRoomInterval, AutoBreakerRoomOffset)
			AutoBreakerRoomInterval = AutoBreakerRoomInterval or 0.04
			AutoBreakerRoomOffset = AutoBreakerRoomOffset or CFrame.new()
			local AutoBreakerRoomEndTime = os.clock() + (AutoBreakerRoomDuration or 3)

			while AutoBreakerRoomEnabled
				and AutoBreakerRoomIsActuallyInRoom100()
				and AutoBreakerRoomIsInRoom100(AutoBreakerRoomTarget)
				and os.clock() < AutoBreakerRoomEndTime do

				local AutoBreakerRoomHRP = AutoBreakerRoomGetHRP()
				local AutoBreakerRoomCF = AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomTarget)

				if AutoBreakerRoomHRP and AutoBreakerRoomCF then
					AutoBreakerRoomHRP.CFrame = AutoBreakerRoomCF * AutoBreakerRoomOffset
				end

				AutoBreakerRoomActivate(AutoBreakerRoomTarget)
				task.wait(AutoBreakerRoomInterval)
			end
		end

		while AutoBreakerRoomEnabled do
			while AutoBreakerRoomEnabled and not AutoBreakerRoomIsActuallyInRoom100() do
				task.wait(0.1)
			end

			if not AutoBreakerRoomEnabled then
				return
			end

			local AutoBreakerRoomPoles = {}

			while AutoBreakerRoomEnabled and AutoBreakerRoomIsActuallyInRoom100() do
				AutoBreakerRoomPoles = {}

				for _, AutoBreakerRoomDescendant in ipairs(AutoBreakerRoom100:GetDescendants()) do
					if AutoBreakerRoomDescendant.Name == "LiveBreakerPolePickup" and AutoBreakerRoomIsInRoom100(AutoBreakerRoomDescendant) then
						if not table.find(AutoBreakerRoomPoles, AutoBreakerRoomDescendant) then
							table.insert(AutoBreakerRoomPoles, AutoBreakerRoomDescendant)
						end
					end
				end

				if #AutoBreakerRoomPoles == 0 then
					break
				end

				for _, AutoBreakerRoomPole in ipairs(AutoBreakerRoomPoles) do
					if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
						break
					end

					if AutoBreakerRoomIsInRoom100(AutoBreakerRoomPole) then
						AutoBreakerRoomConstantTPAndActivate(AutoBreakerRoomPole, 2.8, 0.03)
						task.wait(0.12)
					end
				end

				task.wait(0.05)
			end

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			local AutoBreakerRoomIndustrialGate = AutoBreakerRoom100:FindFirstChild("IndustrialGate")
			local AutoBreakerRoomBox = AutoBreakerRoomIndustrialGate and AutoBreakerRoomIndustrialGate:FindFirstChild("Box")
			local AutoBreakerRoomLever = AutoBreakerRoomBox and AutoBreakerRoomBox:FindFirstChild("Lever")
			local AutoBreakerRoomActivateEventPrompt = AutoBreakerRoomBox and AutoBreakerRoomBox:FindFirstChild("ActivateEventPrompt")

			if AutoBreakerRoomActivateEventPrompt and AutoBreakerRoomLever then
				local function AutoBreakerRoomGetLeverCFrame()
					if AutoBreakerRoomLever:IsA("Model") then
						return AutoBreakerRoomLever:GetPivot()
					elseif AutoBreakerRoomLever:IsA("BasePart") then
						return AutoBreakerRoomLever.CFrame
					end
					local AutoBreakerRoomPart = AutoBreakerRoomLever:FindFirstChildWhichIsA("BasePart", true)
					return AutoBreakerRoomPart and AutoBreakerRoomPart.CFrame
				end

				local AutoBreakerRoomInitialLeverCFrame = AutoBreakerRoomGetLeverCFrame()
				local AutoBreakerRoomLeverEndTime = os.clock() + 10

				while AutoBreakerRoomEnabled
					and AutoBreakerRoomIsActuallyInRoom100()
					and AutoBreakerRoomIsInRoom100(AutoBreakerRoomLever)
					and os.clock() < AutoBreakerRoomLeverEndTime do

					local AutoBreakerRoomCurrentLeverCFrame = AutoBreakerRoomGetLeverCFrame()

					if AutoBreakerRoomCurrentLeverCFrame and AutoBreakerRoomInitialLeverCFrame
						and AutoBreakerRoomCurrentLeverCFrame ~= AutoBreakerRoomInitialLeverCFrame then
						break
					end

					local AutoBreakerRoomHRP = AutoBreakerRoomGetHRP()
					local AutoBreakerRoomCF = AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomBox)

					if AutoBreakerRoomHRP and AutoBreakerRoomCF then
						AutoBreakerRoomHRP.CFrame = AutoBreakerRoomCF
					end

					AutoBreakerRoomActivate(AutoBreakerRoomActivateEventPrompt)
					task.wait(0.04)
				end
			end

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			task.wait(AutoBreakerRoomWaitAfterLever)

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			local AutoBreakerRoomElevatorBreakerEmpty = AutoBreakerRoom100:FindFirstChild("ElevatorBreakerEmpty")
			if not AutoBreakerRoomElevatorBreakerEmpty then
				continue
			end

			local AutoBreakerRoomBreakerPrompt = AutoBreakerRoomElevatorBreakerEmpty:FindFirstChild("Prompt")
			if not AutoBreakerRoomBreakerPrompt then
				continue
			end

			local AutoBreakerRoomBreakerOffset = CFrame.new(0, -1.8, 0)

			while AutoBreakerRoomEnabled and AutoBreakerRoomIsActuallyInRoom100() do
				if AutoBreakerRoomElevatorBreakerEmpty:FindFirstChild("BreakerSwitchInBox") then
					break
				end

				local AutoBreakerRoomHRP = AutoBreakerRoomGetHRP()
				local AutoBreakerRoomCF = AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomElevatorBreakerEmpty)

				if AutoBreakerRoomHRP and AutoBreakerRoomCF then
					AutoBreakerRoomHRP.CFrame = AutoBreakerRoomCF * AutoBreakerRoomBreakerOffset
				end

				AutoBreakerRoomActivate(AutoBreakerRoomBreakerPrompt)
				task.wait(0.04)
			end

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			task.wait(10)

			AutoBreakerRoomConstantTPAndActivate(
				AutoBreakerRoomElevatorBreakerEmpty,
				AutoBreakerRoomBreakerSecondTime,
				0.04,
				AutoBreakerRoomBreakerOffset
			)

			task.wait(AutoBreakerRoomWaitBeforeWeb)

			if not AutoBreakerRoomEnabled or not AutoBreakerRoomIsActuallyInRoom100() then
				continue
			end

			local AutoBreakerRoomElevatorCar = AutoBreakerRoom100:FindFirstChild("ElevatorCar")
			local AutoBreakerRoomWeb = AutoBreakerRoomElevatorCar and AutoBreakerRoomElevatorCar:FindFirstChild("Web", true)

			if AutoBreakerRoomWeb then
				local AutoBreakerRoomEndTime = os.clock() + AutoBreakerRoomWebDuration

				while AutoBreakerRoomEnabled and AutoBreakerRoomIsActuallyInRoom100() and os.clock() < AutoBreakerRoomEndTime do
					local AutoBreakerRoomHRP = AutoBreakerRoomGetHRP()
					local AutoBreakerRoomCF = AutoBreakerRoomGetObjectCFrame(AutoBreakerRoomWeb)

					if AutoBreakerRoomHRP and AutoBreakerRoomCF then
						AutoBreakerRoomHRP.CFrame = AutoBreakerRoomCF
					end

					task.wait(0.04)
				end
			end

			while AutoBreakerRoomEnabled and AutoBreakerRoomIsActuallyInRoom100() do
				task.wait(0.5)
			end
		end
	end)
end)



G.g6.AutoHotelConnection = nil
G.g6.AutoHotelLibraryConnection = nil
G.g6.AutoHotelLibraryRoomConnection = nil
G.g6.AutoHotelSeekConnection = nil
G.g6.AutoHotelEntityPause = false
G.g6.AutoHotelRoomProcessTime = 0.5
G.g6.AutoHotelProcessedRooms = {}

G.g6.AutoHotelEntityNames = {
	["RushMoving"] = true,
	["Scribbles"] = true,
	["BashMoving"] = true,
	["DronesStampede"] = true,
	["AmbushMoving"] = true,
	["A60"] = true,
	["A120"] = true,
	["GlitchRush"] = true,
	["GlitchAmbush"] = true,
	["BackdoorRush"] = true,
	["CustomEntity"] = true,
}

function G.g6.AutoHotelIsEntityPresent()
	if G.g2.Toggles.AutoHotelIgnoreEntities and G.g2.Toggles.AutoHotelIgnoreEntities.Value then
		return false
	end
	for _, AutoHotelChild in ipairs(workspace:GetChildren()) do
		if G.g6.AutoHotelEntityNames[AutoHotelChild.Name] then
			return true
		end
	end
	return false
end

function G.g6.AutoHotelWaitForEntities(AutoHotelSeconds)
	if G.g2.Toggles.AutoHotelIgnoreEntities and G.g2.Toggles.AutoHotelIgnoreEntities.Value then
		return
	end

	task.wait(AutoHotelSeconds or 5)

	while G.g6.AutoHotelIsEntityPresent() do
		task.wait(0.15)
	end
end

function G.g6.AutoHotelGetNextClosedDoor()
	if not G.g3.Character then return nil, nil end

	local AutoHotelGameData = game:GetService("ReplicatedStorage"):FindFirstChild("GameData")
	if not AutoHotelGameData then return nil, nil end

	local AutoHotelLatestRoom = AutoHotelGameData:FindFirstChild("LatestRoom")
	if not AutoHotelLatestRoom then return nil, nil end

	local AutoHotelStartRoom = AutoHotelLatestRoom.Value
	local AutoHotelBestDoor, AutoHotelBestNumber = nil, math.huge
	local AutoHotelCurrentRooms = workspace:FindFirstChild("CurrentRooms")

	if AutoHotelCurrentRooms then
		for _, AutoHotelRoom in ipairs(AutoHotelCurrentRooms:GetChildren()) do
			local AutoHotelRoomNum = tonumber(AutoHotelRoom.Name)
			if AutoHotelRoomNum and AutoHotelRoomNum ~= 100 and AutoHotelRoomNum >= AutoHotelStartRoom and AutoHotelRoomNum < AutoHotelBestNumber then
				local AutoHotelDoor = AutoHotelRoom:FindFirstChild("Door")
				if AutoHotelDoor and AutoHotelDoor:IsA("Model") then
					local AutoHotelOpenAttr = AutoHotelDoor:GetAttribute("Open")
					if AutoHotelOpenAttr == false or AutoHotelOpenAttr == nil then
						AutoHotelBestNumber = AutoHotelRoomNum
						AutoHotelBestDoor = AutoHotelDoor
					end
				end
			end
		end
	end

	return AutoHotelBestDoor, AutoHotelBestNumber
end

function G.g6.AutoHotelFindKeyObtain(AutoHotelRoom)
	local AutoHotelFound = nil
	local function AutoHotelScan(AutoHotelParent)
		if AutoHotelFound then return end
		for _, AutoHotelChild in ipairs(AutoHotelParent:GetChildren()) do
			if AutoHotelChild.Name == "KeyObtain" then
				AutoHotelFound = AutoHotelChild
				return
			end
			AutoHotelScan(AutoHotelChild)
			if AutoHotelFound then return end
		end
	end
	AutoHotelScan(AutoHotelRoom)
	return AutoHotelFound
end

function G.g6.AutoHotelHandleKey(AutoHotelRoomNum)
	local AutoHotelCurrentRooms = workspace:FindFirstChild("CurrentRooms")
	if not AutoHotelCurrentRooms then return false end

	local AutoHotelRoom = AutoHotelCurrentRooms:FindFirstChild(tostring(AutoHotelRoomNum))
	if not AutoHotelRoom then return false end

	local AutoHotelDoor = AutoHotelRoom:FindFirstChild("Door")
	if not AutoHotelDoor or not AutoHotelDoor:FindFirstChild("Lock") then
		return false
	end

	local AutoHotelKeyObtain = G.g6.AutoHotelFindKeyObtain(AutoHotelRoom)
	if not AutoHotelKeyObtain then return false end

	local AutoHotelStart = tick()
	while tick() - AutoHotelStart < 12 do
		if LocalPlayer.Backpack:FindFirstChild("Key") or (G.g3.Character and G.g3.Character:FindFirstChild("Key")) then
			return true
		end

		if G.g3.Character then
			G.g3.Character:PivotTo(AutoHotelKeyObtain:GetPivot())
		end

		for _, AutoHotelDesc in ipairs(AutoHotelKeyObtain:GetDescendants()) do
			if AutoHotelDesc:IsA("ProximityPrompt") then
				fireproximityprompt(AutoHotelDesc)
			end
		end

		task.wait(0.12)
	end
	return false
end

function G.g6.AutoHotelProcessRoom(AutoHotelRoomNum)
	if G.g6.AutoHotelProcessedRooms[AutoHotelRoomNum] then
		return
	end
	task.wait(G.g6.AutoHotelRoomProcessTime)
	G.g6.AutoHotelProcessedRooms[AutoHotelRoomNum] = true
end

function G.g6.AutoHotelRunLibrary()
	local AutoHotelCurrentRooms = workspace:WaitForChild("CurrentRooms")
	local AutoHotelRoom50 = AutoHotelCurrentRooms:WaitForChild("50")
	local AutoHotelLiveHintBooks = {}
	local AutoHotelHintPaperObtained = false

	local function AutoHotelIsInRoom50(AutoHotelObj)
		return AutoHotelObj and AutoHotelObj:IsDescendantOf(AutoHotelRoom50)
	end

	local function AutoHotelIsActuallyInRoom50()
		return tonumber(LocalPlayer:GetAttribute("CurrentRoom")) == 50
	end

	while G.g2.Toggles.AutoHotel.Value and not AutoHotelIsActuallyInRoom50() do
		task.wait(0.1)
	end
	if not G.g2.Toggles.AutoHotel.Value then return end

	G.g6.AutoHotelWaitForEntities(5)

	local function AutoHotelHasHintPaper()
		local AutoHotelChar = LocalPlayer.Character
		if not AutoHotelChar then return false end
		return LocalPlayer.Backpack:FindFirstChild("LibraryHintPaper", true) or AutoHotelChar:FindFirstChild("LibraryHintPaper", true)
	end

	local function AutoHotelGetCFrame(AutoHotelObj)
		if not AutoHotelIsActuallyInRoom50() or not AutoHotelIsInRoom50(AutoHotelObj) then return nil end
		if AutoHotelObj:IsA("Model") then return AutoHotelObj:GetPivot() end
		if AutoHotelObj:IsA("BasePart") then return AutoHotelObj.CFrame end
		local AutoHotelPart = AutoHotelObj:FindFirstChildWhichIsA("BasePart", true)
		return AutoHotelPart and AutoHotelPart.CFrame
	end

	local function AutoHotelCollectBooks()
		for _, AutoHotelDesc in ipairs(AutoHotelRoom50:GetDescendants()) do
			if AutoHotelDesc.Name == "LiveHintBook" and AutoHotelIsInRoom50(AutoHotelDesc) and not table.find(AutoHotelLiveHintBooks, AutoHotelDesc) then
				table.insert(AutoHotelLiveHintBooks, AutoHotelDesc)
			end
		end
	end

	AutoHotelCollectBooks()

	G.g6.AutoHotelLibraryRoomConnection = AutoHotelRoom50.DescendantAdded:Connect(function(AutoHotelAdded)
		if G.g2.Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and AutoHotelIsInRoom50(AutoHotelAdded) then
			if AutoHotelAdded.Name == "LiveHintBook" and not table.find(AutoHotelLiveHintBooks, AutoHotelAdded) then
				table.insert(AutoHotelLiveHintBooks, AutoHotelAdded)
			end
		end
	end)

	while G.g2.Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and #AutoHotelLiveHintBooks < 3 do
		AutoHotelCollectBooks()
		if #AutoHotelLiveHintBooks >= 3 then break end
		task.wait(0.1)
	end

	while G.g2.Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and not AutoHotelHintPaperObtained do
		if AutoHotelHasHintPaper() then
			AutoHotelHintPaperObtained = true
			break
		end

		for AutoHotelIndex = #AutoHotelLiveHintBooks, 1, -1 do
			local AutoHotelBook = AutoHotelLiveHintBooks[AutoHotelIndex]
			if not AutoHotelIsInRoom50(AutoHotelBook) then
				table.remove(AutoHotelLiveHintBooks, AutoHotelIndex)
				continue
			end

			while G.g2.Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and not AutoHotelHintPaperObtained and AutoHotelBook.Parent and AutoHotelIsInRoom50(AutoHotelBook) do
				if AutoHotelHasHintPaper() then
					AutoHotelHintPaperObtained = true
					break
				end

				local AutoHotelChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
				local AutoHotelHRP = AutoHotelChar:FindFirstChild("HumanoidRootPart")
				if not AutoHotelHRP then
					task.wait()
					continue
				end

				local AutoHotelCF = AutoHotelGetCFrame(AutoHotelBook)
				if AutoHotelCF then
					AutoHotelHRP.CFrame = AutoHotelCF
				end

				for _, AutoHotelPrompt in ipairs(AutoHotelBook:GetDescendants()) do
					if AutoHotelPrompt:IsA("ProximityPrompt") then
						fireproximityprompt(AutoHotelPrompt)
					end
				end
				task.wait(0.08)
			end
			if AutoHotelHintPaperObtained then break end
		end

		if AutoHotelHasHintPaper() then
			AutoHotelHintPaperObtained = true
			break
		end

		local AutoHotelPaper = AutoHotelRoom50:FindFirstChild("LibraryHintPaper", true)
		if AutoHotelPaper and AutoHotelIsInRoom50(AutoHotelPaper) then
			while G.g2.Toggles.AutoHotel.Value and AutoHotelIsActuallyInRoom50() and not AutoHotelHintPaperObtained and AutoHotelPaper.Parent do
				if AutoHotelHasHintPaper() then
					AutoHotelHintPaperObtained = true
					break
				end

				local AutoHotelChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
				local AutoHotelHRP = AutoHotelChar:FindFirstChild("HumanoidRootPart")
				if AutoHotelHRP then
					local AutoHotelCF = AutoHotelGetCFrame(AutoHotelPaper)
					if AutoHotelCF then
						AutoHotelHRP.CFrame = AutoHotelCF * CFrame.new(0, 5, 0)
					end
				end

				for _, AutoHotelPrompt in ipairs(AutoHotelPaper:GetDescendants()) do
					if AutoHotelPrompt:IsA("ProximityPrompt") then
						fireproximityprompt(AutoHotelPrompt)
					end
				end
				task.wait(0.08)
			end
		end
		task.wait(0.1)
	end
end

function G.g6.AutoHotelHandleSeek()
	local AutoHotelLastTriggerRoom = nil

	while G.g2.Toggles.AutoHotel.Value do
		local AutoHotelCurrentRooms = workspace:FindFirstChild("CurrentRooms")
		if not AutoHotelCurrentRooms then
			task.wait(0.2)
			continue
		end

		local TriggerRoomNum = nil

		for _, Room in ipairs(AutoHotelCurrentRooms:GetChildren()) do
			local Num = tonumber(Room.Name)
			if Num and Num ~= AutoHotelLastTriggerRoom then
				local Trigger = Room:FindFirstChild("TriggerEventCollision")
					or Room:FindFirstChild("TriggerEventCollision", true)

				if Trigger then
					TriggerRoomNum = Num
					break
				end
			end
		end

		if not TriggerRoomNum then
			task.wait(0.15)
			continue
		end

		AutoHotelLastTriggerRoom = TriggerRoomNum

		G.g6.AutoHotelEntityPause = true
		G.g6.AutoHotelWaitForEntities(10)
		G.g6.AutoHotelEntityPause = false
	end
end

G.g2.Toggles.AutoHotel:OnChanged(function(AutoHotelEnabled)
	if G.g6.AutoHotelConnection then
		task.cancel(G.g6.AutoHotelConnection)
		G.g6.AutoHotelConnection = nil
	end
	if G.g6.AutoHotelLibraryConnection then
		task.cancel(G.g6.AutoHotelLibraryConnection)
		G.g6.AutoHotelLibraryConnection = nil
	end
	if G.g6.AutoHotelLibraryRoomConnection then
		G.g6.AutoHotelLibraryRoomConnection:Disconnect()
		G.g6.AutoHotelLibraryRoomConnection = nil
	end
	if G.g6.AutoHotelSeekConnection then
		task.cancel(G.g6.AutoHotelSeekConnection)
		G.g6.AutoHotelSeekConnection = nil
	end

	G.g6.AutoHotelEntityPause = false
	table.clear(G.g6.AutoHotelProcessedRooms)

	if not AutoHotelEnabled then return end

	if G.g2.Options.AutoHotelRoomProcess then
		G.g6.AutoHotelRoomProcessTime = G.g2.Options.AutoHotelRoomProcess.Value
		G.g2.Options.AutoHotelRoomProcess:OnChanged(function(Value)
			G.g6.AutoHotelRoomProcessTime = Value
		end)
	end

	local AutoHotelCurrentRooms = workspace:FindFirstChild("CurrentRooms")
	if AutoHotelCurrentRooms then
		AutoHotelCurrentRooms.ChildAdded:Connect(function(AutoHotelChild)
			local AutoHotelNum = tonumber(AutoHotelChild.Name)
			if AutoHotelNum then
				G.g6.AutoHotelProcessRoom(AutoHotelNum)
			end
		end)
	end

	G.g6.AutoHotelSeekConnection = task.spawn(G.g6.AutoHotelHandleSeek)

	task.spawn(function()
		while G.g2.Toggles.AutoHotel.Value do
			if G.g6.AutoHotelIsEntityPresent() then
				G.g6.AutoHotelEntityPause = true
				while G.g6.AutoHotelIsEntityPresent() and G.g2.Toggles.AutoHotel.Value do
					task.wait(0.15)
				end
				G.g6.AutoHotelEntityPause = false
			end
			task.wait(0.2)
		end
	end)

	G.g6.AutoHotelConnection = task.spawn(function()
		while G.g2.Toggles.AutoHotel.Value do
			if G.g6.AutoHotelEntityPause then
				task.wait(0.1)
				continue
			end

			local AutoHotelDoor, AutoHotelRoomNum = G.g6.AutoHotelGetNextClosedDoor()

			if AutoHotelDoor and AutoHotelRoomNum and G.g3.Character then
				if AutoHotelRoomNum == 50 then
					if not G.g6.AutoHotelLibraryConnection then
						G.g6.AutoHotelLibraryConnection = task.spawn(function()
							G.g6.AutoHotelRunLibrary()
							G.g6.AutoHotelLibraryConnection = nil
						end)
					end
					task.wait(0.4)
				else
					G.g6.AutoHotelProcessRoom(AutoHotelRoomNum)
					G.g6.AutoHotelHandleKey(AutoHotelRoomNum)
					if G.g3.Character and not G.g6.AutoHotelEntityPause then
						G.g3.Character:PivotTo(AutoHotelDoor:GetPivot() * CFrame.new(0, -1, 0))
					end
				end
			end
			task.wait(0.15)
		end
	end)
end)


G.g2.Groupboxes.Debug = Tabs.General:AddRightGroupbox("Debug")
G.g2.Groupboxes.Debug:AddButton({
	Text = "Ladder Softlock Fix",
	Tooltip = "Ladder Softlock Fix.",
	Func = function()
   		LocalPlayer:SetAttribute("Climbing", false)
	end
})
G.g2.Groupboxes.Debug:AddButton({
	Text = "Get Current Floor",
	Tooltip = "Prints the current floor to the console.",
	Func = function()
		print("Current Floor:", G.g3.GameData:WaitForChild("Floor").Value)
	end
})
G.g2.Groupboxes.Debug:AddButton({
	Text = "Get Current Room",
	Tooltip = "Prints the current room number to the console.",
	Func = function()
		print("Current Room:", LocalPlayer:GetAttribute("CurrentRoom"))
	end
})
G.g2.Groupboxes.Debug:AddButton({
	Text = "Void",
	Tooltip = "Teleports your character to Y -120.",
	Func = function()
		if not G.g3.Character then return end
		local Pivot = G.g3.Character:GetPivot()
		-- Too lazy to loop this
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
		G.g3.Character:PivotTo(Pivot + Vector3.new(0, -120 - Pivot.Position.Y, 0))
	end
})
G.g2.Groupboxes.Debug:AddButton({
	Text = "Death",
	Tooltip = "Death",
	Func = function()
		G.g2.Globals.Deathing = true
		LocalPlayer.Character.Humanoid.Health = 0
	end
})
G.g2.Groupboxes.Debug:AddButton({
	Text = "Exit Closet",
	Tooltip = "Exits the current closet.",
	Func = function()
		if G.g3.RemotesFolder and G.g3.RemotesFolder:FindFirstChild("CamLock") then
			G.g3.RemotesFolder.CamLock:FireServer()
		end
	end
})
G.g7.TpNextDoorConnection = nil

function G.g7.getNextClosedDoor()
	if not G.g3.Character then return nil end

	local GameData = game:GetService("ReplicatedStorage"):FindFirstChild("GameData")
	if not GameData then return nil end

	local LatestRoom = GameData:FindFirstChild("LatestRoom")
	if not LatestRoom then return nil end

	local startRoom = LatestRoom.Value
	local bestDoor = nil
	local bestNumber = math.huge

	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj.Name == "Door" and obj:IsA("Model") then
			local openAttr = obj:GetAttribute("Open")
			if openAttr == false or openAttr == nil then
				local roomModel = obj.Parent
				local roomNum = tonumber(roomModel and roomModel.Name)

				if roomNum and roomNum >= startRoom and roomNum < bestNumber then
					bestNumber = roomNum
					bestDoor = obj
				end
			end
		end
	end

	return bestDoor
end

G.g2.Groupboxes.Debug:AddButton({
	Text = "Tp Next Door",
	Tooltip = "Teleports you to the next sequential unopened door.",
	Func = function()
		local door = G.g7.getNextClosedDoor()
		if door then
			G.g3.Character:PivotTo(door:GetPivot() * CFrame.new(0, -1, 0))
		end
	end
})

G.g2.Toggles.TpNextDoor = G.g2.Groupboxes.Debug:AddToggle("TpNextDoor", {
	Text = "Auto Tp Next Door",
	Tooltip = "Continuously teleports you to the next sequential unopened door.",
	Default = false
})

G.g2.Toggles.TpNextDoor:OnChanged(function(TpNextDoorEnabled)
	if G.g7.TpNextDoorConnection then
		task.cancel(G.g7.TpNextDoorConnection)
		G.g7.TpNextDoorConnection = nil
	end

	if not TpNextDoorEnabled then
		return
	end

	G.g7.TpNextDoorConnection = task.spawn(function()
		while G.g2.Toggles.TpNextDoor.Value do
			local door = G.g7.getNextClosedDoor()
			if door and G.g3.Character then
				G.g3.Character:PivotTo(door:GetPivot() * CFrame.new(0, -1, 0))
			end
			task.wait(0.15)
		end
		G.g7.TpNextDoorConnection = nil
	end)
end)


G.g2.Groupboxes.Exploits_Bypass = Tabs.Exploits:AddLeftGroupbox("Bypass / Solve")

G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassGiggle",         { Text = "Bypass Giggle",           Default = false, Tooltip = "Prevents 'Giggle' from attacking you." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassDupe",           { Text = "Bypass Dupe",             Default = false, Tooltip = "Prevents you from open 'Dupe' fake doors." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassEyes",           { Text = "Bypass Eyes",             Default = false, Tooltip = "Prevents 'Eyes' from hurting you." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassLookman",        { Text = "Bypass Lookman",          Default = false, Tooltip = "Prevents 'Lookman' from hurting you." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassGloombatEggs",   { Text = "Bypass Gloombat Eggs",    Default = false, Tooltip = "Prevents taking damage from stepping on 'Gloombat' eggs." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassSeekObstructions", { Text = "Bypass Seek Obstructions", Default = false, Tooltip = "Prevents obstacles in the 'Seek' chase from harming you." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassVacuum",         { Text = "Bypass Vacuum",           Default = false, Tooltip = "Prevents you from falling into 'Vacuum' fake doors." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassKillbricks",     { Text = "Bypass Killbricks",       Default = false, Tooltip = "Prevents 'Lava' from hurting you." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassSeekingWall",    { Text = "Bypass Seeking Wall",     Default = false, Tooltip = "Prevents 'ScaryWall' from hurting you." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassSnare",          { Text = "Bypass Snare",            Default = false, Tooltip = "Prevents 'Snare' from trapping you." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassBanana",         { Text = "Bypass Banana",           Default = false, Tooltip = "Prevents 'Banana Peel' from slipping you up (sometimes doesn't work)." })
G.g2.Groupboxes.Exploits_Bypass:AddToggle("BypassJeff",           { Text = "Bypass Jeff",             Default = false, Tooltip = "Prevents 'Jeff the Killer' from stabbing you (sometimes doesn't work)." })


G.g2.Toggles.BypassGiggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do
		if Object.Name == "GiggleCeiling" then
			Object:WaitForChild("Hitbox").CanTouch = not Value
		end
	end
end)
G.g2.Toggles.BypassDupe:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do
		if Object.Name == "DoorFake" or Object.Name == "FakeDoor" then
			Object:WaitForChild("Hidden").CanTouch = not Value
			if Object:FindFirstChild("Lock") then
				Object.Lock.UnlockPrompt.Enabled = not Value
			end
		end
	end
end)
G.g2.Toggles.BypassEyes:OnChanged(function(Value)
	if Value and G.g2.Globals.IsEyes then
		if G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel" then
			G.g3.RemotesFolder.MotorReplication:FireServer(0, (G.g2.Globals.SpoofOffset == 200 and 65 or -65), 0, false)
		else
			G.g3.RemotesFolder.MotorReplication:FireServer(-650)
		end
	end
end)
G.g2.Toggles.BypassLookman:OnChanged(function(Value)
	if Value and G.g2.Globals.IsLookman then
		if G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel" then
			G.g3.RemotesFolder.MotorReplication:FireServer(0, (G.g2.Globals.SpoofOffset == 200 and 65 or -65), 0, false)
		else
			G.g3.RemotesFolder.MotorReplication:FireServer(-650)
		end
	end
end)
G.g2.Toggles.BypassGloombatEggs:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then
				Part.CanTouch = not Value
			end
		end
	end
end)
G.g2.Toggles.BypassSeekObstructions:OnChanged(function(Value)
	for _, Object in G.g2.Objects.SeekObstructions do
		Object.CanTouch = not Value
		if Object.Name == "SeekFloodline" then
			Object.CanCollide = Value
		end
	end
	for _, Object in G.g2.Objects.SeekBridges do
		Object.CanCollide = Value
		Object.Transparency = Value and 0 or 1
	end
end)
G.g2.Toggles.BypassVacuum:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do
		if Object.Name == "SideroomSpace" then
			Object:WaitForChild("Collision").CanCollide = Value
			Object:WaitForChild("Collision").CanTouch = not Value
		end
	end
end)
G.g2.Toggles.BypassKillbricks:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Obstructions do
		if Object.Name == "Lava" then Object.CanTouch = not Value end
	end
end)
G.g2.Toggles.BypassSeekingWall:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Obstructions do
		if Object.Name == "ScaryWall" then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then
					Part.CanTouch = not Value
					Part.CanCollide = not Value
				end
			end
		end
	end
end)
G.g2.Toggles.BypassSnare:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do
		if Object.Name == "Snare" then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then Part.CanTouch = not Value end
			end
		end
	end
end)
G.g2.Toggles.BypassBanana:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do
		if Object.Name == "BananaPeel" then Object.CanTouch = not Value end
	end
end)
G.g2.Toggles.BypassJeff:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do
		if Object.Name == "JeffTheKiller" then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then
					Part.CanCollide = not Value
					Part.CanTouch = not Value
				end
			end
			Object:WaitForChild("Humanoid").Health = 0
		end
	end
end)







-- Archives

G.g2.Groupboxes.Archives_Misc = Tabs.Archives:AddRightGroupbox("Exploits / Anti")
G.g2.Groupboxes.Archives_Misc:AddToggle("AntiRansom", { Text = "Anti Ransom", Default = false, Tooltip = "Prevents 'Ransom' from attacking you." })
G.g2.Groupboxes.Archives_Misc:AddToggle("AntiClosetTrash", { Text = "Anti Closet Trash", Default = false, Tooltip = "Prevents 'Closet Trash' from spawning." })
G.g2.Groupboxes.Archives_Misc:AddToggle("ForgetMeNotSolver", { Text = "Forget Me Not Skipper", Default = false, Tooltip = "Automatically Skippes Forget Me Not doors." })
G.g2.Groupboxes.Archives_Misc:AddToggle("TimeShower", { Text = "Time Shower", Default = false, Tooltip = "Shows the Archives clock time." })
G.g2.Groupboxes.Archives_Misc:AddToggle("BypassDronesStampede", { Text = "Stop Time/Anti Stampede", Default = false, Tooltip = "Prevents 'The Drones Stampede' from attacking you." })
G.g2.Groupboxes.Archives_Misc:AddToggle("HonchoCorrectBoxESP", { Text = "Correct Box ESP/Auto Interact", Default = false, Tooltip = "ESP correct Archives boxes in the Honcho sequence and automatically interact with the correct deposit." })

TimeShowerLabel = Instance.new("TextLabel")
TimeShowerLabel.Name = "TimeShower"
TimeShowerLabel.AnchorPoint = Vector2.new(0, 1)
TimeShowerLabel.Position = UDim2.new(0, 12, 1, -12)
TimeShowerLabel.Size = UDim2.new(0, 180, 0, 32)
TimeShowerLabel.BackgroundTransparency = 1
TimeShowerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeShowerLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TimeShowerLabel.TextStrokeTransparency = 0.35
TimeShowerLabel.Font = Enum.Font.GothamBold
TimeShowerLabel.TextSize = 18
TimeShowerLabel.TextXAlignment = Enum.TextXAlignment.Left
TimeShowerLabel.Text = "Time: --:--"
TimeShowerLabel.Visible = false
TimeShowerLabel.Parent = G.g4.Container



function G.g8.GetArchivesClockLabel(Room)
	local Assets = Room and Room:FindFirstChild("Assets", true)
	local Clock = Assets and Assets:FindFirstChild("ArchivesClock", true)
	local Time = Clock and Clock:FindFirstChild("Time", true)
	local TextLabel = Time and Time:FindFirstChild("TextLabel")
	return (TextLabel and TextLabel:IsA("TextLabel")) and TextLabel or nil
end

function G.g8.ResolveClockLabel()
	if G.g2.TimeShowerSourceLabel and G.g2.TimeShowerSourceLabel.Parent and G.g2.TimeShowerSourceLabel:IsDescendantOf(game) then
		return G.g2.TimeShowerSourceLabel
	end
	local currentRooms = workspace:FindFirstChild("CurrentRooms")
	if not currentRooms then return nil end
	local rooms = {}
	for _, room in ipairs(currentRooms:GetChildren()) do
		local num = tonumber(room.Name)
		if num then
			rooms[#rooms + 1] = { room = room, num = num }
		end
	end
	table.sort(rooms, function(a, b) return a.num > b.num end)
	for i = 1, math.min(6, #rooms) do
		local label = G.g8.GetArchivesClockLabel(rooms[i].room)
		if label then
			G.g2.TimeShowerSourceLabel = label
			return label
		end
	end
	return nil
end

function G.g8.ResolveClockRemote()
	local label = G.g8.ResolveClockLabel()
	if not label then return nil end
	local clock = label:FindFirstAncestor("ArchivesClock")
	if not clock then return nil end
	local remote = clock:FindFirstChild("LookedAtRemote", true)
	return (remote and remote:IsA("RemoteEvent")) and remote or nil
end

task.spawn(function()
	local lastCheckedRoomCount = 0
	while game:IsLoaded() do
		local currentRooms = workspace:FindFirstChild("CurrentRooms")
		if currentRooms then
			local roomCount = 0
			for _, child in ipairs(currentRooms:GetChildren()) do
				if tonumber(child.Name) then
					roomCount += 1
				end
			end
			if roomCount > 0 and (lastCheckedRoomCount == 0 or roomCount - lastCheckedRoomCount >= 10) then
				G.g8.ResolveClockLabel()
				lastCheckedRoomCount = roomCount
			end
		end
		task.wait(0.5)
	end
end)

local function StopTimeShower()
	G.g2.TimeShowerToken += 1
	if G.g2.TimeShowerConnection then
		G.g2.TimeShowerConnection:Disconnect()
		G.g2.TimeShowerConnection = nil
	end
	if TimeShowerLabel then
		TimeShowerLabel.Visible = false
		TimeShowerLabel.Text = "Time: --:--"
	end
end

G.g2.Toggles.TimeShower:OnChanged(function(Value)
	StopTimeShower()
	if not Value then return end
	local Token = G.g2.TimeShowerToken
	TimeShowerLabel.Visible = true
	G.g2.TimeShowerConnection = G.g2.Services.RunService.Heartbeat:Connect(function()
		if Token ~= G.g2.TimeShowerToken then return end
		local TextLabel = G.g8.ResolveClockLabel()
		TimeShowerLabel.Text = TextLabel and ("Time: " .. TextLabel.Text) or "Time: --:--"
	end)
end)

G.g2.Toggles.BypassDronesStampede:OnChanged(function(enabled)
	if G.g2.BypassDronesStampedeConnection then
		task.cancel(G.g2.BypassDronesStampedeConnection)
		G.g2.BypassDronesStampedeConnection = nil
	end
	if not enabled then return end
	G.g2.BypassDronesStampedeConnection = task.spawn(function()
		while G.g2.Toggles.BypassDronesStampede.Value do
			local remote = G.g8.ResolveClockRemote()
			if remote then
				remote:FireServer()
				task.wait(0.5)
			else
				task.wait(0.25)
			end
		end
	end)
end)

local function ClearHonchoESP()
	if G.g2.HonchoCorrectBoxConnection then
		G.g2.HonchoCorrectBoxConnection:Disconnect()
		G.g2.HonchoCorrectBoxConnection = nil
	end
	if G.g2.HonchoAutoDepositConnection then
		G.g2.HonchoAutoDepositConnection:Disconnect()
		G.g2.HonchoAutoDepositConnection = nil
	end
	for _, Object in pairs(G.g2.HonchoESPObjects) do
		if Object and Object.Parent then
			G.g2.Functions.RemoveESP(Object)
		end
	end
	table.clear(G.g2.HonchoESPObjects)
	table.clear(G.g2.HonchoProcessedRooms)
	table.clear(G.g2.HonchoDepositCache)
end

G.g2.Toggles.HonchoCorrectBoxESP:OnChanged(function(Value)
	ClearHonchoESP()
	if not Value then return end
	-- DontGroup
	local CurrentRooms = workspace:FindFirstChild("CurrentRooms")
	if not CurrentRooms then return end

	local function GetESPColor()
		return (G.g2.Options.ObjectiveESPColor and G.g2.Options.ObjectiveESPColor.Value) or Color3.fromRGB(0, 255, 0)
	end

	local function AddHonchoESP(Object, Text)
		G.g2.Functions.AddESP({ Object = Object, Text = Text, Color = GetESPColor() }, true)
		G.g2.HonchoESPObjects[#G.g2.HonchoESPObjects + 1] = Object
		Object.Destroying:Once(function()
			G.g2.Functions.RemoveESP(Object)
			local pos = table.find(G.g2.HonchoESPObjects, Object)
			if pos then table.remove(G.g2.HonchoESPObjects, pos) end
		end)
	end

	local function ProcessHonchoRoom(Room)
		if not tonumber(Room.Name) or not Room.Parent or G.g2.HonchoProcessedRooms[Room] then return end
		G.g2.HonchoProcessedRooms[Room] = true
		task.wait(3)
		if not G.g2.Toggles.HonchoCorrectBoxESP.Value or not Room.Parent then
			G.g2.HonchoProcessedRooms[Room] = nil
			return
		end
		local HonchoRoom = Room:FindFirstChild("ArchivesHonchoRoom", true)
		if not HonchoRoom then
			G.g2.HonchoProcessedRooms[Room] = nil
			return
		end
		local BoxIDs = {}
		local RoomNumber = tonumber(Room.Name)
		for _, Desc in ipairs(Room:GetDescendants()) do
			local name = Desc.Name
			if name == "ArchivesPackageDeposit" or name:match("^ArchivesPackageDeposit") then
				local id = Desc:GetAttribute("BoxID")
				if id ~= nil then
					local idStr = tostring(id)
					BoxIDs[idStr] = true
					G.g2.HonchoDepositCache[idStr] = Desc
					AddHonchoESP(Desc, "Deposit (" .. idStr .. ")")
					Desc.Destroying:Once(function()
						if G.g2.HonchoDepositCache[idStr] == Desc then
							G.g2.HonchoDepositCache[idStr] = nil
						end
					end)
				end
			end
		end
		if not next(BoxIDs) then
			G.g2.HonchoProcessedRooms[Room] = nil
			return
		end
		for _, Child in ipairs(HonchoRoom:GetDescendants()) do
			if Child.Name == "ArchivesStorageBox" then
				local ToolBoxID = Child:GetAttribute("Tool_BoxID")
				if ToolBoxID ~= nil and BoxIDs[tostring(ToolBoxID)] then
					if not Child:GetAttribute("ParentRoom") then
						Child:SetAttribute("ParentRoom", RoomNumber)
					end
					Child.Name = "ArchivesStorageBoxCorrect"
					AddHonchoESP(Child, "Correct Box (" .. tostring(ToolBoxID) .. ")")
				end
			end
		end
	end

	for _, Room in ipairs(CurrentRooms:GetChildren()) do
		task.spawn(ProcessHonchoRoom, Room)
	end

	G.g2.HonchoCorrectBoxConnection = CurrentRooms.ChildAdded:Connect(function(Room)
		task.spawn(ProcessHonchoRoom, Room)
	end)

	local lastCheck = 0
	G.g2.HonchoAutoDepositConnection = game:GetService("RunService").Heartbeat:Connect(function()
		if not G.g2.Toggles.HonchoCorrectBoxESP.Value then return end
		local now = os.clock()
		if now - lastCheck < 0.1 then return end
		lastCheck = now
		local Character = LocalPlayer and LocalPlayer.Character
		local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
		if not Character or not HumanoidRootPart then return end
		local BoxCandidates = {}
		for _, Object in ipairs(Character:GetChildren()) do
			if (Object:IsA("Tool") or Object:IsA("Model")) and (Object.Name == "ArchivesStorageBox" or Object.Name == "ArchivesStorageBoxCorrect") then
				BoxCandidates[#BoxCandidates + 1] = Object
			end
		end
		local Drops = workspace:FindFirstChild("Drops")
		if Drops then
			for _, Object in ipairs(Drops:GetChildren()) do
				if Object.Name == "ArchivesStorageBox" or Object.Name == "ArchivesStorageBoxCorrect" then
					BoxCandidates[#BoxCandidates + 1] = Object
				end
			end
		end
		for _, Box in ipairs(BoxCandidates) do
			if not (Box and Box.Parent) then continue end
			local BoxID = Box:GetAttribute("Tool_BoxID") or Box:GetAttribute("BoxID")
			if BoxID == nil then continue end
			local Deposit = G.g2.HonchoDepositCache[tostring(BoxID)]
			if not Deposit or not Deposit.Parent then continue end
			if Box.Parent == Drops and not Box:GetAttribute("HonchoCorrectESP") then
				Box:SetAttribute("HonchoCorrectESP", true)
				AddHonchoESP(Box, "Correct Box (" .. tostring(BoxID) .. ")")
			end
			if Box.Parent == Character then
				local DepositPart = Deposit:IsA("BasePart") and Deposit or Deposit:FindFirstChildWhichIsA("BasePart", true)
				if DepositPart and (HumanoidRootPart.Position - DepositPart.Position).Magnitude <= 10 then
					local Prompt = Deposit:FindFirstChildWhichIsA("ProximityPrompt", true)
					if Prompt then
						fireproximityprompt(Prompt)
					end
				end
			end
		end
	end)
end)


G.g2.Groupboxes.Archives_Bypasses = Tabs.Archives:AddLeftGroupbox("Bypasses")
G.g2.Groupboxes.Archives_Bypasses:AddToggle("BypassWater", { Text = "Bypass Electric Water", Default = false, Tooltip = "Prevents electric water from hurting you." })
G.g2.Groupboxes.Archives_Bypasses:AddToggle("BypassAlma", { Text = "Bypass Alma", Default = false, Tooltip = "Prevents 'Alma' from spawning." })
G.g2.Groupboxes.Archives_Bypasses:AddToggle("BypassDrones", { Text = "Bypass Drones", Default = false, Tooltip = "Prevents 'Drones' from attacking you." })
G.g2.Groupboxes.Archives_Bypasses:AddToggle("AntiScribbles", { Text = "Bypass Scribbles", Default = false, Tooltip = "Prevents 'Scribbles' from attacking you." })

G.g2.Groupboxes.Archives_Experimental = Tabs.Archives:AddLeftGroupbox("Experimental")

G.g2.Toggles.AntiClosetTrash:OnChanged(function(Value)
	if G.g2.AntiClosetTrash_Connection then
		G.g2.AntiClosetTrash_Connection:Disconnect()
		G.g2.AntiClosetTrash_Connection = nil
	end
	if not Value then return end
	G.g2.AntiClosetTrash_Connection = workspace.ChildAdded:Connect(function(Child)
		if not G.g2.Toggles.AntiClosetTrash.Value then return end
		local Name = Child.Name
		if Name:sub(1, 6) == "Binder" or Name:sub(1, 4) == "Shoe" or Name:sub(1, 5) == "Shelf" then
			Child:Destroy()
		end
	end)
end)

G.g2.Toggles.AntiRansom:OnChanged(function(Value)
	if G.g2.AntiRansom_Connection then
		G.g2.AntiRansom_Connection:Disconnect()
		G.g2.AntiRansom_Connection = nil
	end
	if not Value then return end
	G.g2.AntiRansom_Connection = workspace.ChildAdded:Connect(function(Child)
		if Child.Name == "Ransom" and G.g2.Toggles.AntiRansom.Value then
			Child:Destroy()
			print("Ransom gone hehehehehehehehe")
		end
	end)
end)

G.g2.Toggles.ForgetMeNotSolver:OnChanged(function(Value)
	if G.g2.ForgetMeNotConnection then
		G.g2.ForgetMeNotConnection:Disconnect()
		G.g2.ForgetMeNotConnection = nil
	end
	G.g2.ForgetMeNotRunning = false
	table.clear(G.g2.ForgetMeNotProcessing)
	table.clear(G.g2.ForgetMeNotNotified)
	if not Value then return end
	G.g2.ForgetMeNotRunning = true

	local function GetCharacter()
		return game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
	end

	local function GetNextRoom(Number)
		while G.g2.ForgetMeNotRunning do
			for RoomNumber = Number + 1, Number + 5 do
				local NextRoom = workspace.CurrentRooms:FindFirstChild(tostring(RoomNumber))
				if NextRoom then return NextRoom end
			end
			task.wait(0.1)
		end
		return nil
	end

	local function FireLookAts(Room)
		for i = 1, 6 do
			local Obj = Room:FindFirstChild(tostring(i))
			if Obj then
				local LookAt = Obj:FindFirstChild("LookAt")
				if LookAt then
					pcall(function() LookAt:FireServer() end)
				end
			end
		end
	end

	local function VoidCharacter()
		local Character = GetCharacter()
		if not Character then return end

		local voidCF = CFrame.new(0, -120, 0)
		local start = tick()
		while G.g2.ForgetMeNotRunning and tick() - start < 2 do
			Character:PivotTo(voidCF)
			task.wait(0.1)
		end
	end

	local function Run(Room)
		local RoomNumber = tonumber(Room.Name)
		if not RoomNumber or not G.g2.ForgetMeNotRunning or G.g2.ForgetMeNotProcessing[RoomNumber] then return end

		if not Room:FindFirstChild("ForgetMeNotVineDoors", true) then
			return
		end

		G.g2.ForgetMeNotProcessing[RoomNumber] = true

		while G.g2.ForgetMeNotRunning and Room.Parent do
			FireLookAts(Room)

			local NextRoom = GetNextRoom(RoomNumber)
			if not NextRoom then
				task.wait(0.4)
				continue
			end

			local Door = NextRoom:FindFirstChild("Door")

			if not Door then
				local Character = GetCharacter()
				if Character then
					local Target = NextRoom:FindFirstChildWhichIsA("BasePart") or NextRoom
					if Target:IsA("BasePart") then
						Character:PivotTo(Target.CFrame + Vector3.new(0, 3, 0))
					elseif Target:IsA("Model") then
						Character:PivotTo(Target:GetPivot() + Vector3.new(0, 3, 0))
					else
						Character:PivotTo(CFrame.new(NextRoom:GetPivot().Position + Vector3.new(0, 5, 0)))
					end
				end
				break
			end

			if Door:GetAttribute("Opened") == true then
				VoidCharacter()
				break
			end

			local Hidden = Door:FindFirstChild("Hidden") or Door:WaitForChild("Hidden", 2)
			if not Hidden then
				task.wait(0.3)
				continue
			end

			while G.g2.ForgetMeNotRunning and Room.Parent and NextRoom.Parent and Door.Parent and Door:GetAttribute("Opened") ~= true do
				local Character = GetCharacter()
				if Character then
					if Hidden:IsA("BasePart") then
						Character:PivotTo(Hidden.CFrame)
					elseif Hidden:IsA("Model") then
						Character:PivotTo(Hidden:GetPivot())
					end
				end
				pcall(function() Door.ClientOpen:Fire() end)
				pcall(function() Door.ClientOpen:FireServer() end)
				task.wait()
			end

			if G.g2.ForgetMeNotRunning and Door.Parent and Door:GetAttribute("Opened") == true then
				VoidCharacter()
			end

			break
		end

		G.g2.ForgetMeNotProcessing[RoomNumber] = nil
	end

	local function CheckRooms()
		local LatestRoomNumber = tonumber(G.g3.LatestRoom.Value) or 0
		local FirstRoomNumber = math.max(0, LatestRoomNumber - 3)
		for RoomNumber = FirstRoomNumber, LatestRoomNumber do
			if not G.g2.ForgetMeNotRunning then return end
			local Room = workspace.CurrentRooms:FindFirstChild(tostring(RoomNumber))
			if Room and not G.g2.ForgetMeNotProcessing[RoomNumber] then
				task.spawn(Run, Room)
			end
		end
	end

	G.g2.ForgetMeNotConnection = workspace.CurrentRooms.ChildAdded:Connect(function(Room)
		if not tonumber(Room.Name) then return end
		task.spawn(function()
			task.wait(1)
			if G.g2.ForgetMeNotRunning and Room.Parent then
				task.spawn(Run, Room)
			end
		end)
	end)

	task.spawn(function()
		while G.g2.ForgetMeNotRunning do
			CheckRooms()
			task.wait(1)
		end
	end)

	CheckRooms()
end)

G.g2.Toggles.BypassWater:OnChanged(function(Value)
	G.g2.Functions.Notify({ Title = "PositionSpoof Will Break This!." })

	if G.g2.WaterBypassConnection then
		G.g2.WaterBypassConnection:Disconnect()
		G.g2.WaterBypassConnection = nil
	end

	if not Value then
		for _, WaterBypassPart in pairs(G.g2.WaterParts) do
			if WaterBypassPart then
				WaterBypassPart:Destroy()
			end
		end
		table.clear(G.g2.WaterParts)
		return
	end
	-- DontGroup
	local CurrentRooms = workspace.CurrentRooms

	local function ProcessWaterBypassRoom(WaterBypassRoom)
		if not tonumber(WaterBypassRoom.Name) then return end

		task.wait(3)

		local WaterBypassWater = WaterBypassRoom:FindFirstChild("Water")
		if not WaterBypassWater or G.g2.WaterParts[WaterBypassWater] then return end

		local WaterBypassPart = Instance.new("Part")
		WaterBypassPart.Name = "WaterBypass"
		WaterBypassPart.Anchored = true
		WaterBypassPart.CanCollide = true
		WaterBypassPart.CanTouch = false
		WaterBypassPart.CanQuery = false
		WaterBypassPart.Transparency = 0.25
		WaterBypassPart.Color = Color3.fromRGB(0, 150, 255)
		WaterBypassPart.Material = Enum.Material.ForceField

		local WaterBypassSize, WaterBypassCFrame
		if WaterBypassWater:IsA("BasePart") then
			WaterBypassSize = WaterBypassWater.Size
			WaterBypassCFrame = WaterBypassWater.CFrame
		elseif WaterBypassWater:IsA("Model") then
			WaterBypassCFrame, WaterBypassSize = WaterBypassWater:GetBoundingBox()
		else
			WaterBypassSize = Vector3.new(10, 1.5, 10)
			WaterBypassCFrame = WaterBypassWater:GetPivot()
		end

		WaterBypassPart.Size = WaterBypassSize + Vector3.new(0, 0.5, 0)
		WaterBypassPart.CFrame = WaterBypassCFrame * CFrame.new(0, 0.25, 0)

		if WaterBypassPart.Size.Y > 3 then
			WaterBypassPart:Destroy()
			G.g2.Functions.Notify({ Title = "Water Bypass removed: Softlock." })
			return
		end

		WaterBypassPart.Parent = WaterBypassRoom
		G.g2.WaterParts[WaterBypassWater] = WaterBypassPart
	end

	local WaterBypassLatestRoomNumber = tonumber(G.g3.LatestRoom.Value) or 0
	for WaterBypassRoomNumber = math.max(0, WaterBypassLatestRoomNumber - 4), WaterBypassLatestRoomNumber do
		local WaterBypassRoom = CurrentRooms:FindFirstChild(tostring(WaterBypassRoomNumber))
		if WaterBypassRoom then
			task.spawn(ProcessWaterBypassRoom, WaterBypassRoom)
		end
	end

	G.g2.WaterBypassConnection = CurrentRooms.ChildAdded:Connect(function(WaterBypassRoom)
		task.spawn(ProcessWaterBypassRoom, WaterBypassRoom)
	end)
end)

G.g2.Toggles.BypassAlma:OnChanged(function(Value)
	if G.g2.AlmaConnection then
		G.g2.AlmaConnection:Disconnect()
		G.g2.AlmaConnection = nil
	end
	if Value then
		for _, child in ipairs(workspace:GetChildren()) do
			if child.Name == "Alma" then child:Destroy() end
		end
		G.g2.AlmaConnection = workspace.ChildAdded:Connect(function(child)
			if child.Name == "Alma" then child:Destroy() end
		end)
	end
end)

G.g2.Toggles.AntiScribbles:OnChanged(function(Value)
	if G.g2.AntiScribbles_Connection then
		G.g2.AntiScribbles_Connection:Disconnect()
		G.g2.AntiScribbles_Connection = nil
	end
	if not Value then return end
	G.g2.AntiScribbles_Connection = workspace.ChildAdded:Connect(function(Child)
		if Child.Name == "Scribbles" and G.g2.Toggles.AntiScribbles.Value then
			local ExploitSribbleWarning = Child:FindFirstChild("IfYoureExploitingDeleteThis")
			if ExploitSribbleWarning then ExploitSribbleWarning:Destroy() end
		end
	end)
end)

G.g2.Toggles.BypassDrones:OnChanged(function(Value)
	local RS = game:GetService("ReplicatedStorage")
	local function ProcessDrones(drones)
		local WalkedInto = drones:FindFirstChild("WalkedInto") or drones:WaitForChild("WalkedInto", 3)
		if WalkedInto and not G.g2.DroneWalkedIntoParents[WalkedInto] then
			G.g2.DroneWalkedIntoParents[WalkedInto] = drones
			WalkedInto.Parent = RS
		end
	end
	if Value then
		for _, child in ipairs(workspace:GetChildren()) do
			if child.Name == "Drones" then ProcessDrones(child) end
		end
		if G.g2.DroneConnection then G.g2.DroneConnection:Disconnect() end
		G.g2.DroneConnection = workspace.ChildAdded:Connect(function(child)
			if child.Name == "Drones" then ProcessDrones(child) end
		end)
	else
		for WalkedInto, originalParent in pairs(G.g2.DroneWalkedIntoParents) do
			if WalkedInto and WalkedInto.Parent and originalParent and originalParent.Parent then
				WalkedInto.Parent = originalParent
			end
		end
		table.clear(G.g2.DroneWalkedIntoParents)
		if G.g2.DroneConnection then
			G.g2.DroneConnection:Disconnect()
			G.g2.DroneConnection = nil
		end
	end
end)

G.g2.Groupboxes.Stairwell_Misc = Tabs.Stairwell:AddLeftGroupbox("Exploits / Anti / Misc")



G.g2.Groupboxes.Stairwell_Misc:AddDivider()
G.g2.Groupboxes.Stairwell_Misc:AddToggle("BypassNoise", { Text = "Noise Tv Breaker", Default = false, Tooltip = "Breaks the tv of noise while holding it." })
G.g2.Groupboxes.Stairwell_Misc:AddToggle("AntiNoise", { Text = "Anti Noise", Default = false, Tooltip = "Prevents the game from making noise when moving (Visual studio auto ai lmfao ✌)." })


G.g2.Groupboxes.Stairwell_Misc:AddToggle("DroppedItemValue", { Text = "Item Number", Default = false, Tooltip = "Shows the number of dropped items." })

G.g2.Groupboxes.Stairwell_Misc:AddToggle("KillAllWithCart", {
	Text = "Kill All (Requires ≥1 Cart)",
	Default = false,
})
G.g2.Groupboxes.Stairwell_Misc:AddToggle("FlingCreak", {
	Text = "Bug Out Creak (Requires ≥5 Cart)",
	Default = false,
	ToolTip = "DONT TOUCH THE CARTS URSELF, U WILL DIE"
})
G.g2.Groupboxes.Stairwell_Misc:AddToggle("CreakAggressionMeter", {
    Text = "Creak Aggression Meter",
    Default = false,
    Tooltip = "Shows Creak's aggression above its head."
})

G.g9.CreakAggressionMetersTable = {}
G.g9.CreakAggressionCamera = Workspace.CurrentCamera
G.g9.CreakAggressionChildAddedConnection = nil

function G.g9.CleanupCreakAggressionMeter(CreakModel)
    local CreakMeterData = G.g9.CreakAggressionMetersTable[CreakModel]
    if not CreakMeterData then return end

    G.g9.CreakAggressionMetersTable[CreakModel] = nil

    if CreakMeterData.RenderConnection then
        CreakMeterData.RenderConnection:Disconnect()
    end
    if CreakMeterData.DestroyConnection then
        CreakMeterData.DestroyConnection:Disconnect()
    end

    for _, CreakDrawingObject in ipairs(CreakMeterData.Drawings) do
        pcall(function() CreakDrawingObject:Remove() end)
    end
end

function G.g9.GetCreakAggressionValue(CreakModel)
    local CreakAnimator = CreakModel:FindFirstChildOfClass("Animator")
        or (CreakModel:FindFirstChild("AnimationController") and CreakModel.AnimationController:FindFirstChildOfClass("Animator"))
        or CreakModel:FindFirstChildOfClass("AnimationController")

    if not CreakAnimator then return nil end

    for _, CreakAnimationTrack in ipairs(CreakAnimator:GetPlayingAnimationTracks()) do
        if CreakAnimationTrack.Name == "CreakGraph" or (CreakAnimationTrack.Animation and CreakAnimationTrack.Animation.Name == "CreakGraph") then
            local CreakSuccess, CreakAggressionValue = pcall(CreakAnimationTrack.GetParameter, CreakAnimationTrack, "Aggression")
            if CreakSuccess and typeof(CreakAggressionValue) == "number" then
                return math.clamp(CreakAggressionValue, 0, 1)
            end
        end
    end
    return nil
end

function G.g9.CreateCreakAggressionDrawings()
    local CreakDrawingList = {}

    local function CreateCreakDrawing(CreakDrawingType)
        local CreakNewDrawing = Drawing.new(CreakDrawingType)
        table.insert(CreakDrawingList, CreakNewDrawing)
        return CreakNewDrawing
    end

    local CreakTitleText = CreateCreakDrawing("Text")
    CreakTitleText.Text = "Aggression --%"
    CreakTitleText.Size = 16
    CreakTitleText.Font = Drawing.Fonts.Plex
    CreakTitleText.Color = Color3.fromRGB(255, 255, 255)
    CreakTitleText.Center = true
    CreakTitleText.Outline = true
    CreakTitleText.Visible = false

    local CreakBarBackground = CreateCreakDrawing("Square")
    CreakBarBackground.Size = Vector2.new(112, 6)
    CreakBarBackground.Filled = true
    CreakBarBackground.Color = Color3.fromRGB(58, 58, 64)
    CreakBarBackground.Transparency = 0.15
    CreakBarBackground.Visible = false

    local CreakBarFill = CreateCreakDrawing("Square")
    CreakBarFill.Size = Vector2.new(0, 6)
    CreakBarFill.Filled = true
    CreakBarFill.Visible = false

    return {
        Drawings = CreakDrawingList,
        TitleText = CreakTitleText,
        BarBackground = CreakBarBackground,
        BarFill = CreakBarFill
    }
end

function G.g9.AddCreakAggressionMeter(CreakModel)
    if not G.g2.Toggles.CreakAggressionMeter.Value or CreakModel.Name ~= "Creak" or G.g9.CreakAggressionMetersTable[CreakModel] then
        return
    end

    local CreakHeadPart = CreakModel:FindFirstChild("Head")
    if not CreakHeadPart or not CreakHeadPart:IsA("BasePart") then return end

    local CreakMeterData = G.g9.CreateCreakAggressionDrawings()
    G.g9.CreakAggressionMetersTable[CreakModel] = CreakMeterData

    CreakMeterData.RenderConnection = G.g3.RunService.RenderStepped:Connect(function()
        if not G.g2.Toggles.CreakAggressionMeter.Value or not CreakModel.Parent or not CreakHeadPart.Parent then
            G.g9.CleanupCreakAggressionMeter(CreakModel)
            return
        end

        if not G.g9.CreakAggressionCamera or not G.g9.CreakAggressionCamera.Parent then
            G.g9.CreakAggressionCamera = Workspace.CurrentCamera
            if not G.g9.CreakAggressionCamera then return end
        end

        local CreakScreenPosition, CreakIsOnScreen = G.g9.CreakAggressionCamera:WorldToViewportPoint(CreakHeadPart.Position + Vector3.new(0, 1.85, 0))
        if not (CreakIsOnScreen and CreakScreenPosition.Z > 0) then
            CreakMeterData.TitleText.Visible = false
            CreakMeterData.BarBackground.Visible = false
            CreakMeterData.BarFill.Visible = false
            return
        end

        CreakMeterData.TitleText.Position = Vector2.new(CreakScreenPosition.X, CreakScreenPosition.Y - 28)
        CreakMeterData.BarBackground.Position = Vector2.new(CreakScreenPosition.X - 56, CreakScreenPosition.Y - 6)
        CreakMeterData.BarFill.Position = CreakMeterData.BarBackground.Position

        local CreakAggressionValue = G.g9.GetCreakAggressionValue(CreakModel)

        if not CreakAggressionValue then
            CreakMeterData.TitleText.Text = "Aggression --%"
            CreakMeterData.TitleText.Color = Color3.fromRGB(200, 200, 200)
            CreakMeterData.BarFill.Size = Vector2.new(0, 6)
            CreakMeterData.TitleText.Visible = true
            CreakMeterData.BarBackground.Visible = true
            CreakMeterData.BarFill.Visible = false
            return
        end

        CreakMeterData.TitleText.Text = "Aggression " .. math.floor(CreakAggressionValue * 100 + 0.5) .. "%"
        CreakMeterData.TitleText.Color = Color3.fromRGB(255, 255, 255)
        CreakMeterData.BarFill.Size = Vector2.new(112 * CreakAggressionValue, 6)
        CreakMeterData.BarFill.Color = Color3.fromRGB(70, 220, 100):Lerp(Color3.fromRGB(255, 55, 55), CreakAggressionValue)
        CreakMeterData.TitleText.Visible = true
        CreakMeterData.BarBackground.Visible = true
        CreakMeterData.BarFill.Visible = true
    end)

    CreakMeterData.DestroyConnection = CreakModel.Destroying:Connect(function()
        G.g9.CleanupCreakAggressionMeter(CreakModel)
    end)
end

function G.g9.StartCreakAggressionListener()
    if G.g9.CreakAggressionChildAddedConnection then return end

    local CreakLiveEntitiesFolder = Workspace:FindFirstChild("LiveEntities")
    if not CreakLiveEntitiesFolder then return end

    G.g9.CreakAggressionChildAddedConnection = CreakLiveEntitiesFolder.ChildAdded:Connect(function(CreakNewChild)
        if CreakNewChild.Name == "Creak" then
            G.g9.AddCreakAggressionMeter(CreakNewChild)
        end
    end)
end

function G.g9.StopCreakAggressionListener()
    if G.g9.CreakAggressionChildAddedConnection then
        G.g9.CreakAggressionChildAddedConnection:Disconnect()
        G.g9.CreakAggressionChildAddedConnection = nil
    end
end

G.g2.Toggles.CreakAggressionMeter:OnChanged(function(CreakToggleEnabled)
    if CreakToggleEnabled then
        for _, CreakEntityModel in ipairs(G.g2.Objects.Entities or {}) do
            G.g9.AddCreakAggressionMeter(CreakEntityModel)
        end

        local CreakLiveEntitiesFolder = Workspace:FindFirstChild("LiveEntities")
        local CreakExistingModel = CreakLiveEntitiesFolder and CreakLiveEntitiesFolder:FindFirstChild("Creak")
        if CreakExistingModel then
            G.g9.AddCreakAggressionMeter(CreakExistingModel)
        end

        G.g9.StartCreakAggressionListener()
    else
        G.g9.StopCreakAggressionListener()

        for CreakEntityModel in pairs(G.g9.CreakAggressionMetersTable) do
            G.g9.CleanupCreakAggressionMeter(CreakEntityModel)
        end
    end
end)

G.g2.Toggles.KillAllWithCart:OnChanged(function(KillAllWithCartState)
	if not KillAllWithCartState then return end

	local KillAllWithCartIndex = 1

	task.spawn(function()
		while G.g2.Toggles.KillAllWithCart.Value do
			local KillAllWithCartCarts = {}
			for _, KillAllWithCartModel in ipairs(workspace.Misc:GetChildren()) do
				if KillAllWithCartModel.Name == "ShoppingCart" and KillAllWithCartModel:IsA("Model") then
					KillAllWithCartCarts[#KillAllWithCartCarts + 1] = KillAllWithCartModel
				end
			end

			local KillAllWithCartAlivePlayers = {}
			for _, KillAllWithCartPlayer in ipairs(game.Players:GetPlayers()) do
				if KillAllWithCartPlayer ~= game.Players.LocalPlayer and KillAllWithCartPlayer.Character then
					local KillAllWithCartHumanoid = KillAllWithCartPlayer.Character:FindFirstChildOfClass("Humanoid")
					if KillAllWithCartHumanoid and KillAllWithCartHumanoid.Health > 0 then
						KillAllWithCartAlivePlayers[#KillAllWithCartAlivePlayers + 1] = KillAllWithCartPlayer
					end
				end
			end

			if #KillAllWithCartCarts > 0 and #KillAllWithCartAlivePlayers > 0 then
				if KillAllWithCartIndex > #KillAllWithCartAlivePlayers then
					KillAllWithCartIndex = 1
				end
				local KillAllWithCartTarget = KillAllWithCartAlivePlayers[KillAllWithCartIndex]
				local KillAllWithCartTargetCFrame = KillAllWithCartTarget.Character:GetPivot()
				for KillAllWithCartCartIndex = 1, #KillAllWithCartCarts do
					KillAllWithCartCarts[KillAllWithCartCartIndex]:PivotTo(KillAllWithCartTargetCFrame)
				end
				KillAllWithCartIndex = KillAllWithCartIndex + 1
			end
			task.wait(0)
		end
	end)
end)

G.g2.Toggles.FlingCreak:OnChanged(function(FlingCreakState)
	if not FlingCreakState then return end

	task.spawn(function()
		while G.g2.Toggles.FlingCreak.Value do
			local creak = workspace:FindFirstChild("LiveEntities") and workspace.LiveEntities:FindFirstChild("Creak")
			if creak then
				local targetCFrame = creak:GetPivot()
				for _, model in ipairs(workspace.Misc:GetChildren()) do
					if model.Name == "ShoppingCart" and model:IsA("Model") then
						model:PivotTo(targetCFrame)
					end
				end
			end
			task.wait(0.10)
		end
	end)
end)




G.g2.Groupboxes.Stairwell_Misc:AddDivider()


G.g2.Groupboxes.Stairwell_Misc:AddToggle("DisableStairwellCrusherCollision", {
	Text = "Disable Crushers",
	Default = false,
})
G.g2.Groupboxes.Stairwell_Misc:AddToggle("DeleteStairwellCrusherExceptBasicWall", {
	Text = "Delete Crushers",
	Default = false,
})
G.g2.Groupboxes.Stairwell_Misc:AddToggle("MeldRemover", {
	Text = "Remove Meld",
	Default = false,
})

G.g2.Groupboxes.Stairwell_Misc:AddToggle("StairwellLandingSpam", {
	Text = "TP to trash and drop trash.",
	Tooltip = "Combine with orbit, or bring all dropped items.",
	Default = false,
})

G.g2.Toggles.DisableStairwellCrusherCollision:OnChanged(function(DisableStairwellCrusherCollisionState)
	if not DisableStairwellCrusherCollisionState then return end

	task.spawn(function()
		while G.g2.Toggles.DisableStairwellCrusherCollision.Value do
			for _, DisableStairwellCrusherRoom in ipairs(workspace.CurrentRooms:GetChildren()) do
				local DisableStairwellCrusherAssets = DisableStairwellCrusherRoom:FindFirstChild("Assets")
				if DisableStairwellCrusherAssets then
					for _, DisableStairwellCrusherContainer in ipairs(DisableStairwellCrusherAssets:GetChildren()) do
						if DisableStairwellCrusherContainer.Name == "StairwellCrusherContainer1" then
							for _, DisableStairwellCrusherDescendant in ipairs(DisableStairwellCrusherContainer:GetDescendants()) do
								if DisableStairwellCrusherDescendant:IsA("BasePart") and DisableStairwellCrusherDescendant.CanCollide then
									local DisableStairwellCrusherUnderBasicWall = false
									local DisableStairwellCrusherParent = DisableStairwellCrusherDescendant.Parent
									while DisableStairwellCrusherParent and DisableStairwellCrusherParent ~= DisableStairwellCrusherContainer do
										if DisableStairwellCrusherParent.Name == "BasicWall" then
											DisableStairwellCrusherUnderBasicWall = true
											break
										end
										DisableStairwellCrusherParent = DisableStairwellCrusherParent.Parent
									end
									if not DisableStairwellCrusherUnderBasicWall then
										DisableStairwellCrusherDescendant.CanCollide = false
									end
								end
							end
						end

						local DisableStairwellCrusher = DisableStairwellCrusherContainer:FindFirstChild("StairwellCrusher")
						if DisableStairwellCrusher then
							local DisableStairwellCrusherOuterTrigger = DisableStairwellCrusher:FindFirstChild("OuterTrigger")
							local DisableStairwellCrusherCoreTrigger = DisableStairwellCrusher:FindFirstChild("CoreTrigger")
							if DisableStairwellCrusherOuterTrigger then
								DisableStairwellCrusherOuterTrigger:Destroy()
							end
							if DisableStairwellCrusherCoreTrigger then
								DisableStairwellCrusherCoreTrigger:Destroy()
							end
						end
					end
				end
			end
			task.wait(0.5)
		end
	end)
end)
G.g2.Toggles.DeleteStairwellCrusherExceptBasicWall:OnChanged(function(DeleteStairwellCrusherExceptBasicWallState)
	if not DeleteStairwellCrusherExceptBasicWallState then return end

	task.spawn(function()
		while G.g2.Toggles.DeleteStairwellCrusherExceptBasicWall.Value do
			for _, DeleteStairwellCrusherRoom in ipairs(workspace.CurrentRooms:GetChildren()) do
				local DeleteStairwellCrusherAssets = DeleteStairwellCrusherRoom:FindFirstChild("Assets")
				if DeleteStairwellCrusherAssets then
					for _, DeleteStairwellCrusherContainer in ipairs(DeleteStairwellCrusherAssets:GetChildren()) do
						if DeleteStairwellCrusherContainer.Name == "StairwellCrusherContainer1" then
							local DeleteStairwellCrusherToDestroy = {}
							for _, DeleteStairwellCrusherDescendant in ipairs(DeleteStairwellCrusherContainer:GetDescendants()) do
								local DeleteStairwellCrusherUnderBasicWall = false
								local DeleteStairwellCrusherParent = DeleteStairwellCrusherDescendant.Parent
								while DeleteStairwellCrusherParent and DeleteStairwellCrusherParent ~= DeleteStairwellCrusherContainer do
									if DeleteStairwellCrusherParent.Name == "BasicWall" then
										DeleteStairwellCrusherUnderBasicWall = true
										break
									end
									DeleteStairwellCrusherParent = DeleteStairwellCrusherParent.Parent
								end
								if not DeleteStairwellCrusherUnderBasicWall and DeleteStairwellCrusherDescendant.Name ~= "BasicWall" then
									DeleteStairwellCrusherToDestroy[#DeleteStairwellCrusherToDestroy + 1] = DeleteStairwellCrusherDescendant
								end
							end
							for _, DeleteStairwellCrusherInstance in ipairs(DeleteStairwellCrusherToDestroy) do
								if DeleteStairwellCrusherInstance and DeleteStairwellCrusherInstance.Parent then
									DeleteStairwellCrusherInstance:Destroy()
								end
							end
						end
					end
				end
			end
			task.wait(0.5)
		end
	end)
end)

G.g2.Toggles.MeldRemover:OnChanged(function(State)
	if not State then return end
	task.spawn(function()
		while G.g2.Toggles.MeldRemover.Value do
			for _, room in pairs(workspace.CurrentRooms:GetChildren()) do
				for _, folderName in ipairs({"Assets", "Parts"}) do
					local folder = room:FindFirstChild(folderName)
					if folder then
						for _, child in ipairs(folder:GetChildren()) do
							if child.Name == "MeldWall"
								or child.Name == "Boleahghth29tdgfhy2thuy2htuu259uhh3u" -- no qeustions asked
							then
								child:Destroy()
							end
						end
					end
				end
				for _, name in ipairs({"MeldData", "MeldPads", "Meldview", "Meld"}) do
					local obj = room:FindFirstChild(name)
					if obj and obj:IsA("Folder") then
						obj:Destroy()
					end
				end
			end
			task.wait(0.5)
		end
	end)
end)




local StairwellLandingToken = 0

G.g2.Toggles.StairwellLandingSpam:OnChanged(function(Value)
	StairwellLandingToken += 1

	if not Value then
		return
	end

	local CurrentToken = StairwellLandingToken

	task.spawn(function()
		-- DontGroup
		local CurrentRooms = workspace.CurrentRooms
		local LocalPlayer = G.g2.Services.Players.LocalPlayer

		while G.g2.Toggles.StairwellLandingSpam.Value and CurrentToken == StairwellLandingToken do
			local StairwellModels = {}

			for _, Room in ipairs(CurrentRooms:GetChildren()) do
				local StairwellLandingLogic = Room:FindFirstChild("StairwellLandingLogic")

				if StairwellLandingLogic then
					for _, Model in ipairs(StairwellLandingLogic:GetChildren()) do
						if Model:IsA("Model") then
							local Prompts = {}

							for _, Object in ipairs(Model:GetDescendants()) do
								if Object:IsA("ProximityPrompt") then
									Prompts[#Prompts + 1] = Object
								end
							end

							if #Prompts > 0 then
								StairwellModels[#StairwellModels + 1] = {
									Model = Model,
									Prompts = Prompts,
								}
							end
						end
					end
				end
			end

			table.sort(StairwellModels, function(First, Second)
				local FirstRoom = First.Model.Parent and First.Model.Parent.Parent
				local SecondRoom = Second.Model.Parent and Second.Model.Parent.Parent

				return (tonumber(FirstRoom and FirstRoom.Name) or math.huge) <
					(tonumber(SecondRoom and SecondRoom.Name) or math.huge)
			end)

			for _, Data in ipairs(StairwellModels) do
				if not G.g2.Toggles.StairwellLandingSpam.Value or CurrentToken ~= StairwellLandingToken then
					break
				end

				local Model = Data.Model

				while Model.Parent
					and Model:IsDescendantOf(workspace)
					and G.g2.Toggles.StairwellLandingSpam.Value
					and CurrentToken == StairwellLandingToken do

					local Character = LocalPlayer.Character
					local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")

					if HumanoidRootPart then
						HumanoidRootPart.CFrame = Model:GetPivot() + Vector3.new(0, 5, 0)

						for Index = 1, #Data.Prompts do
							local Prompt = Data.Prompts[Index]

							if Prompt.Parent and Prompt.Enabled and fireproximityprompt then
								fireproximityprompt(Prompt)
							end
						end

						if keypress and keyrelease then
							keypress(0x58)
							task.wait(0.03)
							keyrelease(0x58)
						elseif G.g1.Abysall
							and G.g1.Abysall.Environment
							and G.g1.Abysall.Environment.keypress
							and G.g1.Abysall.Environment.keyrelease then

							G.g1.Abysall.Environment.keypress(0x58)
							task.wait(0.03)
							G.g1.Abysall.Environment.keyrelease(0x58)
						end
					end

					G.g2.Services.RunService.Heartbeat:Wait()
				end
			end

			G.g2.Services.RunService.Heartbeat:Wait()
		end
	end)
end)


G.g2.Groupboxes.Stairwell_Misc:AddDivider()

G.g2.Groupboxes.Stairwell_Misc:AddButton("TP Shopping Carts To Player", function()
	local ShoppingCartTargetName = G.g2.Options.ShoppingCartTarget.Value
	local ShoppingCartTargetPlayer = game.Players:FindFirstChild(ShoppingCartTargetName)
	if not ShoppingCartTargetPlayer or not ShoppingCartTargetPlayer.Character then return end
	local ShoppingCartTargetCFrame = ShoppingCartTargetPlayer.Character:GetPivot()
	for _, ShoppingCartModel in ipairs(workspace.Misc:GetChildren()) do
		if ShoppingCartModel.Name == "ShoppingCart" and ShoppingCartModel:IsA("Model") then
			ShoppingCartModel:PivotTo(ShoppingCartTargetCFrame)
		end
	end
end)

G.g2.Groupboxes.Stairwell_Misc:AddDropdown("ShoppingCartTarget", {
	Text = "Shopping Cart Target",
	Values = (function()
		local ShoppingCartPlayerNames = {}
		for _, ShoppingCartPlayer in ipairs(game.Players:GetPlayers()) do
			ShoppingCartPlayerNames[#ShoppingCartPlayerNames + 1] = ShoppingCartPlayer.Name
		end
		return ShoppingCartPlayerNames
	end)(),
	Default = game.Players.LocalPlayer.Name,
})

G.g2.Groupboxes.Stairwell_Misc:AddButton("Refresh Players", function()
	local ShoppingCartPlayerNames = {}
	for _, ShoppingCartPlayer in ipairs(game.Players:GetPlayers()) do
		ShoppingCartPlayerNames[#ShoppingCartPlayerNames + 1] = ShoppingCartPlayer.Name
	end
	G.g2.Options.ShoppingCartTarget:SetValues(ShoppingCartPlayerNames)
end)

G.g2.Groupboxes.Stairwell_Experimental = Tabs.Stairwell:AddRightGroupbox("Experimental")


local function TPDropsToNearestGrinder()
    local TPDropsToNearestGrinderDropsFolder =
        workspace:FindFirstChild("Drops")

    local TPDropsToNearestGrinderRootPart =
        G.g3.Character and G.g3.Character:FindFirstChild("HumanoidRootPart")

    if not TPDropsToNearestGrinderDropsFolder
        or not TPDropsToNearestGrinderRootPart
        or not G.g3.CurrentRooms then
        return
    end

    local TPDropsToNearestGrinderPlayerPosition =
        TPDropsToNearestGrinderRootPart.Position

    local TPDropsToNearestGrinderNearestGrinder = nil
    local TPDropsToNearestGrinderNearestDistance = math.huge

    for _, TPDropsToNearestGrinderRoom in
        ipairs(G.g3.CurrentRooms:GetChildren()) do

        local TPDropsToNearestGrinderScrapper =
            TPDropsToNearestGrinderRoom:FindFirstChild(
                "StairwellScrapper",
                true
            )

        if TPDropsToNearestGrinderScrapper then
            for _, TPDropsToNearestGrinderObject in
                ipairs(TPDropsToNearestGrinderScrapper:GetDescendants()) do

                if TPDropsToNearestGrinderObject.Name == "Grinder1"
                    and (
                        TPDropsToNearestGrinderObject:IsA("Model")
                        or TPDropsToNearestGrinderObject:IsA("BasePart")
                    ) then

                    local TPDropsToNearestGrinderPosition =
                        TPDropsToNearestGrinderObject:GetPivot().Position

                    local TPDropsToNearestGrinderDistance =
                        (
                            TPDropsToNearestGrinderPlayerPosition
                            - TPDropsToNearestGrinderPosition
                        ).Magnitude

                    if TPDropsToNearestGrinderDistance
                        < TPDropsToNearestGrinderNearestDistance then

                        TPDropsToNearestGrinderNearestDistance =
                            TPDropsToNearestGrinderDistance

                        TPDropsToNearestGrinderNearestGrinder =
                            TPDropsToNearestGrinderObject
                    end
                end
            end
        end
    end

    if not TPDropsToNearestGrinderNearestGrinder then
        return
    end

    local TPDropsToNearestGrinderCFrame =
        TPDropsToNearestGrinderNearestGrinder:GetPivot()

    for _, TPDropsToNearestGrinderDropItem in
        ipairs(TPDropsToNearestGrinderDropsFolder:GetChildren()) do

        if TPDropsToNearestGrinderDropItem:IsA("Model")
            or TPDropsToNearestGrinderDropItem:IsA("BasePart") then

            TPDropsToNearestGrinderDropItem:PivotTo(
                TPDropsToNearestGrinderCFrame
            )
        end
    end
end

G.g2.Groupboxes.Stairwell_Experimental:AddButton({
    Text = "TP All Drops to Nearest Grinder",
    Func = TPDropsToNearestGrinder,
    DoubleClick = false,
    Tooltip = "Teleports every dropped item to the grinder closest to you",
})

local function BringDroppedItems()
	local workspaceDropsFolder = workspace:FindFirstChild("Drops")
	if LocalPlayer and LocalPlayer.Character then
		local playerHumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if playerHumanoidRootPart and workspaceDropsFolder then
			for _, itemToBring in ipairs(workspaceDropsFolder:GetChildren()) do
				if itemToBring:IsA("Model") then
					itemToBring:PivotTo(playerHumanoidRootPart.CFrame)
				elseif itemToBring:IsA("BasePart") then
					itemToBring.CFrame = playerHumanoidRootPart.CFrame
				end
			end
		end
	end
end

G.g2.Groupboxes.Stairwell_Experimental:AddButton({
	Text = "Bring Dropped Items",
	Func = function() BringDroppedItems() end,
	DoubleClick = false,
	Tooltip = "Brings all dropped items."
})

G.g2.Groupboxes.Stairwell_Experimental:AddToggle("EnableDroppedItemsInterval", {
	Text = "Enable Interval",
	Default = false,
	Tooltip = "Automatically brings dropped items at the selected interval."
})

G.g2.Groupboxes.Stairwell_Experimental:AddSlider("DroppedItemsInterval", {
	Text = "Interval",
	Default = 1,
	Min = 0,
	Max = 60,
	Rounding = 1,
	Compact = false,
	Tooltip = "How often dropped items are brought."
})

G.g2.Toggles.EnableDroppedItemsInterval:OnChanged(function(enabled)
	if enabled then
		if G.g2.droppedItemsIntervalRunning then return end
		G.g2.droppedItemsIntervalRunning = true
		task.spawn(function()
			while G.g2.Toggles.EnableDroppedItemsInterval.Value do
				BringDroppedItems()
				local interval = G.g2.Options.DroppedItemsInterval.Value
				if interval <= 0 then
					task.wait()
				else
					task.wait(interval)
				end
			end
			G.g2.droppedItemsIntervalRunning = false
		end)
	end
end)

G.g2.Groupboxes.Stairwell_Experimental:AddDivider()

G.g2.Groupboxes.Stairwell_Experimental:AddToggle("OrbitDroppedItems", {
	Text = "Orbit Dropped Items",
	Default = false,
	Tooltip = "Orbits dropped items around you. Teleports them to you every 10s to prevent despawn."
})

G.g2.Groupboxes.Stairwell_Experimental:AddSlider("OrbitDroppedItemsHeight", {
	Text = "Height",
	Default = 2,
	Min = -20,
	Max = 20,
	Rounding = 1,
	Compact = false,
	Tooltip = "The height of the orbit."
})

G.g2.Groupboxes.Stairwell_Experimental:AddSlider("OrbitDroppedItemsDistance", {
	Text = "Distance",
	Default = 5,
	Min = 0,
	Max = 50,
	Rounding = 1,
	Compact = false,
	Tooltip = "The distance of the orbit."
})

G.g2.Groupboxes.Stairwell_Experimental:AddSlider("OrbitDroppedItemsSpeed", {
	Text = "Speed",
	Default = 2,
	Min = 0,
	Max = 20,
	Rounding = 1,
	Compact = false,
	Tooltip = "The speed of the orbit."
})

G.g2.Toggles.OrbitDroppedItems:OnChanged(function(OrbitDroppedItemsEnabled)
	if G.g2.OrbitDroppedItemsConnection then
		G.g2.OrbitDroppedItemsConnection:Disconnect()
		G.g2.OrbitDroppedItemsConnection = nil
	end
	if not OrbitDroppedItemsEnabled then return end
	G.g2.OrbitDroppedItemsAngle = 0
	G.g2.OrbitDroppedItemsLastTeleport = tick()
	G.g2.OrbitDroppedItemsPauseUntil = 0
	G.g2.OrbitDroppedItemsConnection = G.g3.RunService.Heartbeat:Connect(function(OrbitDroppedItemsDeltaTime)
		if not LocalPlayer or not LocalPlayer.Character then return end
		local OrbitDroppedItemsHumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		local OrbitDroppedItemsDropsFolder = workspace:FindFirstChild("Drops")
		if not OrbitDroppedItemsHumanoidRootPart or not OrbitDroppedItemsDropsFolder then return end
		local OrbitDroppedItemsHeightValue = G.g2.Options.OrbitDroppedItemsHeight.Value
		local OrbitDroppedItemsDistanceValue = G.g2.Options.OrbitDroppedItemsDistance.Value
		local OrbitDroppedItemsSpeedValue = G.g2.Options.OrbitDroppedItemsSpeed.Value
		local OrbitDroppedItemsCurrentTime = tick()
		local OrbitDroppedItemsList = {}
		for _, OrbitDroppedItemsObject in ipairs(OrbitDroppedItemsDropsFolder:GetChildren()) do
			if OrbitDroppedItemsObject:IsA("Model") or OrbitDroppedItemsObject:IsA("BasePart") then
				OrbitDroppedItemsList[#OrbitDroppedItemsList + 1] = OrbitDroppedItemsObject
			end
		end
		local OrbitDroppedItemsCount = #OrbitDroppedItemsList
		if OrbitDroppedItemsCount == 0 then return end
		if OrbitDroppedItemsCurrentTime - G.g2.OrbitDroppedItemsLastTeleport >= 10 then
			G.g2.OrbitDroppedItemsLastTeleport = OrbitDroppedItemsCurrentTime
			G.g2.OrbitDroppedItemsPauseUntil = OrbitDroppedItemsCurrentTime + 2
			local OrbitDroppedItemsCenterPosition = OrbitDroppedItemsHumanoidRootPart.Position
			for _, OrbitDroppedItemsObject in ipairs(OrbitDroppedItemsList) do
				if OrbitDroppedItemsObject:IsA("Model") then
					OrbitDroppedItemsObject:PivotTo(CFrame.new(OrbitDroppedItemsCenterPosition))
				else
					OrbitDroppedItemsObject.CFrame = CFrame.new(OrbitDroppedItemsCenterPosition)
				end
			end
		end
		if OrbitDroppedItemsCurrentTime < G.g2.OrbitDroppedItemsPauseUntil then return end
		G.g2.OrbitDroppedItemsAngle += OrbitDroppedItemsDeltaTime * OrbitDroppedItemsSpeedValue
		for OrbitDroppedItemsIndex, OrbitDroppedItemsObject in ipairs(OrbitDroppedItemsList) do
			local OrbitDroppedItemsObjectAngle = G.g2.OrbitDroppedItemsAngle + ((OrbitDroppedItemsIndex - 1) / OrbitDroppedItemsCount) * math.pi * 2
			local OrbitDroppedItemsOffset = Vector3.new(
				math.cos(OrbitDroppedItemsObjectAngle) * OrbitDroppedItemsDistanceValue,
				OrbitDroppedItemsHeightValue,
				math.sin(OrbitDroppedItemsObjectAngle) * OrbitDroppedItemsDistanceValue
			)
			local OrbitDroppedItemsPosition = OrbitDroppedItemsHumanoidRootPart.Position + OrbitDroppedItemsOffset
			if OrbitDroppedItemsObject:IsA("Model") then
				OrbitDroppedItemsObject:PivotTo(CFrame.new(OrbitDroppedItemsPosition))
			else
				OrbitDroppedItemsObject.CFrame = CFrame.new(OrbitDroppedItemsPosition)
			end
		end
	end)
end)

G.g2.Toggles.AntiNoise:OnChanged(function(value)
	for i = #G.g2.Connections_2, 1, -1 do
		local conn = G.g2.Connections_2[i]
		if conn and conn.Disconnect then
			conn:Disconnect()
		end
		table.remove(G.g2.Connections_2, i)
	end
	if not value then return end
	local antiNoiseConn = G.g3.RunService.PreSimulation:Connect(function(dt)
		if not value then return end
		if not LocalPlayer:GetAttribute("Alive") then return end
		local character = LocalPlayer.Character
		if not character then return end
		local rootPart = character:FindFirstChild("HumanoidRootPart")
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		local camera = workspace.CurrentCamera
		if not rootPart or not humanoid or not camera then return end
		if humanoid.Health <= 0 then return end
		if rootPart.Anchored then return end
		local state = humanoid:GetState()
		if state == Enum.HumanoidStateType.Dead
			or state == Enum.HumanoidStateType.Ragdoll
			or state == Enum.HumanoidStateType.Climbing
			or state == Enum.HumanoidStateType.Swimming then
			return
		end
		humanoid.AutoRotate = false
		humanoid:Move(Vector3.zero, false)
		local inputVector = Controls:GetMoveVector()
		local inputMagnitude = inputVector.Magnitude
		if inputMagnitude <= 0 then
			rootPart.AssemblyLinearVelocity = Vector3.zero
			return
		end
		local cameraCFrame = camera.CFrame
		local cameraForward = Vector3.new(cameraCFrame.LookVector.X, 0, cameraCFrame.LookVector.Z)
		local cameraRight = Vector3.new(cameraCFrame.RightVector.X, 0, cameraCFrame.RightVector.Z)
		if cameraForward.Magnitude < 0.001 or cameraRight.Magnitude < 0.001 then return end
		cameraForward = cameraForward.Unit
		cameraRight = cameraRight.Unit
		local worldDirection = (cameraRight * inputVector.X) + (cameraForward * -inputVector.Z)
		if worldDirection.Magnitude <= 0 then return end
		worldDirection = worldDirection.Unit
		local finalSpeed = humanoid.WalkSpeed * math.clamp(inputMagnitude, 0, 1)
		local clampedDt = math.clamp(dt, 0, 1 / 30)
		rootPart.AssemblyLinearVelocity = Vector3.zero
		rootPart.CFrame = rootPart.CFrame + (worldDirection * finalSpeed * clampedDt)
		rootPart.CFrame = CFrame.new(rootPart.Position, rootPart.Position + worldDirection)
	end)
	G.g2.Connections_2[#G.g2.Connections_2 + 1] = antiNoiseConn
end)

G.g2.Toggles.BypassNoise:OnChanged(function(value)
	for i = #G.g2.Connections_2, 1, -1 do
		local existingConnection = G.g2.Connections_2[i]
		if existingConnection and existingConnection.Disconnect then
			existingConnection:Disconnect()
		end
		table.remove(G.g2.Connections_2, i)
	end

	if not value then return end

	local function checkBypassNoiseTvStand(targetTvStand)
		if not targetTvStand:IsA("Model") then return end
		if targetTvStand.Name ~= "TV_Stand" then return end

		local tvStandCurrentCFrame = targetTvStand:GetPivot()

		if tvStandCurrentCFrame.Position.Y > -119 then
			targetTvStand:PivotTo(CFrame.new(
				tvStandCurrentCFrame.Position.X,
				-120,
				tvStandCurrentCFrame.Position.Z
			))
		end
	end

	local bypassNoiseMiscFolder = workspace:FindFirstChild("Misc")
	if not bypassNoiseMiscFolder then return end

	local bypassNoiseMiscChildAddedConnection = bypassNoiseMiscFolder.ChildAdded:Connect(function(bypassNoiseNewChild)
		checkBypassNoiseTvStand(bypassNoiseNewChild)
	end)

	G.g2.Connections_2[#G.g2.Connections_2 + 1] = bypassNoiseMiscChildAddedConnection

	for _, bypassNoiseMiscChild in ipairs(bypassNoiseMiscFolder:GetChildren()) do
		checkBypassNoiseTvStand(bypassNoiseMiscChild)
	end
end)

G.g2.Toggles.DroppedItemValue:OnChanged(function(DroppedItemValue)
	local DroppedItemValueScreenGui = game:GetService("CoreGui"):FindFirstChild("DropsCoinCounter")
	if not DroppedItemValue then
		if DroppedItemValueScreenGui then DroppedItemValueScreenGui:Destroy() end
		return
	end
	local DroppedItemValueWorkspaceDrops = workspace:WaitForChild("Drops")
	if DroppedItemValueScreenGui then DroppedItemValueScreenGui:Destroy() end
	DroppedItemValueScreenGui = Instance.new("ScreenGui")
	DroppedItemValueScreenGui.Name = "DropsCoinCounter"
	DroppedItemValueScreenGui.ResetOnSpawn = false
	DroppedItemValueScreenGui.Parent = game:GetService("CoreGui")
	local DroppedItemValueCoinText = Instance.new("TextLabel")
	DroppedItemValueCoinText.Name = "CoinText"
	DroppedItemValueCoinText.AnchorPoint = Vector2.new(0.5, 0)
	DroppedItemValueCoinText.Position = UDim2.new(0.5, 0, 0.02, 0)
	DroppedItemValueCoinText.Size = UDim2.new(0, 250, 0, 40)
	DroppedItemValueCoinText.BackgroundTransparency = 1
	DroppedItemValueCoinText.Text = "Items: 0"
	DroppedItemValueCoinText.TextSize = 24
	DroppedItemValueCoinText.Font = Enum.Font.GothamBold
	DroppedItemValueCoinText.TextColor3 = Color3.fromRGB(255, 255, 255)
	DroppedItemValueCoinText.TextStrokeTransparency = 0.5
	DroppedItemValueCoinText.Parent = DroppedItemValueScreenGui
	local DroppedItemValueCountedDrops = {}
	task.spawn(function()
		while G.g2.Toggles.DroppedItemValue.Value do
			for _, DroppedItemValueDrop in ipairs(DroppedItemValueWorkspaceDrops:GetChildren()) do
				if DroppedItemValueDrop:IsA("Model") and not DroppedItemValueCountedDrops[DroppedItemValueDrop] then
					DroppedItemValueDrop:SetAttribute("CoinsChecked", true)
					DroppedItemValueCountedDrops[DroppedItemValueDrop] = true
				end
			end
			for DroppedItemValueDrop in pairs(DroppedItemValueCountedDrops) do
				if not DroppedItemValueDrop.Parent or DroppedItemValueDrop.Parent ~= DroppedItemValueWorkspaceDrops then
					DroppedItemValueCountedDrops[DroppedItemValueDrop] = nil
				end
			end
			local DroppedItemValueTotalItems = 0
			for DroppedItemValueDrop in pairs(DroppedItemValueCountedDrops) do
				if DroppedItemValueDrop.Parent == DroppedItemValueWorkspaceDrops then
					DroppedItemValueTotalItems += 1
				end
			end
			DroppedItemValueCoinText.Text = "Items: " .. DroppedItemValueTotalItems
			task.wait(1)
		end
		if DroppedItemValueScreenGui and DroppedItemValueScreenGui.Parent then
			DroppedItemValueScreenGui:Destroy()
		end
	end)
end)

-- Halloween
G.g2.Groupboxes.Halloween_Misc = Tabs.Halloween:AddLeftGroupbox("Exploits / Anti")
--[[
 Groupboxes.Halloween_Misc:AddButton({
	Text = "Candy Farm",
	Func = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/coolcookiebusiness/AbysallHubContinued/refs/heads/main/Games/Doors/verity's%20auto%20farm.txt")) end,
	DoubleClick = false,
	Tooltip = "By Indexell."
}) 
--]]
G.g2.Groupboxes.Halloween_Misc:AddToggle("SkipCutsenesHalloween", {
	Text = "Skip Cutsenes", Default = false,
	Tooltip = "Skip cutsenes."
})
G.g2.Groupboxes.Halloween_Misc:AddToggle("RemoveFogHalloween", {
    Text = "Remove Extra Fog",
    Default = false,
    Tooltip = "Removes The extra fog."
})
G.g2.Groupboxes.Halloween_Misc:AddButton({
	Text = "Bring Dropped Candy",
	Func = function() BringDroppedItems() end,
	DoubleClick = false,
	Tooltip = "Brings all dropped Candy (use for the depot)."
})

G.g2.Groupboxes.Halloween_Misc:AddToggle("EnableDroppedItemsIntervalHalloween", {
	Text = "Enable Interval",
	Default = false,
	Tooltip = "Automatically brings candy items at the selected interval."
})

G.g2.Groupboxes.Halloween_Misc:AddSlider("DroppedItemsIntervalHalloween", {
	Text = "Interval",
	Default = 1,
	Min = 0,
	Max = 60,
	Rounding = 1,
	Compact = false,
	Tooltip = "How often dropped items are brought."
})

G.g2.Toggles.EnableDroppedItemsIntervalHalloween:OnChanged(function(enabled)
	if enabled then
		if G.g2.droppedItemsIntervalRunning then return end
		G.g2.droppedItemsIntervalRunning = true
		task.spawn(function()
			while G.g2.Toggles.EnableDroppedItemsIntervalHalloween.Value do
				BringDroppedItems()
				local interval = G.g2.Options.DroppedItemsIntervalHalloween.Value
				if interval <= 0 then
					task.wait()
				else
					task.wait(interval)
				end
			end
			G.g2.droppedItemsIntervalRunning = false
		end)
	end
end)

G.g2.Toggles.SkipCutsenesHalloween:OnChanged(function(Value)
    if Value then
        task.spawn(function()
            local Event = game:GetService("ReplicatedStorage").FloorReplicated.ClientRemote.SkipCutscene.Remote

            while G.g2.Toggles.SkipCutsenesHalloween.Value do
                Event:FireServer(1, true)
                Event:FireServer(2, true)


                task.wait(0.5)
            end
        end)
    end
end)
G.g2.Toggles.RemoveFogHalloween:OnChanged(function(Value)
    if Value then
        task.spawn(function()
            while G.g2.Toggles.RemoveFogHalloween.Value do
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v.Name == "FogScout" or v.Name == "FogHolder" then
                        v:Destroy()
                    end
                end

                task.wait(0.5)
            end
        end)
    end
end)
-- hi

G.g2.Groupboxes.Exploits_BypassRight = Tabs.Exploits:AddRightGroupbox("Bypass")
G.g2.Groupboxes.Exploits_BypassRight:AddToggle("DisableAnticheat", {
	Text = "Anticheat Bypass", Default = false,
	Tooltip = "Completely disables the anticheat, after interacting with a ladder."
})
G.g2.Groupboxes.Exploits_BypassRight:AddToggle("VelocityManipulationToggle", {
	Text = "Velocity Manipulation", Default = false,
	Tooltip = "Moves your character forward slowly, mitigating the game's anti-noclip."
})
G.g2.Toggles.DisableAnticheat:OnChanged(function(Value)
	if G.g2.Globals.AnticheatDisabled == true and not Value then
		G.g3.RemotesFolder.ClimbLadder:FireServer()
		G.g2.Globals.AnticheatDisabled = false
	end
end)
G.g2.Toggles.VelocityManipulationToggle:AddKeyPicker("VelocityManipulationKeybind", {
	Text = "Velocity Manipulation", Default = "V",
	Mode = G.g2.Library.IsMobile and "Toggle" or "Hold", SyncToggleState = true
})
G.g2.Groupboxes.Exploits_BypassRight:AddDropdown("VelocityManipulationMode", {
	Values = {"Velocity", "Pivot"}, Text = "Manipulation Method",
	Default = 1,
})

G.g2.Groupboxes.Exploits_BypassRight:AddDivider()
G.g2.Groupboxes.Exploits_BypassRight:AddToggle("InfiniteItemsToggle", {
	Text = "Infinite Items", Default = false,
	Tooltip = "Allows certain items to be used without draining their uses.",
	Disabled = not G.g2.Functions.CheckCompatability({"fireproximityprompt"}),
	DisabledTooltip = G.g2.Globals.IncompatibleMessage
})
G.g2.Groupboxes.Exploits_BypassRight:AddDropdown("InfiniteItemsList", {
	Text = "Item List",
	Values = { "Lockpicks", "Skeleton Key", "Shears", "Multitool" },
	Multi = true, AllowNull = true,
	Disabled = not G.g2.Functions.CheckCompatability({"fireproximityprompt"}),
	DisabledTooltip = G.g2.Globals.IncompatibleMessage
})

G.g2.Groupboxes.Exploits_BypassRight:AddToggle("InfCrucifix", {
	Text = "Infinite Crucifix",
	Default = false,
	Tooltip = "Risky! You can die or lose the Crucifix. Recommended to have low ping and stable fps.",
	Risky = G.g3.Floor ~= "Ballz",
})


local InfCrucifixDropTable = {
	RushMoving   = 54,
	AmbushMoving = 67,
	A60          = 70,
	GlitchRush   = 120,
	GlitchAmbush = 155,
	A120         = 75,

}



G.g2.Toggles.InfCrucifix:OnChanged(function(Value)
	print("i allive")
	local InfCrucifixRaycastParams = RaycastParams.new()
	InfCrucifixRaycastParams.FilterType = Enum.RaycastFilterType.Blacklist

	local InfCrucifixConnection
	InfCrucifixConnection = G.g3.RunService.RenderStepped:Connect(function()
		if not G.g2.Toggles.InfCrucifix.Value then
			if InfCrucifixConnection then
				InfCrucifixConnection:Disconnect()
			end
			return
		end

		local InfCrucifixCharacter = game.Players.LocalPlayer
		if not InfCrucifixCharacter then
			return
		end

		local InfCrucifixCollision = InfCrucifixCharacter:FindFirstChild("CollisionPart")
		if not InfCrucifixCollision then
			return
		end

		InfCrucifixRaycastParams.FilterDescendantsInstances = {InfCrucifixCharacter}

		for _, InfCrucifixEntity in ipairs(Workspace:GetChildren()) do
			local InfCrucifixMaxDistance = InfCrucifixDropTable[InfCrucifixEntity.Name]
			if not InfCrucifixMaxDistance or not InfCrucifixEntity.PrimaryPart then
				continue
			end

			InfCrucifixEntity.PrimaryPart.CanCollide = true
			InfCrucifixEntity.PrimaryPart.CanQuery = true

			local InfCrucifixOrigin = InfCrucifixCollision.Position
			local InfCrucifixDirection = InfCrucifixEntity.PrimaryPart.Position - InfCrucifixOrigin
			local InfCrucifixRayResult = Workspace:Raycast(InfCrucifixOrigin, InfCrucifixDirection, InfCrucifixRaycastParams)

			if not InfCrucifixRayResult or not InfCrucifixRayResult.Instance:IsDescendantOf(InfCrucifixEntity) then
				continue
			end

			local InfCrucifixDistance = (InfCrucifixCollision.Position - InfCrucifixEntity.PrimaryPart.Position).Magnitude
			if InfCrucifixDistance >= InfCrucifixMaxDistance then
				continue
			end

			local InfCrucifixTool = InfCrucifixCharacter:FindFirstChildOfClass("Tool")
			if not InfCrucifixTool or InfCrucifixTool.Name ~= "Crucifix" then
				continue
			end

			task.spawn(function()
				ReplicatedStorage.RemotesFolder.DropItem:FireServer(InfCrucifixTool)
				task.wait(0.54)
				print("hi")
				local InfCrucifixDrops = Workspace:FindFirstChild("Drops")
				if not InfCrucifixDrops then
					return
				end

				local InfCrucifixDropped = InfCrucifixDrops:FindFirstChild("Crucifix")
				if not InfCrucifixDropped then
					return
				end

				local InfCrucifixPrompt = InfCrucifixDropped:FindFirstChildOfClass("ProximityPrompt")
				if InfCrucifixPrompt then
					fireproximityprompt(InfCrucifixPrompt)
				end
			end)
			print ("hi")
			task.wait(0.6)
		end
	end)
end)


G.g2.Groupboxes.Exploits_BypassRight:AddDivider()
G.g2.Groupboxes.Exploits_BypassRight:AddToggle("PositionSpoof", {
	Text = "Position Spoof", Default = false,
	Tooltip = "Makes your character appear underground on the server, protecting you from rush-like entities."
})
G.g2.Groupboxes.Exploits_BypassRight:AddToggle("CrouchSpoof", {
	Text = "Crouch Spoof", Default = false, Tooltip = "Makes the game think you are always crouching."
})
G.g2.Toggles.PositionSpoof:OnChanged(function(Value)
	if G.g3.Floor ~= "Fools" and G.g3.Floor ~= "OldHotel" then
		if Value then
			G.g3.RootPart.CFrame = G.g3.RootPart.CFrame * CFrame.new(0, -2.346, 0)
			G.g3.Humanoid.HipHeight = 0.05
			G.g3.RemotesFolder.Crouch:FireServer(true, true)
		else
			G.g3.RootPart.CFrame = G.g3.RootPart.CFrame * CFrame.new(0, 2.346, 0)
			G.g3.Humanoid.HipHeight = 2.396
		end
	end
end)
G.g2.Toggles.PositionSpoof:AddKeyPicker("PositionSpoof", {
	Text = "Position Spoof", Default = "B", Mode = "Toggle", SyncToggleState = true
})
G.g2.Toggles.CrouchSpoof:OnChanged(function(Value)
	if G.g3.RemotesFolder:FindFirstChild("Crouch") then
		G.g3.RemotesFolder.Crouch:FireServer(Value and true or G.g2.Functions.IsCrouching(), true)
	end
end)

G.g2.Groupboxes.Exploits_Remove = Tabs.Exploits:AddRightGroupbox("Remove")
G.g2.Groupboxes.Exploits_Remove:AddToggle("RemoveScreech", { Text = "Remove Screech",  Default = false, Tooltip = "Prevents 'Screech' from spawning." })
G.g2.Groupboxes.Exploits_Remove:AddToggle("RemoveHalt",    { Text = "Remove Halt",     Default = false, Tooltip = "Prevents 'Halt' from spawning." })
G.g2.Groupboxes.Exploits_Remove:AddToggle("RemoveA90",     { Text = "Remove A-90",     Default = false, Tooltip = "Prevents 'A-90' from spawning." })
G.g2.Groupboxes.Exploits_Remove:AddToggle("RemoveDread",   { Text = "Remove Dread",    Default = false, Tooltip = "Prevents 'Dread' from spawning." })
G.g2.Groupboxes.Exploits_Remove:AddToggle("RemoveSurge", { Text = "Remove Surge", Default = false, Tooltip = "Prevents 'Surge' from spawning."})
G.g2.Groupboxes.Exploits_Remove:AddDivider()
G.g2.Groupboxes.Exploits_Remove:AddToggle("NoScreechDamage", { Text = "No Screech Damage", Default = false, Tooltip = "Prevents 'Screech' from hurting you." })
G.g2.Groupboxes.Exploits_Remove:AddToggle("NoHaltDamage",    { Text = "No Halt Damage",    Default = false, Tooltip = "Prevents 'Halt' from hurting you." })
G.g2.Groupboxes.Exploits_Remove:AddToggle("NoA90Damage",     { Text = "No A-90 Damage",    Default = false, Tooltip = "Prevents 'A-90' from hurting you." })
G.g2.Groupboxes.Exploits_Remove:AddToggle("NoSurgeDamage",   { Text = "No Surge Damage",   Default = false, Tooltip = "Prevents 'Surge' from hurting you." })

G.g2.Toggles.NoScreechDamage:OnChanged(function(Value)
	if Value then
		FakeEvents.Screech.Parent = G.g3.RemotesFolder
		FakeEvents.Screech_Real.Parent = nil
	else
		FakeEvents.Screech_Real.Parent = G.g3.RemotesFolder
		FakeEvents.Screech.Parent = nil
	end
end)
G.g2.Toggles.NoHaltDamage:OnChanged(function(Value)
	if Value then
		FakeEvents.Shade.Parent = G.g3.RemotesFolder
		FakeEvents.Shade_Real.Parent = nil
	else
		FakeEvents.Shade_Real.Parent = G.g3.RemotesFolder
		FakeEvents.Shade.Parent = nil
	end
end)
G.g2.Toggles.NoA90Damage:OnChanged(function(Value)
	if G.g3.RemotesFolder:FindFirstChild("A90") then
		if Value then
			FakeEvents.A90.Parent = G.g3.RemotesFolder
			FakeEvents.A90_Real.Parent = nil
		else
			FakeEvents.A90_Real.Parent = G.g3.RemotesFolder
			FakeEvents.A90.Parent = nil
		end
	end
end)
G.g2.Toggles.NoSurgeDamage:OnChanged(function(Value)
	if G.g3.RemotesFolder:FindFirstChild("SurgeRemote") then
		if Value then
			FakeEvents.Surge.Parent = G.g3.RemotesFolder
			FakeEvents.Surge_Real.Parent = nil
		else
			FakeEvents.Surge_Real.Parent = G.g3.RemotesFolder
			FakeEvents.Surge.Parent = nil
		end
	end
end)

local Modules = {}

G.g2.Toggles.RemoveScreech:OnChanged(function(Value)
	if Value then
		task.spawn(function()
			while G.g2.Toggles.RemoveScreech.Value do
				local Camera = workspace:FindFirstChild("Camera")

				if Camera then
					local Screech = Camera:FindFirstChild("Screech")

					if Screech then
						Screech:Destroy()
					end
				end

				task.wait()
			end
		end)
	end
end)
G.g2.Toggles.RemoveHalt:OnChanged(function(Value)
	Modules.Shade.Name = Value and "Shade_Disabled" or "Shade"
end)
G.g2.Toggles.RemoveA90:OnChanged(function(Value)
	if Modules.A90 then
		Modules.A90.Name = Value and "A90_Disabled" or "A90"
	end
end)
G.g2.Toggles.RemoveDread:OnChanged(function(Value)
	if Modules.Dread then
		Modules.Dread.Name = Value and "Dread_Disabled" or "Dread"
	end
end)
G.g2.Toggles.RemoveSurge:OnChanged(function(Value)
	if G.g2.Globals.SurgeFrame then
		G.g2.Globals.SurgeFrame.Name = (Value and "SurgeVignette_Disabled" or "SurgeVignette")
	end
end)

G.g2.Groupboxes.Exploits_Audio = Tabs.Exploits:AddLeftGroupbox("Audio")
G.g2.Globals.JamMuffle = G.g2.Services.SoundService:WaitForChild("Main"):FindFirstChild("Jamming") or Instance.new("EqualizerSoundEffect")

G.g2.Groupboxes.Exploits_Audio:AddToggle("RemoveFootstepSounds",    { Text = "Remove Footstep Sounds",    Default = false, Tooltip = "Removes the sounds when walking." })
G.g2.Groupboxes.Exploits_Audio:AddToggle("RemoveJamminMusic",       { Text = "Remove Jammin Music",       Default = false, Tooltip = "Removes the music and muffle effect from the 'Jammin' modifier." })
G.g2.Groupboxes.Exploits_Audio:AddToggle("RemoveInteractingSounds", { Text = "Remove Interacting Sounds", Default = false, Tooltip = "Removes the sounds when interacting with proximity prompts." })

G.g2.Toggles.RemoveJamminMusic:OnChanged(function(Value)
	local Jam = G.g2.Globals.MainUI.Initiator.Main_Game.Health:FindFirstChild("Jam")
	if Jam then
		Jam.Volume = Value and 0 or 0.45
		G.g2.Globals.JamMuffle.Enabled = G.g3.LiveModifiers:FindFirstChild("Jammin") and not Value or false
	end
end)
G.g2.Toggles.RemoveInteractingSounds:OnChanged(function(Value)
	local PS = G.g2.Globals.MainUI.Initiator.Main_Game.PromptService
	PS.Triggered.Volume   = Value and 0 or 0.04
	PS.Holding.Volume     = Value and 0 or 0.1
	PS.Notification.Volume = Value and 0 or 0.03
	G.g2.Globals.MainUI.Initiator.Main_Game.Reminder.Caption.Volume = Value and 0 or 0.1
end)

G.g2.Groupboxes.Visuals_LeftTab = Tabs.Visuals:AddLeftTabbox("Camera / Effects")
G.g2.Groupboxes.Visuals_Camera = G.g2.Groupboxes.Visuals_LeftTab:AddTab("Camera")
G.g2.Groupboxes.Visuals_Camera:AddToggle("AmbientToggle", { Text = "Ambient", Default = false, Tooltip = "Changes the lighting color to the specified value." })
G.g2.Groupboxes.Visuals_Camera:AddSlider("FieldOfView", { Text = "Field of View", Min = 1, Max = 120, Default = 70, Rounding = 0 })
G.g2.Groupboxes.Visuals_Camera:AddToggle("FOVToggle", {    Text = "Custom FOV",    Default = false,    Tooltip = "Only applies the Field of View slider when enabled." })
G.g2.Toggles.FOVToggle:AddKeyPicker("FovToggle", {Text = "Custom Fov", Default = "O", Mode = "Toggle", SyncToggleState = true})
G.g2.Groupboxes.Visuals_Camera:AddDivider()
G.g2.Groupboxes.Visuals_Camera:AddToggle("RemoveCameraShake", {
	Text = "Remove Camera Shake", Default = false, Tooltip = "Prevents the camera from shaking.",
	Disabled = not G.g2.Functions.CheckCompatability({"require"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage
})
G.g2.Groupboxes.Visuals_Camera:AddToggle("RemoveCameraBobbing", {
	Text = "Remove Camera Bobbing", Default = false, Tooltip = "Prevents the camera from bobbing when moving.",
	Disabled = not G.g2.Functions.CheckCompatability({"require"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage
})
G.g2.Groupboxes.Visuals_Camera:AddToggle("RemoveCutscenes", { Text = "Remove Cutscenes", Default = false, Tooltip = "Removes all non-necessary cutscenes." })
G.g2.Groupboxes.Visuals_Camera:AddToggle("RemoveCameraFog", { Text = "Remove Fog", Default = false, Tooltip = "Removes all fog effects from the camera." })
G.g2.Groupboxes.Visuals_Camera:AddDivider()
G.g2.Groupboxes.Visuals_Camera:AddToggle("ThirdPersonToggle", { Text = "Third Person", Default = false, Tooltip = "Zooms out your camera, allowing you to see your character from behind." })
G.g2.Toggles.ThirdPersonToggle:AddKeyPicker("ThirdPersonKeybind", { Text = "Third Person", Default = "T", Mode = "Toggle", SyncToggleState = true })
G.g2.Groupboxes.Visuals_Camera:AddSlider("ThirdPersonOffsetX", { Text = "X Offset", Min = -10, Max = 10, Default = 1.5, Rounding = 1, Compact = true })
G.g2.Groupboxes.Visuals_Camera:AddSlider("ThirdPersonOffsetY", { Text = "Y Offset", Min = -10, Max = 10, Default = 1,   Rounding = 1, Compact = true })
G.g2.Groupboxes.Visuals_Camera:AddSlider("ThirdPersonOffsetZ", { Text = "Z Offset", Min = -10, Max = 10, Default = 5,   Rounding = 1, Compact = true })
G.g2.Groupboxes.Visuals_Camera:AddToggle("ThirdPersonWallCheck", { Text = "Wall Check", Default = false, Tooltip = "Prevents third person from going through walls." })
G.g2.Groupboxes.Visuals_Camera:AddDivider()
G.g2.Groupboxes.Visuals_Camera:AddToggle("ViewmodelOffsetToggle", {
	Text = "Viewmodel Offset", Default = false, Tooltip = "Changes the offset of your viewmodel while holding an item.",
	Disabled = not G.g2.Functions.CheckCompatability({"require"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage
})
G.g2.Groupboxes.Visuals_Camera:AddSlider("ViewmodelOffsetX", { Text = "X Offset", Min = -10, Max = 10, Default = 0, Rounding = 1, Compact = true, Disabled = not G.g2.Functions.CheckCompatability({"require"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage })
G.g2.Groupboxes.Visuals_Camera:AddSlider("ViewmodelOffsetY", { Text = "Y Offset", Min = -10, Max = 10, Default = 0, Rounding = 1, Compact = true, Disabled = not G.g2.Functions.CheckCompatability({"require"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage })
G.g2.Groupboxes.Visuals_Camera:AddSlider("ViewmodelOffsetZ", { Text = "Z Offset", Min = -10, Max = 10, Default = 0, Rounding = 1, Compact = true, Disabled = not G.g2.Functions.CheckCompatability({"require"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage })

G.g2.Toggles.AmbientToggle:AddColorPicker("AmbientColor", { Text = "Ambient", Default = Color3.fromRGB(255, 255, 255), Transparency = 0 })
G.g2.Toggles.AmbientToggle:OnChanged(function(Value)
	local OldAmbient = G.g3.CurrentRooms:FindFirstChild(tostring(LocalPlayer:GetAttribute("CurrentRoom"))):GetAttribute("Ambient")
	G.g2.Services.TweenService:Create(G.g2.Services.Lighting, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
		Ambient = Value and G.g2.Options.AmbientColor.Value or OldAmbient
	}):Play()
end)

G.g10.Main_Game = nil
G.g10.ClientModules = nil

G.g2.Toggles.RemoveCameraBobbing:OnChanged(function(Value)
	if G.g10.Main_Game then G.g10.Main_Game.spring.Speed = Value and 9e9 or 8 end
end)
G.g2.Toggles.RemoveCameraFog:OnChanged(function(Value)
	G.g2.Services.Lighting.FogEnd = Value and 10000000 or G.g2.Globals.OldFog
	for _, Object in G.g2.Globals.FogInstances do
		Object.Density = Value and 0 or Object:GetAttribute("Density_Old")
	end
end)
G.g2.Toggles.RemoveCutscenes:OnChanged(function(Value)
    local Cutscenes = G.g2.Globals.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes
    for _, Object in pairs(Cutscenes:GetChildren()) do
        if table.find(G.g3.CutsceneNames, Object.Name) and Object:IsA("ModuleScript") or table.find(G.g3.CutsceneNames, Object:GetAttribute("OriginalName")) and Object:IsA("ModuleScript") then
            Object.Name = (Value and Object.Name .. "_Disabled" or Object:GetAttribute("OriginalName"))
        end
    end
    for _, Object in pairs(G.g3.FloorReplicated:GetChildren()) do
        if table.find(G.g3.CutsceneNames, Object.Name) and Object:IsA("ModuleScript") or table.find(G.g3.CutsceneNames, Object:GetAttribute("OriginalName")) and Object:IsA("ModuleScript") then
            Object.Name = (Value and Object.Name .. "_Disabled" or Object:GetAttribute("OriginalName"))
        end
    end
end)

G.g2.Groupboxes.Visuals_Effects = G.g2.Groupboxes.Visuals_LeftTab:AddTab("Effects")
G.g2.Groupboxes.Visuals_Effects:AddToggle("TransparentHidingSpotsToggle", { Text = "Transparent Hiding Spots", Default = false, Tooltip = "Makes a hiding spot transparent when you enter it." })
G.g2.Groupboxes.Visuals_Effects:AddSlider("TransparentHidingSpotsSlider", { Text = "Transparency", Min = 0, Max = 1, Default = 0.5, Rounding = 2, Compact = true })

local function ApplyHidingTransparency(Value, SliderValue)
	for _, Object in G.g2.Objects.HidingSpots do
		local IsHiding = false
		for _, Child in Object:GetDescendants() do
			if Child.Name == "HiddenPlayer" and Child.Value == G.g3.Character then
				IsHiding = true
				break
			end
		end
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") and Part:GetAttribute("Transparency_Old") then
				G.g2.Services.TweenService:Create(Part, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
					Transparency = (Value and IsHiding) and SliderValue or Part:GetAttribute("Transparency_Old")
				}):Play()
			end
		end
	end
end

G.g2.Toggles.TransparentHidingSpotsToggle:OnChanged(function(Value)
	ApplyHidingTransparency(Value, G.g2.Options.TransparentHidingSpotsSlider.Value)
end)
G.g2.Options.TransparentHidingSpotsSlider:OnChanged(function(Value)
	ApplyHidingTransparency(G.g2.Toggles.TransparentHidingSpotsToggle.Value, Value)
end)

G.g2.Groupboxes.Visuals_Effects:AddDivider()
G.g2.Groupboxes.Visuals_Effects:AddToggle("DisableGlitchJumpscare",   { Text = "Disable Glitch Jumpscare",   Default = false, Tooltip = "Disables the jumpscare from 'Glitch'" })
G.g2.Groupboxes.Visuals_Effects:AddToggle("DisableTimothyJumpscare",  { Text = "Disable Timothy Jumpscare",  Default = false, Tooltip = "Disables the jumpscare from 'Timothy'" })
G.g2.Groupboxes.Visuals_Effects:AddToggle("DisableVoidJumpscare",     { Text = "Disable Void Jumpscare",     Default = false, Tooltip = "Disables the jumpscare from 'Void'" })
G.g2.Groupboxes.Visuals_Effects:AddDivider()
G.g2.Groupboxes.Visuals_Effects:AddToggle("DisableHideVignette",      { Text = "Disable Hide Vignette",      Default = false, Tooltip = "Disables the hiding screen effect." })
G.g2.Groupboxes.Visuals_Effects:AddToggle("DisableFiredampEffect",    { Text = "Disable Firedamp Effect",    Default = false, Tooltip = "Disables the firedamp screen effect." })
G.g2.Groupboxes.Visuals_Effects:AddToggle("DisableEntityJumpscares",  { Text = "Disable Entity Jumpscares",  Default = false, Tooltip = "Disables jumpscares from entities like Rush and Ambush." })

G.g2.Toggles.DisableGlitchJumpscare:OnChanged(function(Value)
	Modules.Glitch.Name = Value and "Glitch_Disabled" or "Glitch"
end)
G.g2.Toggles.DisableTimothyJumpscare:OnChanged(function(Value)
	Modules.SpiderJumpscare.Name = Value and "SpiderJumpscare_Disabled" or "SpiderJumpscare"
end)
G.g2.Toggles.DisableVoidJumpscare:OnChanged(function(Value)
	if Modules.Void then Modules.Void.Name = Value and "Void_Disabled" or "Void" end
end)
G.g2.Toggles.DisableHideVignette:OnChanged(function(Value)
	local Vignette = G.g2.Globals.MainUI:FindFirstChild("HideVignette") or G.g2.Globals.MainUI.MainFrame:FindFirstChild("HideVignette")
	if Vignette then Vignette.Image = Value and "Disabled" or "rbxassetid://6100076320" end
end)
G.g2.Toggles.DisableFiredampEffect:OnChanged(function(Value)
	for _, Object in G.g3.CurrentRooms:GetChildren() do
		if Value then
			Object:SetAttribute("Firedamp", false)
			for _, FiredampObj in G.g3.Camera:GetChildren() do
				if FiredampObj.Name == "LiveFiredamp" then FiredampObj:Destroy() end
			end
		else
			Object:SetAttribute("Firedamp", Object:GetAttribute("Firedamp_Old"))
		end
	end
	local Old = LocalPlayer:GetAttribute("CurrentRoom")
	LocalPlayer:SetAttribute("CurrentRoom", 0)
	task.wait()
	LocalPlayer:SetAttribute("CurrentRoom", Old)
end)
G.g2.Toggles.DisableEntityJumpscares:OnChanged(function(Value)
	local Jumpscares = G.g2.Globals.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild("Jumpscares")
		or G.g2.Globals.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild("Jumpscares_Disabled")
	if Jumpscares then
		Jumpscares.Name = Value and "Jumpscares_Disabled" or "Jumpscares"
		for _, Object in G.g2.Objects.JumpscareModules do
			Object.Name = Value and (Object:GetAttribute("OriginalName") .. "_Disabled") or Object:GetAttribute("OriginalName")
		end
	end
end)

G.g2.Groupboxes.Visuals_RightTab     = Tabs.Visuals:AddRightTabbox("Entities / Settings / Entity Nodes")
G.g2.Groupboxes.Visuals_Entities     = G.g2.Groupboxes.Visuals_RightTab:AddTab("Entities")
G.g2.Groupboxes.Visuals_EntitySettings = G.g2.Groupboxes.Visuals_RightTab:AddTab("Settings")

G.g2.Groupboxes.Visuals_Entities:AddDropdown("EntityList", {
	Text = "Entity List",
	Values = { "Rush","Bash","Scribbles","Teller","DronesStampede","Creak","Noise","Noise_TV","Balls","Portrait","CreakHalloween","Weaveling","Ambush","Eyes","Halt","Blitz","Lookman","Gloombat Swarm","A-60","A-120","Sally","Jeff the Killer","Groundskeeper","Monument","AR0xMBUSH","RNIUSHCG==" },
	Multi = true, AllowNull = true
})
G.g2.Groupboxes.Visuals_Entities:AddToggle("NotifyEntities",    { Text = "Notify Entities",    Default = false, Tooltip = "Sends a notification when an entity spawns." })
G.g2.Groupboxes.Visuals_Entities:AddDivider()
G.g2.Groupboxes.Visuals_Entities:AddToggle("ShowEntityPath", {
    Text = "Show Entity Path",
    Default = false,
    Tooltip = "Shows the path of entitys."
})


G.g2.Groupboxes.Visuals_Entities:AddSlider("ShowEntityPathNodeTransparency", {
    Text = "Node Transparency",
    Default = 0,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
    Tooltip = "Transparency of the path nodes when shown"
})

G.g2.Groupboxes.Visuals_Entities:AddSlider("ShowEntityPathLineTransparency", {
    Text = "Line Transparency",
    Default = 0.15,
    Min = 0,
    Max = 1,
    Rounding = 2,
    Compact = false,
    Tooltip = "Transparency of the path lines"
})

G.g2.Groupboxes.Visuals_Entities:AddSlider("ShowEntityPathLineThickness", {
    Text = "Line Thickness",
    Default = 0.3,
    Min = 0.08,
    Max = 1.2,
    Rounding = 2
})

G.g11.ShowEntityPathLines = {}

function G.g11.ShowEntityPathClearAllLines()
    for _, ShowEntityPathRoomLines in pairs(G.g11.ShowEntityPathLines) do
        for _, ShowEntityPathLine in ipairs(ShowEntityPathRoomLines) do
            if ShowEntityPathLine and ShowEntityPathLine.Parent then
                ShowEntityPathLine:Destroy()
            end
        end
    end
    table.clear(G.g11.ShowEntityPathLines)
end

function G.g11.ShowEntityPathCreateLine(ShowEntityPathPoint1, ShowEntityPathPoint2, ShowEntityPathTransparency, ShowEntityPathThickness, ShowEntityPathParent)
    local ShowEntityPathDistance = (ShowEntityPathPoint1 - ShowEntityPathPoint2).Magnitude
    if ShowEntityPathDistance < 0.05 then
        return nil
    end

    local ShowEntityPathLinePart = Instance.new("Part")
    ShowEntityPathLinePart.Name = "PathLine"
    ShowEntityPathLinePart.Anchored = true
    ShowEntityPathLinePart.CanCollide = false
    ShowEntityPathLinePart.CanQuery = false
    ShowEntityPathLinePart.CanTouch = false
    ShowEntityPathLinePart.CastShadow = false
    ShowEntityPathLinePart.Material = Enum.Material.ForceField
    ShowEntityPathLinePart.Color = Color3.fromRGB(0, 255, 210)
    ShowEntityPathLinePart.Transparency = ShowEntityPathTransparency
    ShowEntityPathLinePart.Size = Vector3.new(ShowEntityPathThickness, ShowEntityPathThickness, ShowEntityPathDistance)
    ShowEntityPathLinePart.CFrame = CFrame.lookAt(ShowEntityPathPoint1, ShowEntityPathPoint2) * CFrame.new(0, 0, -ShowEntityPathDistance / 2)
    ShowEntityPathLinePart.Parent = ShowEntityPathParent
    return ShowEntityPathLinePart
end

function G.g11.ShowEntityPathGetSortedNodes(ShowEntityPathNodes)
    local ShowEntityPathSortedNodes = {}
    for _, ShowEntityPathNode in ipairs(ShowEntityPathNodes:GetChildren()) do
        if ShowEntityPathNode:IsA("BasePart") then
            local ShowEntityPathNodeNumber = tonumber(ShowEntityPathNode.Name)
            if ShowEntityPathNodeNumber then
                table.insert(ShowEntityPathSortedNodes, {
                    Part = ShowEntityPathNode,
                    Number = ShowEntityPathNodeNumber
                })
            end
        end
    end
    table.sort(ShowEntityPathSortedNodes, function(a, b)
        return a.Number < b.Number
    end)
    return ShowEntityPathSortedNodes
end

function G.g11.ShowEntityPathSetNodeTransparency(ShowEntityPathTransparency)
    for _, ShowEntityPathRoom in ipairs(workspace.CurrentRooms:GetChildren()) do
        local ShowEntityPathNodes = ShowEntityPathRoom:FindFirstChild("PathfindNodes")
        if ShowEntityPathNodes then
            for _, ShowEntityPathNode in ipairs(ShowEntityPathNodes:GetChildren()) do
                if ShowEntityPathNode:IsA("BasePart") then
                    ShowEntityPathNode.Transparency = ShowEntityPathTransparency
                end
            end
        end
    end
end

function G.g11.ShowEntityPathSetLineTransparency(ShowEntityPathTransparency)
    for _, ShowEntityPathRoomLines in pairs(G.g11.ShowEntityPathLines) do
        for _, ShowEntityPathLine in ipairs(ShowEntityPathRoomLines) do
            if ShowEntityPathLine and ShowEntityPathLine.Parent then
                ShowEntityPathLine.Transparency = ShowEntityPathTransparency
            end
        end
    end
end

function G.g11.ShowEntityPathUpdateAll()
    local ShowEntityPathShow = G.g2.Toggles.ShowEntityPath.Value
    local ShowEntityPathNodeTransparency = ShowEntityPathShow and G.g2.Options.ShowEntityPathNodeTransparency.Value or 1
    local ShowEntityPathLineTransparency = G.g2.Options.ShowEntityPathLineTransparency.Value
    local ShowEntityPathLineThickness = G.g2.Options.ShowEntityPathLineThickness.Value

    G.g11.ShowEntityPathClearAllLines()

    if not ShowEntityPathShow then
        G.g11.ShowEntityPathSetNodeTransparency(1)
        return
    end

    G.g11.ShowEntityPathSetNodeTransparency(ShowEntityPathNodeTransparency)

    local ShowEntityPathValidRooms = {}
    for _, ShowEntityPathRoom in ipairs(workspace.CurrentRooms:GetChildren()) do
        if ShowEntityPathRoom:FindFirstChild("PathfindNodes") then
            table.insert(ShowEntityPathValidRooms, ShowEntityPathRoom)
        end
    end

    table.sort(ShowEntityPathValidRooms, function(a, b)
        return (tonumber(a.Name) or 0) < (tonumber(b.Name) or 0)
    end)

    for _, ShowEntityPathRoom in ipairs(ShowEntityPathValidRooms) do
        local ShowEntityPathNodes = ShowEntityPathRoom.PathfindNodes
        local ShowEntityPathSortedNodes = G.g11.ShowEntityPathGetSortedNodes(ShowEntityPathNodes)

        if #ShowEntityPathSortedNodes > 0 then
            local ShowEntityPathRoomLines = {}

            for i = 1, #ShowEntityPathSortedNodes - 1 do
                local ShowEntityPathFrom = ShowEntityPathSortedNodes[i].Part
                local ShowEntityPathTo = ShowEntityPathSortedNodes[i + 1].Part

                local ShowEntityPathLine = G.g11.ShowEntityPathCreateLine(
                    ShowEntityPathFrom.Position,
                    ShowEntityPathTo.Position,
                    ShowEntityPathLineTransparency,
                    ShowEntityPathLineThickness,
                    ShowEntityPathRoom
                )
                if ShowEntityPathLine then
                    table.insert(ShowEntityPathRoomLines, ShowEntityPathLine)
                end
            end

            if #ShowEntityPathRoomLines > 0 then
                G.g11.ShowEntityPathLines[ShowEntityPathRoom] = ShowEntityPathRoomLines
            end
        end
    end
end

G.g2.Toggles.ShowEntityPath:OnChanged(function()
    if ShowEntityPathChildAddedConnection then
        ShowEntityPathChildAddedConnection:Disconnect()
        ShowEntityPathChildAddedConnection = nil
    end

    G.g11.ShowEntityPathUpdateAll()

    if G.g2.Toggles.ShowEntityPath.Value then
        ShowEntityPathChildAddedConnection = workspace.CurrentRooms.ChildAdded:Connect(function(ShowEntityPathRoom)
            if ShowEntityPathRoom:WaitForChild("PathfindNodes", 5) then
                task.wait(0.1)
                G.g11.ShowEntityPathUpdateAll()
            end
        end)
    end
end)

G.g2.Options.ShowEntityPathNodeTransparency:OnChanged(function()
    if G.g2.Toggles.ShowEntityPath.Value then
        G.g11.ShowEntityPathSetNodeTransparency(G.g2.Options.ShowEntityPathNodeTransparency.Value)
    end
end)

G.g2.Options.ShowEntityPathLineTransparency:OnChanged(function()
    if G.g2.Toggles.ShowEntityPath.Value then
        G.g11.ShowEntityPathSetLineTransparency(G.g2.Options.ShowEntityPathLineTransparency.Value)
    end
end)

G.g2.Options.ShowEntityPathLineThickness:OnChanged(function()
    if G.g2.Toggles.ShowEntityPath.Value then
        G.g11.ShowEntityPathUpdateAll()
    end
end)


G.g2.Groupboxes.Visuals_Entities:AddDivider()

local ItemsToNotify = {}
for Index, Name in pairs(G.g3.ItemNames) do
	if not table.find(ItemsToNotify, Name) then
		table.insert(ItemsToNotify, Name)
	end
end
table.sort(ItemsToNotify)

G.g2.Groupboxes.Visuals_Entities:AddDropdown("NotifyItemList", {
	Text = "Item List",
	Values = ItemsToNotify,
	Multi = true, AllowNull = true
})
G.g2.Groupboxes.Visuals_Entities:AddToggle("NotifyItemsToggle",    { Text = "Notify Items",    Default = false, Tooltip = "Sends a notification when an item spawns." })
G.g2.Groupboxes.Visuals_Entities:AddToggle("NotifyItemsShowDistance",    { Text = "Show Distance",    Default = false, Tooltip = "Shows how far away the item is in the notification." })
G.g2.Groupboxes.Visuals_Entities:AddDivider()
G.g2.Groupboxes.Visuals_Entities:AddToggle("NotifyLibraryCode", { Text = "Notify Library Code", Default = false, Tooltip = "Automatically solves the code for the library padlock." })
G.g2.Groupboxes.Visuals_Entities:AddToggle("NotifyOxygen",      { Text = "Notify Oxygen Level", Default = false, Tooltip = "Shows how much oxygen you have remaining." })
G.g2.Groupboxes.Visuals_Entities:AddToggle("NotifyHasteTime",   { Text = "Notify Haste Time",   Default = false, Tooltip = "Shows how much time you have remaining before 'Haste' spawns." })

G.g2.Globals.LibraryCodeFound = false
G.g2.Toggles.NotifyLibraryCode:OnChanged(function(Value)
	if Value then
		local Code = G.g2.Functions.GetLibraryCode()
		if Code and not Code:find("_") and not G.g2.Globals.LibraryCodeFound and G.g3.CurrentRooms:FindFirstChild("50") then
			local Lock = G.g2.Services.Workspace:FindFirstChild("Padlock", true)
			G.g2.Functions.Notify({ Title = "Padlock code found!", Body = "The code is: '" .. Code .. "'", Time = G.g2.Toggles.NotifyKeepNotifications.Value and Lock or 15 })
			G.g2.Globals.LibraryCodeFound = true
		end
	end
end)

G.g2.Groupboxes.Visuals_EntitySettings:AddToggle("EntityChatToggle", { Text = "Notify Chat", Default = false, Tooltip = "Sends a message in the chat when an entity spawns." })
G.g2.Groupboxes.Visuals_EntitySettings:AddInput("EntityChatMessage", { Text = "Message", Default = "spawned!", Numeric = false, Placeholder = "Message" })
G.g2.Groupboxes.Visuals_EntitySettings:AddDivider()
G.g2.Groupboxes.Visuals_EntitySettings:AddDropdown("NotifyStyle", { Text = "Notify Style", Values = { "Abysall", "Doors", "STX", "Library" }, Default = 1 })
G.g2.Groupboxes.Visuals_EntitySettings:AddSlider("NotifySoundVolume", { Text = "Sound Volume", Min = 0, Max = 10, Default = 3, Rounding = 1 })
G.g2.Groupboxes.Visuals_EntitySettings:AddToggle("NotifyPlaySound", { Text = "Play Sound", Default = true, Tooltip = "Makes notifications play an alert sound." })
G.g2.Groupboxes.Visuals_EntitySettings:AddToggle("NotifyKeepNotifications", { Text = "Keep Notifications", Default = false, Tooltip = "Certain notifications will stay on screen until they are no longer needed." })
G.g2.Groupboxes.Visuals_EntitySettings:AddButton({ Text = "Test Notification", DoubleClick = false, Tooltip = "Sends a test notifcation, so you can see how your settings look.", Func = function()
	G.g2.Functions.Notify({Title = "This is a test."})
end})

G.g2.Groupboxes.Visuals_ESP          = Tabs.Visuals:AddRightTabbox("ESP/Settings")
G.g2.Groupboxes.Visuals_ESP_Toggles  = G.g2.Groupboxes.Visuals_ESP:AddTab("ESP")
G.g2.Groupboxes.Visuals_ESP_Settings = G.g2.Groupboxes.Visuals_ESP:AddTab("Settings")

local function MakeESPToggle(ToggleKey, ColorKey, Text, Tooltip, ObjectsTable, LabelFunc, RoomBased)
	G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle(ToggleKey, { Text = Text, Default = false, Tooltip = Tooltip })
	G.g2.Toggles[ToggleKey]:AddColorPicker(ColorKey, { Text = Text, Default = G.g2.Options[ColorKey] and G.g2.Options[ColorKey].Value or Color3.new(1,1,1), Transparency = 0 })
	G.g2.Toggles[ToggleKey]:OnChanged(function(Value)
		for _, Object in ObjectsTable do
			if Value then
				local Label, UseRoom = LabelFunc(Object)
				if Label then
					G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options[ColorKey].Value }, UseRoom ~= nil and UseRoom or RoomBased)
				end
			else
				G.g2.Functions.RemoveESP(Object)
			end
		end
	end)
	G.g2.Options[ColorKey]:OnChanged(function(Value)
		for _, Object in ObjectsTable do
			G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value)
		end
	end)
end

G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("ObjectiveESPToggle", { Text = "Objectives", Default = false, Tooltip = "Highlights all objects required to progress." })
G.g2.Toggles.ObjectiveESPToggle:AddColorPicker("ObjectiveESPColor", { Text = "Objectives", Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })

local ObjectiveLabels = {
	["DepotHalloween"] 		   = "Candy Magic",
	["StairwellLockpickDoor"]  = "Garage Door",
	["Mirror"]				   = "Mirror",
	["ShoppingCart"]		   = "Shopping Cart",
	["StairwellFireAlarm"]     = "Fire Alarm",
	["StairwellScrapper"]	   = "Scrapper",
	["ArchivesPackageDeposit"] = "BoxDeposit",
	["Cellar"] 				   = "Cellar",
	["ArchivesFihTank"]        = "Fih Tank",
	["KeyObtain"]              = "Door Key",
	["ElectricalKeyObtain"]    = "Electrical Key",
	["MinesGenerator"]         = "Generator",
	["FuseObtain"]             = "Generator Fuse",
	["LiveHintBook"]           = "Hint Book",
	["LiveBreakerPolePickup"]  = "Fuse Breaker",
	["LibraryHintPaper"]       = "Hint Paper",
	["PickupItem"]             = "Hint Paper",
	["CringlePresent"]         = "Present",
	["LeverForGate"]           = "Gate Lever",
	["MinesGateButton"]        = "Gate Button",
	["GardenGateButton"]       = "Gate Button",
}

G.g2.Toggles.ObjectiveESPToggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Objectives do
		if Value then
			local Label = ObjectiveLabels[Object.Name]
			if Object.Name == "TimerLever" then
				Label = "Time Lever [+" .. Object:GetAttribute("AddTime") .. "s]"
			elseif Object.Name == "MinesAnchor" then
				Label = "Anchor [" .. Object:WaitForChild("Sign").TextLabel.Text .. "]"
			elseif Object.Name == "WaterPump" then
				G.g2.Functions.AddESP({ Object = Object.Wheel, Text = "Water Pump", Color = G.g2.Options.ObjectiveESPColor.Value }, true)
			elseif Object.Name == "VineGuillotine" then
				G.g2.Functions.AddESP({ Object = Object.Lever, Text = "Vine Lever", Color = G.g2.Options.ObjectiveESPColor.Value }, true)
			end
			if Label then
				G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options.ObjectiveESPColor.Value }, true)
			end
		else
			G.g2.Functions.RemoveESP(Object)
		end
	end
end)
G.g2.Options.ObjectiveESPColor:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Objectives do
		G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value)
	end
end)

G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("DoorESPToggle",       { Text = "Doors",        Default = false, Tooltip = "Highlights the next door." })
G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("HidingSpotESPToggle", { Text = "Hiding Spots", Default = false, Tooltip = "Highlights places where you can hide from entities" })
G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("PlayerESPToggle",     { Text = "Players",      Default = false, Tooltip = "Highlights other players." })
G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("ChestESPToggle",      { Text = "Chests",       Default = false, Tooltip = "Highlights objects that can contain loot." })
G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("ItemESPToggle",       { Text = "Items",        Default = false, Tooltip = "Highlights all collectable items/consumables." })
G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("CurrencyESPToggle",   { Text = "Currency",     Default = false, Tooltip = "Highlights all currency that spawns." })
G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("LadderESPToggle",     { Text = "Ladders",      Default = false, Tooltip = "Highlights ladders that can be used to disable the anticheat." })
G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("MiscESPToggle",       { Text = "Misc",         Default = false, Tooltip = "Highlights miscellaneous objects that can be used to disable the anticheat." })
G.g2.Groupboxes.Visuals_ESP_Toggles:AddDivider()
G.g2.Groupboxes.Visuals_ESP_Toggles:AddDropdown("EntityESPOptions",     { 
	Text = "Entity List",
	Values = { "Rush","Bash","Scribbles","Teller","DronesStampede","Creak","Noise","Noise_TV","Balls","Portrait","CreakHalloween","Weaveling","Ambush","Eyes","Dupe","Figure","Blitz","Lookman","Snare","Giggle","Gloombat Eggs","Grumble","A-60","A-120","Sally","Jeff the Killer","Groundskeeper","Mandrake Hole","Monument","Bramble","AR0xMBUSH","RNIUSHCG==" },
	Multi = true,
	AllowNull = true
})
G.g2.Groupboxes.Visuals_ESP_Toggles:AddToggle("EntityESPToggle",     { Text = "Entities",      Default = false, Tooltip = "Highlights all entities that spawn." })

G.g2.Toggles.DoorESPToggle:AddColorPicker("DoorESPColor",           { Text = "Doors",        Default = Color3.fromRGB(0, 200, 255),  Transparency = 0 })
G.g2.Toggles.HidingSpotESPToggle:AddColorPicker("HidingSpotESPColor", { Text = "Hiding Spots", Default = Color3.fromRGB(255, 170, 0),  Transparency = 0 })
G.g2.Toggles.PlayerESPToggle:AddColorPicker("PlayerESPColor",       { Text = "Players",      Default = Color3.fromRGB(255, 255, 255), Transparency = 0 })
G.g2.Toggles.ChestESPToggle:AddColorPicker("ChestESPColor",         { Text = "Chests",       Default = Color3.fromRGB(255, 255, 0),   Transparency = 0 })
G.g2.Toggles.ItemESPToggle:AddColorPicker("ItemESPColor",           { Text = "Items",        Default = Color3.fromRGB(170, 0, 255),   Transparency = 0 })
G.g2.Toggles.CurrencyESPToggle:AddColorPicker("CurrencyESPColor",   { Text = "Currency",     Default = Color3.fromRGB(255, 255, 0),   Transparency = 0 })
G.g2.Toggles.LadderESPToggle:AddColorPicker("LadderESPColor",       { Text = "Ladders",      Default = Color3.fromRGB(3, 67, 71), Transparency = 0 })
G.g2.Toggles.MiscESPToggle:AddColorPicker("MiscESPColor",           { Text = "Misc",         Default = Color3.fromRGB(255, 255, 255), Transparency = 0 })
G.g2.Toggles.EntityESPToggle:AddColorPicker("EntityESPColor",       { Text = "Entities",     Default = Color3.fromRGB(255, 0, 0),     Transparency = 0 })

G.g12.HidingSpotLabels = {
	Wardrobe = "Closet", ["Backdoor_Wardrobe"] = "Closet", Toolshed = "Closet",
	RetroWardrobe = "Closet", ["Wardrobe-FOOLS26"] = "Closet",
	Locker_Large = "Locker", Rooms_Locker = "Hiding_Spot", Rooms_Locker_Fridge = "Locker",
	Bed = "Bed", Double_Bed = "Double Bed", CircularVent = "Vent", Dumpster = "Dumpster"
}
G.g12.ChestLabels = {
	ChestBox = true, ChestBoxLocked = true, Toolbox = true, Toolbox_Locked = true,
	Chest_Vine = "Vine Chest", Toolshed_Small = "Toolshed", Locker_Small_Locked = "Locked Item Locker", MouseHole = "Mouse"
}
G.g12.EntityESPLabels = {
	JeffTheKiller = "Jeff the Killer", GiggleCeiling = "Giggle",
	Snare = "Snare", GrumbleRig = "Grumble",
	Drakobloxxer = "Drakobloxxer", Hole = "Mandrake Hole", Groundskeeper = "Groundskeeper",
	LiveEntityBramble = "Bramble", Figure = "Figure", FigureRig = "Figure", FigureRagdoll = "Figure",
	FakeDoor = "Dupe", DoorFake = "Dupe"
}

G.g12.NodeEntities = {
	Rush = true, Bash = true, Scribbles = true, DronesStampede = true, Ambush = true, Eyes = true, Blitz = true, Lookman = true, ["A-60"] = true, ["A-120"] = true, Sally = true, ["Jeff The Killer"] = true, Monument = true, ["AR0xMBUSH"] = true, ["RNIUSHCG=="] = true
}

G.g2.Toggles.DoorESPToggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Doors do
		if Value then G.g2.Functions.AddESP({ Object = Object, Text = "Door " .. G.g2.Functions.GetDoorNumber(Object), Color = G.g2.Options.DoorESPColor.Value }, true)
		else G.g2.Functions.RemoveESP(Object) end
	end
end)
G.g2.Options.DoorESPColor:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Doors do G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

G.g2.Toggles.HidingSpotESPToggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.HidingSpots do
		local Label = G.g12.HidingSpotLabels[Object.Name]
		if Value and Label then G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options.HidingSpotESPColor.Value }, true)
		elseif not Value then G.g2.Functions.RemoveESP(Object) end
	end
end)
G.g2.Options.HidingSpotESPColor:OnChanged(function(Value)
	for _, Object in G.g2.Objects.HidingSpots do G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

G.g2.Toggles.PlayerESPToggle:OnChanged(function(Value)
	task.wait()
	for _, Player in G.g2.Services.Players:GetPlayers() do
		if Player.Character and Player ~= LocalPlayer then
			if Value and Player:GetAttribute("Alive") == true then
				G.g2.Functions.AddESP({ Object = Player.Character, Text = Player.Name, Color = G.g2.Options.PlayerESPColor.Value })
			else
				G.g2.Functions.RemoveESP(Player.Character)
			end
		end
	end
end)
G.g2.Options.PlayerESPColor:OnChanged(function(Value)
	for _, Player in G.g2.Services.Players:GetPlayers() do
		if Player.Character and Player ~= LocalPlayer then
			G.g1.Abysall.ESPLibrary:UpdateObjectColor(Player.Character, Value)
		end
	end
end)

G.g2.Toggles.ChestESPToggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Chests do
		if Value then
			local Label
			if Object.Name == "ChestBox" or Object.Name == "ChestBoxLocked" then
				Label = Object:GetAttribute("Locked") and "Locked Chest" or "Chest"
			elseif Object.Name == "Toolbox" or Object.Name == "Toolbox_Locked" then
				Label = Object:GetAttribute("Locked") and "Locked Toolbox" or "Toolbox"
			elseif G.g12.ChestLabels[Object.Name] and G.g12.ChestLabels[Object.Name] ~= true then
				Label = G.g12.ChestLabels[Object.Name]
			end
			if Label then G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options.ChestESPColor.Value }, true) end
		else
			G.g2.Functions.RemoveESP(Object)
		end
	end
end)

G.g2.Options.ChestESPColor:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Chests do G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

G.g2.Toggles.ItemESPToggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Items do
		if Value then
			local Label = G.g3.ItemNames[Object.Name] or (Object.Name == "Green_Herb" and "Green Herb")
			if Label then
				G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options.ItemESPColor.Value }, Object:GetAttribute("ParentRoom") ~= nil)
			end
		else
			G.g2.Functions.RemoveESP(Object)
		end
	end
end)
G.g2.Options.ItemESPColor:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Items do G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

G.g2.Toggles.CurrencyESPToggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Currency do
		if Value then
			local Label
			if Object.Name == "GoldPile" and Object:GetAttribute("GoldValue") then
				Label = "Gold Pile [" .. Object:GetAttribute("GoldValue") .. "]"
			elseif Object.Name == "StardustPickup" then
				Label = "Stardust Pile"
			end
			if Label then G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options.CurrencyESPColor.Value }, true) end
		else
			G.g2.Functions.RemoveESP(Object)
		end
	end
end)
G.g2.Options.CurrencyESPColor:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Currency do G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

G.g2.Toggles.EntityESPToggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do
		if Value then
			local Label = G.g12.EntityESPLabels[Object.Name]
			if not Label and G.g3.Entities[Object.Name] then Label = G.g3.Entities[Object.Name].Alias end
			if Label and G.g2.Options.EntityESPOptions.Value[Label] then
				G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options.EntityESPColor.Value }, G.g12.NodeEntities[Label] ~= true)
			else
				G.g2.Functions.RemoveESP(Object)
			end
		else
			G.g2.Functions.RemoveESP(Object)
		end
	end
end)

G.g2.Options.EntityESPOptions:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do
		if G.g2.Toggles.EntityESPToggle.Value then
			local Label = G.g12.EntityESPLabels[Object.Name]
			if not Label and G.g3.Entities[Object.Name] then Label = G.g3.Entities[Object.Name].Alias end
			if Label and G.g2.Options.EntityESPOptions.Value[Label] then
				G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options.EntityESPColor.Value }, G.g12.NodeEntities[Label] ~= true)
			else
				G.g2.Functions.RemoveESP(Object)
			end
		else
			G.g2.Functions.RemoveESP(Object)
		end
	end
end)

G.g2.Options.EntityESPColor:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Entities do G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

G.g2.Toggles.LadderESPToggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Ladders do
		if Value then G.g2.Functions.AddESP({ Object = Object, Text = "Ladder", Color = G.g2.Options.LadderESPColor.Value }, true)
		else G.g2.Functions.RemoveESP(Object) end
	end
end)
G.g2.Options.LadderESPColor:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Ladders do G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

G.g2.Toggles.MiscESPToggle:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Misc do
		if Value then
			local Label = Object.Name
			if Object.Name == "StairwellLockpickDoor" or Object.Name == "StiarwellLockpickDoor" then
				Label = "Garage Door"
			elseif Object.Name == "StairwellFireAlarm" then
				Label = "Fire Alarm"
			elseif Object.Name == "ShoppingCart" then
				Label = "Shopping Cart"
			elseif Object.Name == "ArchivesFihTank" or Object.Name == "ArchivesFishTank" then
				Label = "Fish Tank"
			end
			G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options.MiscESPColor.Value }, true)
		else
			G.g2.Functions.RemoveESP(Object)
		end
	end
end)
G.g2.Options.MiscESPColor:OnChanged(function(Value)
	for _, Object in G.g2.Objects.Misc do G.g1.Abysall.ESPLibrary:UpdateObjectColor(Object, Value) end
end)

G.g2.Groupboxes.Visuals_ESP_Settings:AddToggle("ESPRainbow",     { Text = "Rainbow Effect", Default = false, Tooltip = "Makes the esp objects change colour like a rainbow." })
G.g2.Groupboxes.Visuals_ESP_Settings:AddToggle("ESPShowDistance",{ Text = "Show Distance",  Default = true,  Tooltip = "Shows how far away your character is from the object." })
G.g2.Groupboxes.Visuals_ESP_Settings:AddDivider()
G.g2.Groupboxes.Visuals_ESP_Settings:AddSlider("ESPFillTransparency",        { Text = "Fill Transparency",         Min = 0, Max = 1, Default = 0.75, Rounding = 2, Compact = true })
G.g2.Groupboxes.Visuals_ESP_Settings:AddSlider("ESPOutlineTransparency",     { Text = "Outline Transparency",      Min = 0, Max = 1, Default = 0,    Rounding = 2, Compact = true })
G.g2.Groupboxes.Visuals_ESP_Settings:AddSlider("ESPTextTransparency",        { Text = "Text Transparency",         Min = 0, Max = 1, Default = 0,    Rounding = 2, Compact = true })
G.g2.Groupboxes.Visuals_ESP_Settings:AddSlider("ESPTextOutlineTransparency", { Text = "Text Outline Transparency", Min = 0, Max = 1, Default = 0,    Rounding = 2, Compact = true })
G.g2.Groupboxes.Visuals_ESP_Settings:AddSlider("ESPFadeTime",                { Text = "Fade Time",                 Min = 0, Max = 1, Default = 0.25, Rounding = 2, Compact = true })
G.g2.Groupboxes.Visuals_ESP_Settings:AddSlider("ESPRenderLimit",             { Text = "Render Limit",              Min = 30, Max = 240, Default = 240, Rounding = 0, Compact = true })
G.g2.Groupboxes.Visuals_ESP_Settings:AddSlider("ESPTextSize",                { Text = "Text Size",                 Min = 12, Max = 24, Default = 20, Rounding = 0, Compact = true })
G.g2.Groupboxes.Visuals_ESP_Settings:AddDropdown("ESPTextFont", {
	Text = "Text Font",
	Values = { "Legacy","Arial","ArialBold","SourceSans","SourceSansBold","SourceSansLight","SourceSansItalic","Bodoni","Garamond","Cartoon","Code","Highway","SciFi","Arcade","Fantasy","Antique","SourceSansSemibold","Gotham","GothamMedium","GothamBold","GothamBlack","AmaticSC","Bangers","Creepster","DenkOne","Fondamento","FredokaOne","GrenzeGotisch","IndieFlower","JosefinSans","Jura","Kalam","LuckiestGuy","Merriweather","Michroma","Nunito","Oswald","PatrickHand","PermanentMarker","Roboto","RobotoCondensed","RobotoMono","Sarpanch","SpecialElite","TitilliumWeb","Ubuntu","BuilderSans","BuilderSansMedium","BuilderSansBold","BuilderSansExtraBold","Arimo","ArimoBold" },
	Default = 12
})
G.g2.Groupboxes.Visuals_ESP_Settings:AddDivider()
G.g2.Groupboxes.Visuals_ESP_Settings:AddDropdown("ESPTracersOrigin",  { Text = "Tracer Origin", Values = { "Bottom","Center","Top","Mouse" }, Default = 1 })
G.g2.Groupboxes.Visuals_ESP_Settings:AddSlider("ESPTracerThickness",  { Text = "Tracer Thickness", Min = 0.5, Max = 2, Default = 0.75, Rounding = 2, Compact = true })
G.g2.Groupboxes.Visuals_ESP_Settings:AddToggle("ESPTracersToggle",    { Text = "Enable Tracers", Default = false, Tooltip = "Draws a line to highlighted objects." })
G.g2.Groupboxes.Visuals_ESP_Settings:AddDivider()
G.g2.Groupboxes.Visuals_ESP_Settings:AddSlider("ESPArrowsRadius",     { Text = "Arrow Radius", Min = 100, Max = 500, Default = 250, Rounding = 0, Compact = true })
G.g2.Groupboxes.Visuals_ESP_Settings:AddToggle("ESPArrowsToggle",     { Text = "Enable Arrows", Default = false, Tooltip = "Shows arrow that point to off-screen objects." })

G.g1.Abysall.ESPLibrary:SetRainbow(false)
G.g1.Abysall.ESPLibrary:SetShowDistance(true)
G.g1.Abysall.ESPLibrary:SetFillTransparency(0.75)
G.g1.Abysall.ESPLibrary:SetOutlineTransparency(0)
G.g1.Abysall.ESPLibrary:SetTextTransparency(0)
G.g1.Abysall.ESPLibrary:SetTextOutlineTransparency(0)
G.g1.Abysall.ESPLibrary:SetRenderLimit(240)
G.g1.Abysall.ESPLibrary:SetFadeTime(0.25)
G.g1.Abysall.ESPLibrary:SetTextSize(20)
G.g1.Abysall.ESPLibrary:SetFont(Enum.Font.Highway)
G.g1.Abysall.ESPLibrary:SetTracers(false)
G.g1.Abysall.ESPLibrary:SetTracerSize(0.75)
G.g1.Abysall.ESPLibrary:SetTracerOrigin("Bottom")
G.g1.Abysall.ESPLibrary:SetArrows(false)
G.g1.Abysall.ESPLibrary:SetArrowRadius(250)
G.g1.Abysall.ESPLibrary:SetDistanceSizeRatio(0.8)

G.g2.Toggles.ESPRainbow:OnChanged(function(V)        G.g1.Abysall.ESPLibrary:SetRainbow(V) end)
G.g2.Toggles.ESPShowDistance:OnChanged(function(V)   G.g1.Abysall.ESPLibrary:SetShowDistance(V) end)
G.g2.Options.ESPFillTransparency:OnChanged(function(V)        G.g1.Abysall.ESPLibrary:SetFillTransparency(V) end)
G.g2.Options.ESPOutlineTransparency:OnChanged(function(V)     G.g1.Abysall.ESPLibrary:SetOutlineTransparency(V) end)
G.g2.Options.ESPTextTransparency:OnChanged(function(V)        G.g1.Abysall.ESPLibrary:SetTextTransparency(V) end)
G.g2.Options.ESPTextOutlineTransparency:OnChanged(function(V) G.g1.Abysall.ESPLibrary:SetTextOutlineTransparency(V) end)
G.g2.Options.ESPFadeTime:OnChanged(function(V)        G.g1.Abysall.ESPLibrary:SetFadeTime(V) end)
G.g2.Options.ESPRenderLimit:OnChanged(function(V)     G.g1.Abysall.ESPLibrary:SetRenderLimit(V) end)
G.g2.Options.ESPTextSize:OnChanged(function(V)        G.g1.Abysall.ESPLibrary:SetTextSize(V) end)
G.g2.Options.ESPTextFont:OnChanged(function(V)        G.g1.Abysall.ESPLibrary:SetFont(Enum.Font[V]) end)
G.g2.Toggles.ESPTracersToggle:OnChanged(function(V)   G.g1.Abysall.ESPLibrary:SetTracers(V) end)
G.g2.Options.ESPTracersOrigin:OnChanged(function(V)   G.g1.Abysall.ESPLibrary:SetTracerOrigin(V) end)
G.g2.Options.ESPTracerThickness:OnChanged(function(V) G.g1.Abysall.ESPLibrary:SetTracerSize(V) end)
G.g2.Toggles.ESPArrowsToggle:OnChanged(function(V)    G.g1.Abysall.ESPLibrary:SetArrows(V) end)
G.g2.Options.ESPArrowsRadius:OnChanged(function(V)    G.g1.Abysall.ESPLibrary:SetArrowRadius(V) end)

Tabs.Floors:UpdateWarningBox({
	Visible = true,
	Title = "Compatability/Risk Warning",
	Text = "Features highlighted in red are risky / dont work in the current floor.",
})
G.g2.Groupboxes.Floors_Automation = Tabs.Floors:AddRightGroupbox("Automation")

G.g2.Groupboxes.Floors_Automation:AddToggle("SkipSeekMines", {
	Text = "Skip Seek (Mines)",
	Default = false,
	Tooltip = "Skips the entire Seek sections.",
	Risky = G.g3.Floor ~= "Mines"
})

G.g2.Toggles.SkipSeekMines:OnChanged(function(Value)
	if Value then
		if G.g3.Floor ~= "Mines" then
			return
		end
		task.spawn(function()
			local MinesSkipSeekCurrentRooms

			repeat
				if not G.g2.Toggles.SkipSeekMines.Value then
					return
				end

				MinesSkipSeekCurrentRooms = workspace:FindFirstChild("CurrentRooms")
				task.wait()
			until MinesSkipSeekCurrentRooms

			local MinesSkipSeekStartRoom

			repeat
				if not G.g2.Toggles.SkipSeekMines.Value then
					return
				end

				MinesSkipSeekCurrentRooms = workspace:FindFirstChild("CurrentRooms")

				if MinesSkipSeekCurrentRooms then
					MinesSkipSeekStartRoom = MinesSkipSeekCurrentRooms:FindFirstChild("42")
				end

				task.wait()
			until MinesSkipSeekStartRoom

			local MinesSkipSeekStartDoor

			repeat
				if not G.g2.Toggles.SkipSeekMines.Value then
					return
				end

				MinesSkipSeekStartDoor = MinesSkipSeekStartRoom:FindFirstChild("Door", true)
				task.wait()
			until MinesSkipSeekStartDoor

			repeat
				if not G.g2.Toggles.SkipSeekMines.Value then
					return
				end

				task.wait()
			until MinesSkipSeekStartDoor:GetAttribute("Opened") == true

			if G.g3.Character and G.g3.Character:GetAttribute("Minecarting") == true then
				G.g3.Character:SetAttribute("Minecarting", false)
			end

			for _, MinesSkipSeekRoomNumber in ipairs({
				43, 44, 45, 46, 47, 48, 49,
				78, 79, 80, 81, 82, 83
			}) do
				if not G.g2.Toggles.SkipSeekMines.Value then
					return
				end

				local MinesSkipSeekRoom

				repeat
					if not G.g2.Toggles.SkipSeekMines.Value then
						return
					end

					MinesSkipSeekCurrentRooms = workspace:FindFirstChild("CurrentRooms")

					if MinesSkipSeekCurrentRooms then
						MinesSkipSeekRoom = MinesSkipSeekCurrentRooms:FindFirstChild(
							tostring(MinesSkipSeekRoomNumber)
						)
					end

					task.wait()
				until MinesSkipSeekRoom

				local MinesSkipSeekDoor

				repeat
					if not G.g2.Toggles.SkipSeekMines.Value then
						return
					end

					MinesSkipSeekDoor = MinesSkipSeekRoom:FindFirstChild("Door", true)
					task.wait()
				until MinesSkipSeekDoor

				repeat
					if not G.g2.Toggles.SkipSeekMines.Value then
						return
					end

					if G.g3.Character then
						G.g3.Character:PivotTo(MinesSkipSeekDoor:GetPivot())
					end

					task.wait()
				until MinesSkipSeekDoor:GetAttribute("Opened") == true

				if MinesSkipSeekRoomNumber == 49 or MinesSkipSeekRoomNumber == 83 then
					if not G.g3.Character then
						return
					end

					local MinesSkipSeekVoidPivot = G.g3.Character:GetPivot()
					MinesSkipSeekVoidPivot = MinesSkipSeekVoidPivot + Vector3.new(0, -1000, 0)

					task.wait(0.3)

					for MinesSkipSeekVoidCount = 1, 12 do
						G.g3.Character:PivotTo(MinesSkipSeekVoidPivot)
					end

					for MinesSkipSeekVoidCount = 1, 12 do
						G.g3.Character:PivotTo(MinesSkipSeekVoidPivot)
					end

					for MinesSkipSeekVoidCount = 1, 12 do
						G.g3.Character:PivotTo(MinesSkipSeekVoidPivot)
					end

					task.wait(0.3)

					for MinesSkipSeekVoidCount = 1, 6 do
						G.g3.Character:PivotTo(MinesSkipSeekVoidPivot)
					end
				end

				if MinesSkipSeekRoomNumber == 83 then
					return
				end
			end
		end)
	end
end)

G.g2.Groupboxes.Floors_Automation:AddToggle("AutoSteerMinecart", {
	Text = "Auto Steer Minecart", Default = false, Tooltip = "Automatically completes the minecart chase.",
	Disabled = not G.g2.Functions.CheckCompatability({"require"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage
})
G.g2.Groupboxes.Floors_Automation:AddSlider("AutoSteerMinecartTurnDistance", {
	Text = "Turn Distance", Min = 20, Max = 40, Default = 30, Rounding = 0,
	Disabled = not G.g2.Functions.CheckCompatability({"require"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage
})
G.g2.Groupboxes.Floors_Automation:AddSlider("AutoSteerMinecartDuckDistance", {
	Text = "Crouch Distance", Min = 20, Max = 40, Default = 30, Rounding = 0,
	Disabled = not G.g2.Functions.CheckCompatability({"require"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage
})
G.g2.Groupboxes.Floors_Automation:AddDivider()
G.g2.Groupboxes.Floors_Automation:AddToggle("RoomsAutoWalk",             { Text = "Auto Rooms",       Default = false, Tooltip = "Automatically moves and hides from entities in The Rooms." })
G.g2.Groupboxes.Floors_Automation:AddSlider("RoomsAutoWalkPathfindTimeout", { Text = "Pathfind Timeout", Min = 0.5, Max = 3, Default = 1, Rounding = 1 })
G.g2.Groupboxes.Floors_Automation:AddToggle("RoomsAutoWalkIgnoreA60",    { Text = "Ignore A-60",      Default = false, Tooltip = "Continues to walk if entity 'A-60' is present, enables position spoof automatically." })
G.g2.Groupboxes.Floors_Automation:AddToggle("RoomsAutoWalkShowPathToggle", { Text = "Show Path",       Default = false, Tooltip = "Shows the current path of rooms auto-walk." })
G.g2.Groupboxes.Floors_Automation:AddToggle("RoomsAutoWalkSpoofFootsteps", {
    Text = "Spoof Footsteps", Default = false, Tooltip = "Makes it appear as if your character is walking normally.",
    Disabled = not G.g2.Functions.CheckCompatability({"hookmetamethod", "newcclosure", "getnamecallmethod"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage
})

G.g2.Toggles.RoomsAutoWalk:OnChanged(function()
	for _, Object in G.g2.Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == "PathNode" then Object:Destroy() end
	end
end)
G.g2.Toggles.RoomsAutoWalkShowPathToggle:AddColorPicker("RoomsAutoWalkShowPathColor", { Text = "Path", Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })
G.g2.Toggles.RoomsAutoWalkShowPathToggle:OnChanged(function(Value)
	for _, Object in G.g2.Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == "PathNode" then Object.Transparency = Value and 0.5 or 1 end
	end
end)
G.g2.Options.RoomsAutoWalkShowPathColor:OnChanged(function(Value)
	for _, Object in G.g2.Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == "PathNode" then Object.Color = Value end
	end
end)

G.g2.Functions.RoomsAutoWalk = {}
G.g2.Functions.RoomsAutoWalk.GetNearestHidingSpot = function()
	local Nearest = { Distance = math.huge, Object = nil }
	for _, Object in G.g2.Objects.HidingSpots do
		if Object.PrimaryPart and Object:FindFirstChild("HidePrompt") then
			local Distance = LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)
			if Distance < Nearest.Distance and Object.PrimaryPart.Position.Y > -10 then
				local HiddenPlayer = Object:FindFirstChild("HiddenPlayer", true)
				if HiddenPlayer and not HiddenPlayer.Value then
					Nearest.Distance = Distance
					Nearest.Object = Object
				end
			end
		end
	end
	return Nearest.Object
end

local RoomsEntityList = { "RushMoving","AmbushMoving","BackdoorRush","A60","A120","CustomEntity","GlitchRush","GlitchAmbush" }
G.g2.Functions.RoomsAutoWalk.GetPathfindTarget = function()
	for _, Object in G.g2.Services.Workspace:GetChildren() do
		if table.find(RoomsEntityList, Object.Name) and Object.PrimaryPart then
			local Y = Object.PrimaryPart.Position.Y
			if Y > -10 and Y < 150 then
				if Object.Name == "A60" and not G.g2.Toggles.RoomsAutoWalkIgnoreA60.Value or Object.Name ~= "A60" then
					return G.g2.Functions.RoomsAutoWalk.GetNearestHidingSpot() or G.g3.CurrentRooms[tostring(G.g3.LatestRoom.Value)]:FindFirstChild("RoomExit")
				end
			end
		end
	end
	return G.g3.CurrentRooms[tostring(G.g3.LatestRoom.Value)]:FindFirstChild("RoomExit")
end

G.g2.Connections_2.RoomsAutoWalkHandler = G.g2.Services.RunService.Heartbeat:Connect(function()
	if G.g3.Floor ~= "Rooms" or not G.g2.Toggles.RoomsAutoWalk.Value or G.g2.Globals.RoomsAutoWalkActive or not G.g3.CollisionPart or G.g3.LatestRoom.Value >= 1000 then return end
	G.g2.Globals.RoomsAutoWalkActive = true

	local Path = G.g2.Services.PathfindingService:CreatePath({
		AgentCanJump = true, AgentCanClimb = false, WaypointSpacing = 4,
		AgentRadius = 1.5, AgentHeight = 1.5, Costs = { StuckPart = 8 }
	})

	if G.g2.Toggles.RoomsAutoWalkIgnoreA60.Value and not G.g2.Toggles.PositionSpoof.Value then
		G.g2.Toggles.PositionSpoof:SetValue(true)
	end

	local TargetPart = G.g2.Functions.RoomsAutoWalk.GetPathfindTarget()
	if not TargetPart then
		G.g2.Globals.RoomsAutoWalkActive = false
		return
	end

	local TargetPosition
	if TargetPart.Name == "RoomExit" then
		TargetPosition = TargetPart.Position
	elseif TargetPart:FindFirstChild("HidePrompt") then
		for _, Part in TargetPart:GetDescendants() do
			if Part:IsA("BasePart") then Part.CanCollide = false end
		end
		TargetPosition = TargetPart.PrimaryPart.Position
	end

	if G.g3.CollisionPart.Anchored and not TargetPart:FindFirstChild("HidePrompt") then
		G.g3.Character:SetAttribute("Hiding", true)
		G.g3.RemotesFolder.CamLock:FireServer()
		G.g3.Character:SetAttribute("Hiding", false)
	end
	-- DontGroup
	local CurrentRoom = G.g3.CurrentRooms[tostring(G.g3.LatestRoom.Value)]
	if CurrentRoom:FindFirstChild("Door") then
		CurrentRoom.Door.Door.CanCollide = false
	end

	if not TargetPosition or LocalPlayer:DistanceFromCharacter(TargetPosition) >= 750 then
		G.g2.Globals.RoomsAutoWalkActive = false
		return
	end

	Path:ComputeAsync(G.g3.CollisionPart.Position, TargetPosition)
	local Waypoints = Path:GetWaypoints()

	if #Waypoints == 0 then
		local RoomExit = CurrentRoom:FindFirstChild("RoomExit")
		if RoomExit then G.g3.Humanoid:MoveTo(RoomExit.Position) end
		G.g2.Globals.RoomsAutoWalkActive = false
		return
	end

	for _, Node in G.g2.Globals.RoomsNodesFolder:GetChildren() do
		if Node.Name == "PathNode" then Node:Destroy() end
	end

	for _, Waypoint in Waypoints do
		local Block = Instance.new("Part", G.g2.Globals.RoomsNodesFolder)
		Block.Transparency = G.g2.Toggles.RoomsAutoWalkShowPathToggle.Value and 0.5 or 1
		Block.Size = Vector3.one
		Block.Position = Waypoint.Position
		Block.Shape = Enum.PartType.Ball
		Block.CanCollide = false
		Block.Anchored = true
		Block.Name = "PathNode"
		Block.Color = G.g2.Options.RoomsAutoWalkShowPathColor.Value
		Block.Material = Enum.Material.Neon
	end

	local Stuck = false
	for _, Waypoint in Waypoints do
		if Stuck or not G.g2.Toggles.RoomsAutoWalk.Value then break end

		local Finished = false
		local Start = tick()

		local StepConnection = G.g2.Services.RunService.RenderStepped:Connect(function()
			if Stuck or not G.g2.Toggles.RoomsAutoWalk.Value then Finished = true return end

			local NewTarget = G.g2.Functions.RoomsAutoWalk.GetPathfindTarget()
			if NewTarget and NewTarget:FindFirstChild("HidePrompt") and not TargetPart:FindFirstChild("HidePrompt") then
				Finished = true return
			end
			if TargetPart:FindFirstChild("HidePrompt") then
				local HidePrompt = TargetPart:FindFirstChild("HidePrompt")
				if LocalPlayer:DistanceFromCharacter(TargetPosition) < HidePrompt.MaxActivationDistance
					and G.g3.Character:GetAttribute("Hiding") ~= true
				then
					G.g2.Functions.ForceFirePrompt(HidePrompt)
				end
			end
			local FlatPos = Vector3.new(Waypoint.Position.X, G.g3.RootPart.Position.Y, Waypoint.Position.Z)
			if LocalPlayer:DistanceFromCharacter(FlatPos) < 5 then Finished = true end
			G.g3.Humanoid:MoveTo(Waypoint.Position)
		end)

		while not Finished do
			if tick() - Start > G.g2.Options.RoomsAutoWalkPathfindTimeout.Value then
				local StuckBlock = Instance.new("Part", G.g2.Globals.RoomsNodesFolder)
				StuckBlock.Transparency = 1
				StuckBlock.Size = Vector3.one
				StuckBlock.CFrame = G.g3.Collision.CFrame
				StuckBlock.Shape = Enum.PartType.Ball
				StuckBlock.CanCollide = false
				StuckBlock.Anchored = true
				StuckBlock.Name = "StuckPart"
				local Modifier = Instance.new("PathfindingModifier", StuckBlock)
				Modifier.Label = "StuckPart"
				Stuck = true
				break
			end
			task.wait()
		end
		StepConnection:Disconnect()
		G.g3.Humanoid:MoveTo(G.g3.RootPart.Position)
	end

	G.g2.Globals.RoomsAutoWalkActive = false
end)

G.g2.Connections_2.RoomsHandler = G.g3.CurrentRooms.ChildAdded:Connect(function(Room)
	for _, Object in G.g2.Globals.RoomsNodesFolder:GetChildren() do
		if Object.Name == "StuckPart" then Object:Destroy() end
	end

	if Room:GetAttribute("RawName") and string.find(Room:GetAttribute("RawName"), "Eyestalk") then
        local PreviousNode = nil

		local function CreateEyestalkNode(WaypointPos)
			local NewNode = Instance.new("Part")
			NewNode.Size = Vector3.one
			NewNode.Transparency = 1
			NewNode.Parent = G.g2.Globals.SeekNodesFolder
			NewNode.Anchored = true
			NewNode.Position = WaypointPos
			NewNode.CanCollide = false
			NewNode.Name = "SeekLightNode"

			local PrevNode = PreviousNode or NewNode
			PreviousNode = NewNode

			local NewBeam = Instance.new("Beam")
			NewBeam.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, G.g2.Options.ShowEyestalkPathColor.Value), ColorSequenceKeypoint.new(1, G.g2.Options.ShowEyestalkPathColor.Value) })
			NewBeam.FaceCamera = true
			NewBeam.Width0 = 0.2
			NewBeam.Width1 = 0.2
			NewBeam.Brightness = 10
			NewBeam.LightInfluence = 0
			NewBeam.LightEmission = 0
			NewBeam.Enabled = true

			local Vis = G.g2.Toggles.ShowEyestalkPathToggle.Value and 0 or 1
			NewBeam.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, Vis), NumberSequenceKeypoint.new(1, Vis) })
			NewBeam.Parent = G.g2.Globals.SeekNodesFolder

			local A0 = Instance.new("Attachment", NewNode)
			local A1 = Instance.new("Attachment", PrevNode)
			NewBeam.Attachment0 = A0
			NewBeam.Attachment1 = A1

			table.insert(G.g2.Objects.EyestalkHighlights, NewBeam)
		end

		Room:WaitForChild("RoomEntrance", 9e9)
		Room:WaitForChild("RoomExit", 9e9)

		while not Room:GetAttribute("PathFound") do
			if G.g2.Toggles.ShowEyestalkPathToggle.Value then
				local EyePath = game:GetService("PathfindingService"):CreatePath({
					AgentCanJump = false, AgentCanClimb = false, WaypointSpacing = 2, AgentRadius = 1, AgentHeight = 1
				})
				EyePath:ComputeAsync(G.g3.RootPart.Position, Room.RoomExit.Position)
				if EyePath.Status == Enum.PathStatus.Success then
					Room:SetAttribute("PathFound", true)
					for _, Waypoint in EyePath:GetWaypoints() do
						CreateEyestalkNode(Waypoint.Position)
						task.wait()
					end
                    break
				end
			end
			task.wait(0.25)
		end
	end
end)

G.g2.Groupboxes.Floors_Completion = Tabs.Floors:AddRightGroupbox("Completion")
G.g2.Groupboxes.Floors_Completion:AddButton({
    Text = "Auto Complete Dam Seek",
    Tooltip = "Automatically teleports to and interacts with each water pump.",
    Func = function()
        if G.g3.LatestRoom.Value < 100 or G.g3.Floor ~= "Mines" then
            G.g2.Functions.Notify({Title = "You must be in Room 200 to do this."})
            return
        end

		local IsCutscene = false
		local CutsceneConnection = G.g3.RemotesFolder.Cutscene.OnClientEvent:Connect(function()
			IsCutscene = true
			task.wait(7)
			IsCutscene = false
		end)

        local function GetNextPump()
            local Highest = {
                Height = -69420,
                Object = nil
            }
            for _, Object in pairs(G.g2.Objects.Objectives) do
                if Object.Name == "WaterPump" and Object:GetAttribute("Abysall_Completed") ~= true then
                    if Object.PrimaryPart and Object.PrimaryPart.Position.Y > Highest.Height then
                        Highest.Object = Object
                        Highest.Height = Object.PrimaryPart.Position.Y
                    end
                end
            end
            return Highest.Object
        end

        local function HandlePump(Pump)

            while task.wait(0.1) do
				if IsCutscene then
					continue
				end

                G.g3.Character:PivotTo(Pump:GetPivot())

                local Prompt = Pump:FindFirstChild("ValvePrompt", true)
                if Prompt then
                    G.g2.Functions.ForceFirePrompt(Prompt)
                end

                if Pump:GetAttribute("Abysall_Completed") then
                    break
                end
            end
        end

        G.g2.Functions.Notify({Title = "Attempting to complete the valves.", Body = "Please wait."})
        while task.wait(0.1) do
            local Pump = GetNextPump()
            if Pump then
                HandlePump(Pump)
            else
                break
            end
        end
        G.g2.Functions.Notify({Title = "Successfully completed the valves."})
    end
})

G.g2.Groupboxes.Floors_Completion:AddButton({
    Text = "Auto Complete Cringle",
    Tooltip = "Instantly completes the quest.",
    Func = function()
        local TouchPart = G.g3.CurrentRooms:FindFirstChild("RippleExitDoor", true)
        if TouchPart then
            G.g3.Character:PivotTo(TouchPart:GetPivot())
        end
    end
})

G.g2.Groupboxes.Floors_Visuals = Tabs.Floors:AddLeftGroupbox("Visuals")
G.g2.Groupboxes.Floors_Visuals:AddToggle("ShowSeekPathToggle", {
	Text = "Show Seek Path", Default = false, Tooltip = "Shows you the correct path in seek chases.",
	Risky = G.g3.Floor ~= "Mines"
})
G.g2.Toggles.ShowSeekPathToggle:AddColorPicker("ShowSeekPathColor", { Text = "Seek Path", Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })

function G.g13.UpdateBeamVisibility(BeamTable, ColorKey, Visible)
	local Vis = Visible and 0 or 1
	local Seq = NumberSequence.new({ NumberSequenceKeypoint.new(0, Vis), NumberSequenceKeypoint.new(1, Vis) })
	for _, Beam in BeamTable do Beam.Transparency = Seq end
end
function G.g13.UpdateBeamColor(BeamTable, Value)
	local Seq = ColorSequence.new({ ColorSequenceKeypoint.new(0, Value), ColorSequenceKeypoint.new(1, Value) })
	for _, Beam in BeamTable do Beam.Color = Seq end
end

G.g2.Toggles.ShowSeekPathToggle:OnChanged(function(V)  G.g13.UpdateBeamVisibility(G.g2.Objects.SeekHighlights, "ShowSeekPathColor", V) end)
G.g2.Options.ShowSeekPathColor:OnChanged(function(V)   G.g13.UpdateBeamColor(G.g2.Objects.SeekHighlights, V) end)

G.g2.Groupboxes.Floors_Visuals:AddToggle("ShowEyestalkPathToggle", {
	Text = "Show Eyestalk Path", Default = false, Tooltip = "Shows you the correct path in the eyestalk chase.",
	Risky = G.g3.Floor ~= "Garden"
})
G.g2.Toggles.ShowEyestalkPathToggle:AddColorPicker("ShowEyestalkPathColor", { Text = "Eyestalk Path", Default = Color3.fromRGB(0, 255, 0), Transparency = 0 })
G.g2.Toggles.ShowEyestalkPathToggle:OnChanged(function(V) G.g13.UpdateBeamVisibility(G.g2.Objects.EyestalkHighlights, "ShowEyestalkPathColor", V) end)
G.g2.Options.ShowEyestalkPathColor:OnChanged(function(V)  G.g13.UpdateBeamColor(G.g2.Objects.EyestalkHighlights, V) end)

G.g2.Groupboxes.Floors_Bypass = Tabs.Floors:AddLeftGroupbox("Bypass")
G.g2.Groupboxes.Floors_Bypass:AddToggle("RemoveSeekTrigger", {
	Text = "Delete Seek Trigger", Default = false, Tooltip = "Diables the 'Seek' chase trigger.",
	Risky = not (G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel"),
	Disabled = not G.g2.Functions.CheckCompatability({"firetouchinterest"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage
})
G.g2.Groupboxes.Floors_Bypass:AddToggle("RemoveFigure", {
	Text = "Delete Figure", Default = false, Tooltip = "Completely removes the entity 'Figure' (doesn't always work).",
	Risky = not (G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel" or G.g3.Floor == "Mines"),
	Disabled = not G.g2.Functions.CheckCompatability({"isnetworkowner"}), DisabledTooltip = G.g2.Globals.IncompatibleMessage
})
G.g2.Groupboxes.Floors_Bypass:AddToggle("AutoRevive", {
	Text = "Infinite Revives", Default = false, Tooltip = "Automatically revives after dying, with unlimited respawns.",
	Risky = not (G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel")
})
G.g2.Groupboxes.Floors_Bypass:AddToggle("FigureGodmode", {
	Text = "Figure Godmode", Default = false, Tooltip = "Prevents 'Figure' from hurting you.",
	Risky = not (G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel")
})
G.g2.Groupboxes.Floors_Bypass:AddDivider()
G.g2.Groupboxes.Floors_Bypass:AddToggle("RemoveBasementGate",  { Text = "Remove Basement Gate",   Default = false, Tooltip = "Removes the gate from basement rooms.",            Risky = not (G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel") })
G.g2.Groupboxes.Floors_Bypass:AddToggle("RemovePaintingsDoor", { Text = "Remove Paintings Door",  Default = false, Tooltip = "Removes the fireplace doors from painting rooms.", Risky = not (G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel") })
G.g2.Groupboxes.Floors_Bypass:AddToggle("RemoveSkeletonDoor",  { Text = "Remove Skeleton Door",   Default = false, Tooltip = "Removes the skeleton door from the infirmary.",    Risky = G.g3.Floor ~= "Fools" })

local ObstructionNames = { ThingToOpen = "RemoveBasementGate", MovingDoor = "RemovePaintingsDoor", Wax_Door = "RemoveSkeletonDoor" }
for ObjName, ToggleName in ObstructionNames do
	G.g2.Toggles[ToggleName]:OnChanged(function(Value)
		for _, Object in G.g2.Objects.Obstructions do
			if Object.Name == ObjName then
				Object:PivotTo(Value and CFrame.new(-10000, -10000, -10000) or Object:GetAttribute("OriginalPosition"))
			end
		end
	end)
end

G.g2.Groupboxes.Floors_Farming = Tabs.Floors:AddLeftGroupbox("Farming")
G.g2.Groupboxes.Floors_Farming:AddToggle("KnobFarm", {
    Text = "Knob Farm",
    Default = false,
    Tooltip = "Automatically gains knobs for you, dies and revives repeatedly.",
	Risky = G.g3.Floor ~= "Ballz",
})

G.g2.Groupboxes.Floors_Farming:AddButton({
    Text = "Start Knob Farm",
    Tooltip = "Starts farming knobs, click this when you have enough gold.",
    Func = function()
		if G.g3.LatestRoom.Value ~= 0 then
			G.g2.Functions.Notify({Title = "You must be in Room 0 to use this."})
			return
		end

		if LocalPlayer.PlayerGui:FindFirstChild("TopbarUI") then 
			local GoldCount = LocalPlayer.PlayerGui.TopbarUI.Topbar.StatsTopbarHandler.StatModules.Gold.GoldVal
			if GoldCount.Value <= 0 then
				G.g2.Functions.Notify({Title = "You must have gold to do this."})
				return
			end
		end

        G.g2.Globals.KnobFarmStarted = true
    end
})

G.g2.Groupboxes.Floors_Farming:AddDivider()
G.g2.Groupboxes.Floors_Farming:AddButton({
	Text = "Start Death Farm",
	DoubleClick = true,
	Tooltip = "Automatically farms deaths, joining new runs.",
	Func = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/Scripts/DeathFarm.luau"))()
	end,

	Disabled = not G.g2.Functions.CheckCompatability({"fireproximityprompt", "firesignal"}),
	DisabledTooltip = G.g2.Globals.ImcompatibleMessage
})
G.g2.Groupboxes.Floors_Farming:AddButton({
	Text = "Copy Death Farm Loadstring",
	DoubleClick = false,
	Tooltip = "Copies the death farm loadstring to your clipboard.",
	Func = function()
		toclipboard([==[
			loadstring(game:HttpGet("https://raw.githubusercontent.com/bocaj111004/Abysall/refs/heads/main/Scripts/DeathFarm.luau"))()
		]==])
		G.g2.Library:Notify("Loadstring has been copied to your clipboard.")
	end,

	Disabled = not G.g2.Functions.CheckCompatability({"fireproximityprompt", "firesignal"}),
	DisabledTooltip = G.g2.Globals.ImcompatibleMessage
})

G.g2.Toggles.KnobFarm:OnChanged(function(Value)
    if Value then
        G.g2.Functions.Notify({Title = "Please collect some gold to earn knobs.", Body = "Click 'Start Knob Farm' when you're ready."})
	else
		G.g2.Globals.KnobFarmStarted = false
    end
end)

G.g2.Globals.KnobFarmActive = false
G.g2.Globals.KnobFarmStarted = false
G.g2.Connections_2.KnobFarm = G.g2.Services.RunService.Heartbeat:Connect(function()
	if G.g2.Toggles.KnobFarm.Value and G.g2.Globals.KnobFarmStarted then
		if not G.g2.Globals.KnobFarmActive then
			G.g2.Globals.KnobFarmActive = true
			if G.g2.Functions.CheckCompatability({"replicatesignal"}) then
				G.g1.Abysall.Environment.replicatesignal(LocalPlayer.Kill)
			else
				LocalPlayer.Character.Humanoid.Health = 0
			end
			while task.wait() do
				if LocalPlayer:GetAttribute("Alive") then
					break
				end
			end
			G.g3.RemotesFolder.Statistics:FireServer()
			task.wait(0.25)
			G.g2.Globals.KnobFarmActive = false
		end
	end
end)

G.g14.MainHook = nil
G.g14.OtherHook = nil
if G.g2.Functions.CheckCompatability({"hookmetamethod", "newcclosure", "getnamecallmethod"}) then
	G.g14.MainHook = G.g1.Abysall.Environment.hookmetamethod(game, "__namecall", G.g1.Abysall.Environment.newcclosure(function(Self, ...)
		local Args = { ... }
		if G.g1.Abysall and G.g1.Abysall.Environment then
			local Method = G.g1.Abysall.Environment.getnamecallmethod()

			if Self.Name == "Crouch" and Method == "FireServer" then
				if G.g2.Toggles.CrouchSpoof.Value or G.g2.Toggles.PositionSpoof.Value then
					Args[1] = true
				end
				Args[2] = true
			end

			if Self.Name == "ClutchHeartbeat" and Method == "FireServer" and G.g2.Toggles.AutoHeartbeatMinigame.Value or Self.Name == "HideMonster" and Method == "FireServer" and G.g2.Toggles.AutoHeartbeatMinigame.Value then
				return
			end

			if Self.Name == "MotorReplication" and Method == "FireServer" then
				local DoBypass = (G.g2.Toggles.BypassEyes.Value and G.g2.Globals.IsEyes) or (G.g2.Toggles.BypassLookman.Value and G.g2.Globals.IsLookman)
				if DoBypass then
					if G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel" then
						Args[1] = 0 Args[2] = (G.g2.Globals.SpoofOffset == 200 and 65 or -65) Args[3] = 0 Args[4] = false
					else
						Args[1] = -650
					end
				end
			end
		end
		return G.g14.MainHook(Self, table.unpack(Args))
	end))

    G.g14.OtherHook = G.g1.Abysall.Environment.hookmetamethod(game, "__index", G.g1.Abysall.Environment.newcclosure(function(Self, Property)
        local Real = G.g14.OtherHook(Self, Property)

        if Property == "MoveDirection" and Self == G.g3.Humanoid and G.g2.Globals.RoomsAutoWalkActive and G.g2.Toggles.RoomsAutoWalkSpoofFootsteps.Value and G.g3.Floor == "Rooms" and not G.g3.Character:GetAttribute("Hiding") then
            return G.g3.RootPart.CFrame.LookVector
        end
        
        return Real
    end))
end

if G.g2.Services.ReplicatedStorage:FindFirstChild("ModulesClient") then
	G.g10.ClientModules = G.g2.Services.ReplicatedStorage.ModulesClient
else
	G.g10.ClientModules = G.g2.Services.ReplicatedStorage.ClientModules
end

Modules = {
	Glitch         = G.g10.ClientModules.EntityModules.Glitch,
	Shade          = G.g10.ClientModules.EntityModules.Shade,
	Void           = G.g10.ClientModules.EntityModules:FindFirstChild("Void"),
	SpiderJumpscare = nil,
	A90            = nil,
	Screech        = nil,
	Dread          = nil,
	GlitchScreech  = nil,
}

local CharacterOldConnectionKeys = {
	"MainHandler", "JumpHandler", "SlideHandler", "LibraryCodeHandler1", "LibraryCodeHandler2",
	"OxygenConnection", "AnimationHandler", "AutoHideConnection", "AutoReviveHandler",
	"SHMFixer", "AnticheatDisabler", "AnticheatEnableDetector1", "AnticheatEnableDetector2",
	"AutoSteerMinecartDuckHandler", "AutoSolveAnchorsConnection", "InfiniteJumpsConnection1", "InfiniteJumpsConnection2",
	"FootstepHandler"
}

G.g2.Globals.IsTyping = false
G.g2.Connections_2.TextBoxConnection1 = G.g2.Services.UserInputService.TextBoxFocused:Connect(function()
	G.g2.Globals.IsTyping = true
end)
G.g2.Connections_2.TextBoxConnection2 = G.g2.Services.UserInputService.TextBoxFocusReleased:Connect(function()
	G.g2.Globals.IsTyping = false
end)

G.g2.Functions.HandleCharacter = function(NewCharacter)
	for _, Key in CharacterOldConnectionKeys do
		if G.g2.Connections_2[Key] then
			G.g2.Connections_2[Key]:Disconnect()
			G.g2.Connections_2[Key] = nil
		end
	end

	while not LocalPlayer.PlayerGui:FindFirstChild("MainUI") do
		task.wait()
	end

	G.g3.Character = NewCharacter
	G.g3.Humanoid = NewCharacter:WaitForChild("Humanoid", 9e9)
	G.g3.RootPart = NewCharacter:FindFirstChild("HumanoidRootPart")
	G.g3.Camera   = G.g2.Services.Workspace.CurrentCamera

	G.g2.Globals.OldCamera = G.g3.Camera
	G.g2.Globals.MainUI = LocalPlayer.PlayerGui.MainUI

	G.g3.Collision = NewCharacter:WaitForChild("Collision")
	G.g3.CollisionPart  = NewCharacter:FindFirstChild("CollisionPart") or NewCharacter:FindFirstChild("Collision")
	G.g3.CollisionClone = G.g3.Collision:Clone()
	G.g3.CollisionClone.Parent = NewCharacter
	G.g3.CollisionClone.Name = "CollisionClone"
	G.g3.CollisionClone.Massless = true

	G.g3.CollisionPartClone = G.g3.CollisionPart:Clone()
	G.g3.CollisionPartClone.Parent = NewCharacter
	G.g3.CollisionPartClone.Name = "CollisionPartClone"
	G.g3.CollisionPartClone.CanCollide = false
	G.g3.CollisionPartClone.Massless = true

	if G.g3.CollisionPartClone:FindFirstChild("CollisionCrouch") then
		G.g3.CollisionPartClone.CollisionCrouch:Destroy()
	end

	G.g3.Character:SetAttribute("SpeedBoost", 0)
	G.g3.Character:SetAttribute("SpeedBoostBehind", 0)
	G.g3.Character:SetAttribute("SpeedBoostExtra", 0)

	G.g5.OldJump  = NewCharacter:GetAttribute("CanJump")
	G.g5.OldSlide = NewCharacter:GetAttribute("CanSlide")

	if G.g2.Toggles.EnableCharacterJump.Value  then G.g3.Character:SetAttribute("CanJump",  true) end
	if G.g2.Toggles.EnableCharacterSlide.Value then G.g3.Character:SetAttribute("CanSlide", true) end

	if G.g2.Functions.CheckCompatability({"require"}) then
		G.g10.Main_Game = G.g1.Abysall.Environment.require(G.g2.Globals.MainUI.Initiator.Main_Game)
	end

	if G.g10.Main_Game and G.g2.Toggles.RemoveCameraBobbing.Value then
		G.g10.Main_Game.spring.Speed = 9e9
	end

	if G.g10.Main_Game and G.g2.Functions.CheckCompatability({"require"}) then
		local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()
		local OriginalGetMoveVector = Controls.GetMoveVector
		G.g2.Globals.OriginalGetMoveVector = OriginalGetMoveVector
		Controls.GetMoveVector = function(...)
			if G.g2.Toggles.AutoSteerMinecart.Value and G.g3.Floor == "Mines" then
				local Node = G.g2.Globals.NearestTurnNode
				if Node and G.g2.Functions.GetMinecart() then
					local Turn = Node:GetAttribute("Turn")
					return Turn == "Left" and Vector3.new(-1, 0, 0) or Turn == "Right" and Vector3.new(1, 0, 0) or Vector3.zero
				end
			end
			return OriginalGetMoveVector(...)
		end
	end

	G.g2.Globals.AutoMinecartDucked = false
	G.g2.Globals.LastDuck = tick()
	G.g2.Connections_2.AutoSteerMinecartDuckHandler = G.g2.Services.RunService.Heartbeat:Connect(function()
		if not G.g2.Toggles.AutoSteerMinecart.Value or not G.g2.Functions.GetMinecart() or tick() - G.g2.Globals.LastDuck < 0.1 then return end
		G.g2.Globals.NearestTurnNode = G.g2.Functions.GetNearestTurnNode()

		if not G.g2.Globals.AutoMinecartDucked and G.g2.Functions.GetNearestDuckBoard() then
			G.g10.Main_Game.crouch(true)
			G.g2.Globals.AutoMinecartDucked = true
		elseif not G.g2.Functions.GetNearestDuckBoard() and G.g2.Globals.AutoMinecartDucked then
			G.g10.Main_Game.crouch(false)
			G.g2.Globals.AutoMinecartDucked = false
		end
		if G.g10.Main_Game then
			G.g10.Main_Game.fovtarget = G.g2.Options.FieldOfView.Value
		else
			G.g3.Camera.FieldOfView = G.g2.Options.FieldOfView.Value
		end
		G.g2.Globals.LastDuck = tick()
	end)

	G.g2.Globals.AnticheatDisabled = false

	local UIModules = G.g2.Globals.MainUI.Initiator.Main_Game.RemoteListener.Modules
	Modules.A90             = UIModules:FindFirstChild("A90")
	Modules.Screech         = UIModules.Screech
	Modules.Dread           = UIModules:FindFirstChild("Dread")
	Modules.SpiderJumpscare = UIModules.SpiderJumpscare

	if G.g2.Toggles.RemoveScreech.Value    then Modules.Screech.Name = "Screech_Disabled" print ("screech gone") end
	if G.g2.Toggles.RemoveA90.Value and Modules.A90   then Modules.A90.Name = "A90_Disabled" end
	if G.g2.Toggles.RemoveDread.Value and Modules.Dread then Modules.Dread.Name = "Dread_Disabled" end
	if G.g2.Toggles.DisableTimothyJumpscare.Value then Modules.SpiderJumpscare.Name = "SpiderJumpscare_Disabled" end

	if G.g2.Toggles.DisableHideVignette.Value then
		local Vignette = G.g2.Globals.MainUI:FindFirstChild("HideVignette") or G.g2.Globals.MainUI.MainFrame:FindFirstChild("HideVignette")
		if Vignette then Vignette.Image = "Disabled" end
	end
	if G.g2.Toggles.RemoveInteractingSounds.Value then
		local PS = G.g2.Globals.MainUI.Initiator.Main_Game.PromptService
		PS.Triggered.Volume = 0
		PS.Holding.Volume   = 0
		PS.Notification.Volume = 0
		G.g2.Globals.MainUI.Initiator.Main_Game.Reminder.Caption.Volume = 0
	end
	if G.g2.Toggles.DisableEntityJumpscares.Value then
		local JS = G.g2.Globals.MainUI.Initiator.Main_Game.RemoteListener:FindFirstChild("Jumpscares")
		if JS then JS.Name = "Jumpscares_Disabled" end
	end
    local Cutscenes = G.g2.Globals.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes
    for _, Object in pairs(Cutscenes:GetChildren()) do
        if table.find(G.g3.CutsceneNames, Object.Name) and Object:IsA("ModuleScript") then
            Object:SetAttribute("OriginalName", Object.Name)
            if G.g2.Toggles.RemoveCutscenes.Value then
                Object.Name = Object.Name .. "_Disabled"
            end
        end
    end
    for _, Object in pairs(G.g3.FloorReplicated:GetChildren()) do
        if table.find(G.g3.CutsceneNames, Object.Name) and Object:IsA("ModuleScript") then
            Object:SetAttribute("OriginalName", Object.Name)
            if G.g2.Toggles.RemoveCutscenes.Value then
                Object.Name = Object.Name .. "_Disabled"
            end
        end
    end

	CustomPhysics = PhysicalProperties.new(
		100,
		G.g3.RootPart.CustomPhysicalProperties.Friction,
		G.g3.RootPart.CustomPhysicalProperties.Elasticity,
		G.g3.RootPart.CustomPhysicalProperties.FrictionWeight,
		G.g3.RootPart.CustomPhysicalProperties.ElasticityWeight
	)
	for _, Part in NewCharacter:GetDescendants() do
		if Part:IsA("BasePart") then
			G.g2.PartProperties[Part] = Part.CustomPhysicalProperties
			if G.g2.Toggles.RemoveAcceleration.Value then
				Part.CustomPhysicalProperties = CustomPhysics
			end
		end
	end

	G.g2.Connections_2.LibraryCodeHandler1 = LocalPlayer.PlayerGui.PermUI.Hints.ChildAdded:Connect(function()
		if G.g2.Toggles.NotifyLibraryCode.Value then
			local Code = G.g2.Functions.GetLibraryCode()
			if Code and not Code:find("_") and not G.g2.Globals.LibraryCodeFound then
				local Lock = G.g2.Services.Workspace:FindFirstChild("Padlock", true)
				G.g2.Functions.Notify({ Title = "Padlock code found!", Body = "The code is: '" .. Code .. "'", Time = G.g2.Toggles.NotifyKeepNotifications.Value and Lock or 15 })
				G.g2.Globals.LibraryCodeFound = true
			end
		end
	end)

	G.g2.Connections_2.LibraryCodeHandler2 = G.g3.Character.ChildAdded:Connect(function(Child)
		if (Child.Name == "LibraryHintPaper" or Child.Name == "LibraryHintPaperHard") and G.g2.Toggles.NotifyLibraryCode.Value then
			local Code = G.g2.Functions.GetLibraryCode()
			if Code and not Code:find("_") and not G.g2.Globals.LibraryCodeFound then
				local Lock = G.g2.Services.Workspace:FindFirstChild("Padlock", true)
				G.g2.Functions.Notify({ Title = "Padlock code found!", Body = "The code is: '" .. Code .. "'", Time = G.g2.Toggles.NotifyKeepNotifications.Value and Lock or 15 })
				G.g2.Globals.LibraryCodeFound = true
			end
		end
	end)

	G.g2.Connections_2.FootstepHandler = G.g3.Character.ChildAdded:Connect(function(Object)
		if Object:IsA("Sound") and Object.Name == "Sound" and G.g2.Toggles.RemoveFootstepSounds.Value then
			Object.Volume = 0
		end
	end)

	G.g2.Globals.OldOxygen = G.g3.Character:GetAttribute("Oxygen")
	G.g2.Connections_2.OxygenConnection = G.g3.Character:GetAttributeChangedSignal("Oxygen"):Connect(function()
		local NewOxy = G.g3.Character:GetAttribute("Oxygen")
		if NewOxy < G.g2.Globals.OldOxygen and G.g2.Toggles.NotifyOxygen.Value then
			G.g2.Functions.Caption(G.g2.Functions.FormatOxygen(NewOxy), true)
		end
		G.g2.Globals.OldOxygen = NewOxy
	end)

	G.g2.Connections_2.AutoReviveHandler = LocalPlayer:GetAttributeChangedSignal("Alive"):Connect(function()
		if LocalPlayer:GetAttribute("Alive") == false and G.g2.Toggles.AutoRevive.Value then
			if G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel" then
				while LocalPlayer:GetAttribute("Alive") ~= true do
					G.g3.RemotesFolder.Revive:FireServer()
					task.wait(0.5)
				end
			end
		end
	end)

	G.g2.Connections_2.SHMFixer = G.g3.RootPart:GetPropertyChangedSignal("Anchored"):Connect(function()
		task.wait()
		if G.g3.Floor == "Fools" and G.g3.RootPart.Anchored and G.g3.Character:GetAttribute("Hiding") ~= true then
			G.g3.RootPart.Anchored = false
		end
	end)

	G.g2.Connections_2.AnticheatDisabler = G.g3.Character:GetAttributeChangedSignal("Climbing"):Connect(function()
		if G.g3.Character:GetAttribute("Climbing") == true and G.g2.Toggles.DisableAnticheat.Value and not G.g2.Globals.AnticheatDisabled then
			task.wait(0.25)
			G.g3.Character:SetAttribute("Climbing", false)
			G.g2.Functions.Notify({ Title = "Successfully disabled the anticheat.", Body = "It will be re-enabled after a cutscene or halt room." })
			G.g2.Globals.AnticheatDisabled = true
		end
	end)

	G.g2.Connections_2.AnticheatEnableDetector1 = G.g3.RemotesFolder:WaitForChild("Cutscene").OnClientEvent:Connect(function(CutsceneName)
		if G.g2.Globals.AnticheatDisabled and not CutsceneName:find("SewerSeek") then
			G.g2.Globals.AnticheatDisabled = false
			G.g2.Functions.Notify({ Title = "The anticheat has been re-enabled.", Body = "Interact with a ladder to disable it again." })
		end
	end)

	G.g2.Connections_2.AnticheatEnableDetector2 = G.g3.RemotesFolder:WaitForChild("UseEnemyModule").OnClientEvent:Connect(function(ModuleName)
		if ModuleName == "Void" or ModuleName == "Glitch" then
			if G.g2.Globals.AnticheatDisabled then
				G.g2.Globals.AnticheatDisabled = false
				G.g2.Functions.Notify({ Title = "The anticheat has been re-enabled.", Body = "Interact with a ladder to disable it again." })
			end
			LocalPlayer:SetAttribute("CurrentRoom", G.g3.LatestRoom.Value)
		end
	end)

	G.g2.Connections_2.AnimationHandler = G.g3.Character.ChildAdded:Connect(function()
		local ToolNames = { "Lockpick","Shears","SkeletonKey","Key","GeneratorFuse","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
		local Tool
		for _, Name in ToolNames do
			Tool = G.g3.Character:FindFirstChild(Name)
			if Tool then break end
		end
		if not Tool then return end

		local UseAnim = Tool:FindFirstChild("use", true) or Tool:FindFirstChild("promptanim", true)
		if UseAnim then
			UseAnim = G.g3.Humanoid:LoadAnimation(UseAnim)
			UseAnim.Priority = Enum.AnimationPriority.Action4
			G.g2.Globals.UseAnimation = UseAnim
		end
		local UseAnimBreak = Tool:FindFirstChild("usefinish", true) or Tool:FindFirstChild("promptanimend", true) or Tool:FindFirstChild("lockpickuse", true)
		if UseAnimBreak then
			UseAnimBreak = G.g3.Humanoid:LoadAnimation(UseAnimBreak)
			UseAnimBreak.Priority = Enum.AnimationPriority.Action4
			G.g2.Globals.UseAnimationBreak = UseAnimBreak
		end
	end)

	G.g2.Connections_2.JumpHandler = G.g3.Character:GetAttributeChangedSignal("CanJump"):Connect(function()
		local Val = G.g3.Character:GetAttribute("CanJump")
		if G.g2.Toggles.EnableCharacterJump.Value and Val ~= true or not G.g2.Toggles.EnableCharacterJump.Value then
			G.g5.OldJump = Val
		end
		if G.g2.Toggles.EnableCharacterJump.Value then G.g3.Character:SetAttribute("CanJump", true) end
	end)

	G.g2.Connections_2.SlideHandler = G.g3.Character:GetAttributeChangedSignal("CanSlide"):Connect(function()
		local Val = G.g3.Character:GetAttribute("CanSlide")
		if G.g2.Toggles.EnableCharacterSlide.Value and Val ~= true or not G.g2.Toggles.EnableCharacterSlide.Value then
			G.g5.OldSlide = Val
		end
		if G.g2.Toggles.EnableCharacterSlide.Value then G.g3.Character:SetAttribute("CanSlide", true) end
	end)

	G.g2.Connections_2.InfiniteJumpsConnection1 = G.g2.Services.UserInputService.InputBegan:Connect(function(Input)
		if Input.KeyCode == Enum.KeyCode.Space and G.g2.Toggles.InfiniteJumps.Value and not G.g2.Globals.IsTyping then
			G.g3.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)

	local JumpButton = G.g2.Globals.MainUI.MainFrame.MobileButtons:FindFirstChild("JumpButton")
	if JumpButton then
		G.g2.Connections_2.InfiniteJumpsConnection2 = JumpButton.MouseButton1Down:Connect(function()
			if G.g2.Toggles.InfiniteJumps.Value then
				G.g3.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end

	G.g2.Globals.SpoofOffset = 0
	G.g2.Globals.LastAutoHide = tick()
	G.g2.Connections_2.AutoHideConnection = G.g2.Services.RunService.Heartbeat:Connect(function()
		if not G.g2.Toggles.AutoClosetToggle.Value or tick() - G.g2.Globals.LastAutoHide <= 0.1 then
			G.g2.Globals.AutoClosetActive = false
			return
		end
		local Entity = G.g2.Functions.GetNearestEntity(true, G.g2.Options.AutoClosetEntityList.Value)
		local EntityNearby = Entity and LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position) <= (EntityDistances[Entity.Name] or 150)
		if G.g3.Character:GetAttribute("Hiding") == true then
			G.g2.Globals.AutoClosetActive = false
			G.g2.Globals.SpectateEntity = nil
			if not EntityNearby then
				G.g3.RemotesFolder.CamLock:FireServer()
			end
			G.g2.Globals.LastAutoHide = tick()
			return
		end
		if not Entity then
			G.g2.Globals.SpectateEntity = nil
			G.g2.Globals.AutoClosetActive = false
			G.g2.Globals.LastAutoHide = tick()
			return
		end
		if not EntityNearby then
			G.g2.Globals.SpectateEntity = nil
			G.g2.Globals.AutoClosetActive = false
			G.g2.Globals.LastAutoHide = tick()
			return
		end
		local Closet = G.g2.Functions.GetNearestHidingSpot()
		if G.g3.Character:GetAttribute("Hiding") ~= true and Closet then
			local Prompt = Closet:FindFirstChild("HidePrompt")
				or Closet:FindFirstChild("HidingPrompt")
				or Closet:FindFirstChild("HidePrompt", true)
				or Closet:FindFirstChild("HidingPrompt", true)

			if not Prompt then
				for _, Child in Closet:GetDescendants() do
					if (Child:IsA("ProximityPrompt") or Child:IsA("InteractPrompt"))
						and (Child.Name == "HidePrompt" or Child.Name == "HidingPrompt")
					then
						Prompt = Child
						break
					end
				end
			end

			if Prompt then
				G.g2.Globals.AutoClosetActive = true
				G.g2.Functions.ForceFirePrompt(Prompt)
			end
		end
		if G.g3.Character:GetAttribute("Hiding") then
			if G.g2.Toggles.SpectateEntityToggle.Value and Entity.PrimaryPart then
				G.g2.Globals.SpectateEntity = Entity
			end
		end
		G.g2.Globals.LastAutoHide = tick()
	end)

	G.g2.Globals.LastAutoAnchor = tick()
	G.g2.Connections_2.AutoSolveAnchorsConnection = G.g2.Services.RunService.Heartbeat:Connect(function()
		if not G.g2.Toggles.AutoSolveAnchors.Value then return end
		if not G.g2.Globals.MainUI:FindFirstChild("AnchorHintFrame") then return end
		if tick() - G.g2.Globals.LastAutoAnchor <= 0.1 then return end
		local Anchor = G.g2.Functions.GetCurrentAnchor()
		if Anchor and LocalPlayer:DistanceFromCharacter(Anchor.PrimaryPart.Position) < Anchor.ActivateEventPrompt.MaxActivationDistance and not Anchor:GetAttribute("Activated") then
			Anchor:WaitForChild("AnchorRemote"):InvokeServer(G.g2.Globals.MainUI.AnchorHintFrame.Code.Text)
		end
		G.g2.Globals.LastAutoAnchor = tick()
	end)

	G.g2.Globals.ManipulateBody = Instance.new("BodyVelocity")
	G.g2.Globals.ManipulateBody.MaxForce = Vector3.new(9e9, 9e9, 9e9)

	G.g2.Globals.FlyBody = Instance.new("BodyVelocity")
	G.g2.Globals.FlyBody.MaxForce = Vector3.new(9e9, 9e9, 9e9)

	G.g2.Globals.SelfKilled = false
	G.g2.Globals.ThirdPersonParts = {}
	for _, Object in G.g3.Character:GetDescendants() do
		if Object:IsA("Accessory") and Object:FindFirstChild("Handle") then
			table.insert(G.g2.Globals.ThirdPersonParts, Object.Handle)
		end
	end
	table.insert(G.g2.Globals.ThirdPersonParts, G.g3.Character:WaitForChild("Head"))

	G.g2.Globals.LastAnimationCheck = tick()
	G.g2.Globals.LastCrouchFire = tick()
	G.g2.Globals.OriginalC1 = G.g3.Character.LowerTorso.Root.C1

	local RayParams = RaycastParams.new()
	RayParams.FilterType = Enum.RaycastFilterType.Exclude

	local MainFrame = G.g2.Globals.MainUI:FindFirstChild("MainFrame")
	if MainFrame and MainFrame:FindFirstChild("SurgeVignette") then
		G.g2.Globals.SurgeFrame = MainFrame.SurgeVignette
		if G.g2.Toggles.RemoveSurge.Value then
			G.g2.Globals.SurgeFrame.Name = "SurgeVignette_Disabled"
		end
	end

	G.g2.Connections_2.MainHandler = G.g2.Services.RunService.RenderStepped:Connect(function()
		if G.g2.Services.Workspace:FindFirstChild("Camera") then
			G.g3.Camera = G.g2.Services.Workspace:FindFirstChild("Camera")
		end

		if G.g2.Toggles.SpeedBoostToggle.Value then
			G.g3.Humanoid.WalkSpeed = G.g2.Functions.GetCurrentSpeed() + G.g2.Options.SpeedBoostSlider.Value
		end

		if G.g2.Globals.Lagging or (G.g2.Options.SpeedBoostSlider.Value <= 6 and G.g2.Options.FlySpeed.Value <= 21) then
			G.g3.CollisionPartClone.Massless = true
		end

		G.g2.Globals.IsEyes    = G.g2.Services.Workspace:FindFirstChild("Eyes") ~= nil or G.g2.Services.Workspace:FindFirstChild("Lookman") ~= nil
		G.g2.Globals.IsLookman = G.g2.Services.Workspace:FindFirstChild("BackdoorLookman") ~= nil

		if G.g2.Toggles.AmbientToggle.Value then
			G.g2.Services.TweenService:Create(G.g2.Services.Lighting, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), { Ambient = G.g2.Options.AmbientColor.Value }):Play()
		end

		if G.g10.Main_Game then
			if G.g2.Toggles.RemoveCameraShake.Value     then G.g10.Main_Game.csgo = CFrame.new() end
			if G.g2.Toggles.ViewmodelOffsetToggle.Value then
				G.g10.Main_Game.tooloffset = Vector3.new(G.g2.Options.ViewmodelOffsetX.Value, G.g2.Options.ViewmodelOffsetY.Value, G.g2.Options.ViewmodelOffsetZ.Value)
			else
				G.g10.Main_Game.tooloffset = Vector3.zero
			end
		end

		if G.g2.Globals.SelfKilled and G.g2.Globals.MainUI:FindFirstChild("Statistics") then
			G.g2.Globals.MainUI.Statistics.Death.Text = "Died to Abysall Hub"
		end

		if G.g2.Globals.Deathing and G.g2.Globals.MainUI:FindFirstChild("Statistics") then
			G.g2.Globals.MainUI.Statistics.Death.Text = "Died to Verity"
		end

		local MainFrame = G.g2.Globals.MainUI:FindFirstChild("MainFrame")
		if MainFrame then
			local Effects = MainFrame.Healthbar:FindFirstChild("Effects")
			if Effects and Effects:FindFirstChild("Crouching") then
				Effects.Crouching.Visible = G.g2.Functions.IsCrouching()
			end
		end

		if (G.g2.Toggles.CrouchSpoof.Value or G.g2.Toggles.PositionSpoof.Value) and G.g3.RemotesFolder:FindFirstChild("Crouch") then
			G.g3.RemotesFolder.Crouch:FireServer(true, true)
		end

		if G.g3.Floor ~= "Fools" and G.g3.Floor ~= "OldHotel" and not G.g3.Camera:FindFirstChild("MinecartRig") then
			G.g3.RootPart.CanCollide = false
		end

		for _, Part in G.g3.Character:GetChildren() do
			if Part:IsA("BasePart") then Part.CanCollide = false end
		end

		if LocalPlayer:GetAttribute("Alive") == true then
			G.g2.Services.SoundService:WaitForChild("Main").Volume = 1
		end

		if G.g3.Floor == "OldHotel" or G.g3.Floor == "Fools" then
			local SpoofOffset = G.g2.Toggles.PositionSpoof.Value and G.g2.Functions.GetNearestEntity() and 200 or G.g2.Toggles.FigureGodmode.Value and G.g2.Functions.GetNearestFigure() and 200 or 0
			G.g2.Globals.SpoofOffset = SpoofOffset
			G.g3.Collision.Position = G.g3.RootPart.Position + Vector3.new(0, SpoofOffset, 0)
			G.g3.Collision.CanCollide = false
			if G.g3.Floor == "Fools" then
				G.g3.Collision.CollisionCrouch.CanCollide = false
				G.g3.CollisionClone.CollisionCrouch.CanCollide = false
			end
			G.g3.RootPart.CanCollide = not (G.g2.Toggles.NoclipToggle.Value or G.g2.Toggles.VelocityManipulationToggle.Value)
		else
			G.g3.Collision.CanCollide = false
			if G.g3.Collision:FindFirstChild("CollisionCrouch") then G.g3.Collision.CollisionCrouch.CanCollide = false end

			if G.g3.CollisionClone:FindFirstChild("CollisionCrouch") then
				local IsCrouch = G.g2.Functions.IsCrouching()
				G.g3.CollisionClone.CanCollide = not (G.g2.Toggles.NoclipToggle.Value or G.g2.Toggles.VelocityManipulationToggle.Value or IsCrouch)
				G.g3.CollisionClone.CollisionCrouch.CanCollide = not (G.g2.Toggles.NoclipToggle.Value or G.g2.Toggles.VelocityManipulationToggle.Value or not IsCrouch)
			else
				G.g3.RootPart.CanCollide = not (G.g2.Toggles.NoclipToggle.Value or G.g2.Toggles.VelocityManipulationToggle.Value)
			end

			local SpoofY = G.g2.Toggles.PositionSpoof.Value and 2.328 or 0.18
			G.g3.Collision.Position     = G.g3.RootPart.Position + Vector3.new(0, SpoofY, 0)
			G.g3.CollisionPart.Position = G.g3.RootPart.Position + Vector3.new(0, SpoofY, 0)

			if G.g3.Collision:FindFirstChild("CollisionCrouch") and G.g3.CollisionClone:FindFirstChild("CollisionCrouch") then
				local CrouchY = G.g2.Toggles.PositionSpoof.Value and 1.328 or -0.982
				G.g3.Collision.CollisionCrouch.Position = G.g3.RootPart.Position + Vector3.new(0, CrouchY, 0)
				G.g3.CollisionClone.CollisionCrouch.CollisionGroup = G.g3.Collision.CollisionCrouch.CollisionGroup
			end
			if G.g3.CollisionClone:FindFirstChild("CollisionCrouch") then
				G.g3.CollisionClone.CollisionCrouch.Position = G.g3.RootPart.Position + Vector3.new(0, G.g2.Toggles.PositionSpoof.Value and 0.75 or -0.982, 0)
			end
		end

		G.g3.CollisionClone.CollisionGroup = G.g3.Collision.CollisionGroup
		G.g3.CollisionClone.Position = G.g3.RootPart.Position + Vector3.new(0, G.g2.Toggles.PositionSpoof.Value and 1.75 or 0.18, 0)

		if G.g2.Toggles.VelocityManipulationToggle.Value and G.g2.Options.VelocityManipulationMode.Value == "Velocity" then
			G.g2.Globals.ManipulateBody.Parent = G.g3.RootPart
			G.g2.Globals.ManipulateBody.Velocity = G.g3.RootPart.CFrame.LookVector * 2.25
		else
			G.g2.Globals.ManipulateBody.Parent = nil
		end

		if G.g2.Toggles.VelocityManipulationToggle.Value and G.g2.Options.VelocityManipulationMode.Value == "Pivot" and G.g3.Floor ~= "Fools" and G.g3.Floor ~= "OldHotel" then
			G.g3.Character:PivotTo(G.g3.Camera:GetPivot() * CFrame.new(0, 0, 2560))
		end

		if G.g2.Toggles.FlyToggle.Value then
			G.g2.Globals.FlyBody.Parent = G.g3.RootPart
			G.g2.Globals.FlyBody.Velocity = G.g2.Functions.GetFlyVelocity() * G.g2.Options.FlySpeed.Value
		else
			G.g2.Globals.FlyBody.Parent = nil
		end

		local DoEyesBypass = (G.g2.Toggles.BypassEyes.Value and G.g2.Globals.IsEyes) or (G.g2.Toggles.BypassLookman.Value and G.g2.Globals.IsLookman)
		if DoEyesBypass then
			if G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel" then
				G.g3.RemotesFolder.MotorReplication:FireServer(0, (G.g2.Globals.SpoofOffset == 200 and 65 or -65), 0, false)
			else
				G.g3.RemotesFolder.MotorReplication:FireServer(-650)
			end
		end

		if G.g3.RemotesFolder:FindFirstChild("Crouch") and tick() - G.g2.Globals.LastCrouchFire > 0.1 then
			local IsCrouch = G.g2.Functions.IsCrouching()
			if G.g2.Toggles.CrouchSpoof.Value or G.g2.Toggles.PositionSpoof.Value then IsCrouch = true end
			G.g3.RemotesFolder.Crouch:FireServer(IsCrouch, true)
			G.g2.Globals.LastCrouchFire = tick()
		end

		if tick() - G.g2.Globals.LastAnimationCheck > 0.1 then
			local Sliding = false
			for _, Anim in G.g3.Humanoid:GetPlayingAnimationTracks() do
				if Anim.Name == "Slide" then Sliding = true break end
			end
			G.g2.Globals.Sliding = Sliding
			G.g2.Globals.LastAnimationCheck = tick()
		end

		G.g3.Character:SetAttribute("Sliding", G.g2.Globals.Sliding)
		if G.g3.Character:GetAttribute("Crouching") ~= G.g2.Functions.IsCrouching() then
			G.g3.Character:SetAttribute("Crouching", G.g2.Functions.IsCrouching())
		end

		RayParams.FilterDescendantsInstances = { G.g3.Character }
		local TPOffset = CFrame.new(G.g2.Options.ThirdPersonOffsetX.Value, G.g2.Options.ThirdPersonOffsetY.Value, G.g2.Options.ThirdPersonOffsetZ.Value)
		local Direction = (G.g3.Camera.CFrame * TPOffset).Position - G.g3.Camera.CFrame.Position
		local WallResult = G.g2.Services.Workspace:Spherecast(G.g3.Camera.CFrame.Position, 0.2, Direction, RayParams)

		if G.g2.Toggles.ThirdPersonToggle.Value then
			if G.g2.Toggles.ThirdPersonWallCheck.Value and WallResult and WallResult.Instance.CanCollide then
				local NewPos = G.g3.Camera.CFrame.Position + Direction.Unit * WallResult.Distance
				G.g3.Camera.CFrame = CFrame.new(NewPos, NewPos + G.g3.Camera.CFrame.LookVector)
			else
				G.g3.Camera.CFrame = G.g3.Camera.CFrame * TPOffset
			end
		end

		for _, Part in G.g2.Globals.ThirdPersonParts do
			Part.Transparency = G.g2.Toggles.ThirdPersonToggle.Value and 0 or 1
			Part.LocalTransparencyModifier = G.g2.Toggles.ThirdPersonToggle.Value and 0 or 1
		end

		if G.g2.Globals.SpectateEntity and G.g2.Toggles.AutoClosetToggle.Value and G.g2.Toggles.SpectateEntityToggle.Value then
			local Entity = G.g2.Globals.SpectateEntity

			local CamPosition
			if G.g2.Options.SpecateEntityMode.Value == "Player to Entity" then
				CamPosition = CFrame.lookAt(G.g3.Character.Head.Position, Entity.PrimaryPart.Position)
			else
				CamPosition = CFrame.lookAt(Entity.PrimaryPart.Position, G.g3.Character.Head.Position)
			end

			G.g3.Camera.CFrame = CamPosition
		end

		if G.g2.Toggles.FOVToggle.Value then
			if G.g10.Main_Game then
				task.wait()
				G.g10.Main_Game.fovtarget = G.g2.Options.FieldOfView.Value
			else
				G.g3.Camera.FieldOfView = G.g2.Options.FieldOfView.Value
			end
		end

		if G.g2.Toggles.RemoveClosetDelay.Value
			and G.g3.Humanoid.MoveDirection ~= Vector3.zero
			and (G.g3.CollisionPart.Anchored or G.g3.RootPart.Anchored)
			and G.g3.Character:GetAttribute("AnimatingClient") ~= true
			and G.g3.Character:GetAttribute("Hiding") == true
		then
			G.g3.RemotesFolder.CamLock:FireServer()
		end

		local ClosestPlayer = { Distance = math.huge, Object = nil }
		for _, Player in G.g2.Services.Players:GetPlayers() do
			if Player.Character and Player ~= LocalPlayer then
				local Root = Player.Character:FindFirstChild("HumanoidRootPart")
				if Root then
					local D = (G.g3.Camera.CFrame.Position - Root.Position).Magnitude
					if D < ClosestPlayer.Distance then
						ClosestPlayer.Distance = D
						ClosestPlayer.Object = Player
					end
				end
			end
		end
		if ClosestPlayer.Object and LocalPlayer:GetAttribute("Alive") ~= true then
			LocalPlayer:SetAttribute("CurrentRoom", ClosestPlayer.Object:GetAttribute("CurrentRoom"))
		end
	end)

	task.wait(1)
	if G.g2.Toggles.PositionSpoof.Value and G.g3.Floor ~= "Fools" and G.g3.Floor ~= "OldHotel" then
		G.g3.RootPart.CFrame = G.g3.RootPart.CFrame * CFrame.new(0, -2.346, 0)
		G.g3.Humanoid.HipHeight = 0.05
		G.g3.RemotesFolder.Crouch:FireServer(true, true)
	end

	local Jam = G.g2.Globals.MainUI.Initiator.Main_Game.Health:FindFirstChild("Jam")
	if Jam and G.g2.Toggles.RemoveJamminMusic.Value then
		Jam.Volume = 0
		G.g2.Globals.JamMuffle.Enabled = false
	end
end

G.g2.Functions.HandleHidingTransparency = function(Model)
	local Parts = {}
	for _, Part in Model:GetDescendants() do
		if Part:IsA("BasePart") then
			Part:SetAttribute("Transparency_Old", Part.Transparency)
			table.insert(Parts, Part)
		end
		if Part.Name == "HiddenPlayer" then
			local HideConn = Part:GetPropertyChangedSignal("Value"):Connect(function()
				for _, P in Parts do
					if P:GetAttribute("Transparency_Old") then
						G.g2.Services.TweenService:Create(P, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {
							Transparency = (Part.Value == G.g3.Character and G.g2.Toggles.TransparentHidingSpotsToggle.Value)
								and G.g2.Options.TransparentHidingSpotsSlider.Value
								or P:GetAttribute("Transparency_Old")
						}):Play()
					end
				end
			end)
			table.insert(G.g2.Connections_2, HideConn)
			Model.Destroying:Once(function()
				HideConn:Disconnect()
				local Pos = table.find(G.g2.Connections_2, HideConn)
				if Pos then table.remove(G.g2.Connections_2, Pos) end
			end)
		end
	end
end

G.g2.Functions.HandleObject = function(Object)
	for _, Room in G.g3.CurrentRooms:GetChildren() do
		if Object:IsDescendantOf(Room) then
			Object:SetAttribute("ParentRoom", tonumber(Room.Name))
			break
		end
		task.wait()
	end

	if Object.Parent == G.g3.CurrentRooms then
		local FiredampVal = Object:GetAttribute("Firedamp")
		Object:SetAttribute("Firedamp_Old", FiredampVal ~= nil and FiredampVal or false)
		if G.g2.Toggles.DisableFiredampEffect.Value then
			Object:SetAttribute("Firedamp", false)
		end
	end

	local Name = Object.Name

	if Name == "KeyObtain" then
		task.spawn(function()
			task.wait(0.5)
			if Object.Parent then
				if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Door Key", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
				table.insert(G.g2.Objects.Objectives, Object)
			end
		end)
	elseif Name == "ElectricalKeyObtain" then
		task.spawn(function()
			task.wait(0.5)
			if Object.Parent then
				if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Electrical Key", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
				table.insert(G.g2.Objects.Objectives, Object)
			end
		end)
	elseif Name == "TimerLever" then
		task.spawn(function()
			task.wait(0.5)
			if Object.Parent then
				Object:SetAttribute("AddTime", Object.TakeTimer.TextLabel.Text == "01:00" and 60 or 30)
				if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Time Lever [+" .. Object:GetAttribute("AddTime") .. "s]", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
				Object:WaitForChild("Main").SoundToPlay.Played:Once(function()
					G.g2.Functions.RemoveESP(Object)
					G.g2.Functions.BlacklistESP(Object)
				end)
				table.insert(G.g2.Objects.Objectives, Object)
			end
		end)
	elseif Name == "DepotHalloween" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Candy Magic", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "StairwellLockpickDoor" then
		if G.g2.Toggles.MiscESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Garage Door", Color = G.g2.Options.MiscESPColor.Value }, true) end
		table.insert(G.g2.Objects.Misc, Object)
	elseif Name == "Mirror" then
		if G.g2.Toggles.MiscESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Mirror", Color = G.g2.Options.MiscESPColor.Value }, true) end
		table.insert(G.g2.Objects.Misc, Object)
	elseif Name == "StairwellFireAlarm" then
		if G.g2.Toggles.MiscESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Fire Alarm", Color = G.g2.Options.MiscESPColor.Value }, true) end
		table.insert(G.g2.Objects.Misc, Object)
	elseif Name == "ShoppingCart" then
		if G.g2.Toggles.MiscESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Shopping Cart", Color = G.g2.Options.MiscESPColor.Value }, true) end
		table.insert(G.g2.Objects.Misc, Object)
	elseif Name == "StairwellScrapper" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Scrapper", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "ArchivesPackageDeposit" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Package Deposit", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "Cellar" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Cellar", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "ArchivesFihTank" then
		if G.g2.Toggles.MiscESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Fih Tank", Color = G.g2.Options.MiscESPColor.Value }, true) end
		table.insert(G.g2.Objects.Misc, Object)
	elseif Name == "LiveHintBook" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Hint Book", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "LiveBreakerPolePickup" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Fuse Breaker", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		for _, Child in Object:GetChildren() do
			if Child.Name == "ActivateEventPrompt" and (Child.MaxActivationDistance == 5 or Child:GetAttribute("MaxActivationDistance_Old") == 5) then
				Child:Destroy()
			end
		end
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "LibraryHintPaper" or Name == "PickupItem" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Hint Paper", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "MinesAnchor" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Anchor [" .. Object:WaitForChild("Sign").TextLabel.Text .. "]", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		Object:GetAttributeChangedSignal("Activated"):Once(function()
			G.g2.Functions.RemoveESP(Object)
			G.g2.Functions.BlacklistESP(Object)
		end)
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "WaterPump" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object:WaitForChild("Wheel"), Text = "Water Pump", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild("Wheel").Sound.Played:Once(function()
			Object:SetAttribute("Abysall_Completed", true)

			G.g2.Functions.RemoveESP(Object.Wheel)
			G.g2.Functions.BlacklistESP(Object.Wheel)
		end)
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "CringlePresent" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Present", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild("ToolProp").Highlight:Destroy()
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "LeverForGate" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Gate Lever", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild("Main").SoundToPlay.Played:Once(function()
			G.g2.Functions.RemoveESP(Object)
			G.g2.Functions.BlacklistESP(Object)
		end)
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "VineGuillotine" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object.Lever, Text = "Vine Lever", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		Object.Lever:WaitForChild("ActivateEventPrompt"):GetAttributeChangedSignal("Interactions"):Once(function()
			G.g2.Functions.RemoveESP(Object)
			G.g2.Functions.BlacklistESP(Object)
		end)
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "MandrakeLive" then
		if G.g2.Toggles.ObjectiveESPToggle.Value and G.g2.Options.EntityESPOptions.Value["Mandrake Hole"] then G.g2.Functions.AddESP({ Object = Object.Hole, Text = "Mandrake Hole", Color = G.g2.Options.EntityESPColor.Value }, true) end
		table.insert(G.g2.Objects.Entities, Object.Hole)
	elseif Name == "MinesGenerator" then
		task.spawn(function()
			task.wait(0.75)
			if Object.Parent then
				if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Generator", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
				Object:WaitForChild("Lever").Sound.Played:Once(function()
					G.g2.Functions.RemoveESP(Object)
					G.g2.Functions.BlacklistESP(Object)
				end)
				table.insert(G.g2.Objects.Objectives, Object)
			end
		end)
	elseif Name == "FuseObtain" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Generator Fuse", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		Object:WaitForChild("Hitbox").FuseModel:GetPropertyChangedSignal("LocalTransparencyModifier"):Once(function()
			G.g2.Functions.RemoveESP(Object)
			G.g2.Functions.BlacklistESP(Object)
		end)
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "MinesGateButton" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Gate Button", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		Object.Parent:WaitForChild("MinesGate").Main.SoundOpen.Played:Once(function()
			G.g2.Functions.RemoveESP(Object)
			G.g2.Functions.BlacklistESP(Object)
		end)
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "GardenGateButton" then
		if G.g2.Toggles.ObjectiveESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Gate Button", Color = G.g2.Options.ObjectiveESPColor.Value }, true) end
		Object.Parent:WaitForChild("GardenGate").Collision.Sound.Played:Once(function()
			G.g2.Functions.RemoveESP(Object)
			G.g2.Functions.BlacklistESP(Object)
		end)
		table.insert(G.g2.Objects.Objectives, Object)
	elseif Name == "Ladder" then
		if G.g2.Toggles.LadderESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Ladder", Color = G.g2.Options.LadderESPColor.Value }, true) end
		table.insert(G.g2.Objects.Ladders, Object)
	elseif Name == "Door" and Object.Parent and tonumber(Object.Parent.Name) then
		local DoorParts = {}
		for _, Child in Object:GetChildren() do
			if Child.Name == "Door" and Child:IsA("BasePart") then
				table.insert(DoorParts, Child)
			end
		end

		if #DoorParts == 2 then
			local HighlightModel = Instance.new("Model", Object)
			HighlightModel.Name = "HighlightModel"
			Instance.new("Humanoid", HighlightModel).Name = "HighlightHumanoid"
			HighlightModel:SetAttribute("ParentRoom", tonumber(Object.Parent.Name))

			for _, DoorPart in DoorParts do
				local HP = Instance.new("Part", HighlightModel)
				HP.Transparency = 0.999
				HP.Size = DoorPart.Size
				HP.CanCollide = false
				HP.CFrame = DoorPart.CFrame
				HP.Name = "HighlightPart"
				HP.Material = Enum.Material.Plastic
				HP:SetAttribute("ParentRoom", tonumber(Object.Parent.Name))
				local W = Instance.new("WeldConstraint", HP)
				W.Part0 = HP W.Part1 = DoorPart W.Enabled = true
			end
			table.insert(G.g2.Objects.Doors, HighlightModel)
			if G.g2.Toggles.DoorESPToggle.Value then G.g2.Functions.AddESP({ Object = HighlightModel, Text = "Door " .. G.g2.Functions.GetDoorNumber(Object), Color = G.g2.Options.DoorESPColor.Value }, true) end
		else
			local Root = Object:WaitForChild("Door", 9e9)
			local HP = Instance.new("Part", Object)
			HP.Transparency = 0.999
			HP.Size = Root.Size
			HP.CanCollide = false
			HP.CFrame = Root.CFrame
			HP.Name = "HighlightPart"
			HP.Material = Enum.Material.Plastic
			HP:SetAttribute("ParentRoom", tonumber(Object.Parent.Name))
			local W = Instance.new("WeldConstraint", HP)
			W.Part0 = HP W.Part1 = Root W.Enabled = true
			Instance.new("Humanoid", Object).Name = "HighlightHumanoid"
			table.insert(G.g2.Objects.Doors, HP)
			if G.g2.Toggles.DoorESPToggle.Value then G.g2.Functions.AddESP({ Object = HP, Text = "Door " .. G.g2.Functions.GetDoorNumber(Object), Color = G.g2.Options.DoorESPColor.Value }, true) end
		end

		local LastDoorFire = tick()
		local DoorConn = G.g2.Services.RunService.Heartbeat:Connect(function()
			if Object:FindFirstChild("Door") and Object:FindFirstChild("ClientOpen") then
				if LocalPlayer:DistanceFromCharacter(Object.Door.Position) < 75
					and tick() - LastDoorFire > 0.1
					and (G.g2.Toggles.DoorReachToggle.Value or G.g2.Functions.GetMinecart())
				then
					Object.ClientOpen:FireServer()
					LastDoorFire = tick()
				end
			end
		end)
		Object.Destroying:Once(function()
			DoorConn:Disconnect()
		end)
		Object:WaitForChild("Door"):WaitForChild("Open").Played:Once(function()
			DoorConn:Disconnect()
		end)
		table.insert(G.g2.Connections_2, DoorConn)

	elseif Name == "PathLights" then
		local ObjectsToHighlight = {}
		local PLConn = Object.ChildAdded:Connect(function(Child)
			table.insert(ObjectsToHighlight, Child)
		end)
		for _, Child in Object:GetChildren() do
			table.insert(ObjectsToHighlight, Child)
		end

		local function CreateSeekNode(Light)
			if Light.Name ~= "SeekGuidingLight" or Light:GetAttribute("Highlighted") then return end
			Light:SetAttribute("Highlighted", true)

			local NewNode = Instance.new("Part")
			NewNode.Size = Vector3.one
			NewNode.Transparency = 1
			NewNode.Parent = G.g2.Globals.SeekNodesFolder
			NewNode.Anchored = true
			NewNode.CFrame = Light.CFrame
			NewNode.CanCollide = false
			NewNode.Name = "SeekLightNode"

			local PrevNode2 = PreviousNode or NewNode
			PreviousNode = NewNode

			local Beam = Instance.new("Beam")
			Beam.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, G.g2.Options.ShowSeekPathColor.Value), ColorSequenceKeypoint.new(1, G.g2.Options.ShowSeekPathColor.Value) })
			Beam.FaceCamera = true
			Beam.Width0 = 0.2
			Beam.Width1 = 0.2
			Beam.Brightness = 10
			Beam.LightInfluence = 0
			Beam.LightEmission = 0
			Beam.Enabled = true
			local Vis = G.g2.Toggles.ShowSeekPathToggle.Value and 0 or 1
			Beam.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, Vis), NumberSequenceKeypoint.new(1, Vis) })
			Beam.Parent = G.g2.Globals.SeekNodesFolder
			local A0 = Instance.new("Attachment", NewNode)
			local A1 = Instance.new("Attachment", PrevNode2)
			Beam.Attachment0 = A0
			Beam.Attachment1 = A1
			table.insert(G.g2.Objects.SeekHighlights, Beam)
			Light:Destroy()
		end

		task.spawn(function()
			while task.wait() do
				local Light = table.remove(ObjectsToHighlight, 1)
				if Light then CreateSeekNode(Light) end
			end
		end)

		table.insert(G.g2.Connections_2, PLConn)
		table.insert(G.g2.Objects.PathLights, Object)
		Object.Destroying:Once(function() PLConn:Disconnect() end)
	elseif Name == "SeekMovingNewClone" then
		local Connection = Object.Destroying:Connect(function()
			for _, Folder in pairs(G.g2.Objects.PathLights) do
				Folder:ClearAllChildren()
			end
			G.g2.Globals.SeekNodesFolder:ClearAllChildren()
		end)
		table.insert(G.g2.Connections_2, Connection)
	elseif Name == "Bridge" then
		for _, Child in Object:GetChildren() do
			if Child.Name == "PlayerBarrier" and Child.Size.Y == 2.75 and (Child.Rotation.X == 0 or Child.Rotation.X == 180) then
				local NewBridge = Child:Clone()
				NewBridge.CFrame = NewBridge.CFrame * CFrame.new(0, 0, -5)
				NewBridge.Name = G.g1.Abysall.ESPLibrary:GenerateRandomString()
				NewBridge.Size = Vector3.new(NewBridge.Size.X, NewBridge.Size.Y, 11)
				NewBridge.Parent = Object
				NewBridge.CanCollide = G.g2.Toggles.BypassSeekObstructions.Value
				NewBridge.Color = Color3.fromRGB(0, 255, 255)
				NewBridge.Transparency = G.g2.Toggles.BypassSeekObstructions.Value and 0 or 1
				NewBridge.Material = Enum.Material.ForceField
				table.insert(G.g2.Objects.SeekBridges, NewBridge)
			end
			task.wait()
		end
    elseif Name == "MinecartRig" then
        G.g2.Globals.Minecart = Object
	elseif Name == "RunnerNodes" then
		local function IsBehind(Part1, Part2)
			local P1 = (Part1.CFrame + Part1.CFrame.LookVector).Position
			local P2 = (Part1.CFrame + Part1.CFrame.LookVector * -1).Position
			return (P1 - Part2.Position).Magnitude > (P2 - Part2.Position).Magnitude
		end
		local function GetDirection(Part1, Part2)
			local RightDist = Part1.CFrame.RightVector:Dot(Part1.Position - Part2.Position)
			if RightDist > 0.5    then return IsBehind(Part1, Part2) and "Right" or "Left" end
			if RightDist < -0.5   then return IsBehind(Part1, Part2) and "Left" or "Right" end
			return "Straight"
		end
		local function GetClosestNode(Node)
			local Best, BestDist = nil, math.huge
			local NodeID2 = tonumber(Node.Name:split("MinecartNode")[2])
			for _, OtherNode in Object:GetChildren() do
				local OtherID = tonumber(OtherNode.Name:split("MinecartNode")[2])
				if OtherNode ~= Node and OtherID and NodeID2 and OtherID > NodeID2 then
					local D = (Node.Position - OtherNode.Position).Magnitude
					if D < BestDist and OtherNode:GetAttribute("DistanceBlacklist") ~= true then
						BestDist = D Best = OtherNode
					end
				end
			end
			return Best
		end

		for _, Node in Object:GetChildren() do
			local NodeID = tonumber(Node.Name:split("MinecartNode")[2])
			if Node:GetAttribute("DeathType") then Node:SetAttribute("DistanceBlacklist", true) end
			for I = 1, 20 do
				local NextNode = NodeID and Object:FindFirstChild("MinecartNode" .. NodeID + I)
				if NextNode and NextNode:GetAttribute("DeathType") ~= nil then
					Node:SetAttribute("DistanceBlacklist", true)
				end
			end
			local PrevNode3 = NodeID and Object:FindFirstChild("MinecartNode" .. NodeID - 1)
			if PrevNode3 and PrevNode3:GetAttribute("ForceConnect") then
				Node:SetAttribute("DistanceBlacklist", nil)
			end
			task.wait()
		end

		for _, Node in Object:GetChildren() do
			if Node:GetAttribute("ForceConnect") then
				local NextNode = GetClosestNode(Node)
				if NextNode then
					Node:SetAttribute("Turn", GetDirection(Node, NextNode))
					table.insert(G.g2.Objects.SeekNodes, Node)
				end
			end
			task.wait()
		end

	elseif Name == "EyestalkEndCutscene" then
		Object.Name = "_EyestalkEndCutscene"
	elseif Name == "DuckBoard" then
		table.insert(G.g2.Objects.SeekDuckBoards, Object)
	elseif G.g12.HidingSpotLabels[Name] or string.find(string.lower(Name), "hidingspot") then
		local Label = G.g12.HidingSpotLabels[Name] or (string.find(string.lower(Name), "hidingspot") and "Hiding Spot" or nil)
		if Label and G.g2.Toggles.HidingSpotESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = Label, Color = G.g2.Options.HidingSpotESPColor.Value }, true) end
		G.g2.Functions.HandleHidingTransparency(Object)
		table.insert(G.g2.Objects.HidingSpots, Object)
	elseif Object:FindFirstChild("HidingPrompt") or Object:FindFirstChild("HidePrompt") then
		G.g2.Functions.HandleHidingTransparency(Object)
		table.insert(G.g2.Objects.HidingSpots, Object)
	elseif Name == "Lava" then
		if G.g2.Toggles.BypassKillbricks.Value then Object.CanTouch = false end
		table.insert(G.g2.Objects.Obstructions, Object)
	elseif Name == "ScaryWall" then
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then
				Part.CanTouch = not G.g2.Toggles.BypassSeekingWall.Value
				Part.CanCollide = not G.g2.Toggles.BypassSeekingWall.Value

                local Connection1 = Part:GetPropertyChangedSignal("CanTouch"):Connect(function()
                    if Part.CanTouch == G.g2.Toggles.BypassSeekingWall.Value then
                        Part.CanTouch = not G.g2.Toggles.BypassSeekingWall.Value
                    end
                end)
                local Connection2 = Part:GetPropertyChangedSignal("CanCollide"):Connect(function()
                    if Part.CanCollide == G.g2.Toggles.BypassSeekingWall.Value then
                        Part.CanCollide = not G.g2.Toggles.BypassSeekingWall.Value
                    end
                end)

                table.insert(G.g2.Connections_2, Connection1)
                table.insert(G.g2.Connections_2, Connection2)
            end
		end
		table.insert(G.g2.Objects.Obstructions, Object)
	elseif Name == "ChestBox" or Name == "ChestBoxLocked" then
		if G.g2.Toggles.ChestESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = Object:GetAttribute("Locked") and "Locked Chest" or "Chest", Color = G.g2.Options.ChestESPColor.Value }, true) end
		table.insert(G.g2.Objects.Chests, Object)
	elseif Name == "Toolbox" or Name == "Toolbox_Locked" then
		if G.g2.Toggles.ChestESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = Object:GetAttribute("Locked") and "Locked Toolbox" or "Toolbox", Color = G.g2.Options.ChestESPColor.Value }, true) end
		table.insert(G.g2.Objects.Chests, Object)
	elseif Name == "Chest_Vine" then
		if G.g2.Toggles.ChestESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Vine Chest", Color = G.g2.Options.ChestESPColor.Value }, true) end
		table.insert(G.g2.Objects.Chests, Object)
	elseif Name == "Toolshed_Small" then
		if G.g2.Toggles.ChestESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Toolshed", Color = G.g2.Options.ChestESPColor.Value }, true) end
		table.insert(G.g2.Objects.Chests, Object)
	elseif Name == "Locker_Small_Locked" then
		if G.g2.Toggles.ChestESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Locked Item Locker", Color = G.g2.Options.ChestESPColor.Value }, true) end
		table.insert(G.g2.Objects.Chests, Object)
	elseif Name == "MouseHole" then
		if G.g2.Toggles.ChestESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Mouse", Color = G.g2.Options.ChestESPColor.Value }, true) end
		table.insert(G.g2.Objects.Chests, Object)
	elseif G.g3.ItemNames[Name] and Object:FindFirstChild("ModulePrompt") then
		if G.g2.Toggles.ItemESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = G.g3.ItemNames[Name], Color = G.g2.Options.ItemESPColor.Value }, Object:GetAttribute("ParentRoom") ~= nil) end
		if Name == "LotusHolder" or Name == "LotusPetalPickup" then
			Object.Handle:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function()
				G.g1.Abysall.ESPLibrary:RemoveESP(Object)
				G.g2.Functions.BlacklistESP(Object)
			end)
		end

		if G.g2.Toggles.NotifyItemsToggle.Value and G.g2.Options.NotifyItemList.Value[G.g3.ItemNames[Name]] and Object.Parent.Name ~= "Drops" then
			if G.g2.Toggles.NotifyItemsShowDistance.Value then
				G.g2.Functions.Notify({ Title = "Item '" .. G.g3.ItemNames[Name] .. "' has spawned.", Body = "It is '" .. math.round(LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)) .. "' studs away from you." })
			else
				G.g2.Functions.Notify({ Title = "Item '" .. G.g3.ItemNames[Name] .. "' has spawned."})
			end
		end

		table.insert(G.g2.Objects.Items, Object)
	elseif Name == "Green_Herb" then
		if G.g2.Toggles.ItemESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Green Herb", Color = G.g2.Options.ItemESPColor.Value }, true) end
		table.insert(G.g2.Objects.Items, Object)
	elseif Name == "GoldPile" and Object:GetAttribute("GoldValue") then
		if G.g2.Toggles.CurrencyESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Gold Pile [" .. Object:GetAttribute("GoldValue") .. "]", Color = G.g2.Options.CurrencyESPColor.Value }, true) end
		table.insert(G.g2.Objects.Currency, Object)
	elseif Name == "StardustPickup" then
		if G.g2.Toggles.CurrencyESPToggle.Value then G.g2.Functions.AddESP({ Object = Object, Text = "Stardust Pile", Color = G.g2.Options.CurrencyESPColor.Value }, true) end
		table.insert(G.g2.Objects.Currency, Object)
	elseif Name == "GiggleCeiling" then
		if G.g2.Toggles.EntityESPToggle.Value and G.g2.Options.EntityESPOptions.Value["Giggle"] then G.g2.Functions.AddESP({ Object = Object, Text = "Giggle", Color = G.g2.Options.EntityESPColor.Value }, true) end
		if G.g2.Toggles.BypassGiggle.Value then Object:WaitForChild("Hitbox").CanTouch = false end
		table.insert(G.g2.Objects.Entities, Object)
	elseif Name == "GloomPile" then
		if G.g2.Toggles.BypassGloombatEggs.Value then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then Part.CanTouch = false
				end
			end
		end
		local Connection = Object.DescendantAdded:Connect(function(Part)
			if Part:IsA("BasePart") then Part.CanTouch = false end
		end)

		if G.g2.Toggles.EntityESPToggle.Value and G.g2.Options.EntityESPOptions.Value["Gloombat Eggs"] then
			G.g2.Functions.AddESP({ Object = Object, Text = "Gloombat Eggs", Color = G.g2.Options.EntityESPColor.Value })
		end

		table.insert(G.g2.Connections_2, Connection)
		table.insert(G.g2.Objects.Entities, Object)
	elseif Name == "TriggerEventCollision" and G.g2.Functions.CheckCompatability({"firetouchinterest"}) then
		if (G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel") and G.g2.Toggles.RemoveSeekTrigger.Value then
			task.spawn(function()
				while Object:IsDescendantOf(game) do
					for _, Part in Object:GetChildren() do
						if Part:IsA("BasePart") then
							G.g1.Abysall.Environment.firetouchinterest(G.g3.RootPart, Part, 0)
							task.wait()
							G.g1.Abysall.Environment.firetouchinterest(G.g3.RootPart, Part, 1)
						end
					end
					task.wait()
				end
			end)
		end
		table.insert(G.g2.Objects.EventTriggers, Object)
	elseif Name == "DoorFake" or Name == "FakeDoor" then
		if Object.Parent and Object:FindFirstChild("Hidden") then
			if G.g2.Toggles.BypassDupe.Value then
				Object:WaitForChild("Hidden").CanTouch = false
				local Lock = Object:FindFirstChild("Lock")
				if Lock and Lock:FindFirstChild("UnlockPrompt") then Lock.UnlockPrompt.Enabled = false end
			end
			if G.g2.Toggles.EntityESPToggle.Value and G.g2.Options.EntityESPOptions.Value["Dupe"] then
				G.g2.Functions.AddESP({ Object = Object, Text = "Dupe", Color = G.g2.Options.EntityESPColor.Value }, true)
			end
			table.insert(G.g2.Objects.Entities, Object)
		end
	elseif Name == "SideroomSpace" then
		if G.g2.Toggles.BypassVacuum.Value then
			Object:WaitForChild("Collision").CanCollide = true
			Object:WaitForChild("Collision").CanTouch = false
		end
		table.insert(G.g2.Objects.Entities, Object)
	elseif Name == "Snare" then
		if G.g2.Toggles.EntityESPToggle.Value and G.g2.Options.EntityESPOptions.Value["Snare"] then G.g2.Functions.AddESP({ Object = Object, Text = "Snare", Color = G.g2.Options.EntityESPColor.Value }, true) end
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then Part.CanTouch = not G.g2.Toggles.BypassSnare.Value end
		end
		local Connection = Object.DescendantAdded:Connect(function(Part)
			if Part:IsA("BasePart") then Part.CanTouch = not G.g2.Toggles.BypassSnare.Value end
		end)
		table.insert(G.g2.Connections_2, Connection)
		table.insert(G.g2.Objects.Entities, Object)

		if Object:FindFirstChild("Snare") then
			Object:WaitForChild("Snare"):WaitForChild("Roots").Transparency = 1
			Object:WaitForChild("Snare"):WaitForChild("SnareBase").Transparency = 1
		end
		if Object:FindFirstChild("Void") then
			Object.Void.Transparency = 0
			Object.Void.Color = Color3.fromRGB(76, 67, 55)
		end
	elseif Name == "Seek_Arm" or Name == "ChandelierObstruction" then
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then
				Part.CanTouch = not G.g2.Toggles.BypassSeekObstructions.Value
				table.insert(G.g2.Objects.SeekObstructions, Part)
			end
		end
	elseif Name == "SeekFloodline" then
		Object.CanCollide = G.g2.Toggles.BypassSeekObstructions.Value
		local FloodConn = Object:GetPropertyChangedSignal("CanCollide"):Connect(function()
			if Object.CanCollide ~= G.g2.Toggles.BypassSeekObstructions.Value then
				Object.CanCollide = G.g2.Toggles.BypassSeekObstructions.Value
			end
		end)
		Object.Destroying:Once(function() FloodConn:Disconnect() end)
		table.insert(G.g2.Objects.SeekObstructions, Object)
	elseif Object:GetAttribute("RawName") and Object:GetAttribute("RawName"):find("Halt") or Object:GetAttribute("Shade") == true then
		if G.g2.Toggles.NotifyEntities.Value and G.g2.Options.EntityList.Value["Halt"] then
			G.g2.Functions.Notify({ Title = "Entity 'Halt' will spawn in the next room.", Image = G.g3.EntityIcons["Halt"] })
			if G.g2.Toggles.EntityChatToggle.Value then G.g2.Functions.SendChat("Halt next room!") end
		end
		local HaltLogConn
		HaltLogConn = G.g2.Services.LogService.MessageOut:Connect(function(Message)
			if Message == "client teleporting" then
				if G.g2.Globals.AnticheatDisabled then
					G.g2.Globals.AnticheatDisabled = false
					G.g2.Functions.Notify({ Title = "The anticheat has been re-enabled.", Body = "Interact with a ladder to disable it again." })
				end
				HaltLogConn:Disconnect()
			end
		end)
	elseif Name == "BananaPeel" then
		if G.g2.Toggles.BypassBanana.Value then Object.CanTouch = false end
		table.insert(G.g2.Objects.Entities, Object)
	elseif Name == "JeffTheKiller" then
		if G.g2.Toggles.BypassJeff.Value then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then Part.CanCollide = false Part.CanTouch = false end
			end
			Object:WaitForChild("Humanoid").Health = 0
		end
	elseif Name == "GrumbleRig" then
		if G.g2.Toggles.EntityESPToggle.Value and G.g2.Options.EntityESPOptions.Value["Grumble"] then G.g2.Functions.AddESP({ Object = Object, Text = "Grumble", Color = G.g2.Options.EntityESPColor.Value }, true) end
		table.insert(G.g2.Objects.Entities, Object)
	elseif Name == "LiveEntityBramble" then
		if G.g2.Toggles.EntityESPToggle.Value and G.g2.Options.EntityESPOptions.Value["Bramble"] then G.g2.Functions.AddESP({ Object = Object, Text = "Bramble", Color = G.g2.Options.EntityESPColor.Value }, true) end
		table.insert(G.g2.Objects.Entities, Object)
	elseif Name == "Groundskeeper" then
		if G.g2.Toggles.EntityESPToggle.Value and G.g2.Options.EntityESPOptions.Value["Groundskeeper"] then G.g2.Functions.AddESP({ Object = Object, Text = "Groundskeeper", Color = G.g2.Options.EntityESPColor.Value }, true) end
		if G.g2.Toggles.NotifyEntities.Value and G.g2.Options.EntityList.Value["Groundskeeper"] then
			local ED = G.g3.Entities["Groundskeeper"]
			G.g2.Functions.Notify({ Title = ED.NotifyMessage.Title, Body = ED.NotifyMessage.Body, Image = G.g3.EntityIcons["Groundskeeper"] })
		end
		table.insert(G.g2.Objects.Entities, Object)
	elseif Name == "Figure" or Name == "FigureRig" or Name == "FigureRagdoll" then
		for _, Part in Object:GetDescendants() do
			if Part:IsA("BasePart") then
				Part.CanTouch = false
			end
		end
		if G.g2.Toggles.EntityESPToggle.Value and G.g2.Options.EntityESPOptions.Value["Figure"] then G.g2.Functions.AddESP({ Object = Object, Text = "Figure", Color = G.g2.Options.EntityESPColor.Value }, true) end
		table.insert(G.g2.Objects.Entities, Object)
		if G.g2.Toggles.RemoveFigure.Value and G.g2.Functions.CheckCompatability({"isnetworkowner"}) then
			if G.g3.Floor == "Mines" then
				for _, Part in Object:GetDescendants() do
					if Part:IsA("BasePart") then
						task.spawn(function()
							if G.g1.Abysall.Environment.isnetworkowner(Part) then
								Part.Position = Vector3.new(-49999, -49999, -49999)
							end
						end)
					end
				end
			elseif G.g3.Floor == "OldHotel" or G.g3.Floor == "Fools" then
				G.g3.CurrentRooms.ChildAdded:Wait()
				for _, Part in Object:GetDescendants() do
					if Part:IsA("BasePart") then
						Part.CanCollide = false
						task.spawn(function()
							while G.g1.Abysall.Environment.isnetworkowner(Part) do
								Part.Position = Vector3.new(math.random(-29999,29999), math.random(-29999,29999), math.random(-29999,29999))
								task.wait()
							end
						end)
					end
				end
			end
		end
	elseif (Name == "ThingToOpen" or Name == "MovingDoor") and (G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel")
		or Name == "Wax_Door" and G.g3.Floor == "Fools"
	then
		Object:SetAttribute("OriginalPosition", Object:GetPivot())
		local ToggleMap = { ThingToOpen = "RemoveBasementGate", MovingDoor = "RemovePaintingsDoor", Wax_Door = "RemoveSkeletonDoor" }
		if ToggleMap[Name] and G.g2.Toggles[ToggleMap[Name]].Value then
			Object:PivotTo(CFrame.new(-10000, -10000, -10000))
		end
		table.insert(G.g2.Objects.Obstructions, Object)
	elseif Name == "ElevatorBreaker" then
		if G.g2.Toggles.AutoBreakerBox.Value and not G.g2.Globals.BreakerBoxNotified then
			G.g2.Functions.Notify({ Title = "Interact with the breaker box.", Body = "It will be automatically solved." })
			G.g2.Globals.BreakerBoxNotified = true
		end
		G.g2.Connections_2.BreakerConnection = Object:WaitForChild("SurfaceGui").Frame.Code:GetPropertyChangedSignal("Text"):Connect(function()
			if G.g2.Toggles.AutoBreakerBox.Value then
				if not G.g2.Globals.BreakerBoxStartNotified and (G.g3.Floor == "Fools" or G.g3.Floor == "OldHotel") then
					G.g2.Functions.Notify({ Title = "Attempting to solve the breaker box.", Body = "Please wait." })
					G.g2.Globals.BreakerBoxStartNotified = true
				end
				G.g3.RemotesFolder.EBF:FireServer()
			end
			G.g2.Globals.BreakerBoxInteracted = true
		end)
	elseif Name == "ElevatorCar" then
		local ElevConn = Object.DescendantAdded:Connect(function(Desc)
			if G.g2.Toggles.AutoBreakerBox.Value and Desc.Name == "TouchInterest" and not G.g2.Globals.BreakerBoxFinishedNotified then
				G.g2.Functions.Notify({ Title = "Successfully solved the breaker box.", Body = "Try going to the elevator!" })
				G.g2.Globals.BreakerBoxFinishedNotified = true
			end
		end)
		Object.Destroying:Once(function() ElevConn:Disconnect() end)
	elseif Object.ClassName == "ProximityPrompt" and not Object:GetAttribute("FakePrompt") then
		if Object:HasTag("DisableWhenEnabledOnClient") then Object:RemoveTag("DisableWhenEnabledOnClient") end

		Object:SetAttribute("HoldDuration_Old", Object.HoldDuration)
		Object:SetAttribute("RequiresLineOfSight_Old", Object.RequiresLineOfSight)
		Object:SetAttribute("MaxActivationDistance_Old", Object.MaxActivationDistance)

		if G.g2.Toggles.InstantPrompts.Value    then Object.HoldDuration = 0 end
		if G.g2.Toggles.PromptClip.Value        then Object.RequiresLineOfSight = false end
		Object.MaxActivationDistance = Object:GetAttribute("MaxActivationDistance_Old") * G.g2.Options.PromptReachSlider.Value

		local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }

		if G.g2.Functions.CheckCompatability({"fireproximityprompt"}) and G.g3.Floor ~= "OldHotel" and G.g3.Floor ~= "Fools" then
			local IsLockPrompt = LockPromptNames[Object.Name] and Object.Parent.Name ~= "Handle" and Object.Parent.Name ~= "LockHolder"
				or (Object.Parent and Object.Parent:GetAttribute("Locked") == true)
				or (Object.Parent and Object.Parent.Parent and Object.Parent.Parent.Name == "Locker_Small_Locked" and Object.Name == "ActivateEventPrompt")

			if IsLockPrompt then
				local FakePrompt = Object:Clone()
				FakePrompt:SetAttribute("FakePrompt", true)
				task.wait()
				FakePrompt.Parent = Object.Parent

				FakePrompt:SetAttribute("HoldDuration_Old", Object:GetAttribute("HoldDuration_Old"))
				FakePrompt:SetAttribute("RequiresLineOfSight_Old", Object:GetAttribute("RequiresLineOfSight_Old"))
				FakePrompt:SetAttribute("MaxActivationDistance_Old", Object:GetAttribute("MaxActivationDistance_Old"))

				FakePrompt.HoldDuration = Object.HoldDuration
				FakePrompt.RequiresLineOfSight = Object.RequiresLineOfSight
				FakePrompt.MaxActivationDistance = Object.MaxActivationDistance

				if G.g2.Toggles.InstantPrompts.Value    then FakePrompt.HoldDuration = 0 end
				if G.g2.Toggles.PromptClip.Value        then FakePrompt.RequiresLineOfSight = false end
				FakePrompt.MaxActivationDistance = FakePrompt:GetAttribute("MaxActivationDistance_Old") * G.g2.Options.PromptReachSlider.Value

				G.g2.FakePrompts[FakePrompt] = Object
				pcall(function() Object.Parent = G.g2.Globals.PromptContainer end)

				local FPEnabledConn = Object:GetPropertyChangedSignal("Enabled"):Connect(function()
					FakePrompt.Enabled = Object.Enabled
				end)
				Object:GetPropertyChangedSignal("ActionText"):Once(function()
					Object.Parent = FakePrompt.Parent
					FakePrompt:Destroy()
					FPEnabledConn:Disconnect()
				end)
				Object.Destroying:Once(function()
					FakePrompt:Destroy()
					FPEnabledConn:Disconnect()
				end)
				table.insert(G.g2.Connections_2, FPEnabledConn)
				table.insert(G.g2.Objects.Prompts, FakePrompt)

				FakePrompt.Enabled = false
				task.wait()
				FakePrompt.Enabled = Object.Enabled
			end
		end
		table.insert(G.g2.Objects.Prompts, Object)
	elseif Name == "Padlock" then
		local PadlockConn = G.g2.Services.RunService.Heartbeat:Connect(function()
			if Object.PrimaryPart then
				local Distance = LocalPlayer:DistanceFromCharacter(Object.PrimaryPart.Position)
				if G.g2.Toggles.AutoUnlockPadlockToggle.Value then
					local Code = G.g2.Functions.GetLibraryCode()
					if Code and tonumber(Code) and Distance < G.g2.Options.AutoUnlockPadlockSlider.Value then
						G.g3.RemotesFolder.PL:FireServer(Code)
					end
				end
				if G.g2.Toggles.AutoLibraryGuessCode.Value and G.g3.LatestRoom.Value == 50 then
					local Code = G.g2.Functions.GetRandomCode()
					if Code then G.g3.RemotesFolder.PL:FireServer(Code) end
				end
			end
		end)
		Object.Destroying:Once(function()
			PadlockConn:Disconnect()
		end)
	end
end

G.g2.Connections_2.PromptAnimationFixer1 = G.g2.Services.ProximityPromptService.PromptButtonHoldBegan:Connect(function(Object)
	if not Object:GetAttribute("FakePrompt") then return end
	local ToolNames = { "Lockpick","Shears","SkeletonKey","Key","GeneratorFuse","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
	local AnimateToolNames = { "Lockpick","Shears","SkeletonKey","Key","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
	local Tool
	for _, N in ToolNames do Tool = G.g3.Character:FindFirstChild(N) if Tool then break end end

	local Prompt = Object
	local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }
	local IsLockPrompt = LockPromptNames[Object.Name]
		or (Object.Parent and Object.Parent:GetAttribute("Locked") == true)
		or (Object.Parent and Object.Parent.Parent and Object.Parent.Parent.Name == "Locker_Small_Locked" and Object.Name == "ActivateEventPrompt")
	if IsLockPrompt then
		if G.g2.Options.AutoInteractIgnoreList.Value["Locks"] then return end
		local KeyItems = { "Key","GeneratorFuse","KeyBackdoor","KeyElectrical","KeyIron","Lockpick","SkeletonKey","Shears","Multitool" }
		local OffhandKeyItems = { "Key","GeneratorFuse","KeyElectrical","KeyIron" }
		local HasKey = false
		for _, K in KeyItems do if G.g2.Functions.HasItem(K, true) then HasKey = true break end end
		for _, K in OffhandKeyItems do if G.g2.Functions.HasItem(K) then HasKey = true break end end
		if not HasKey then return end
	end

	if Prompt.Parent.Name == "CuttableVines" and not G.g2.Functions.HasItem("Shears", true) and not G.g2.Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Chest_Vine" and not G.g2.Functions.HasItem("Shears", true) and not G.g2.Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Cellar" and not G.g2.Functions.HasItem("Shears", true) and not G.g2.Functions.HasItem("Multitool", true) then return end
	if Prompt.Parent.Name == "SkullLock" and not G.g2.Functions.HasItem("SkeletonKey", true) then return end
	if Prompt.Parent.Name == "Lock1" and not G.g2.Functions.HasItem("Lockpick", true) and not G.g2.Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Lock2" and not G.g2.Functions.HasItem("Lockpick", true) and not G.g2.Functions.HasItem("Multitool", true) then return end
	if G.g2.Functions.HasItem("Shears", true) and IsLockPrompt and Prompt.Parent.Name ~= "CuttableVines" and Prompt.Parent.Name ~= "Chest_Vine" and Prompt.Parent.Name ~= "Cellar" then return end
	
	if Tool and table.find(AnimateToolNames, Tool.Name) and G.g2.Globals.UseAnimation then
		G.g2.Globals.UseAnimationBreak:Stop()
		G.g2.Globals.UseAnimation:Stop()
		G.g2.Globals.UseAnimation:Play()
		if Tool.Name == "Shears" then Tool:WaitForChild("Handle"):WaitForChild("sound_prompt"):Play() end
	end
end)

G.g2.Globals.ObjectQueue = {}
local AllowedInstances = {
	Lava=true, GoldPile=true, KeyObtain=true, Drakobloxxer=true, FuseObtain=true,
	MinesGenerator=true, JeffTheKiller=true, Snare=true, FakeDoor=true, DoorFake=true, SideroomSpace=true,
	ChestBox=true, ChestBoxLocked=true, Chest_Vine=true, Locker_Small_Locked=true, Toolbox=true,
	Toolbox_Locked=true, Wardrobe=true, ["Wardrobe-FOOLS26"]=true, Toolshed=true, Toolshed_Small=true,
	Bed=true, MinesAnchor=true, Double_Bed=true, RetroWardrobe=true, Backdoor_Wardrobe=true,
	Rooms_Locker=true, Rooms_Locker_Fridge=true, Locker_Large=true, FigureRig=true, FigureRagdoll=true,
	TimerLever=true, Lever=true, Seek_Arm=true, ChandelierObstruction=true, ScaryWall=true, Ladder=true,
	CircularVent=true, Dumpster=true, SquareGrate=true, TriggerEventCollision=true, GrumbleRig=true,
	GiggleCeiling=true, MinesGateButton=true, ElectricalKeyObtain=true, LibraryHintPaper=true,
	WaterPump=true, CringlePresent=true, Wheel=true, PickupItem=true, LiveHintBook=true,
	LiveBreakerPolePickup=true, LeverForGate=true, GloomPile=true, SeekFloodline=true, Door=true,
	Green_Herb=true, Bridge=true, MouseHole=true, BananaPeel=true, NannerPeel=true, PowerupPad=true,
	IndustrialGate=true, CollisionFloor=true, ElevatorCar=true, Wax_Door=true, ThingToOpen=true,
	MovingDoor=true, StardustPickup=true, Hole=true, Groundskeeper=true, MandrakeLive=true,
	GardenGateButton=true, LotusPetalPickup=true, VineGuillotine=true, LiveEntityBramble=true, ArchivesFihTank=true,
	RiftSpawn=true, ElevatorBreaker=true, RunnerNodes=true, PathLights=true, DuckBoard=true,
	Padlock=true, EyestalkEndCutscene=true, MinecartRig=true, SeekMovingNewClone=true, Cellar=true, ArchivesPackageDeposit=true, StairwellScrapper=true,
	StairwellFireAlarm=true, ShoppingCart=true, Mirror=true, StairwellLockpickDoor=true, DepotHalloween=true
}

G.g2.Functions.QueueObject = function(Object)
	if TimeShowerClone and Object:IsDescendantOf(TimeShowerClone) then
		return
	end
	local IsHidingSpot = typeof(Object.Name) == "string" and string.find(string.lower(Object.Name), "hidingspot")
	if not AllowedInstances[Object.Name] and not IsHidingSpot and Object.ClassName ~= "ProximityPrompt" and Object.Parent ~= G.g3.CurrentRooms and not G.g3.ItemNames[Object.Name] then
		return
	end
	table.insert(G.g2.Globals.ObjectQueue, Object)
end

G.g2.Globals.QueueDone = true
G.g2.Connections_2.QueueConnection = G.g2.Services.RunService.RenderStepped:Connect(function()
	local Object = table.remove(G.g2.Globals.ObjectQueue, 1)
	if Object then
		G.g2.Functions.HandleObject(Object)
	end
end)

for _, Object in G.g2.Services.Workspace:GetDescendants() do
	task.spawn(function() G.g2.Functions.QueueObject(Object) end)
end

G.g2.Connections_2.InstanceHandler = G.g2.Services.Workspace.DescendantAdded:Connect(function(Object)
	G.g2.Functions.QueueObject(Object)
end)

for _, Player in G.g2.Services.Players:GetPlayers() do
	if Player ~= LocalPlayer then
		if Player.Character and G.g2.Toggles.PlayerESPToggle.Value then
			G.g2.Functions.AddESP({ Object = Player.Character, Text = Player.Name, Color = G.g2.Options.PlayerESPColor.Value })
		end
		local CharConn = Player.CharacterAdded:Connect(function(NewCharacter)
			if G.g2.Toggles.PlayerESPToggle.Value then
				G.g2.Functions.AddESP({ Object = NewCharacter, Text = Player.Name, Color = G.g2.Options.PlayerESPColor.Value })
			end
		end)
		local DeadConn = Player:GetAttributeChangedSignal("Alive"):Connect(function()
			if Player:GetAttribute("Alive") ~= true and Player.Character then
				G.g2.Functions.RemoveESP(Player.Character)
			end
		end)
		table.insert(G.g2.Connections_2, CharConn)
		table.insert(G.g2.Connections_2, DeadConn)
		Player.Destroying:Once(function()
			CharConn:Disconnect()
			DeadConn:Disconnect()
		end)
	end
end

G.g2.Connections_2.PlayerHandler = G.g2.Services.Players.PlayerAdded:Connect(function(Player)
	if Player == LocalPlayer then return end
	if Player.Character and G.g2.Toggles.PlayerESPToggle.Value then
		G.g2.Functions.AddESP({ Object = Player.Character, Text = Player.Name, Color = G.g2.Options.PlayerESPColor.Value })
	end
	local CharConn = Player.CharacterAdded:Connect(function(NewCharacter)
		if G.g2.Toggles.PlayerESPToggle.Value then
			G.g2.Functions.AddESP({ Object = NewCharacter, Text = Player.Name, Color = G.g2.Options.PlayerESPColor.Value })
		end
	end)
	local DeadConn = Player:GetAttributeChangedSignal("Alive"):Connect(function()
		if Player:GetAttribute("Alive") ~= true and Player.Character then
			G.g2.Functions.RemoveESP(Player.Character)
		end
	end)
	table.insert(G.g2.Connections_2, CharConn)
	table.insert(G.g2.Connections_2, DeadConn)
	Player.Destroying:Once(function()
		CharConn:Disconnect()
		DeadConn:Disconnect()
	end)
end)

G.g15.PromptsToFire = {}
G.g15.PromptCooldown = {}

G.g2.Functions.FirePrompt      = G.g1.Abysall.Environment.fireproximityprompt
G.g2.Functions.ForceFirePrompt = G.g1.Abysall.Environment.fireproximityprompt

if not G.g2.Functions.FirePrompt then
	G.g2.Functions.FirePrompt = function(Prompt)
		if not Prompt:IsA("ProximityPrompt") or G.g15.PromptCooldown[Prompt] or table.find(G.g15.PromptsToFire, Prompt) or not G.g3.Camera then return end
		table.insert(G.g15.PromptsToFire, Prompt)
	end
	G.g2.Functions.ForceFirePrompt = G.g2.Functions.FirePrompt

	task.spawn(function()
		while task.wait() do
			local Prompt = table.remove(G.g15.PromptsToFire, 1)
			if not Prompt then continue end
			G.g15.PromptCooldown[Prompt] = true

			local OldDist   = Prompt.MaxActivationDistance
			local OldEnable = Prompt.Enabled
			local OldParent = Prompt.Parent
			local OldHold   = Prompt.HoldDuration
			local OldLOS    = Prompt.RequiresLineOfSight

			Prompt.MaxActivationDistance = 99999
			Prompt.Enabled = true
			Prompt.HoldDuration = 0
			Prompt.RequiresLineOfSight = false

			local TempPart = Instance.new("Part")
			TempPart.Parent = G.g2.Services.Workspace
			TempPart.CanCollide = false TempPart.CanQuery = false TempPart.CanTouch = false
			TempPart.Anchored = true TempPart.Transparency = 1
			TempPart.Size = Vector3.new(0.001, 0.001, 0.001)
			TempPart.Position = G.g3.Camera.CFrame:ToWorldSpace(CFrame.new(0, 0, -0.1)).Position

			if not Prompt or not OldParent then
				TempPart:Destroy()
				G.g15.PromptCooldown[Prompt] = nil
				continue
			end

			pcall(function() Prompt.Parent = TempPart end)

			local Shown, Fired = false, false

			local ShownConn = G.g2.Services.ProximityPromptService.PromptShown:Connect(function(P)
				if P == Prompt then Shown = true end
			end)
			local FiredConn = Prompt.Triggered:Connect(function() Fired = true end)

			local T1 = 0
			while not Shown and T1 < 5 do T1 += 1 task.wait() end

			local T2 = 0
			while not Fired and T2 < 5 do
				Prompt:InputHoldBegin()
				Prompt:InputHoldEnd()
				T2 += 1 task.wait()
			end

			Prompt.MaxActivationDistance = OldDist
			Prompt.Enabled = OldEnable
			Prompt.HoldDuration = OldHold
			Prompt.RequiresLineOfSight = OldLOS
			pcall(function() Prompt.Parent = OldParent end)
			task.wait()
			G.g15.PromptCooldown[Prompt] = nil
			TempPart:Destroy()
			ShownConn:Disconnect()
			FiredConn:Disconnect()
		end
	end)
end

G.g16.AutoInteractBlacklist = {
	HidePrompt=true, RiftPrompt=true, StarRiftPrompt=true, InteractPrompt=true, ClimbPrompt=true,
	DonatePrompt=true, DialoguePrompt=true, RevivePrompt=true, EnterPrompt=true, AnimatePrompt=true,
	ToolEventPrompt=true, Prompt=true, PropPrompt=true
}

G.g16.TriggerDebounce = false

function G.g16.GetHidingSpotModel(Prompt)
	if not Prompt or not Prompt.Parent then return false end
	local Model = Prompt.Parent
	while Model and not Model:IsA("Model") do
		Model = Model.Parent
	end
	if not Model then return nil end

	local Name = string.lower(Model.Name)
	if not string.find(Name, "hidingspot") and not string.find(Name, "hiding_spot") then
		return nil
	end
	return Model
end

function G.g16.HasHidePrompt(Model)
	return Model and (Model:FindFirstChild("HidePrompt") or Model:FindFirstChild("HidingPrompt")) ~= nil
end

function G.g16.IsHidingSpotPrompt(Prompt)
	if not Prompt or not Prompt.Parent then return false end
	if Prompt.Name ~= "HidePrompt" and Prompt.Name ~= "HidingPrompt" then return false end
	return G.g16.HasHidePrompt(G.g16.GetHidingSpotModel(Prompt))
end

G.g2.Functions.TriggerPrompt = function(Prompt)
	if not Prompt or not Prompt.Parent then return end
	if G.g3.Character:GetAttribute("Hiding") == true then return end
	local HidingSpot = G.g16.GetHidingSpotModel(Prompt)
	if HidingSpot and Prompt.Name ~= "InteractPrompt" then return end
	local IsHidingSpotInteractPrompt = HidingSpot and Prompt.Name == "InteractPrompt"
	if G.g16.AutoInteractBlacklist[Prompt.Name] and not G.g16.IsHidingSpotPrompt(Prompt) and not IsHidingSpotInteractPrompt then return end
	if (Prompt.Name == "HidePrompt" or Prompt.Name == "HidingPrompt") and not G.g16.IsHidingSpotPrompt(Prompt) then return end
	if (Prompt.Name == "HidePrompt" or Prompt.Name == "HidingPrompt" or G.g16.IsHidingSpotPrompt(Prompt)) then
		if not G.g2.Toggles.AutoClosetToggle.Value then return end
		local Entity = G.g2.Functions.GetNearestEntity(true, G.g2.Options.AutoClosetEntityList.Value)
		if not Entity then return end
		local EntityDistance = LocalPlayer:DistanceFromCharacter(Entity.PrimaryPart.Position)
		if EntityDistance > (EntityDistances[Entity.Name] or 150) then return end
	end
	if G.g16.TriggerDebounce then return end

	local ParentItem = G.g2.Functions.HasItem(Prompt.Parent.Name)
	if ParentItem and ParentItem:GetAttribute("Durability") and ParentItem:GetAttribute("DurabilityMax")
		and ParentItem:GetAttribute("Durability") >= ParentItem:GetAttribute("DurabilityMax")
	then return end

	local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }
	local IsLockPrompt = LockPromptNames[Prompt.Name]
		or (Prompt.Parent and Prompt.Parent:GetAttribute("Locked") == true)
		or (Prompt.Parent and Prompt.Parent.Parent and Prompt.Parent.Parent.Name == "Locker_Small_Locked" and Prompt.Name == "ActivateEventPrompt")

	if IsLockPrompt then
		if G.g2.Options.AutoInteractIgnoreList.Value["Locks"] then return end
		local KeyItems = { "Key","GeneratorFuse","KeyBackdoor","KeyElectrical","KeyIron","Lockpick","SkeletonKey","Shears","Multitool" }
		local OffhandKeyItems = { "Key","GeneratorFuse","KeyElectrical","KeyIron" }
		local HasKey = false
		for _, K in KeyItems do if G.g2.Functions.HasItem(K, true) then HasKey = true break end end
		for _, K in OffhandKeyItems do if G.g2.Functions.HasItem(K) then HasKey = true break end end
		if not HasKey then return end
	end

	if Prompt.Parent.Name == "CuttableVines" and not G.g2.Functions.HasItem("Shears", true) and not G.g2.Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Chest_Vine" and not G.g2.Functions.HasItem("Shears", true) and not G.g2.Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Cellar" and not G.g2.Functions.HasItem("Shears", true) and not G.g2.Functions.HasItem("Multitool", true) then return end
	if Prompt.Parent.Name == "SkullLock" and not G.g2.Functions.HasItem("SkeletonKey", true) then return end
	if Prompt.Parent.Name == "Lock1" and not G.g2.Functions.HasItem("Lockpick", true) and not G.g2.Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Lock2" and not G.g2.Functions.HasItem("Lockpick", true) and not G.g2.Functions.HasItem("Multitool", true) then return end
	if G.g2.Functions.HasItem("Shears", true) and IsLockPrompt and Prompt.Parent.Name ~= "CuttableVines" and Prompt.Parent.Name ~= "Chest_Vine" and Prompt.Parent.Name ~= "Cellar" then return end

	if Prompt.Parent.Name == "GlitchCube" and G.g2.Options.AutoInteractIgnoreList.Value["Glitch Fragments"] then return end

	if (Prompt.Parent.Name == "KeyObtain" and (G.g2.Functions.HasItem("Key") or G.g2.Functions.HasItem("KeyBackdoor")))
		or (Prompt.Parent.Name == "ElectricalKeyObtain" and G.g2.Functions.HasItem("KeyElectrical"))
	then return end

	if Prompt:IsDescendantOf(G.g3.Drops) and G.g2.Options.AutoInteractIgnoreList.Value["Dropped Items"] then return end
	if Prompt.Parent.Name == "TrackLever" then return end
	if Prompt.Name == "ActivateEventPrompt" and (Prompt.ActionText == "Close"
		or Prompt.Parent.Name == "ElevatorBreaker"
		or (Prompt.Parent.Parent and Prompt.Parent.Parent.Name == "IndustrialGate"))
	then return end
	if Prompt.Name == "ActivateEventPrompt" and (Prompt.Parent.Name == "Padlock" or Prompt.Parent.Name == "MinesAnchor") then return end
	if Prompt.Parent.Name == "LeverForGate" and Prompt:GetAttribute("Interactions") then return end
	if Prompt.Parent.Parent and (Prompt.Parent.Parent.Name == "DoorFake" or Prompt.Parent.Parent.Name == "FakeDoor") then return end
	if Prompt.Parent:GetAttribute("JeffShop") and G.g2.Options.AutoInteractIgnoreList.Value["Jeff Items"] then return end
	if Prompt:GetAttribute("AutoInteractIgnore") then return end
	if Prompt.Name == "PushPrompt" and G.g2.Options.AutoInteractIgnoreList.Value["Minecarts"] then return end
	if (Prompt.Parent.Name == "GoldPile" or Prompt.Parent.Name == "StardustPickup") and G.g2.Options.AutoInteractIgnoreList.Value["Currency"] then return end

	if Prompt.Parent.Name == "Bandage" then
		local BPack = G.g2.Functions.HasItem("BandagePack")
		if G.g3.Humanoid.Health >= G.g3.Humanoid.MaxHealth and not BPack then return end
		if BPack and BPack:GetAttribute("Durability") >= BPack:GetAttribute("DurabilityMax") then return end
	end

	if Prompt.Parent.Name == "Battery" then
		local Tool = G.g3.Character:FindFirstChildOfClass("Tool")
		local BPack = G.g2.Functions.HasItem("BatteryPack")
		if not Tool and not BPack then return end
		if Tool and Tool:GetAttribute("LightSource") then
			if Tool:GetAttribute("Durability") and Tool:GetAttribute("DurabilityMax")
				and Tool:GetAttribute("Durability") > Tool:GetAttribute("DurabilityMax")
			then return end
		elseif not BPack then
			return
		end
		if BPack and BPack:GetAttribute("Durability") >= BPack:GetAttribute("DurabilityMax") then return end
	end

	if Prompt.Name == "HerbPrompt" then
		local Effects = G.g2.Globals.MainUI.MainFrame.Healthbar:FindFirstChild("Effects")
		if Effects and Effects.HerbGreenEffect.Visible then return end
	end

	if (Prompt.Parent.Name == "LibraryHintPaper" or Prompt.Parent.Name == "PickupItem") and (G.g2.Functions.HasItem("LibraryHintPaper") or G.g2.Functions.HasItem("LibraryHintPaperHard")) then return end
	if Prompt.Parent.Name == "AlarmClock" and G.g2.Functions.HasItem("AlarmClock") then return end
	if Prompt.Parent.Name == "KeyObtainFake" or Prompt.Parent.Name == "TithingPlate" then return end
	if Prompt.Parent.Name == "StarBottle" then return end
    -- archives
	if Prompt.parent.Name == "ArchivesStorageBox" then return end
	if Prompt.Parent.Name == "Briefcase" then return end
	if Prompt.Name == "SinkPrompt" or Prompt.Parent.Name == "Faucet" then return end
	if Prompt.Parent.Name == "PaperPlanePickup" or Prompt.Parent.Name == "PaperPlane" then return end
	if Prompt.Name == "ManualOpenPrompt" or Prompt.Name == "EntryPrompt" then return end
	if Prompt.Parent.Parent.Name == "ArchivesLargePrinter" then return end
	if Prompt.Name == "TrashcanPrompt" then return end
	if Prompt.Parent.Name == "Keyboard" then return end
	if Prompt.Name == "CartPrompt" or Prompt.Parent.Parent.Name == "ArchivesOfficeChair" then return end
	if Prompt.Parent.Name == "ArchivesTerminal" then return end
	if Prompt.Name == "VendorPrompt" then return end
    if Prompt.Parent.Name == "SeatPart" or Prompt.Name == "SeatPrompt" then return end


	-- Stairwell
	if Prompt.Parent.Parent.Parent.Parent.Name == "CandyVault" then return end
	if Prompt.Parent.Name == "StairwellScrapper" then return end
	if Prompt.Name == "PortraitDupePrompt" or Prompt.Parent.Name == "MirrorTool" then return end
	if Prompt.Name == "LaptopPrompt" or Prompt.Parent.Name == "SecretLaptop" then return end
	if Prompt.Parent.Name == "StairwellFireAlarm" or Prompt.Parent.Parent.Name == "StairwellFireAlarm" then return end
	if Prompt.Parent.name == "CobblerFriendly" then return end
	if Prompt.Parent.Name == "StairwellTerminal" then return end
	if Prompt.Parent.Parent.Name == "MeldChord" then return end

	G.g2.Functions.FirePrompt(Prompt)
	G.g16.TriggerDebounce = true
	if G.g3.Floor == "OldHotel" then task.wait() end
	G.g16.TriggerDebounce = false
end

G.g2.Globals.LastAutoInteractFire = tick()
G.g2.Connections_2.AutoInteract = G.g2.Services.RunService.Heartbeat:Connect(function()
	local Active = G.g2.Toggles.AutoInteractToggle.Value or G.g2.Options.AutoInteractKeybind:GetState()
    if not Active then return end
    if tick() - G.g2.Globals.LastAutoInteractFire < 1/60 then return end

	for _, Prompt in G.g2.Objects.Prompts do
        if Prompt:GetAttribute("ParentRoom") and tonumber(Prompt:GetAttribute("ParentRoom")) ~= tonumber(LocalPlayer:GetAttribute("CurrentRoom")) then continue end

		if Prompt.Parent and (Prompt.Parent:IsA("BasePart") or Prompt.Parent:IsA("Model")) then
			local Distance
			if Prompt.Parent:IsA("BasePart") then
				Distance = LocalPlayer:DistanceFromCharacter(Prompt.Parent.Position)
			else
				Distance = LocalPlayer:DistanceFromCharacter(Prompt.Parent:GetPivot().Position)
			end
			if Distance <= Prompt.MaxActivationDistance and Prompt.Enabled or Distance <= Prompt.MaxActivationDistance and Prompt.Name == "LongPushPrompt" or Distance <= Prompt.MaxActivationDistance and Prompt.Name == "BigPropPrompt" then
				task.spawn(G.g2.Functions.TriggerPrompt, Prompt)
			end
		end
	end
    G.g2.Globals.LastAutoInteractFire = tick()
end)

G.g2.Connections_2.InfiniteItemsHandler = G.g2.Services.ProximityPromptService.PromptTriggered:Connect(function(Object)
	if not Object:GetAttribute("FakePrompt") then return end

	local ToolNames = { "Lockpick","Shears","SkeletonKey","Key","GeneratorFuse","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
	local AnimateToolNames = { "Lockpick","Shears","SkeletonKey","Key","KeyElectrical","KeyBackdoor","KeyIron", "Multitool" }
	local Tool
	for _, N in ToolNames do Tool = G.g3.Character:FindFirstChild(N) if Tool then break end end

	local Prompt = Object
	local LockPromptNames = { UnlockPrompt=true, SkullPrompt=true, LockPrompt=true, ThingToEnable=true, FusesPrompt=true }
	local IsLockPrompt = LockPromptNames[Object.Name]
		or (Object.Parent and Object.Parent:GetAttribute("Locked") == true)
		or (Object.Parent and Object.Parent.Parent and Object.Parent.Parent.Name == "Locker_Small_Locked" and Object.Name == "ActivateEventPrompt")
	if IsLockPrompt then
		if G.g2.Options.AutoInteractIgnoreList.Value["Locks"] then return end
		local KeyItems = { "Key","GeneratorFuse","KeyBackdoor","KeyElectrical","KeyIron","Lockpick","SkeletonKey","Shears","Multitool" }
		local OffhandKeyItems = { "Key","GeneratorFuse","KeyElectrical","KeyIron" }
		local HasKey = false
		for _, K in KeyItems do if G.g2.Functions.HasItem(K, true) then HasKey = true break end end
		for _, K in OffhandKeyItems do if G.g2.Functions.HasItem(K) then HasKey = true break end end
		if not HasKey then return end
	end

	if Prompt.Parent.Name == "CuttableVines" and not G.g2.Functions.HasItem("Shears", true) and not G.g2.Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Chest_Vine" and not G.g2.Functions.HasItem("Shears", true) and not G.g2.Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Cellar" and not G.g2.Functions.HasItem("Shears", true) and not G.g2.Functions.HasItem("Multitool", true) then return end
	if Prompt.Parent.Name == "SkullLock" and not G.g2.Functions.HasItem("SkeletonKey", true) then return end
	if Prompt.Parent.Name == "Lock1" and not G.g2.Functions.HasItem("Lockpick", true) and not G.g2.Functions.HasItem("Multitool", true) or Prompt.Parent.Name == "Lock2" and not G.g2.Functions.HasItem("Lockpick", true) and not G.g2.Functions.HasItem("Multitool", true) then return end
	if G.g2.Functions.HasItem("Shears", true) and IsLockPrompt and Prompt.Parent.Name ~= "CuttableVines" and Prompt.Parent.Name ~= "Chest_Vine" and Prompt.Parent.Name ~= "Cellar" then return end

	if Tool and table.find(AnimateToolNames, Tool.Name) and G.g2.Globals.UseAnimation and G.g2.Globals.UseAnimationBreak then
		G.g2.Globals.UseAnimation:Stop()
		G.g2.Globals.UseAnimationBreak:Stop()
		G.g2.Globals.UseAnimationBreak:Play()
		if Tool.Name == "Shears" then Tool:WaitForChild("Handle"):WaitForChild("sound_prompt"):Play() end
	end

	local AnyTool = G.g3.Character:FindFirstChildOfClass("Tool")
	local ToolData = AnyTool and G.g3.ItemNames[AnyTool.Name]
	if AnyTool and ToolData and G.g2.Toggles.InfiniteItemsToggle.Value and G.g2.Options.InfiniteItemsList.Value[ToolData] then
		G.g3.Drops.ChildAdded:Once(function(NewTool)
			local Prompt = NewTool:FindFirstChild("ModulePrompt")
			local RealPrompt = G.g2.FakePrompts[Object]
			G.g2.Functions.FirePrompt(Prompt)
			G.g2.Functions.FirePrompt(RealPrompt)
		end)
		G.g3.Character.ChildAdded:Once(function(NewTool)
			if NewTool.Name == "Shears" then NewTool:WaitForChild("Handle"):WaitForChild("sound_promptend"):Play() end
		end)
		G.g3.RemotesFolder.DropItem:FireServer(AnyTool)
	else
		local RealPrompt = G.g2.FakePrompts[Object]
		G.g2.Functions.FirePrompt(RealPrompt)
	end
end)

G.g2.Connections_2.FloorReplicatedHandler = G.g3.FloorReplicated.DescendantAdded:Connect(function(Object)
	if Object.Name == "GlitchScreech" then
		Modules.GlitchScreech = Object
		if G.g2.Toggles.RemoveScreech.Value then Object.Name = "GlitchScreech_Disabled" end
	end
	if Object.Name:find("Jumpscare") and Object:IsA("ModuleScript")
		and not Object.Name:find("Eyestalk") and not Object.Name:find("Groundskeeper") and not Object.Name:find("Monument")
	then
		Object:SetAttribute("OriginalName", Object.Name)
		if G.g2.Toggles.DisableEntityJumpscares.Value then Object.Name = Object.Name .. "_Disabled" end
		table.insert(G.g2.Objects.JumpscareModules, Object)
	end
end)

if G.g3.FloorReplicated:FindFirstChild("DigitalTimer") then
	G.g2.Connections_2.HasteTimerConnection = G.g3.FloorReplicated.DigitalTimer:GetPropertyChangedSignal("Value"):Connect(function()
		if G.g2.Toggles.NotifyHasteTime.Value then G.g2.Functions.Caption(G.g2.Functions.GetHasteTime(), true) end
	end)
end

G.g2.Connections_2.FogHandler = G.g2.Services.Lighting:GetPropertyChangedSignal("FogEnd"):Connect(function()
	if G.g2.Services.Lighting.FogEnd ~= 10000000 then
		G.g2.Globals.OldFog = G.g2.Services.Lighting.FogEnd
	end
	if G.g2.Toggles.RemoveCameraFog.Value then
		G.g2.Services.Lighting.FogEnd = 10000000
	end
end)

G.g2.Connections_2.FogHandler2 = G.g2.Services.Lighting.DescendantAdded:Connect(function(Object)
	if not Object:IsA("Atmosphere") then return end
	Object:SetAttribute("Density_Old", Object.Density)
	if G.g2.Toggles.RemoveCameraFog.Value then Object.Density = 0 end

	local AtmoConn2 = Object:GetPropertyChangedSignal("Density"):Connect(function()
		if Object.Density ~= 0 then Object:SetAttribute("Density_Old", Object.Density) end
		if G.g2.Toggles.RemoveCameraFog.Value then Object.Density = 0 end
	end)
	Object.Destroying:Once(function() AtmoConn2:Disconnect() end)
	table.insert(G.g2.Connections_2, AtmoConn2)
	table.insert(G.g2.Globals.FogInstances, Object)
end)

G.g17.RusherAliases = { Rush=true, Bash=true, Scribbles=true, DronesStampede=true, Ambush=true, Eyes=true, Lookman=true, Blitz=true, ["A-60"]=true, ["A-120"]=true, AR0xMBUSH=true, ["RNIUSHCG=="]=true, ["Custom Entity"]=true }

function G.g17.HandleEntitySpawn(Entity)
	if not Entity or typeof(Entity) ~= "Instance" then return end

	local Model = Entity
	if Entity:IsA("Humanoid") then
		Model = Entity.Parent
	end
	if not Model or not Model:IsA("Model") then return end

	local EntityData = G.g3.Entities[Model.Name]
	if not EntityData then return end
	if Model:GetAttribute("Abysall_EntityHandled") then return end
	Model:SetAttribute("Abysall_EntityHandled", true)

	while not Model.PrimaryPart do
		for _, Child in Model:GetChildren() do
			if Child:IsA("BasePart") then Model.PrimaryPart = Child end
		end
		if not Model.PrimaryPart then task.wait() end
	end
	task.wait(0.1)

	if not Model.PrimaryPart or LocalPlayer:DistanceFromCharacter(Model.PrimaryPart.Position) >= 10000 then return end

	local Alias = EntityData.Alias
	local RealAlias = Alias
	if G.g2.Options.EntityList.Value[Alias] and G.g2.Toggles.NotifyEntities.Value then
		local NotifyTitle = EntityData.NotifyMessage.Title
		local NotifyBody  = EntityData.NotifyMessage.Body
		local NotifyImage = G.g3.EntityIcons[Model.Name]

		if Model.Name == "RushMoving" and Model.PrimaryPart.Name ~= "RushNew" then
			NotifyTitle = NotifyTitle:gsub("Rush", Model.PrimaryPart.Name)
			NotifyImage = Model.PrimaryPart:WaitForChild("Attachment").ParticleEmitter.Texture
			Alias = Model.PrimaryPart.Name
		end

		G.g2.Functions.Notify({ Title = NotifyTitle, Body = NotifyBody, Image = NotifyImage, Time = G.g2.Toggles.NotifyKeepNotifications.Value and Model or nil })

		if G.g2.Toggles.EntityChatToggle.Value then
			G.g2.Functions.SendChat(Alias .. " " .. G.g2.Options.EntityChatMessage.Value)
		end
	end

	if Model.Name ~= "GloombatSwarm" then
		if G.g2.Toggles.EntityESPToggle.Value and G.g2.Options.EntityESPOptions.Value[RealAlias] then
			if Model.Name == "MonumentEntity" then
				G.g2.Functions.AddESP({ Object = Model.Top, Text = Alias, Color = G.g2.Options.EntityESPColor.Value })
			else
				G.g2.Functions.AddESP({ Object = Model, Text = Alias, Color = G.g2.Options.EntityESPColor.Value })
			end
		end
		table.insert(G.g2.Objects.Entities, Model)
	end

	if G.g17.RusherAliases[EntityData.Alias] then
		Instance.new("Humanoid", Model).Name = "HighlightHumanoid"
		local Root = Model.PrimaryPart
		if Root then Root.Transparency = 0.999 Root.Material = Enum.Material.Plastic end
	end

	if Model.Name == "Lookman" then
		G.g3.CurrentRooms.ChildAdded:Wait()
		task.wait(10)
		Model:Destroy()
	end
end

G.g2.Connections_2.EntityHandler = G.g2.Services.Workspace.ChildAdded:Connect(G.g17.HandleEntitySpawn)
G.g2.Connections_2.EntityDescendantHandler = G.g2.Services.Workspace.DescendantAdded:Connect(function(Descendant)
	local EntityModel = Descendant:IsA("Humanoid") and Descendant.Parent or Descendant
	if EntityModel and EntityModel:IsA("Model") and G.g3.Entities[EntityModel.Name] then
		task.defer(function()
			G.g17.HandleEntitySpawn(Descendant)
		end)
	end
end)

local LastClean = tick()
G.g2.Connections_2.Cleaner = G.g2.Services.RunService.Heartbeat:Connect(function()
	if tick() - LastClean <= 0.5 then return end
	LastClean = tick()

	for ArrayName, Array in G.g2.Objects do
		local I = #Array
		while I >= 1 do
			local Object = Array[I]
			if Object == nil or not Object:IsDescendantOf(G.g2.Services.Workspace) then
				table.remove(Array, I)
				local Conn = G.g2.ESPConnections[Object]
				if Conn then
					Conn:Disconnect()
					G.g2.ESPConnections[Object] = nil
					local Pos = table.find(G.g2.Connections_2, Conn)
					if Pos then table.remove(G.g2.Connections_2, Pos) end
				end
			end
			I -= 1
		end
	end
end)

local LastPromptFix = tick()
G.g2.Connections_2.PromptFixer = G.g2.Services.RunService.Heartbeat:Connect(function()
	if tick() - LastPromptFix <= 0.5 then return end
	LastPromptFix = tick()
	for _, Prompt in G.g2.Objects.Prompts do
		if Prompt:HasTag("DisableWhenEnabledOnClient") then
			Prompt:RemoveTag("DisableWhenEnabledOnClient")
		end
	end
end)

if LocalPlayer.Character then
	task.spawn(function() G.g2.Functions.HandleCharacter(LocalPlayer.Character) end)
end

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
	if G.g2.Connections_2.MainHandler then
		G.g2.Connections_2.MainHandler:Disconnect()
		G.g2.Connections_2.MainHandler = nil
	end
	task.wait(0.5)
	G.g2.Functions.HandleCharacter(NewCharacter)
end)

G.g2.Library:OnUnload(function()
	StopTimeShower(true)
	for Key, Connection in G.g2.Connections_2 do
		if type(Key) == "string" then
			pcall(function() Connection:Disconnect() end)
		else
			pcall(function() Key:Disconnect() end)
			pcall(function() Connection:Disconnect() end)
		end
	end

	for _, Object in G.g2.Objects.Entities do
		if Object.Name == "Snare" or Object.Name == "GiggleCeiling" then
			local Hitbox = Object:FindFirstChild("Hitbox")
			if Hitbox then Hitbox.CanTouch = true end
		end
		if Object.Name == "GloomPile" then
			for _, Part in Object:GetDescendants() do
				if Part:IsA("BasePart") then Part.CanTouch = true end
			end
		end
		if Object.Name == "FakeDoor" or Object.Name == "DoorFake" then
			local Hidden = Object:FindFirstChild("Hidden")
			if Hidden then Hidden.CanTouch = true end
			local Lock = Object:FindFirstChild("Lock")
			if Lock and Lock:FindFirstChild("UnlockPrompt") then Lock.UnlockPrompt.Enabled = true end
		end
		if Object.Name == "SideroomSpace" then
			local Coll = Object:FindFirstChild("Collision")
			if Coll then Coll.CanCollide = false Coll.CanTouch = true end
		end
	end

	for _, Object in G.g2.Objects.SeekBridges do Object:Destroy() end

	for _, Fog in G.g2.Globals.FogInstances do
		Fog.Density = Fog:GetAttribute("Density_Old")
	end
	G.g2.Services.Lighting.FogEnd = G.g2.Globals.OldFog

	local Vignette = G.g2.Globals.MainUI:FindFirstChild("HideVignette") or G.g2.Globals.MainUI.MainFrame:FindFirstChild("HideVignette")
	if Vignette then Vignette.Image = "rbxassetid://6100076320" end

	local ModuleRestores = {
		Screech = "Screech", Glitch = "Glitch", Shade = "Shade",
		SpiderJumpscare = "SpiderJumpscare", A90 = "A90", Dread = "Dread", Void = "Void"
	}
	for Key, OriginalName in ModuleRestores do
		if Modules[Key] then Modules[Key].Name = OriginalName end
	end

	FakeEvents.Screech:Destroy()
	FakeEvents.Screech_Real.Parent = G.g3.RemotesFolder
	FakeEvents.Shade:Destroy()
	FakeEvents.Shade_Real.Parent = G.g3.RemotesFolder

	if FakeEvents.A90_Real then
		FakeEvents.A90:Destroy()
		FakeEvents.A90_Real.Parent = G.g3.RemotesFolder
	end
	if FakeEvents.Surge_Real then
		FakeEvents.Surge:Destroy()
		FakeEvents.Surge_Real.Parent = G.g3.RemotesFolder
	end

	G.g2.Globals.SeekNodesFolder:Destroy()
	G.g2.Globals.RoomsNodesFolder:Destroy()
	G.g2.Globals.ManipulateBody:Destroy()

	local OldAmbient = G.g3.CurrentRooms:FindFirstChild(tostring(LocalPlayer:GetAttribute("CurrentRoom"))):GetAttribute("Ambient")
	G.g2.Services.TweenService:Create(G.g2.Services.Lighting, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), { Ambient = OldAmbient }):Play()

	for _, Prompt in G.g2.Objects.Prompts do
		if G.g2.FakePrompts[Prompt] then
			G.g2.FakePrompts[Prompt].Parent = Prompt.Parent
			Prompt:Destroy()
		end
		if Prompt.Parent then
			Prompt.HoldDuration = Prompt:GetAttribute("HoldDuration_Old") or Prompt.HoldDuration
			Prompt.RequiresLineOfSight = Prompt:GetAttribute("RequiresLineOfSight_Old") or Prompt.RequiresLineOfSight
			Prompt.MaxActivationDistance = Prompt:GetAttribute("MaxActivationDistance_Old") or Prompt.MaxActivationDistance
		end
	end

	G.g3.Character:SetAttribute("CanJump",  G.g5.OldJump)
	G.g3.Character:SetAttribute("CanSlide", G.g5.OldSlide)

	for _, Object in G.g2.Services.Workspace:GetDescendants() do
		task.spawn(function() G.g2.Functions.RemoveESP(Object) end)
	end

	G.g3.Humanoid.WalkSpeed  = G.g2.Functions.GetCurrentSpeed()
	G.g3.Humanoid.JumpPower  = 5
	G.g3.Humanoid.HipHeight  = 2.367

	local BaseY = 0.18
	G.g3.Collision.Position          = G.g3.RootPart.Position + Vector3.new(0, BaseY, 0)
	G.g3.CollisionPart.Position      = G.g3.RootPart.Position + Vector3.new(0, BaseY, 0)
	G.g3.CollisionPartClone.Position = G.g3.RootPart.Position + Vector3.new(0, BaseY, 0)

	if G.g3.Character:FindFirstChild("LowerTorso") and G.g3.Character.LowerTorso:FindFirstChild("Root") then
		G.g3.Character.LowerTorso.Root.C1 = G.g2.Globals.OriginalC1
	end
	if G.g3.Collision:FindFirstChild("CollisionCrouch") then
		G.g3.Collision.CollisionCrouch.Position = G.g3.RootPart.Position + Vector3.new(0, -0.982, 0)
	end

	G.g3.CollisionClone:Destroy()
	G.g3.CollisionPartClone:Destroy()
	G.g1.Abysall.ESPLibrary:Unload()

	if G.g10.Main_Game then
		G.g10.Main_Game.fovtarget   = 70
		G.g10.Main_Game.spring.Speed = 8
		G.g10.Main_Game.tooloffset   = Vector3.zero
	end

	if G.g2.Globals.OriginalGetMoveVector then 
		local Controls = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()
		Controls.GetMoveVector = G.g2.Globals.OriginalGetMoveVector
	end

	getgenv().Abysall = nil
	shared.Hastelepasta = false
end)



while not G.g2.Globals.MainUI do task.wait() end


G.g1.Abysall.Interface.ApplySettingsTab(Window)
G.g2.Functions.Notify({ Title = "Successfully loaded in " .. math.floor((tick() - LoadStart) * 1000) / 1000 .. " seconds." , Body = "Press '" .. tostring(G.g2.Options.MenuKeybind.Value) .. "' to toggle the UI."})
