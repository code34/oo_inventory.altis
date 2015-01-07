	call compilefinal preprocessFileLineNumbers "oo_inventory.sqf";

	// create a new inventory 
	_inventory = ["new", []] call OO_INVENTORY;

	// save the inventory of player
	["save", player] call _inventory;

	sleep 2;

	// clear the inventory of player
	 ["clear", player] call _inventory;	

	sleep 2;

	// load the inventory of player to player
	["load", player] call _inventory;

	sleep 2;

	// retrive inventory and copy it to clipboard
	_loadout = "getInventory" call _inventory;
	copytoclipboard str(_loadout);

	// load it on civil guy
	["setInventory", _loadout] call _inventory;
	["load", toto] call _inventory;	

	["delete", _inventory] call OO_INVENTORY;
	hint str("getInventory" call _inventory);