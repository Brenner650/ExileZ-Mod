/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

private ["_device","_zombie","_zombiePos","_zombieClass","_distance","_radius","_flags"];

if (EZM_ExtendedLogging) then
{
	diag_log format["ExileZ Mod: Monitored Zombies	|	%1	", (count EZM_aliveZombies)];
};

{
	_zombie = _x;
	_zombieClass = typeOf _zombie;
	_zombiePos = getPos _zombie;
	
	if ((isNull _zombie) || (!(alive _zombie))) exitWith
	{
		deleteVehicle _zombie;
		EZM_aliveZombies = EZM_aliveZombies - [_zombie];
		
		if (EZM_ExtendedLogging) then
		{
			diag_log format["ExileZ Mod: Removing 1 Zombie (Probably dead..)	|	Position : %1	|	Class : %2",_zombiePos,_zombieClass];
		};		
	};
	
	// Check for the absence of players
	if (({isplayer _x} count (_zombiePos nearEntities EZM_MaxDistance) == 0) && alive _zombie) then
	{
		//_zombie setdamage 1;
		//uisleep 5;
		deleteVehicle _zombie;
		EZM_aliveZombies = EZM_aliveZombies - [_zombie];
	
		if (EZM_ExtendedLogging) then
		{
			diag_log format["ExileZ Mod: Removing 1 Zombie due to no Players	|	Position : %1	|	Class : %2",_zombiePos,_zombieClass];
		};
	};
	
	// Check for safe zones
	if ((EZM_RemoveZfromTraders) && ((getPosATL _zombie) call ExileClient_util_world_isInTraderZone) && (alive _zombie)) then
	{
		//_zombie setdamage 1;
		//uisleep 5;
		deleteVehicle _zombie;
		EZM_aliveZombies = EZM_aliveZombies - [_zombie];
	
		if (EZM_ExtendedLogging) then
		{
			diag_log format["ExileZ Mod: Removing 1 Zombie at a SafeZone	|	Position : %1	|	Class : %2",_zombiePos,_zombieClass];
		};
	};
	
	// Check for flags
	if ((EZM_RemoveZfromTerritory) && ((getPosATL _zombie) call ExileClient_util_world_isInTerritory) && (alive _zombie)) then
	{
		//_zombie setdamage 1;
		//uisleep 5;
		deleteVehicle _zombie;
		EZM_aliveZombies = EZM_aliveZombies - [_zombie];
	
		if (EZM_ExtendedLogging) then
		{
			diag_log format["ExileZ Mod: Removing 1 Zombie at a Territory	|	Position : %1	|	Class : %2",_zombiePos,_zombieClass];
		};
	};
	
	// Check for the device
	if (alive _zombie)then
	{
		_device = _zombiePos nearObjects ["Land_Device_assembled_F", 30];
		{
			_distance = (getPosATL _x) distance _zombiePos;
			if (_distance <= 30) exitWith 
			{
				//_zombie setdamage 1;
				//uisleep 10;
				deleteVehicle _zombie;
				EZM_aliveZombies = EZM_aliveZombies - [_zombie];
	
				if (EZM_ExtendedLogging) then
				{
					diag_log format["ExileZ Mod: Removing 1 Zombie near a Land Device	|	Position : %1	|	Class : %2",_zombiePos,_zombieClass];
				};
			};
		}forEach _device;
	};
	
	// Check for the mobile device
	if (alive _zombie)then
	{
		_device = _zombiePos nearObjects ["O_Truck_03_device_F", 30];
		{
			_distance = (getPosATL _x) distance _zombiePos;
			if (_distance <= 30) exitWith 
			{
				//_zombie setdamage 1;
				//uisleep 10;
				deleteVehicle _zombie;
				EZM_aliveZombies = EZM_aliveZombies - [_zombie];
	
				if (EZM_ExtendedLogging) then
				{
					diag_log format["ExileZ Mod: Removing 1 Zombie near a Truck Device	|	Position : %1	|	Class : %2",_zombiePos,_zombieClass];
				};
			};
		}forEach _device;
	};
	
}forEach EZM_aliveZombies;
