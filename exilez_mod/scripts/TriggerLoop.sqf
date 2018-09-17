/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

private ["_triggerObj","_group","_groupSize","_triggerPosition","_nearestLocation","_newAct","_VestGroup","_LootGroup","_ZombieGroup","_SpawnDelay","_RespawnDelay","_cnt","_triggerList"];

//exit if script is already running
if (_this select 0 getvariable ["active", False]) exitwith {};

//Set the script as active
_this select 0 setvariable ["active", true, False];

_triggerObj  = _this select 0;

//get the variable from the trigger
_group = _triggerObj getvariable ["group", objNull];

_groupSize = _triggerObj getvariable ["groupSize", 0];

_vestGroup = _triggerObj getvariable ["vestGroup", nil];
_lootGroup = _triggerObj getvariable ["lootGroup", nil];
_zombieGroup = _triggerObj getvariable ["zombieGroup", nil];

_spawnDelay = _triggerObj getvariable ["spawnDelay", 15];
_respawnDelay = _triggerObj getvariable ["respawnDelay",45];

if (EZM_Debug) then
{
	diag_log format["ExileZ Mod: TriggerLoop: Group : %1 | Size : %2 | Vest : %3 | Loot : %4 | ZGroup : %5 | SDelay : %6 | RSDelay : %7",_group,_groupSize,_vestGroup,_lootGroup,_zombieGroup,_spawnDelay,_respawnDelay];
};

//local variables
_newAct = true;
_triggerPosition = (getpos (_triggerObj));
_nearestLocation = text nearestLocation [_triggerPosition, ""];


if (EZM_Debug) then
{
	diag_log format["ExileZ Mod: Activating Trigger	|	Position : %1	|	GroupSize : %2	|	Near : %3 ",_triggerPosition,_groupSize,_nearestLocation];
};

//Select a random player and spawn a zombie near him
EZM_SpawnOne = {
	_triggerList = list _triggerObj;
	if !(count _triggerList == 0) then 
	{
		_playerObj = _triggerList call BIS_fnc_selectRandom;
		_playerPos = getPos _playerObj;
		
		// Max Zombies reached?
		if ((count EZM_aliveZombies) <= EZM_MaxZombies) then
		{
			nul = [_group,_playerPos,_vestGroup,_lootGroup,_zombieGroup] spawn EZM_SpawnZombie;
		}
		else
		{
			if (EZM_ExtendedLogging) then
			{
				diag_log "ExileZ Mod: Maximum Zombies reached for now!";
			};
		};
	};
};


//Active loop
while {triggeractivated (_this select 0)} do 
{
	if (isNull _group) then 
	{ 															//the zombie group is empty or all dead
		_group = [_triggerObj] call EZM_InitGroup;					//Create Group
		if (_newAct) then 
		{ 														//if newAct is true The zombies were deleted not killed
			for "_x" from 1 to _groupSize do 
			{													//populate the group "rapidly"
				if (triggeractivated (_this select 0)) then 
				{												//player check
					if (isNull _group) then 
					{ 											//the zombie group is empty or all dead
						_group = [_triggerObj] call EZM_InitGroup;
						uisleep 1;
					};
					call EZM_SpawnOne;
				};
				uisleep _SpawnDelay;								//spawn delay
			};
			_newAct = false;
		} 
		else 													//player probably killed all the zombies without leaving the zone
		{
			call EZM_SpawnOne;
			uisleep _RespawnDelay; 								//Wait respawn time
		};
	}
	else //group is not empty
	{
		_cnt = {alive _x} count units _group; 					//count number of zombie alive in the group
		_triggerList = list _triggerObj;
		_playersInZone = count _triggerList;
		_scaledGroupSize = _groupSize + (_groupSize * EZM_TriggerGroupScaling * _playersInZone);
		if (_cnt < _scaledGroupSize) then 
		{
			call EZM_SpawnOne;
		};
		uisleep _RespawnDelay; 									//Wait respawn time
	};
};
//Reboot the trigger
if (EZM_Debug) then
{
	diag_log format["ExileZ Mod: Deactivating Trigger	|	Position : %1	|	GroupSize : %2	|	Near : %3 ",_triggerPosition,_groupSize,_nearestLocation];
};
_this select 0 setvariable ["active", false, False];