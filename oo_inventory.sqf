	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2013-2016 Nicolas BOITEUX

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

		PUBLIC FUNCTION("object","setUnit") {
			MEMBER("unit", _this);
		};

		PUBLIC FUNCTION("","clearInventory") {
			private ["_unit"];

			_unit = MEMBER("unit", nil);

			removeallweapons _unit;
			removeGoggles _unit;
			removeHeadgear _unit;
			removeVest _unit;
			removeUniform _unit;
			removeAllAssignedItems _unit;
			removeBackpack _unit;
		};
	
		PUBLIC FUNCTION("","getInventory") {
			private ["_array", "_unit"];
			
			_unit = MEMBER("unit", nil);
			
			_array = [
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

		PUBLIC FUNCTION("","hasBackpack") {
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
			private ["_array", "_headgear", "_goggles", "_uniform", "_uniformitems", "_vest", "_vestitems", "_backpack", "_backpackitems", "_primaryweapon", "_primaryweaponitems", "_secondaryweapon", "_secondaryweaponitems",  "_handgun", "_handgunweaponitems", "_assigneditems", "_position", "_damage", "_dir", "_fullmagazine", "_unit"];

			_array = _this;
			
			_unit = MEMBER("unit", nil);
			MEMBER("clearInventory", _unit);

			_headgear = _array select 0;
			_goggles = _array select 1;
			_uniform = _array select 2;
			_uniformitems = _array select 3;
			_vest = _array select 4;
			_vestitems = _array select 5;
			_backpack = _array select 6;
			_backpackitems = _array select 7;
			_fullmagazine = _array select 8;
			_primaryweapon = _array select 9;
			_primaryweaponitems = _array select 10;
			_secondaryweapon = _array select 11;
			_secondaryweaponitems = _array select 12;
			_handgunweapon = _array select 13;
			_handgunweaponitems = _array select 14;
			_assigneditems = _array select 15;

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
					_unit additem _x;
					_unit assignItem _x;
				};
			} foreach _assigneditems;

			if (needReload _unit == 1) then {reload _unit};
		};

		PUBLIC FUNCTION("","deconstructor") {
			DELETE_VARIABLE("unit");
		 };
	ENDCLASS;