local Name = "SSHub | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." | "

_G.CriminalityInfo = {
    SilentAimColor = Color3.fromRGB(255, 176, 0),
    ESPColor = Color3.fromRGB(255, 176, 0)
};

LibraryConfg = {
    ShowCursor = false,
    AccentColors = {
        Accent1 = Color3.fromRGB(255, 176, 0),
        Accent2 = Color3.fromRGB(255, 176, 0),
    };
};

--#region Notify
local NS = {
	Title = "SSHub",
	Icon = "rbxassetid://8426126371"
};
local function Notify(Title, Icon, Text, Duration)
	game.StarterGui:SetCore("SendNotification", {Title = Title or ""; Text = Text or ""; Icon = Icon or ""; Duration = tonumber(Duration) or 3 })
end
--#endregion
--#region Libs
local LibraryHttps = "https://raw.githubusercontent.com/miguel831/Roblox-Scripts/main/SSHub/Lib/LibrarySSHub.lua"
local LibraryESPHttps = "https://raw.githubusercontent.com/miguel831/Roblox-Scripts/main/SSHub/Lib/ESP.lua"
local Library = loadstring(game:HttpGet(LibraryHttps, true))() 
local LibraryESP = loadstring(game:HttpGet(LibraryESPHttps, true))()
--#endregion
-- #region Services
local game = game;
local GetService = game.GetService;
local Workspace = GetService(game, "Workspace");
local Players = GetService(game, "Players");
local Lighting = GetService(game, "Lighting");
local ReplicatedStorage = GetService(game, "ReplicatedStorage");
local CoreGui = GetService(game, "CoreGui");
local Cam = Workspace.CurrentCamera;
local Player = Players.LocalPlayer;
local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Character = Player.Character
--#endregion

--#region Settings
--Variables Settings
local Settings = {
	GunMods = { NoRecoil = false, InstantEquip = false, Spread = false, SpreadAmount = 0, InstantAim = false,
		},
	TpHit = {
		Name = "nil",
		HitPart = "Head",
		Weapon = "Fists",
		Configs = {
			Bat = {0.65, 0.1},
			Fists = {0.2, 0.1},
			FireAxe = {0.65, 0.1},
			Chainsaw = {0.13, 0.1},
		},
		--|1| When do teleport + Start hit seceunce
		--|2| When do the hit
		--|3| When teleport back
	},
	Killaura = false,
	DownedChat = false,
	KillChat = false,
	KillMSG = "",
	IsDead = true,
	AutoPickCash = false,
	AutoPickTools = false,
	AutoPickScrap = false,
	InfiniteStamina = false,
	NoJumpCooldown = false,
	SpaceJump = false,
	NoFailLockpick = false,
	ShowChatLogs = true,
	NoFlashbang  = false,
	NoSmoke = false,
	UnlockDoorsNearby = false,
	OpenDoorsNearby = false,
	NoClip = false,
	FullBright = false,
	CamFovToggled = false,
	CamFov = 70,
	Zoom = 10,
	InfinitePepperSpray = false,
	PepperSprayAura = false,
	WalkSpeed = {Enabled = false, Amount = 30},
	JumpPower = {Enabled = false, Amount = 75},
	NoBarbwire = false,
	NoFallDamage = false,
	NoRagdoll = false,
	WallBang = false,
	ElevatorTP = false,
	TowerTP = false,
	UIKey = Enum.KeyCode.LeftAlt,
	NoDowned = false
};
local ESPSettings = { PlayerESP = { Enabled = false, TracersOn = false, BoxesOn = true, NamesOn = true, DistanceOn = true, HealthOn = true, ToolOn = true, FaceCamOn = false, Distance = 2000 }, ScrapESP = { Enabled = false, Distance = 2000, LegendaryOnly = true, RareOnly = true, GoodOnly = true, BadOnly = true }, SafeESP = { Enabled = false, Distance = 2000, BigOnly = true, SmallOnly = true }, RegisterESP = { Enabled = false, Distance = 2000 }, ESPColor = Color3.fromRGB(255, 255, 255), ToolColor = Color3.fromRGB(255, 255, 255)};
local CoolDowns = { AutoPickUps = { MoneyCooldown = false, ScrapCooldown = false, ToolCooldown = false } }
--Silent Aim Settings
local SilentSettings = { Main = { Enabled = false, TeamCheck = false, VisibleCheck = false, TargetPart = "Head" }, FOVSettings = { Visible = false, Radius = 360 }, SilentAimColor = Color3.fromRGB(255, 255, 255)};
local ValidTargetParts = {"Head", "Torso"};
--#endregion

local function LoadFunctions()
--Admins Check--
game.Players.PlayerAdded:Connect(function(AdminUserCheck)
    if AdminUserCheck.UserId == 68246168 or AdminUserCheck.UserId == 955294 or AdminUserCheck.UserId == 1095419 or AdminUserCheck.UserId == 50585425 or AdminUserCheck.UserId == 48405917 or AdminUserCheck.UserId == 9212846 or AdminUserCheck.UserId == 47352513 or AdminUserCheck.UserId == 48058122 then
		Notify(NS.Title,NS.Icon,"Mod Alert\n"..AdminUserCheck.Name..", Is in the server.", 120)
    elseif AdminUserCheck.UserId == 42066711 or AdminUserCheck.UserId == 513615792 then
		Notify(NS.Title,NS.Icon,"Contractors Alert\n"..AdminUserCheck.Name..", Is in the server.", 120)
    elseif AdminUserCheck.UserId == 151691292 or AdminUserCheck.UserId == 92504899 or AdminUserCheck.UserId == 31967243 then
		Notify(NS.Title,NS.Icon,"Devs Alert\n"..AdminUserCheck.Name..", Is in the server.", 120)
    elseif AdminUserCheck.UserId == 29761878 then
		Notify(NS.Title,NS.Icon,"Owner Alert\n"..AdminUserCheck.Name..", Is in the server.", 120)
    end
end)

for i, v in pairs(game.Players:GetPlayers()) do
    if v.UserId == 68246168 or v.UserId == 955294 or v.UserId == 1095419 or v.UserId == 50585425 or v.UserId == 48405917 or v.UserId == 9212846 or v.UserId == 47352513 or v.UserId == 48058122 then
        Notify(NS.Title,NS.Icon,"Mod Alert\n"..v.Name..", Is in the server.", 120)
    elseif v.UserId == 42066711 or v.UserId == 513615792 then
		Notify(NS.Title,NS.Icon,"Contractors Alert\n"..v.Name..", Is in the server.", 120)
    elseif v.UserId == 151691292 or v.UserId == 92504899 or v.UserId == 31967243 then
		Notify(NS.Title,NS.Icon,"Devs Alert\n"..v.Name..", Is in the server.", 120)
    elseif v.UserId == 29761878 then
		Notify(NS.Title,NS.Icon,"Owner Alert\n"..v.Name..", Is in the server.", 120)
    end
end
--Admin Check End--

--#region Silent Aim
local Character = Character or Player.CharacterAdded:Wait();
local Mouse = Player:GetMouse()
local WorldToScreen = Cam.WorldToScreenPoint
local WorldToViewportPoint = Cam.WorldToViewportPoint
local GetPartsObscuringTarget = Cam.GetPartsObscuringTarget
local ExpectedArguments = {
	Raycast = {
		ArgCountRequired = 3,
			Args = {
				"Instance", "Vector3", "Vector3", "RaycastParams"
			}
		}
	};


	local SilentAIMFov = Drawing.new("Circle")
	SilentAIMFov.Thickness = 1
	SilentAIMFov.NumSides = 100
	SilentAIMFov.Radius = 360
	SilentAIMFov.Filled = false
	SilentAIMFov.Visible = false
	SilentAIMFov.ZIndex = 999
	SilentAIMFov.Transparency = 1
	SilentAIMFov.Color = Color3.fromRGB(25,25,25)
	SilentSettings.Visible = false
	--Silent Aim Functions--
	local function GetPositionOnScreen(Vector)
		local Vec3, OnScreen = WorldToScreen(Cam, Vector)
		return Vector2.new(Vec3.X, Vec3.Y), OnScreen
	end

	local function ValidateArguments(Args, RayMethod)
		local Matches = 0

		if #Args < RayMethod.ArgCountRequired then
			return false
		end

		for Pos, Argument in next, Args do
			if typeof(Argument) == RayMethod.Args[Pos] then
				Matches = Matches + 1
			end
		end

		return Matches >= RayMethod.ArgCountRequired
	end

	local function GetDirection(Origin, Position)
		return (Position - Origin).Unit * (Origin - Position).Magnitude
	end

	local function GetMousePosition()
		return Vector2.new(Mouse.X, Mouse.Y)
	end

	local function IsPlayerVisible(TargetPlayer)
		local PlayerCharacter = TargetPlayer.Character
		local LocalPlayerCharacter = Player.Character

		if not (PlayerCharacter or LocalPlayerCharacter) then return end 

		local PlayerRoot = game.FindFirstChild(PlayerCharacter, SilentSettings.Main.TargetPart) or game.FindFirstChild(PlayerCharacter, "HumanoidRootPart")

		if not PlayerRoot then return end 

		local CastPoints, IgnoreList = {PlayerRoot.Position, LocalPlayerCharacter, PlayerCharacter}, {LocalPlayerCharacter, PlayerCharacter}
		local ObscuringObjects = #GetPartsObscuringTarget(Cam, CastPoints, IgnoreList)

		return ((ObscuringObjects == 0 and true) or (ObscuringObjects > 0 and false))
	end

	local function GetClosestPlayer()
		if not SilentSettings.Main.TargetPart then return end

		local Closest
		local DistanceToMouse

		for _, v in next, game.GetChildren(Players) do
			if v == Player then continue end
			if SilentSettings.Main.TeamCheck and v.Team == Player.Team then continue end

			local Character = v.Character
			if not Character then continue end

			if SilentSettings.Main.VisibleCheck and not IsPlayerVisible(v) then continue end

			local HumanoidRootPart = game.FindFirstChild(Character, "HumanoidRootPart")
			local Humanoid = game.FindFirstChild(Character, "Humanoid")

			if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 then continue end

			local ScreenPosition, OnScreen = GetPositionOnScreen(HumanoidRootPart.Position)

			if not OnScreen then continue end

			local Distance = (GetMousePosition() - ScreenPosition).Magnitude
			if Distance <= (DistanceToMouse or (SilentSettings.Main.Enabled and SilentSettings.FOVSettings.Radius) or 2000) then
				Closest = ((SilentSettings.Main.TargetPart == "Random" and Character[ValidTargetParts[math.random(1, #ValidTargetParts)]]) or Character[SilentSettings.Main.TargetPart])
				DistanceToMouse = Distance
			end
		end
		return Closest
	end
--#endregion

--#region BypassAntiCheat
function BypassAnticheat()
	local function CheckTable(tbl, ...)
		local Indexes = {...}
	
		for _, v in ipairs(Indexes) do
			if not (rawget(tbl, v)) then
				return false
			end
		end
	
		return true
	end
	
	local u21
	for _,v in ipairs(getgc(true)) do
		if (typeof(v) == "table" and CheckTable(v, "A", "B", "GP", "EN")) then
			u21 = v
			break
		end
	end
	
	hookfunction(u21.A, function()
	
	end)
	hookfunction(u21.B, function()
	
	end)
	end
--#endregion
if game:IsLoaded() then BypassAnticheat() end
--#region Esp Handlers
			local function ScrapESP(Scrap)
				local ItemName = Drawing.new("Text")
				ItemName.Visible = false
				ItemName.Center = true
				ItemName.Outline = true
				ItemName.Font = 2
				ItemName.Size = 13
				ItemName.Color = Color3.new(1, 2.5, 2.5)
				ItemName.Text = "Scrap"

				local RarityText = Drawing.new("Text")
				RarityText.Visible = false
				RarityText.Center = true
				RarityText.Outline = true
				RarityText.Font = 2
				RarityText.Size = 13
				RarityText.Color = Color3.new(1, 2.5, 2.5)
				RarityText.Text = "Type"

				local DistanceText = Drawing.new("Text")
				DistanceText.Visible = false
				DistanceText.Center = true
				DistanceText.Outline = true
				DistanceText.Font = 2
				DistanceText.Size = 13
				DistanceText.Color = Color3.new(1, 2.5, 2.5)
				DistanceText.Text = "Distance"

				local function InfoUpdate()
					local Iu

					Iu = game:GetService("RunService").RenderStepped:Connect(function()
						if not workspace:IsAncestorOf(Scrap) then
							ItemName.Visible = false
							RarityText.Visible = false
							DistanceText.Visible = false

							Iu:Disconnect()
						else
							local Vector, OnScreen = Cam:WorldToViewportPoint(Scrap:FindFirstChild("MeshPart").Position)

							if OnScreen then
								ItemName.Position = Vector2.new(Vector.X, Vector.Y - 30)
								RarityText.Position = Vector2.new(Vector.X, Vector.Y - 20)
								DistanceText.Position = Vector2.new(Vector.X, Vector.Y - 10)

								ItemName.Visible = false
								RarityText.Visible = false
								DistanceText.Visible = false

								local ItemDistance = math.ceil((Scrap.MeshPart.Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude)

								if ESPSettings.ScrapESP.Enabled == true then
									if ItemDistance < ESPSettings.ScrapESP.Distance then
										if tostring(Scrap:FindFirstChild("MeshPart"):FindFirstChild("Particle").Color) == "0 1 1 1 0 1 1 1 1 0 " then
											RarityText.Text = "Rarity: Bad"
											RarityText.Color = Color3.new(1, 2.5, 2.5)

											if ESPSettings.ScrapESP.BadOnly == true then
												ItemName.Visible = true
												RarityText.Visible = true
												DistanceText.Visible = true
											else
												ItemName.Visible = false
												RarityText.Visible = false
												DistanceText.Visible = false
											end
										elseif tostring(Scrap:FindFirstChild("MeshPart"):FindFirstChild("Particle").Color) == "0 0.184314 1 0.4 0 1 0.184314 1 0.4 0 " then
											RarityText.Text = "Rarity: Good"
											RarityText.Color = Color3.new(0, 2.5, 0)

											if ESPSettings.ScrapESP.GoodOnly == true then
												ItemName.Visible = true
												RarityText.Visible = true
												DistanceText.Visible = true
											else
												ItemName.Visible = false
												RarityText.Visible = false
												DistanceText.Visible = false
											end
										elseif tostring(Scrap:FindFirstChild("MeshPart"):FindFirstChild("Particle").Color) == "0 1 0.184314 0.184314 0 1 1 0.184314 0.184314 0 " then
											RarityText.Text = "Rarity: Rare"
											RarityText.Color = Color3.new(1, 0, 0)

											if ESPSettings.ScrapESP.RareOnly == true then
												ItemName.Visible = true
												RarityText.Visible = true
												DistanceText.Visible = true
											else
												ItemName.Visible = false
												RarityText.Visible = false
												DistanceText.Visible = false
											end
										else
											RarityText.Text = "Rarity: Legnedary"
											RarityText.Color = Color3.new(1, 1, 0.5)

											if ESPSettings.ScrapESP.LegendaryOnly == true then
												ItemName.Visible = true
												RarityText.Visible = true
												DistanceText.Visible = true
											else
												ItemName.Visible = false
												RarityText.Visible = false
												DistanceText.Visible = false
											end
										end

										DistanceText.Text = "["..tostring(ItemDistance).."]"
									else
										ItemName.Visible = false
										RarityText.Visible = false
										DistanceText.Visible = false
									end
								else
									ItemName.Visible = false
									RarityText.Visible = false
									DistanceText.Visible = false

									Iu:Disconnect()
								end
							else
								ItemName.Visible = false
								RarityText.Visible = false
								DistanceText.Visible = false
							end
						end
					end)
				end
				coroutine.wrap(InfoUpdate)()
			end
			

			--SafeESP 
			local function SafeESP(Vault, RarityValue)
				local ItemName = Drawing.new("Text")
				ItemName.Visible = false
				ItemName.Center = true
				ItemName.Outline = true
				ItemName.Font = 2
				ItemName.Size = 13
				ItemName.Color = Color3.new(1, 2.5, 2.5)
				ItemName.Text = "Safe"

				local RarityText = Drawing.new("Text")
				RarityText.Visible = false
				RarityText.Center = true
				RarityText.Outline = true
				RarityText.Font = 2
				RarityText.Size = 13
				RarityText.Color = Color3.new(1, 2.5, 2.5)
				RarityText.Text = "Type"

				local StatusText = Drawing.new("Text")
				StatusText.Visible = false
				StatusText.Center = true
				StatusText.Outline = true
				StatusText.Font = 2
				StatusText.Size = 13
				StatusText.Color = Color3.new(1, 2.5, 2.5)
				StatusText.Text = "Status"

				local DistanceText = Drawing.new("Text")
				DistanceText.Visible = false
				DistanceText.Center = true
				DistanceText.Outline = true
				DistanceText.Font = 2
				DistanceText.Size = 13
				DistanceText.Color = Color3.new(1, 2.5, 2.5)
				DistanceText.Text = "Distance"

				local function InfoUpdate()
					local Iu

					Iu = game:GetService("RunService").RenderStepped:Connect(function()
						if not workspace:IsAncestorOf(Vault) then
							ItemName.Visible = false
							RarityText.Visible = false
							StatusText.Visible = false
							DistanceText.Visible = false

							Iu:Disconnect()
						else
							local Vector, OnScreen = Cam:WorldToViewportPoint(Vault:FindFirstChild("MainPart").Position)

							if OnScreen then
								ItemName.Position = Vector2.new(Vector.X, Vector.Y - 30)
								RarityText.Position = Vector2.new(Vector.X, Vector.Y - 20)
								StatusText.Position = Vector2.new(Vector.X, Vector.Y - 0)
								DistanceText.Position = Vector2.new(Vector.X, Vector.Y - 10)

								ItemName.Visible = false
								RarityText.Visible = false
								StatusText.Visible = false
								DistanceText.Visible = false

								local ItemDistance = math.ceil((Vault:FindFirstChild("MainPart").Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude)

								if ESPSettings.SafeESP.Enabled == true then
									if ItemDistance < ESPSettings.SafeESP.Distance then
										if RarityValue == 2 then
											RarityText.Text = "Rarity: Good"
											RarityText.Color = Color3.new(0, 2.5, 0)

											if ESPSettings.SafeESP.SmallOnly == true then
												ItemName.Visible = true
												RarityText.Visible = true
												StatusText.Visible = true
												DistanceText.Visible = true
											else
												ItemName.Visible = false
												RarityText.Visible = false
												StatusText.Visible = false
												DistanceText.Visible = false
											end
										elseif RarityValue == 3 then
											RarityText.Text = "Rarity: Rare"
											RarityText.Color = Color3.new(1, 0, 0)

											if ESPSettings.SafeESP.BigOnly == true then
												ItemName.Visible = true
												RarityText.Visible = true
												StatusText.Visible = true
												DistanceText.Visible = true
											else
												ItemName.Visible = false
												RarityText.Visible = false
												StatusText.Visible = false
												DistanceText.Visible = false
											end
										end

										DistanceText.Text = "["..tostring(ItemDistance).."]"

										if Vault.Values.Broken.Value == false then
											StatusText.Text = "UnBroken"

											ItemName.Visible = true
											RarityText.Visible = true
											StatusText.Visible = true
											DistanceText.Visible = true

										else
											StatusText.Text = "Broken"

											ItemName.Visible = false
											RarityText.Visible = false
											StatusText.Visible = false
											DistanceText.Visible = false

										end
									else
										ItemName.Visible = false
										RarityText.Visible = false
										StatusText.Visible = false
										DistanceText.Visible = false
									end
								else
									ItemName.Visible = false
									RarityText.Visible = false
									StatusText.Visible = false
									DistanceText.Visible = false

									Iu:Disconnect()
								end
							else
								ItemName.Visible = false
								RarityText.Visible = false
								StatusText.Visible = false
								DistanceText.Visible = false
							end
						end
					end)
				end
				coroutine.wrap(InfoUpdate)()
			end
			

			--  // RegisterESP 
			local function RegisterESP(Register)
				local ItemName = Drawing.new("Text")
				ItemName.Visible = false
				ItemName.Center = true
				ItemName.Outline = true
				ItemName.Font = 2
				ItemName.Size = 13
				ItemName.Color = Color3.new(1, 2.5, 2.5)
				ItemName.Text = "Register"

				local StatusText = Drawing.new("Text")
				StatusText.Visible = false
				StatusText.Center = true
				StatusText.Outline = true
				StatusText.Font = 2
				StatusText.Size = 13
				StatusText.Color = Color3.new(1, 2.5, 2.5)
				StatusText.Text = "Status"

				local DistanceText = Drawing.new("Text")
				DistanceText.Visible = false
				DistanceText.Center = true
				DistanceText.Outline = true
				DistanceText.Font = 2
				DistanceText.Size = 13
				DistanceText.Color = Color3.new(1, 2.5, 2.5)
				DistanceText.Text = "Distance"

				local function InfoUpdate()
					local Iu

					Iu = game:GetService("RunService").RenderStepped:Connect(function()
						if not workspace:IsAncestorOf(Register) then
							ItemName.Visible = false
							StatusText.Visible = false
							DistanceText.Visible = false

							Iu:Disconnect()
						else
							local Vector, OnScreen = Cam:WorldToViewportPoint(Register:FindFirstChild("MainPart").Position)

							if OnScreen then
								ItemName.Position = Vector2.new(Vector.X, Vector.Y - 20)
								StatusText.Position = Vector2.new(Vector.X, Vector.Y - 0)
								DistanceText.Position = Vector2.new(Vector.X, Vector.Y - 10)

								ItemName.Visible = false
								StatusText.Visible = false
								DistanceText.Visible = false

								local ItemDistance = math.ceil((Register:FindFirstChild("MainPart").Position - game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude)

								if ESPSettings.RegisterESP.Enabled == true then
									if ItemDistance < ESPSettings.RegisterESP.Distance then
										ItemName.Visible = true
										StatusText.Visible = true
										DistanceText.Visible = true

										DistanceText.Text = "["..tostring(ItemDistance).."]"

										if Register.Values.Broken.Value == false then
											StatusText.Text = "UnBroken"

											ItemName.Visible = true
											StatusText.Visible = true
											DistanceText.Visible = true

										else
											StatusText.Text = "Broken"

											ItemName.Visible = false
											StatusText.Visible = false
											DistanceText.Visible = false

										end
									else
										ItemName.Visible = false
										StatusText.Visible = false
										DistanceText.Visible = false
									end
								else
									ItemName.Visible = false
									StatusText.Visible = false
									DistanceText.Visible = false

									Iu:Disconnect()
								end
							else
								ItemName.Visible = false
								StatusText.Visible = false
								DistanceText.Visible = false
							end
						end
					end)
				end
				coroutine.wrap(InfoUpdate)()
			end
--#endregion
			

			--Scrap Added
			game:GetService("Workspace").Filter.SpawnedPiles.ChildAdded:Connect(function(Object)
				if ESPSettings.ScrapESP.Enabled == true then
					coroutine.wrap(ScrapESP)(Object)
				end
			end)
			--Infinite Stamina
			local oldStamina
			oldStamina =
				hookfunction(
					getupvalue(getrenv()._G.S_Take, 2),
					function(v1, ...)
						if (Settings.InfiniteStamina) then 
						v1 = 0
					end
						return oldStamina(v1, ...)
					end
				)
			

			--No Jump Cooldown
			local __newindex
			__newindex = hookmetamethod(game, "__newindex", function(t, k, v)
				if (t:IsDescendantOf(Character) and k == "Jump" and v == false) then
					if Settings.NoJumpCooldown == true then
						return
					end
				end

				return __newindex(t, k, v)
			end)
			

			--Auto Pickup
			coroutine.wrap(function()
				game:GetService("RunService").RenderStepped:Connect(function()
					if Settings.AutoPickScrap == true then
						for i, v in pairs(game:GetService("Workspace").Filter.SpawnedPiles:GetChildren()) do
							if Settings.IsDead == false then
								if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v:FindFirstChild("MeshPart").Position).Magnitude < 5 then
									if CoolDowns.AutoPickUps.ScrapCooldown == false then
										CoolDowns.AutoPickUps.ScrapCooldown = true
										game:GetService("ReplicatedStorage").Events.PIC_PU:FireServer(string.reverse(v:GetAttribute("zp")))

										wait(1)

										CoolDowns.AutoPickUps.ScrapCooldown = false
									end
								end
							end 
						end
					end
				end)
			end)()

			coroutine.wrap(function()
				game:GetService("RunService").RenderStepped:Connect(function()
					if Settings.AutoPickTools == true then
						for i, v in pairs(game:GetService("Workspace").Filter.SpawnedTools:GetChildren()) do
							if Settings.IsDead == false then
								if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v:FindFirstChildWhichIsA("MeshPart").Position).Magnitude < 5 then
									if CoolDowns.AutoPickUps.ToolCooldown == false then
										CoolDowns.AutoPickUps.ToolCooldown = true
										game:GetService("ReplicatedStorage").Events.PIC_TLO:FireServer(v:FindFirstChildWhichIsA("MeshPart"))

										wait(1)

										CoolDowns.AutoPickUps.ToolCooldown = false
									end
								end
							end
						end
					end
				end)
			end)()

			coroutine.wrap(function()
				game:GetService("RunService").RenderStepped:Connect(function()
					if Settings.AutoPickCash == true then
						for i, v in pairs(game:GetService("Workspace").Filter.SpawnedBread:GetChildren()) do
							if Settings.IsDead == false then
								if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.Position).Magnitude < 5 then
									if CoolDowns.AutoPickUps.MoneyCooldown == false then
										CoolDowns.AutoPickUps.MoneyCooldown = true
										game:GetService("ReplicatedStorage").Events.CZDPZUS:FireServer(v)

										wait(1)

										CoolDowns.AutoPickUps.MoneyCooldown = false
									end
								end
							end
						end
					end
				end)
			end)()
			

			--FlashBang
			game.Workspace.Camera.ChildAdded:Connect(function(Item)
				if Settings.NoFlashbang == true then
					if Item.Name == "BlindEffect" then
						Item.Enabled = false
					end
				end
			end)

			game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(Item)
				if Item.Name == "FlashedGUI" then
					if Settings.NoFlashbang == true then
						Item.Enabled = false
					end
				end
			end)
			

			--Smoke
			game.Workspace.Debris.ChildAdded:Connect(function(Item)
				if Item.Name == "SmokeExplosion" then
					if Settings.NoSmoke == true then
						wait(0.1)
						Item.Particle1:Destroy()
						Item.Particle2:Destroy()
					end
				end
			end)

			game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(Item)
				if Item.Name == "SmokeScreenGUI" then
					if Settings.NoSmoke == true then
						Item.Enabled = false
					end
				end
			end)

			--Pepper Spray Aura
			coroutine.wrap(function()
				game:GetService("RunService").RenderStepped:Connect(function()
					wait(1)

					if Settings.IsDead == false then
						if Player.Character:FindFirstChild("Pepper-spray") then
							if Settings.PepperSprayAura == true then
								if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v.Character:FindFirstChild("HumanoidRootPart").Position).Magnitude < 15 then
									game.Players.LocalPlayer.Character["Pepper-spray"].RemoteEvent:FireServer("Spray", true)
									game.Players.LocalPlayer.Character["Pepper-spray"].RemoteEvent:FireServer("Hit", v.Character)
								else
									game.Players.LocalPlayer.Character["Pepper-spray"].RemoteEvent:FireServer("Spray", false)
								end
							end
						end
					end
				end)
			end)()
			

			--No Fail Lockpick
			game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(Item)
				if Settings.NoFailLockpick == true then
					if Item.Name == "LockpickGUI" then
						Item.MF["LP_Frame"].Frames.B1.Bar.UIScale.Scale = 10
						Item.MF["LP_Frame"].Frames.B2.Bar.UIScale.Scale = 10
						Item.MF["LP_Frame"].Frames.B3.Bar.UIScale.Scale = 10
					end
				elseif Settings.NoFailLockpick == false then
					if Item.Name == "LockpickGUI" then
						Item.MF["LP_Frame"].Frames.B1.Bar.UIScale.Scale = 1
						Item.MF["LP_Frame"].Frames.B2.Bar.UIScale.Scale = 1
						Item.MF["LP_Frame"].Frames.B3.Bar.UIScale.Scale = 1
					end
				end
			end)
			

			--Dead Checker
			game.Players.LocalPlayer.CharacterAdded:Connect(function(Character)
				repeat wait() until game.Players.LocalPlayer.Character ~= nil and game.Players.LocalPlayer.Character.Parent ~= nil

				Character = Player.Character
				Settings.IsDead = false

				Character:FindFirstChild("Humanoid").Died:Connect(function()

						if Settings.IsDead == false then
							Settings.IsDead = true 
						end
				end)
			end)

			if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Parent then
				Settings.IsDead = false
			end
			

            --Gun Mods
			function GunModules()
				for i,v in pairs(getgc(true)) do 
					if type(v) == 'table' and rawget(v, 'EquipTime') then 
						if Settings.GunMods.NoRecoil == true then
							coroutine.resume(coroutine.create(function()
								v.Recoil = 0
								v.CameraRecoilingEnabled = false
								v.AngleX_Min = 0 
								v.AngleX_Max = 0 
								v.AngleY_Min = 0
								v.AngleY_Max = 0
								v.AngleZ_Min = 0
								v.AngleZ_Max = 0
							end))
						end
						if Settings.GunMods.Spread == true then
							coroutine.resume(coroutine.create(function()
								v.Spread = 0
							end))
						end
						if Settings.GunMods.InstantEquip == true then
							coroutine.resume(coroutine.create(function()
								v.EquipTime = 0
								v.EquipAnimSpeed = 10000000000
							end))
						end
						if Settings.GunMods.InstantAim == true then
							coroutine.resume(coroutine.create(function()
								v.AimSettings.AimSpeed = 0
							end))
							coroutine.resume(coroutine.create(function()
								v.SniperSettings.AimSpeed = 0
								v.SniperSettings.AimAnimSpeed = 10000000000
							end))
						end
					end
				end
			end
		
		game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(Character)
			Character.ChildAdded:Connect(function(Object)
				if Object:IsA("Tool") then
					GunModules()
				end
			end)
		end)
		
		if game:GetService("Players").LocalPlayer.Character ~= nil then
			game:GetService("Players").LocalPlayer.Character.ChildAdded:Connect(function(Object)
				if Object:IsA("Tool") then
					GunModules()
				end
			end)
		end

            coroutine.resume(coroutine.create(function()
				game:GetService("RunService").RenderStepped:Connect(function()
					if SilentSettings.FOVSettings.Visible then 
						SilentAIMFov.Visible = SilentSettings.FOVSettings.Visible
						SilentAIMFov.Color = SilentSettings.SilentAimColor
						SilentAIMFov.Position = GetMousePosition() + Vector2.new(0, 36)
					end
				end)
			end))

			local oldNamecall
			oldNamecall = hookmetamethod(game, "__namecall", function(...)
				local Method = getnamecallmethod()
				local Arguments = {...}
				local self = Arguments[1]
	
				if SilentSettings.Main.Enabled and self == workspace then
					if Method == "Raycast" then
						if ValidateArguments(Arguments, ExpectedArguments.Raycast) then
							local A_Origin = Arguments[2]
	
							local HitPart = GetClosestPlayer()
							if HitPart then
								Arguments[3] = GetDirection(A_Origin, HitPart.Position)
	
								return oldNamecall(unpack(Arguments))
							end
						end
					end
				end
				return oldNamecall(...)
			end)

			-- #region Anti Stuff

		local MT = getrawmetatable(game)
		setreadonly(MT, false)
		local NameCall = MT.__namecall

		MT.__namecall = newcclosure(function(self, ...)
			local Method = getnamecallmethod()
			local Args = {...}

			if Method == "FireServer" and Args[1] == "BHHh" then
				if Settings.NoBarbwire == true then
					return wait(9e9)
				end	
			elseif Method == "FireServer" and Args[1] == "FlllD" or Args[1] == "FlllH" then
				if Settings.NoFallDamage == true then
					return wait(9e9)
				end
			elseif Method == "FireServer" and Args[1] == "__--r" or Args[1] == "HITRGP" then
				if Settings.NoRagdoll == true then
					return wait(9e9)
				end
			elseif Method == "FireServer" and Args[1] == "FllH" then
				if Settings.NoDowned == true then
					return wait(9e9)
				end
			end

			return NameCall(self, ...)
		end)
			

			--Anti Afk
			local VirtualUser = game:GetService("VirtualUser")

			Player.Idled:connect(function()
				VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
				wait(1)
				VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
			end)
			
            --DealerESP
			LibraryESP:AddObjectListener(workspace.Map.Shopz, {
				Name = "Dealer",
				CustomName = "Dealer",
				Color = Color3.fromRGB(197, 253, 255),
				IsEnabled = "DealerESP"
			})

			LibraryESP:AddObjectListener(workspace.Map.Shopz, {
				Name = "ArmoryDealer",
				CustomName = "Armory Dealer",
				Color = Color3.fromRGB(158, 168, 255),
				IsEnabled = "ArmoryDealerESP"
			})
			

			--AtmESP 
			LibraryESP:AddObjectListener(workspace.Map.ATMz, {
				Name = "ATM",
				CustomName = "ATM",
				Color = Color3.fromRGB(197, 255, 120),
				IsEnabled = "AtmESP"
			})


			game:GetService("RunService").RenderStepped:Connect(function()
					
				if Settings.CamFovToggled == true then
					game.Workspace.Camera.FieldOfView = Settings.CamFov
				else
					game.Workspace.Camera.FieldOfView = 70
				end

				if Settings.FullBright == true then
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 14
					game:GetService("Lighting").FogEnd = 100000
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(128, 128, 128)
				end

				if Settings.UnlockDoorsNearby == true then
					if Settings.IsDead == false then
						for i, v in pairs(game:GetService("Workspace").Map.Doors:GetChildren()) do
							if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v:FindFirstChild("DoorBase").Position).Magnitude <= 5 then
								if v:FindFirstChild("Values"):FindFirstChild("Locked").Value == true then
									v:FindFirstChild("Events"):FindFirstChild("Toggle"):FireServer("Unlock", v.Lock)
								end
							end
						end
					end
				end

				if Settings.OpenDoorsNearby == true then
					if Settings.IsDead == false then
						for i, v in pairs(game:GetService("Workspace").Map.Doors:GetChildren()) do
							if (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v:FindFirstChild("DoorBase").Position).Magnitude <= 5 then
								if v:FindFirstChild("Values"):FindFirstChild("Open").Value == false then
									v:FindFirstChild("Events"):FindFirstChild("Toggle"):FireServer("Open", v.Knob2)
								end
							end
						end
					end
				end

				if Settings.IsDead == false then
					if Player.Character:FindFirstChild("Pepper-spray") then
						if Settings.InfinitePepperSpray == true then
							game.Players.LocalPlayer.Character["Pepper-spray"].Ammo.Value = 100
							game.Players.LocalPlayer.Character["Pepper-spray"].RemoteEvent:FireServer("Update", 100)
						end
					end
				end

				if Settings.IsDead == false then
					if Settings.WalkSpeed.Enabled == true then
						Player.Character:FindFirstChild("Humanoid").WalkSpeed = Settings.WalkSpeed.Amount
					end

					if Settings.JumpPower.Enabled == true then
						Player.Character:FindFirstChild("Humanoid").JumpPower = Settings.JumpPower.Amount
					end
				end

				for i, v in pairs(game:GetService("ReplicatedStorage").Storage.HitStuff.Main:GetDescendants()) do
					if v:IsA("Sound") then
						v.Volume = Settings.VolumheadgeeHitsound
					end
				end


				if Player.PlayerGui:FindFirstChild("MouseGUI") then
					Player.PlayerGui:FindFirstChild("MouseGUI").HitmarkerSound.Volume = Settings.VolumeHitsound
					Player.PlayerGui:FindFirstChild("MouseGUI").HeadshotSound.Volume = Settings.VolumeHitsound
				end
			end)

			local Clients = game.Players
local Client = Clients.LocalPlayer

local function KillAura(Target, debounce)

    local ohString1 = "\240\159\154\168"
    local ohNumber2 = tick()
    local ohInstance3 = Client.Character:FindFirstChildOfClass("Tool")
    local ohString4 = "43TRFWJ"
    local ohString5 = "Normal"
    local ohNumber6 = tick() - 0
    local ohBoolean7 = true

    local return_value = game:GetService("ReplicatedStorage").Events["XMHH.1"]:InvokeServer(ohString1, ohNumber2, ohInstance3, ohString4, ohString5, ohNumber6, ohBoolean7)

    wait(debounce)

    local ohString1 = "\240\159\154\168"
    local ohNumber2 = tick()
    local ohInstance3 = Client.Character:FindFirstChildOfClass("Tool")
    local ohString4 = "2389ZFX33"
    local ohNumber5 = return_value
    local ohBoolean6 = false
    local ohInstance7 = Client.Character["Left Arm"]
    local ohInstance8 = Target["Left Arm"]
    local ohInstance9 = Target
    local ohVector310 = Client.Character["Left Arm"].Position
    local ohVector311 = Target["Head"].Position

    for i=1, 4 do

    game:GetService("ReplicatedStorage").Events["XMHH2.1"]:FireServer(ohString1, ohNumber2, ohInstance3, ohString4, ohNumber5, ohBoolean6, ohInstance7, ohInstance8, ohInstance9, ohVector310, ohVector311)
    
    end
end

task.spawn(function()
    while wait(0.07) do
        if Settings.Killaura then
            pcall(function()
                for _,v in next, Clients:GetChildren() do
                    if v.Character and v~=Client then
                        if v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") then
                            if v.Character.Humanoid.Health > 4 then
                                if (v.Character.HumanoidRootPart.Position-Client.Character.HumanoidRootPart.Position).magnitude < 20 then -- to add multiple targets
                                    KillAura(v.Character, 0)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)
--#enderegion

--#region TpHit
local Client = game.Players.LocalPlayer; local Clients = game.Players

local function Hit(Target, Part, Debounce, Debounce2)

	local return_teleport = Client.Character.HumanoidRootPart.CFrame
	local return_value
	local time = tick();
    
	local DebounceArgs = {}

	DebounceArgs[1] = "\240\159\154\168"
	DebounceArgs[2] = time
	DebounceArgs[3] = Client.Character:FindFirstChildOfClass("Tool")
	DebounceArgs[4] = "43TRFWJ"
	DebounceArgs[5] = "Normal"
	DebounceArgs[6] = time - 0
	DebounceArgs[7] = true

	return_value = ReplicatedStorage.Events["XMHH.1"]:InvokeServer(unpack(DebounceArgs))

	wait(Debounce)

		Client.Character.HumanoidRootPart.CFrame = Target["HumanoidRootPart"].CFrame + Vector3.new(0,2,0)

		wait(Debounce2)
        for _,v in next, Clients:GetChildren() do if v ~= Client and v.Character then if v.Character:FindFirstChildOfClass("Humanoid") then
            if (Client.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude < 15 then

		local HitArgs = {}

		HitArgs[1] = "\240\159\154\168"
		HitArgs[2] = time
		HitArgs[3] = Client.Character:FindFirstChildOfClass("Tool")
		HitArgs[4] = "2389ZFX33"
		HitArgs[5] = return_value
		HitArgs[6] = false
		HitArgs[7] = Client.Character["Right Arm"]
		HitArgs[8] = v.Character[Part]
		HitArgs[9] = v.Character
		HitArgs[10] = Client.Character["Right Arm"].Position
		HitArgs[11] = v.Character[Part].Position
		ReplicatedStorage.Events["XMHH2.1"]:FireServer(unpack(HitArgs)) ReplicatedStorage.Events["XMHH2.1"]:FireServer(unpack(HitArgs)) 
		ReplicatedStorage.Events["XMHH2.1"]:FireServer(unpack(HitArgs)) ReplicatedStorage.Events["XMHH2.1"]:FireServer(unpack(HitArgs))
    end
end
end
end
		Client.Character.HumanoidRootPart.CFrame = return_teleport

end

local function Get(String)
    local Found
    local strl = String:lower()

        for i,v in next, Clients:GetChildren() do
            if v.Name:lower():sub(1, #String) == String:lower() or v.DisplayName:lower():sub(1, #String) == String:lower() then
                Found = v.Character
            end
		end

    return Found  
end

local function GetDebounce2(Target)
    local hrp = Target.HumanoidRootPart
    local hrp2 = Client.Character.HumanoidRootPart
    local debounce = 0.1
    
    local mag = (hrp.Position - hrp2.Position).magnitude
    
    if mag/5275 < 0.2 then
        debounce = mag/5275 + 0.85 + mag/tick()

    else

        debounce = 0.2 - mag/52750
    end

    return debounce
end
--#endregion

local SShub = Library:CreateWindow(Name, Vector2.new(492, 650))
local General = SShub:CreateTab("General")
local Combat = SShub:CreateTab("Combat")
local Misc = SShub:CreateTab("Misc")
local Visuals = SShub:CreateTab("Visuals")
local Teleports = SShub:CreateTab("Teleports")
local Settingss = SShub:CreateTab("Settings")

local MainL = General:CreateSector("Player", "left")
local MainL2 = General:CreateSector("Anti Stuff", "right")

local MainCo = Combat:CreateSector("SilentAim", "left")
local MainGun = Combat:CreateSector("Mods", "right")
local MainAur = Combat:CreateSector("Stuff", "right")

local MainMs = Misc:CreateSector("Misc", "left")

local MainP = Visuals:CreateSector("Player ESP", "left")
local MainScrap = Visuals:CreateSector("Scrap ESP", "right")
local MainSafes = Visuals:CreateSector("Safes ESP", "right")
local MainRegister = Visuals:CreateSector("Register ESP", "right")

local MainTo = Teleports:CreateSector("Tower", "right")
local MainEl = Teleports:CreateSector("Elevator", "right")
local MainTele = Teleports:CreateSector("Teleports", "right")

local MainC = Settingss:CreateSector("Credits", "left")
local MainUI = Settingss:CreateSector("UI", "left")

local InfStamina = MainL:AddToggle("Infinite Stamina", Settings.InfiniteStamina, function(V)
	Settings.InfiniteStamina = V
end, "InfStaminaToggle")
InfStamina:AddKeybind("None", "InfStaminaToggle")

MainL:AddToggle("No Jump Cooldown", Settings.NoJumpCooldown, function(V)
	Settings.NoJumpCooldown = V
end)

MainL:AddToggle("Infinite Jump", Settings.SpaceJump, function(V)
	Settings.SpaceJump = V

	game:GetService("UserInputService").JumpRequest:connect(function()
		if Settings.SpaceJump == true then
			game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end
	end)
end)

MainL:AddToggle("Full Brightness", Settings.FullBright, function(V)
	Settings.FullBright = V
end)

local LockPickNofail = MainL:AddToggle("No Fail Lockpick", Settings.NoFailLockpick, function(V)
	Settings.NoFailLockpick = V
end)
LockPickNofail:AddKeybind("None", "LockPickNFToggle")

MainL:AddToggle("No Flash", Settings.NoFlashbang, function(V)
	Settings.NoFlashbang = V
end)

MainL:AddToggle("No Smoke", Settings.NoSmoke, function(V)
	Settings.NoSmoke = V
end)

MainL:AddSlider("Camera Max Zoom", 10, Settings.Zoom, 3000, 10, function(V)
	Player.CameraMaxZoomDistance = V
end)

MainL:AddSeperator("Autos")

local AS = MainL:AddToggle("Auto Scrap", Settings.AutoPickScrap, function(V)
	Settings.AutoPickScrap = V
end, "AutoScrapToggle")
AS:AddKeybind("None", "AutoScrapToggle")

local AT = MainL:AddToggle("Auto Tools", Settings.AutoPickTools, function(V)
	Settings.AutoPickTools = V
end, "AutoTools Toggle")
AT:AddKeybind("None", "AutoTools Toggle")

local AC = MainL:AddToggle("Auto Cash", Settings.AutoPickCash, function(V)
	Settings.AutoPickCash = V
end, "AutoCash Toggle")
AC:AddKeybind("None", "AutoCash Toggle")


local AD = MainL2:AddToggle("Anti Downed", false, function(V)
	Settings.NoDowned = V
end, "ADt")
AD:AddKeybind("None", "ADt")

local AS = MainL2:AddToggle("Anti Stomp", false, function(V)
	_G.AntiStomp = V
	local Downed = game:GetService("ReplicatedStorage").CharStats[game:GetService("Players").LocalPlayer.Name].Downed
	Downed.Changed:Connect(function()
		if Downed.Value == true and _G.AntiStomp == true then
			for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
				if v:IsA("BasePart") then
					v:Destroy()
				end
			end
		end
	end)
end, "ASt")

AS:AddKeybind("None", "ASt")

local DB = MainL2:AddToggle("Anti Barbwire", Settings.NoBarbwire, function(V)
	Settings.NoBarbwire = V
end, "Disablebarb Toggle")
DB:AddKeybind("None", "Disablebarb Toggle")
local DFA = MainL2:AddToggle("Anti Fall Damage", Settings.NoFallDamage, function(V)
	Settings.NoFallDamage = V
end, "DisableFall Toggle")
DFA:AddKeybind("None", "DisableFall Toggle")
local DR = MainL2:AddToggle("Anti Ragdoll", Settings.NoRagdoll, function(V)
	Settings.NoRagdoll = V
end, "DisabelRagdoll Toggle")
DR:AddKeybind("None", "DisabelRagdoll Toggle")

MainL:AddSeperator("Player Mods")
local FOVToggle = MainL:AddToggle("Toggle Fov", Settings.CamFovToggled, function(V)
	Settings.CamFovToggled = V
end, "FOVToggle")

FOVToggle:AddKeybind("None", "FOVToggle")

MainL:AddSlider("Field Of View", 70, Settings.CamFov, 120, 10, function(V)
	Settings.CamFov = V
end)

local WalkSpeedToggle = MainL:AddToggle("WalkSpeed Toggler", Settings.WalkSpeed.Enabled, function(V)
	Settings.WalkSpeed.Enabled = V
end, "WalkSpeedToggle")

WalkSpeedToggle:AddKeybind("None", "WalkSpeedToggle")

local JumpPowerToggle = MainL:AddToggle("JumpPower Toggler", Settings.JumpPower.Enabled, function(V)
	Settings.JumpPower.Enabled = V
end, "JumpPowerToggle")

JumpPowerToggle:AddKeybind("None", "JumpPowerToggle")

MainL:AddSlider("WalkSpeed", 16, Settings.WalkSpeed.Amount, 100, 10, function(V)
	Settings.WalkSpeed.Amount = V
end)

MainL:AddSlider("JumpPower", 30, Settings.JumpPower.Amount, 150, 10, function(V)
	Settings.JumpPower.Amount = V
end)
MainMs:AddToggle("Chat Logs", Settings.ShowChatLogs, function(V)
	Settings.ShowChatLogs = V

	if V == true then
		local ChatFrame = game.Players.LocalPlayer.PlayerGui.Chat.Frame
		ChatFrame.ChatChannelParentFrame.Visible = true
		ChatFrame.ChatBarParentFrame.Position = ChatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), ChatFrame.ChatChannelParentFrame.Size.Y)
	elseif V == false then
		local ChatFrame = game.Players.LocalPlayer.PlayerGui.Chat.Frame
		ChatFrame.ChatChannelParentFrame.Visible = false
		ChatFrame.ChatBarParentFrame.Position = ChatFrame.ChatChannelParentFrame.Position + UDim2.new(0, 0, 0, 0)
	end
end)
MainMs:AddSeperator("Doors")
MainMs:AddToggle("Unlock Nearby Doors", Settings.UnlockDoorsNearby, function(V)
	Settings.UnlockDoorsNearby = V
end)

MainMs:AddToggle("Open Nearby Doors", Settings.OpenDoorsNearby, function(V)
	Settings.OpenDoorsNearby = V
end)

MainMs:AddToggle("NoClip Doors", Settings.NoClip, function(V)
	Settings.NoClip = V

	if Settings.NoClip == true then
		for _, v in pairs(game:GetService("Workspace").Map.Doors:GetChildren()) do
			if v:FindFirstChild("DoorBase") then
				v.DoorBase.CanCollide = false
			end
			if v:FindFirstChild("DoorA") then
				v.DoorA.CanCollide = false
			end
			if v:FindFirstChild("DoorB") then
				v.DoorB.CanCollide = false
			end
			if v:FindFirstChild("DoorC") then
				v.DoorC.CanCollide = false
			end
			if v:FindFirstChild("DoorD") then
				v.DoorD.CanCollide = false
			end
		end
	else
		for _, v in pairs(game:GetService("Workspace").Map.Doors:GetChildren()) do
			if v:FindFirstChild("DoorBase") then
				v.DoorBase.CanCollide = true
			end
			if v:FindFirstChild("DoorA") then
				v.DoorA.CanCollide = true
			end
			if v:FindFirstChild("DoorB") then
				v.DoorB.CanCollide = true
			end
			if v:FindFirstChild("DoorC") then
				v.DoorC.CanCollide = true
			end
			if v:FindFirstChild("DoorD") then
				v.DoorD.CanCollide = true
			end
		end
	end
end)

MainGun:AddToggle("No Recoil", Settings.GunMods.NoRecoil, function(V)
	Settings.GunMods.NoRecoil = V
end)

MainGun:AddToggle("No Spread", Settings.GunMods.Spread, function(V)
	Settings.GunMods.Spread = V
end)

MainGun:AddToggle("Instant Equip", Settings.GunMods.InstantEquip, function(V)
	Settings.GunMods.InstantEquip = V
end)

MainGun:AddToggle("Instant Aim", Settings.GunMods.InstantAim, function(V)
	Settings.GunMods.InstantAim = V
end)
MainGun:AddSeperator("xd")
MainGun:AddButton("WallBang", function()
	game:service[[Workspace]]:FindFirstChild('Map'):FindFirstChild('Parts'):FindFirstChild('M_Parts').Parent = game:service[[Workspace]]:FindFirstChild('Characters')
end)
MainGun:AddButton("Melee God Mode", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Tobias020108Back/YBA-AUT/main/Criminality-Semi-Godmode.lua", true))()
end)

MainGun:AddSeperator("Pepper Spray")
MainGun:AddToggle("Infinite Pepper Spray", Settings.InfinitePepperSpray, function(V)
	Settings.InfinitePepperSpray = V
end)

MainGun:AddToggle("Pepper Spray Aura", Settings.PepperSprayAura, function(V)
	Settings.PepperSprayAura = V
end)
--Silent Aim
local SilentToggle = MainCo:AddToggle("Silent Aim", SilentSettings.Main.Enabled, function(V)
	SilentSettings.Main.Enabled = V
end, "SilentToggle")

SilentToggle:AddKeybind("None", "SilentToggle")

local VC = MainCo:AddToggle("Visible Check", false, function(V)
	 SilentSettings.Main.VisibleCheck = V
end, "VCt")
VC:AddKeybind("None", "VCt")
MainCo:AddDropdown("Hit Part", {"Head", "Torso", "Random"}, "Head", false, function(V)
	SilentSettings.Main.TargetPart = V
end)

MainCo:AddSeperator("- Fov Settings -")

local SilentAimToggle = MainCo:AddToggle("Silent Aim Fov", SilentSettings.FOVSettings.Visible, function(V)
	SilentSettings.FOVSettings.Visible = V
	SilentAIMFov.Visible = V
end, "SilentAimVisible")

SilentAimToggle:AddKeybind("None", "SilentAimVisible")

MainCo:AddSlider("Radius", 5, SilentSettings.FOVSettings.Radius, 1080, 10, function(V)
	SilentSettings.FOVSettings.Radius = V
	SilentAIMFov.Radius = V
end)

local KA = MainAur:AddToggle("KillAura", Settings.Killaura, function(V)
	Settings.Killaura = V
end, "KAT")

KA:AddKeybind("None", "KAT")

MainAur:AddSeperator("Tp Hit")

MainAur:AddTextbox("Player", false, function(V)
	Settings.TpHit.Name = V
	Notification("Tp Hit", "Current Player is: "..Settings.TpHit.Name, ScriptConfg.NotificationsIcon, 5)
end)

MainAur:AddDropdown("Weapon", {"Fists", "FireAxe", "Chainsaw", "Bat"}, Settings.TpHit.Weapon, false, function(V)
	Settings.TpHit.Weapon = V
end)

MainAur:AddDropdown("Hit Part", {"Head", "Torso"}, Settings.TpHit.HitPart, false, function(V)
	Settings.TpHit.HitPart = V
end)

MainAur:AddButton("Tp Hit", function()
		local Target = Get(Settings.TpHit.Name)
		if Settings.TpHit.Weapon == "Fists" then
			Hit(Target, Settings.TpHit.HitPart, Settings.TpHit.Configs.Fists, Settings.TpHit.Configs.Fists[2])
			elseif Settings.TpHit.Weapon == "FireAxe" then
			Hit(Target, Settings.TpHit.HitPart, Settings.TpHit.Configs.FireAxe, Settings.TpHit.Configs.FireAxe[2])
			elseif Settings.TpHit.Weapon == "Chainsaw" then
			Hit(Target, Settings.TpHit.HitPart, Settings.TpHit.Configs.Chainsaw, Settings.TpHit.Configs.Chainsaw[2])
			elseif Settings.TpHit.Weapon == "Bat" then
			Hit(Target, Settings.TpHit.HitPart, Settings.TpHit.Configs.Bat, Settings.TpHit.Configs.Bat[2])
		end
end)

--Player Visuals
local PlayerESPsToggle = MainP:AddToggle("Toggle ESP's", ESPSettings.PlayerESP.Enabled, function(V)
	ESPSettings.PlayerESP.Enabled = V

	LibraryESP.Color = ESPSettings.ESPColor
	LibraryESP.ToolColor = ESPSettings.ToolColor
	LibraryESP.Tracers = ESPSettings.PlayerESP.TracersOn
	LibraryESP.Names = ESPSettings.PlayerESP.NamesOn
	LibraryESP.Health = ESPSettings.PlayerESP.HealthOn
	LibraryESP.Distance = ESPSettings.PlayerESP.DistanceOn
	LibraryESP.Tool = ESPSettings.PlayerESP.ToolOn
	LibraryESP.Boxes = ESPSettings.PlayerESP.BoxesOn
	LibraryESP.FaceCamera = ESPSettings.PlayerESP.FaceCamOn
	LibraryESP:Toggle(ESPSettings.PlayerESP.Enabled)
end, "PlayerESPsToggle")

PlayerESPsToggle:AddKeybind("None", "PlayerESPsToggle")

MainP:AddToggle("Boxes", ESPSettings.PlayerESP.BoxesOn, function(V)
	ESPSettings.PlayerESP.BoxesOn = V
	LibraryESP.Boxes = ESPSettings.PlayerESP.BoxesOn
end)

MainP:AddToggle("Tracers", ESPSettings.PlayerESP.TracersOn, function(V)
	ESPSettings.PlayerESP.TracersOn = V
	LibraryESP.Tracers = ESPSettings.PlayerESP.TracersOn
end)

MainP:AddToggle("Name", ESPSettings.PlayerESP.NamesOn, function(V)
	ESPSettings.PlayerESP.NamesOn = V
	LibraryESP.Names = ESPSettings.PlayerESP.NamesOn
end)

MainP:AddToggle("Health", ESPSettings.PlayerESP.HealthOn, function(V)
	ESPSettings.PlayerESP.HealthOn = V
	LibraryESP.Health = ESPSettings.PlayerESP.HealthOn
end)

MainP:AddToggle("Distance", ESPSettings.PlayerESP.DistanceOn, function(V)
	ESPSettings.PlayerESP.DistanceOn = V
	LibraryESP.Distance = ESPSettings.PlayerESP.DistanceOn
end)

MainP:AddToggle("Tool", ESPSettings.PlayerESP.ToolOn, function(V)
	ESPSettings.PlayerESP.ToolOn = V
	LibraryESP.Tool = ESPSettings.PlayerESP.ToolOn
end)

MainP:AddToggle("Face Cam", ESPSettings.PlayerESP.FaceCamOn, function(V)
	ESPSettings.PlayerESP.FaceCamOn = V
	LibraryESP.FaceCamera = ESPSettings.PlayerESP.FaceCamOn
end)

MainP:AddSeperator("Dealer")

MainP:AddToggle("Drug Dealer", false, function(V)
	LibraryESP.DealerESP = V
end)

MainP:AddToggle("Armory Dealer", false, function(V)
	LibraryESP.ArmoryDealerESP = V
end)

MainP:AddToggle("ATM ESP", false, function(V)
	LibraryESP.AtmESP = V
end)

MainP:AddSlider("ESP Distance", 0, ESPSettings.PlayerESP.Distance, 2000, 10, function(V)
	LibraryESP.DistanceS = V
	ESPSettings.PlayerESP.Distance = V
end)


--Scrap Visuals
local ScrapESPToggle = MainScrap:AddToggle("Scrap ESP", ESPSettings.ScrapESP.Enabled, function(V)
	ESPSettings.ScrapESP.Enabled = V

	if V == true then
		for i, v in pairs(game:GetService("Workspace").Filter.SpawnedPiles:GetChildren()) do
			coroutine.wrap(ScrapESP)(v)
		end
	end
end, "ScrapESPToggle")

ScrapESPToggle:AddKeybind("None", "ScrapESPToggle")

MainScrap:AddSeperator("Rarity")

MainScrap:AddToggle("Legendary Only", ESPSettings.ScrapESP.LegendaryOnly, function(V)
	ESPSettings.ScrapESP.LegendaryOnly = V
end)

MainScrap:AddToggle("Rare Only", ESPSettings.ScrapESP.RareOnly, function(V)
	ESPSettings.ScrapESP.RareOnly = V
end)

MainScrap:AddToggle("Good Only", ESPSettings.ScrapESP.GoodOnly, function(V)
	ESPSettings.ScrapESP.GoodOnly = V
end)

MainScrap:AddToggle("Bad Only", ESPSettings.ScrapESP.BadOnly, function(V)
	ESPSettings.ScrapESP.BadOnly = V
end)

-- MainScrap:AddSeperator("Distance")

MainScrap:AddSlider("Scrap Distance", 0, ESPSettings.ScrapESP.Distance, 2000, 10, function(V)
	ESPSettings.ScrapESP.Distance = V
end)


--Safe Visuals
local SafeESPToggle = MainSafes:AddToggle("Safe ESP", ESPSettings.SafeESP.Enabled, function(V)
	ESPSettings.SafeESP.Enabled = V

	if V == true then
		for i, v in pairs(game:GetService("Workspace").Map.BredMakurz:GetChildren()) do
			if tonumber(v:FindFirstChild("Type").Value) == 2 then
				coroutine.wrap(SafeESP)(v, 2)
			elseif tonumber(v:FindFirstChild("Type").Value) == 3 then
				coroutine.wrap(SafeESP)(v, 3)
			end
		end
	end
end, "SafeESPToggle")

SafeESPToggle:AddKeybind("None", "SafeESPToggle")

MainSafes:AddSeperator("Rarity")

MainSafes:AddToggle("Big Only", ESPSettings.SafeESP.BigOnly, function(V)
	ESPSettings.SafeESP.BigOnly = V
end)

MainSafes:AddToggle("Small Only", ESPSettings.SafeESP.SmallOnly, function(V)
	ESPSettings.SafeESP.SmallOnly = V
end)

MainSafes:AddSeperator("Distance")

MainSafes:AddSlider("Safe Distance", 0, ESPSettings.SafeESP.Distance, 2000, 10, function(V)
	ESPSettings.SafeESP.Distance = V
end)


--Register Visuals
local RegisterESPToggle = MainRegister:AddToggle("Register ESP", ESPSettings.RegisterESP.Enabled, function(V)
	ESPSettings.RegisterESP.Enabled = V

	if V == true then
		for i, v in pairs(game:GetService("Workspace").Map.BredMakurz:GetChildren()) do
			if tonumber(v:FindFirstChild("Type").Value) == 1 then
				coroutine.wrap(RegisterESP)(v)
			end
		end
	end
end, "RegisterESPToggle")

RegisterESPToggle:AddKeybind("None", "RegisterESPToggle")

MainRegister:AddSeperator("Distance")

MainRegister:AddSlider("Register Distance", 2000, ESPSettings.RegisterESP.Distance, 2000, 10, function(V)
	ESPSettings.RegisterESP.Distance = V
end)

MainC:AddLabel("Tupi")

local ToggleToggleUI = MainUI:AddToggle("UI Shortcut", true, function(V)
	game:GetService("RunService").RenderStepped:Wait()
	game:GetService("CoreGui"):FindFirstChild(Name).Enabled = V
end)

ToggleToggleUI:AddKeybind(Enum.KeyCode.LeftAlt)

MainUI:AddToggle("Show Ui Cursor", true, function(V)
	Library.theme.cursor = V
	SShub:UpdateTheme()
end)

MainUI:AddColorpicker("Accent 1", LibraryConfg.AccentColors.Accent1, function(V)
Library.theme.accentcolor = V
SShub:UpdateTheme()
end)

MainUI:AddColorpicker("Accent 2", LibraryConfg.AccentColors.Accent2, function(V)
Library.theme.accentcolor2 = V
SShub:UpdateTheme()
end)

MainUI:AddColorpicker("Text Color", LibraryConfg.AccentColors.Accent2, function(V)
Library.theme.tabstextcolor = V
SShub:UpdateTheme()
end)


--Teleports Tab

local function TeleportAreaNew(Cframe)

	local TPCFrame = Cframe
	local User = game.Players.LocalPlayer.Character.HumanoidRootPart

	User.CFrame = TPCFrame
end

-- TeleportNew1:AddSeperator("Vibe In-N-Out")
local db = false
local db1 = false
local db2 = false
local db3 = false

local function PartThin(p)
	p.Anchored = true
	p.Size = Vector3.new(2, 10, 2)
	p.Material = Enum.Material.ForceField
	p.Color = Color3.fromRGB(255, 255, 255)
	p.CanCollide = false
	p.Transparency = 1
end

local part = Instance.new("Part", workspace)
PartThin(part)
part.Position = Vector3.new(-4766.666, -32.768, -818.809)

local part1 = Instance.new("Part", workspace)
PartThin(part1)
part1.Position = Vector3.new(-4770.976, -198.929, -842.684)

local tow = Instance.new("Part", workspace)
PartThin(tow)
tow.Position = Vector3.new(-4525.734, 9.314, -778.03)

local tow1 = Instance.new("Part", workspace)
PartThin(tow1)
tow1.Position = Vector3.new(-4525.795, 85.759, -778.03)

part.Touched:Connect(function()
	if Player and Settings.ElevatorTP then
		if not db and not db1 then
			db = true
			TeleportAreaNew(CFrame.new(-4770.976, -198.929, -842.684))
			wait(1)
			db = false
		end
	end
end)

part1.Touched:Connect(function()
	if Player and Settings.ElevatorTP then
		if not db1 and not db then
			db1 = true
			TeleportAreaNew(CFrame.new(-4766.666, -32.768, -818.809))
			wait(1)
			db1 = false
		end
	end
end)

tow.Touched:Connect(function()
	if Player and Settings.TowerTP then
		if not d2 and not db3 then
			db2 = true
			TeleportAreaNew(CFrame.new(-4525.795, 85.759, -778.03))
			wait(1)
			db2 = false
		end
	end
end)

tow1.Touched:Connect(function()
	if Player and Settings.TowerTP then
		if not db3 and not db2 then
			db3 = true
			TeleportAreaNew(CFrame.new(-4525.734, 9.314, -778.03))
			wait(1)
			db3 = false
		end
	end
end)

MainEl:AddToggle("Elevator", Settings.ElevatorTP, function(V)
	Settings.ElevatorTP = V

	if Settings.ElevatorTP == true then
		part.Transparency = 0
		part1.Transparency = 0
	else
		part.Transparency = 1
		part1.Transparency = 1
	end
end)

MainTo:AddToggle("Tower", Settings.TowerTP, function(V)
	Settings.TowerTP = V

	if Settings.TowerTP == true then
		tow.Transparency = 0
		tow1.Transparency = 0
	else
		tow.Transparency = 1
		tow1.Transparency = 1
	end
end)

MainTele:AddSeperator("Elevator")

MainTele:AddButton("Elevator Up", function()
	TeleportAreaNew(CFrame.new(-4768.198, -34.303, -817.605))
end)

MainTele:AddButton("Elevator Down", function()
	TeleportAreaNew(CFrame.new(-4776.88, -201.662, -823.827))
end)

MainTele:AddSeperator("Tower")

MainTele:AddButton("Tower Up", function()
	TeleportAreaNew(CFrame.new(-4519.51, 85.714, -773.943))
end)
end
if game:GetService("Players").LocalPlayer.Character ~= nil then
		if not CoreGui:FindFirstChild(Name) then
			LoadFunctions()
		elseif CoreGui:FindFirstChild(Name) then
			Notify(NS.Title,NS.Icon,"Script Alredy Loaded")
		end
	else
	Notify(NS.Title,NS.Icon,"Join game to script get loaded.")
	if game:GetService("Players").LocalPlayer.CharacterAdded then
			if not CoreGui:FindFirstChild(Name) then
				LoadFunctions()
			elseif CoreGui:FindFirstChild(Name) then
				Notify(NS.Title,NS.Icon,"Script Alredy Loaded")
			end
	end
end