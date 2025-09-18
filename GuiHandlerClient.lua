--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// UI Elements
local bottlesAmountLabel = playerGui.Currency.Bottles:WaitForChild("Amount")
local coinsAmountLabel = playerGui.Currency.Holder.Coins:WaitForChild("Amount")
local recycledAmountLabel = playerGui.Currency.Holder.Recycled:WaitForChild("Amount")

--// Remotes
local UpdateInventoryEvent = ReplicatedStorage.RemoteEvents:WaitForChild("UpdateInventory")
local GetDataFunction = ReplicatedStorage.RemoteFunctions:WaitForChild("GetData")

--// Initial Values
local maxBottleCapacity = 0
local bottleInventory = {}
local coinBalance = 0
local recyclePoints = 0

--// Initial Data Fetch
local playerData = GetDataFunction:InvokeServer()

if playerData then
	maxBottleCapacity = playerData.maxBottles
	bottleInventory = playerData.bottleInventory
	coinBalance = playerData.coins
	recyclePoints = playerData.recyclePoints
end

local function updateGUI(data)
	if not data then return end

	bottleInventory = data.bottle_inventory or bottleInventory
	coinBalance = data.coins or coinBalance
	recyclePoints = data.recyclePoints or recyclePoints
	maxBottleCapacity = data.maxBottles or maxBottleCapacity 

	local totalBottles = 0
	for _, count in pairs(bottleInventory) do
		totalBottles += count
	end

	bottlesAmountLabel.Text = string.format("%d / %d", totalBottles, maxBottleCapacity)
	coinsAmountLabel.Text = string.format("%d", math.round(coinBalance))
	recycledAmountLabel.Text = string.format("%d", math.round(recyclePoints))
end

--// Initialize GUI
updateGUI({
	bottle_inventory = bottleInventory,
	coins = coinBalance,
	recyclePoints = recyclePoints,
	maxBottles = maxBottleCapacity
})

UpdateInventoryEvent.OnClientEvent:Connect(updateGUI)


