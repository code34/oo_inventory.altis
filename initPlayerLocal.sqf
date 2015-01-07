	call compilefinal preprocessFileLineNumbers "oo_inventory.sqf";

	// create a new inventory 
	_inventory = ["new", []] call OO_INVENTORY;

	// save the inventory of player
	_inventory = ["save", player] call OO_INVENTORY;

	// load the inventory of player to player
	_inventory = ["load", player] call OO_INVENTORY;

	// clear the inventory of player
	_inventory = ["clear", player] call OO_INVENTORY;