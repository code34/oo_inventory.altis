	call compilefinal preprocessFileLineNumbers "oo_inventory.sqf";

	// create a new inventory 
	_inventory = ["new", toto] call OO_INVENTORY;

	toto fire ("getPrimaryWeaponType" call _inventory);
	sleep 2;

	hint format ["Secondary ammo type %1 count %2", ["getAmmoLoadedType", "secondaryweapon"] call _inventory, ["getAmmoLoadedCount", "secondaryweapon"] call _inventory];
	sleep 2;

	toto fire ("getHandGunType" call _inventory);
	sleep 2;

	// get Backpack
	_result = "getBackPackItems" call _inventory;
	hint format ["Backpack Items: %1 ", _result];
	sleep 2;	

	// get Backpack
	_result = "getBackPackWeapons" call _inventory;
	hint format ["Backpack Weapons: %1 ", _result];
	sleep 2;	

	// get Backpack
	_result = "getBackPackType" call _inventory;
	hint format ["Backpack: %1 ", _result];
	sleep 2;

	// get current ammos 
	_count = ["getAmmoLoadedCount", "primaryweapon"] call _inventory;
	hint format ["Nb of ammos loaded in primary weapon %1", _count];
	sleep 2;

	// get current ammos 
	_count = ["getAmmoLoadedCount", "secondaryweapon"] call _inventory;
	hint format ["Nb of ammos loaded in secondary weapon %1", _count];
	sleep 2;	

	// get current ammos 
	_count = ["getAmmoLoadedCount", "handgun"] call _inventory;
	hint format ["Nb of ammos loaded in hand gun %1", _count];
	sleep 2;	

	// get current ammos 
	_count = ["getAmmoLoadedCount", "grenade"] call _inventory;
	hint format ["Nb of ammos loaded in grenade %1", _count];
	sleep 2;	

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

	["setUnit", tata] call _inventory;
	hint "change to next unit";
	sleep 2;

	// Clear inventory of character
	"clearInventory" call _inventory;
	hint "clear inventory of next unit";
	sleep 2;

	// set inventory
	["setInventory", _array] call _inventory;
	hint "set same Inventory as first unit";
	sleep 2;


