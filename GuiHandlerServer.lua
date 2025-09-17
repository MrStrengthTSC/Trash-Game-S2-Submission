--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

--// Required Modules
local TrashSystem = require(game.ServerScriptService.Modules.TrashSystem)
local Shared = require(game.ServerScriptService.Modules.Database)

--// Remote Functions
local GetData = ReplicatedStorage.RemoteFunctions:WaitForChild("GetData")

GetData.OnServerInvoke = function(player: Player)
	local profile = TrashSystem.GetLoadedProfile(player)
	if not profile then return nil end

	local invBoostLevel = profile.invBoostLevel
	local maxBottles = Shared.INV_BOOST_LEVELS[invBoostLevel]

	return {
		coins = profile.coins,
		maxBottles = maxBottles,
		recyclePoints = profile.recyclePoints,
		bottleInventory = profile.bottle_inventory
	}
end
