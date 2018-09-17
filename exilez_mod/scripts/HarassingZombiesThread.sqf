/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

private ["_chanceRoll","_nPlayer","_sTime","_group","_count","_groupSize","_vestGroup","_lootGroup","_zombieGroup","_playerObj","_playerName","_playerPosition","_skipPlayer"];

_groupSize =         (_this select 0) select 0;
_vestGroup =         (_this select 0) select 1;
_lootGroup =         (_this select 0) select 2;
_zombieGroup =       (_this select 0) select 3;

// Wait 2 minutes before starting Harassing Zombie Loop
if (time < 120) exitWith 
{
    if (EZM_ExtendedLogging) then 
    {
        diag_log format["ExileZ Mod: Waiting until the server has been up at least 2 minutes (it has currently been up for %1 seconds)",time];
    };
};

// Run the Harassing Zombie Loop
{
	if (EZM_Debug) then
	{
		diag_log format["ExileZ Mod: HarassingZombiesLoop: GroupSize : %1 | Vest : %2 | Loot : %3 | ZGroup : %4",_groupSize,_vestGroup,_lootGroup,_zombieGroup];
	};
	
	// Setup player object and name
	_playerObj = _x;
	_playerName = name _playerObj;
	
	// Get player position
	_playerPosition = getPos _playerObj;
	
	// Setup skipping the player
	_skipPlayer = false;
	
	// Not in Blacklisted Areas
	if (EZM_UseAreaBlacklist) then
	{
		{
			if (_playerPosition distance (_x select 0) <= _x select 1) then
			{
				_skipPlayer = true;
				if (EZM_ExtendedLogging) then 
				{
					diag_log format["ExileZ Mod: %1 is in a Blacklisted area, no Harassing Zombie for them.",_playerName];
				};
			};
		}
		forEach EZM_BlacklistedPositions;	
		uisleep 0.5;
	};
	
	// Not in Traders
	if ((EZM_RemoveZfromTraders) && ((getPosATL _playerObj) call ExileClient_util_world_isInTraderZone)) then
	{
		_skipPlayer = true;
		if (EZM_ExtendedLogging) then 
		{
			diag_log format["ExileZ Mod: %1 is in a SafeZone, no Harassing Zombie for them.",_playerName];
		};
		uisleep 0.5;
	};
	
	// Not in Territory
	if ((EZM_RemoveZfromTerritory) && ((getPosATL _playerObj) call ExileClient_util_world_isInTerritory)) then
	{
		_skipPlayer = true;
		if (EZM_ExtendedLogging) then 
		{
			diag_log format["ExileZ Mod: %1 is in their Territory, no Harassing Zombie for them.",_playerName];
		};
		uisleep 0.5;
	};
	
	// Roll for Harassing Zombie chance..
	_chanceRoll = random (floor 99);
	if (EZM_HarassingZedChance <= _chanceRoll) then
	{
		_skipPlayer = true;
		if (EZM_ExtendedLogging) then 
		{
			diag_log format["ExileZ Mod: %1 got lucky, no Harassing Zombie for them.",_playerName];
		};
		uisleep 0.5;
	};

	if ((EZM_HarassingZombieAtNightOnly && (daytime >= EZM_NightStartTime or daytime < EZM_NightEndTime) && !(_skipPlayer)) || (!(EZM_HarassingZombieAtNightOnly) && !(_skipPlayer))) then 
	{
		if (isPlayer _playerObj) then 
		{
			if (alive _playerObj) then 
			{
				// Get group from player
				_group = _playerObj getvariable ["group", objNull];
				
				// If nul create group
				if (isNull _group) then 
				{
					_group = [_playerObj] call EZM_InitGroup;
					uisleep 1;
				};

				// Count number of zombie alive in the group
				_count = {alive _playerObj} count units _group; 	
				
				// Fill the group
				if (_count < _groupSize) then
				{
					for "_i" from 1 to (_groupSize - _count) do
					{
						// Max Zombies reached?
						if ((count EZM_aliveZombies) <= EZM_MaxZombies) then
						{
							nul = [_group,_playerPosition,_vestGroup,_lootGroup,_zombieGroup] spawn EZM_SpawnZombie;
						}
						else
						{
							if (EZM_ExtendedLogging) then
							{
								diag_log "ExileZ Mod: Maximum Zombies reached for now!";
							};
						};
						uisleep 1;
					};
					
					if (EZM_ExtendedLogging) then 
					{
						diag_log format["ExileZ Mod: Spawning %1 Harassing Zombie(s) for %2.",(_groupSize - _count),_playerName];
					};
				};
			};
		};
	};
	uisleep 0.5;
}
forEach (allPlayers - entities "HeadlessClient_F");