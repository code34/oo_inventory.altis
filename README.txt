	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2013-2018 Nicolas BOITEUX

	CLASS OO_INVENTORY - a class to manage unit inventory
	
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

	Create an inventory object to load/save unit inventory
	
	Usage:
		put the "oo_inventory.sqf" and the "oop.h" files in your mission directory
		put this code into your mission init.sqf
		call compile preprocessFileLineNumbers "oo_inventory.sqf";

	See example mission in directory: init.sqf
	
	Licence: 
	You can share, modify, distribute this script but don't remove the licence and the name of the original author

	logs:
		0.5	- improve performance
			- fix private keyword

		0.4
			- fix addweapon for items
			- fix typo
			- add isequalto instead ==
			- use native array method
			- fix setinventory bug
		0.3	
			- add bullets count methods
			- add clear methods
			- add get methods
			- add Takeoff methods
			- add setUnit methods
			- add hasX methods
			- fix interface
			- fix magazine methods/locality
			- fix gps
			- update documentation
		0.2 	- add accessors set/get
			- rebuild constructor
			- add doc
		0.1 	- OO_INVENTORY - from combat-assault.eu mission


