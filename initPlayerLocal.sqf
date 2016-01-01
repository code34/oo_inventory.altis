	call compilefinal preprocessFileLineNumbers "oo_inventory.sqf";

	// create a new inventory 
	_inventory = ["new", toto] call OO_INVENTORY;

	// get inventory content
	_array = "getInventory" call _inventory;
	hint format ["inventory content: %1", _array];
	sleep 2;

	// Clear inventory of character
	"clearInventory" call _inventory;
	sleep 2;

	// set inventory
	["setInventory", _array] call _inventory;
	hint "set Inventory back";
	sleep 2;

	// check if backpack
	_result = "hasBackPack" call _inventory;
	hint format ["has backpack %1", _result];
	sleep 2;

	// check if vest
	_result = "hasVest" call _inventory;
	hint format ["has Vest %1", _result];
	sleep 2;	

	// check if uniform
	_result = "hasUniform" call _inventory;
	hint format ["has Uniform %1", _result];
	sleep 2;	

	// check if goggle
	_result = "hasGoggles" call _inventory;
	hint format ["has Goggles %1", _result];
	sleep 2;		

	// check if goggle
	_result = "hasPrimaryWeapon" call _inventory;
	hint format ["has Primary Weapon %1", _result];
	sleep 2;		

	_result = "hasSecondaryWeapon" call _inventory;
	hint format ["has Secondary Weapon %1", _result];
	sleep 2;

	_result = "hasHandGun" call _inventory;
	hint format ["has Hand Gun %1", _result];
	sleep 2;

	_result = "hasHeadGear" call _inventory;
	hint format ["has Head Gear %1", _result];
	sleep 2;		