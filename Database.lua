local Shared = {}

Shared.DEFAULT_PLAYER_DATA = {
	coins = 0,
	recyclePoints = 0,

	bottle_inventory = {
		common = 0,
		rare = 0,
		epic = 0,
		legendary = 0,
		mythic = 0,
		admin = 0
	},

	coinBoostLevel = 1,  
	invBoostLevel  = 1,   
	speedBoostLevel = 1
}

Shared.COIN_BOOST_LEVELS  = {1, 1.5, 1.8, 2.5, 3}
Shared.INV_BOOST_LEVELS   = {10, 12, 14, 18, 22}
Shared.SPEED_BOOST_LEVELS = {16, 20, 34, 38, 42}

return Shared
