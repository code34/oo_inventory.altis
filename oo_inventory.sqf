	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2013-2018 Nicolas BOITEUX

	CLASS OO_INVENTORY simple inventory class
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	#include "oop.h"

	CLASS("OO_INVENTORY")
		PRIVATE VARIABLE("object","unit");

		PUBLIC FUNCTION("object","constructor") { 
			MEMBER("unit", _this);
		};

		PUBLIC FUNCTION("","getVersion") {
			"0.5";
		};

		PUBLIC FUNCTION("object","setUnit") {
			MEMBER("unit", _this);
		};

		PUBLIC FUNCTION("","clearInventory") {
			private _unit = MEMBER("unit", nil);

			removeallweapons _unit;
			removeGoggles _unit;
			removeHeadgear _unit;
			removeVest _unit;
			removeUniform _unit;
			removeAllAssignedItems _unit;
			removeBackpack _unit;
		};

		PUBLIC FUNCTION("","clearBackpack") {
			clearAllItemsFromBackpack MEMBER("unit", nil);
		};

		PUBLIC FUNCTION("","clearBackpackItems") {
			{
				if(!(_x isEqualTo "") and (_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					 MEMBER("unit", nil) removeItemFromBackpack _x;
				};
				sleep 0.001;
			} foreach (backpackItems MEMBER("unit", nil));
		};

		PUBLIC FUNCTION("","clearBackpackWeapons") {
			{
				if(!(_x isEqualTo "") and !(_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					 MEMBER("unit", nil) removeItemFromBackpack _x;
				};
				sleep 0.001;
			} foreach (backpackItems MEMBER("unit", nil));
		};		

		PUBLIC FUNCTION("","clearVest") {
			{
				MEMBER("unit", nil) removeItemFromVest _x;
				sleep 0.001;
			} foreach (vestItems MEMBER("unit", nil));
		};

		PUBLIC FUNCTION("","clearVestItems") {
			{
				if(!(_x isEqualTo "") and (_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					 MEMBER("unit", nil) removeItemFromVest _x;
				};
				sleep 0.001;
			} foreach (vestItems MEMBER("unit", nil));
		};

		PUBLIC FUNCTION("","clearVestWeapons") {
			{
				if(!(_x isEqualTo "") and !(_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					 MEMBER("unit", nil) removeItemFromVest _x;
				};
				sleep 0.001;
			} foreach (vestItems MEMBER("unit", nil));
		};

		PUBLIC FUNCTION("","clearUniform") {
			{
				MEMBER("unit", nil) removeItemFromUniform _x;
				sleep 0.001;
			} foreach (uniformItems MEMBER("unit", nil));
		};

		PUBLIC FUNCTION("","clearUniformItems") {
			{
				if(!(_x isEqualTo "") and (_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					 MEMBER("unit", nil) removeItemFromUniform _x;
				};
				sleep 0.001;
			} foreach (uniformItems MEMBER("unit", nil));
		};

		PUBLIC FUNCTION("","clearUniformWeapons") {
			{
				if(!(_x isEqualTo "") and !(_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					 MEMBER("unit", nil) removeItemFromUniform _x;
				};
				sleep 0.001;
			} foreach (uniformItems MEMBER("unit", nil));
		};

		PUBLIC FUNCTION("","takeOffInventory") {
			private _holder = "groundweaponholder" createVehicle position MEMBER("unit", nil);
			_holder setpos (position MEMBER("unit", nil));

			{
				if(_x isEqualType "") then {
					_holder addItemCargoGlobal [_x , 1] ;
				} else {
					{
						_holder addItemCargoGlobal [_x , 1] ;
						sleep 0.001;
					}foreach _x;
				};
				sleep 0.001;
			} foreach MEMBER("getInventory", nil);
			MEMBER("clearInventory", nil);
			_holder;			
		};

		PUBLIC FUNCTION("","takeOffVest") {
			private _holder = "groundweaponholder" createVehicle position MEMBER("unit", nil);
			_holder setpos (position MEMBER("unit", nil));
			_holder addItemCargoGlobal [(vest MEMBER("unit", nil)) , 1] ;

			{
				_holder addItemCargoGlobal [_x , 1] ;
				sleep 0.001;
			} foreach (vestItems MEMBER("unit", nil));
			removeVest MEMBER("unit", nil);
			_holder;
		};

		PUBLIC FUNCTION("","takeOffUniform") {
			private _holder = "groundweaponholder" createVehicle position MEMBER("unit", nil);
			_holder setpos (position MEMBER("unit", nil));
			_holder addItemCargoGlobal [(uniform MEMBER("unit", nil)) , 1] ;

			{
				_holder addItemCargoGlobal [_x , 1] ;
				sleep 0.001;
			} foreach (uniformItems MEMBER("unit", nil));
			removeUniform MEMBER("unit", nil);
			_holder;
		};

		PUBLIC FUNCTION("","takeOffBackPack") {	
			MEMBER("unit", nil) addBackpack (backpack MEMBER("unit", nil));
			removeBackpack MEMBER("unit", nil);
		};

		PUBLIC FUNCTION("","takeOffPrimaryWeapon") {
			private _holder = "groundweaponholder" createVehicle position MEMBER("unit", nil);
			_holder setpos (position MEMBER("unit", nil));
			_holder addItemCargoGlobal [(primaryWeapon MEMBER("unit", nil)) , 1] ;

		 	{
				if((_x select 3 == 1) and !(_x select 4 in ["Vest", "Uniform", "Backpack"])) then {
					_holder addMagazineAmmoCargo [_x select 0, 1, _x select 1] ;
				};
				sleep 0.001;
			}foreach (magazinesAmmoFull MEMBER("unit", nil));
			MEMBER("unit", nil) removeWeaponGlobal (primaryWeapon MEMBER("unit", nil));
			_holder;
		};

		PUBLIC FUNCTION("","takeOffSecondaryWeapon") {
			private _holder = "groundweaponholder" createVehicle position MEMBER("unit", nil);
			_holder setpos (position MEMBER("unit", nil));
			_holder addItemCargoGlobal [(secondaryWeapon MEMBER("unit", nil)) , 1] ;
		
			{
				if((_x select 3 == 4) and !(_x select 4 in ["Vest", "Uniform", "Backpack"])) then {
					_holder addMagazineAmmoCargo [_x select 0, 1, _x select 1] ;
				};
				sleep 0.001;
			}foreach (magazinesAmmoFull MEMBER("unit", nil));
			MEMBER("unit", nil) removeWeaponGlobal (secondaryWeapon MEMBER("unit", nil));
			_holder;
		 };

		 PUBLIC FUNCTION("","takeOffHandGun") {
			private _holder = "groundweaponholder" createVehicle position MEMBER("unit", nil);
			_holder setpos (position MEMBER("unit", nil));
			_holder addItemCargoGlobal [(handgunWeapon MEMBER("unit", nil)) , 1] ;

			{
				if((_x select 3 == 2) and !(_x select 4 in ["Vest", "Uniform", "Backpack"])) then {
					_holder addMagazineAmmoCargo [_x select 0, 1, _x select 1] ;
				};
				sleep 0.001;
			}foreach (magazinesAmmoFull MEMBER("unit", nil));
			MEMBER("unit", nil) removeWeaponGlobal (handgunWeapon MEMBER("unit", nil));
			_holder;
		 };

		PUBLIC FUNCTION("","getInventory") {	
			private _unit = MEMBER("unit", nil);
			
			private _array = [
				(headgear _unit), 
				(goggles _unit), 
				(uniform _unit), 
				(UniformItems _unit), 
				(vest _unit), 
				(VestItems _unit), 
				(backpack _unit), 
				(backpackItems _unit), 
				(magazinesAmmoFull _unit),
				(primaryWeapon _unit), 
				(primaryWeaponItems _unit),
				(secondaryWeapon _unit),
				(secondaryWeaponItems _unit),
				(handgunWeapon _unit),
				(handgunItems _unit),
				(assignedItems _unit)
			];
			_array;
		};

		PUBLIC FUNCTION("","getPrimaryWeaponType") {
			primaryWeapon MEMBER("unit", nil);
		};

		PUBLIC FUNCTION("","getSecondaryWeaponType") {
			secondaryWeapon MEMBER("unit", nil);
		};

		PUBLIC FUNCTION("","getHandGunType") {
			handgunWeapon MEMBER("unit", nil);
		};

		PUBLIC FUNCTION("","getBackPackType") {
			backpack MEMBER("unit", nil);
		};

		PUBLIC FUNCTION("","getVestType") {
			vest MEMBER("unit", nil);
		};

		PUBLIC FUNCTION("","getUniformType") {
			uniform MEMBER("unit", nil);
		};

		PUBLIC FUNCTION("","getBackPack") {
			unitBackpack MEMBER("unit", nil);
		};

		PUBLIC FUNCTION("","getUniformItems") {
			private _array = [];

			{
				if(!(_x isEqualTo "") and (_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					_array pushBack _x;
				};
				sleep 0.001;
			} foreach (uniformItems MEMBER("unit", nil));
			_array;
		};

		PUBLIC FUNCTION("","getUniformWeapons") {
			private _array = [];

			{
				if(!(_x isEqualTo "") and !(_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					_array pushBack _x;
				};
				sleep 0.001;
			} foreach (uniformItems MEMBER("unit", nil));
			_array;
		};		

		PUBLIC FUNCTION("","getVestItems") {
			private _array = [];

			{
				if(!(_x isEqualTo "") and (_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					_array pushBack _x;
				};
				sleep 0.001;
			} foreach (vestItems MEMBER("unit", nil));
			_array;
		};

		PUBLIC FUNCTION("","getVestWeapons") {
			private _array = [];

			{
				if(!(_x isEqualTo "") and !(_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					_array pushBack _x;
				};
				sleep 0.001;
			} foreach (vestItems MEMBER("unit", nil));
			_array;
		};		

		PUBLIC FUNCTION("","getBackPackItems") {
			private _array = [];

			{
				if(!(_x isEqualTo "") and (_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					_array pushBack _x;
				};
				sleep 0.001;
			} foreach (backpackItems MEMBER("unit", nil));
			_array;
		};

		PUBLIC FUNCTION("","getBackPackWeapons") {
			private _array = [];

			{
				if(!(_x isEqualTo "") and !(_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					_array pushBack _x;
				};
				sleep 0.001;
			} foreach (backpackItems MEMBER("unit", nil));
			_array;
		};


		PUBLIC FUNCTION("string","getAmmoLoadedType") {
			private _ammo = "";
			private _type = 1;

			switch (tolower _this) do {
				case "primaryweapon" : {
					_type = 1;
				};

				case "secondaryweapon" : {
					_type = 4;
				};

				case "handgun" : {
					_type = 2;
				};

				case "grenade" : {
					_type = 0;
				};

				default {
					_type = 1;
				};
			};

			{
				if((_x select 3 == _type) and !(_x select 4 in ["Vest", "Uniform", "Backpack"])) then {
					_ammo = _x select 0;
				};
				sleep 0.001;
			}foreach (magazinesAmmoFull MEMBER("unit", nil));
			_ammo;
		};

		PUBLIC FUNCTION("string","getAmmoCountByType") {
			private _type = _this;
			private _count = 0;

			{
				if((_x select 0) isEqualTo _type)  then {
					_count = (_x select 1) + _count;
				};
				sleep 0.001;
			}foreach (magazinesAmmoFull MEMBER("unit", nil));
			_count;
		};

		PUBLIC FUNCTION("string","getMagazinesCountByType") {
			private _type = _this;
			private _count = 0;

			{
				if((_x select 0)  isEqualTo _type)  then { 
					_count = _count + 1;
				};
				sleep 0.001;
			}foreach (magazinesAmmoFull MEMBER("unit", nil));
			_count;
		};

		PUBLIC FUNCTION("string","getAmmoCountByWeapon") {
			private _count = 0;
			private _type = "";

			switch (tolower _this) do {
				case "primaryweapon" : {
					_type = (primaryWeaponMagazine MEMBER("unit", nil)) select 0;
				};

				case "secondaryweapon" : {
					_type = (secondaryWeaponMagazine MEMBER("unit", nil)) select 0;
				};

				case "handgun" : {
					_type = (handgunMagazine MEMBER("unit", nil)) select 0;
				};

				default {
					_type = (primaryWeaponMagazine MEMBER("unit", nil)) select 0;
				};
			};

			if(isnil "_type") then {_type = "";};
			MEMBER("getAmmoCountByType", _type);
		};

		PUBLIC FUNCTION("string","getAmmoLoadedCount") {
			private _count = 0;
			private _type = "";

			switch (tolower _this) do {
				case "primaryweapon" : {
					_type = 1;
				};

				case "secondaryweapon" : {
					_type = 4;
				};

				case "handgun" : {
					_type = 2;
				};

				case "grenade" : {
					_type = 0;
				};

				default {
					_type = 1;
				};
			};

			{
				if((_x select 3 == _type) and !(_x select 4 in ["Vest", "Uniform", "Backpack"])) then {
					_count = _x select 1;
				};
				sleep 0.001;
			}foreach (magazinesAmmoFull MEMBER("unit", nil));
			_count;
		};

		PUBLIC FUNCTION("","hasBackPack") {
			if(backpack MEMBER("unit", nil) isEqualTo "") then { false;} else {true;};
		};

		PUBLIC FUNCTION("","hasVest") {
			if(vest MEMBER("unit", nil) isEqualTo "") then { false;} else {true;};
		};

		PUBLIC FUNCTION("","hasUniform") {
			if(uniform MEMBER("unit", nil) isEqualTo "") then { false;} else {true;};
		};

		PUBLIC FUNCTION("","hasPrimaryWeapon") {
			if(primaryWeapon MEMBER("unit", nil) isEqualTo "") then { false;} else {true;};
		};

		PUBLIC FUNCTION("","hasSecondaryWeapon") {
			if(secondaryWeapon MEMBER("unit", nil) isEqualTo "") then { false;} else {true;};
		};

		PUBLIC FUNCTION("","hasHandGun") {
			if(handgunWeapon MEMBER("unit", nil) isEqualTo "") then { false;} else {true;};
		};

		PUBLIC FUNCTION("","hasHeadGear") {
			if(headgear MEMBER("unit", nil) isEqualTo "") then { false;} else {true;};
		};

		PUBLIC FUNCTION("","hasGoggles") {
			if(goggles MEMBER("unit", nil) isEqualTo "") then { false;} else {true;};
		};

		PUBLIC FUNCTION("array","setInventory") {
			private _array = _this;
			private _unit = MEMBER("unit", nil);

			MEMBER("clearInventory", _unit);

			private _headgear = _array select 0;
			private _goggles = _array select 1;
			private _uniform = _array select 2;
			private _uniformitems = _array select 3;
			private _vest = _array select 4;
			private _vestitems = _array select 5;
			private _backpack = _array select 6;
			private _backpackitems = _array select 7;
			private _fullmagazine = _array select 8;
			private _primaryweapon = _array select 9;
			private _primaryweaponitems = _array select 10;
			private _secondaryweapon = _array select 11;
			private _secondaryweaponitems = _array select 12;
			private _handgunweapon = _array select 13;
			private _handgunweaponitems = _array select 14;
			private _assigneditems = _array select 15;

			_unit addHeadgear _headgear;
			_unit forceAddUniform _uniform;
			_unit addGoggles _goggles;
			_unit addVest _vest;

			{
				if(!(_x isEqualTo "") and (_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					_unit addItemToUniform _x;
				};
			}foreach _uniformitems;
	
			{
				if(!(_x isEqualTo "") and (_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
					_unit addItemToVest _x;
				};
			}foreach _vestitems;
	
			if!(_backpack isEqualTo "") then {
				_unit addbackpack _backpack;
				{
					if(!(_x isEqualTo "") and (_x isKindOf ["ItemCore", configFile >> "CfgWeapons"] )) then {
						_unit addItemToBackpack _x;
					};
				} foreach _backpackitems;
			};
	
			{
				if!(_x isEqualTo "") then {
					_unit addMagazine [_x select 0, _x select 1];
				};
			} foreach _fullmagazine;

			//must be after assign items to secure loading mags
			_unit addweapon _primaryweapon;
	
			{
				if(_x != "") then {
					_unit addPrimaryWeaponItem _x;
				};
			} foreach _primaryweaponitems;

			_unit addweapon _secondaryweapon;
	
			{
				if(_x != "") then {
					_unit addSecondaryWeaponItem _x;
				};
			} foreach _secondaryweaponitems;
	

			_unit addweapon _handgunweapon;
	
			{
				if(_x != "") then {
					_unit addHandgunItem _x;
				};
			} foreach _handgunweaponitems;
	
			{
				if(_x != "") then {
					_unit addweapon _x;
				};
			} foreach _assigneditems;

			if (needReload _unit == 1) then {reload _unit};
		};

		PUBLIC FUNCTION("","deconstructor") {
			DELETE_VARIABLE("unit");
		 };
	ENDCLASS;