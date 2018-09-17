/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

// Populate a group with 1 zombie at a random location near the given position.

// _validLocation = [_group,_position,_vestGroup,_lootGroup,_zombieGroup] call SpawnZombie;
// _return true or false

private ["_TempPosition","_face","_group","_position","_vestGroup","_lootGroup","_zombieGroup","_validLocation","_zClass","_maxSpawnDistance","_return","_result","_maxValue"];

_group =             _this select 0;
_position =          _this select 1;
_vestGroup =         _this select 2;
_lootGroup =         _this select 3;
_zombieGroup =       _this select 4;

if (EZM_Debug) then
{
	diag_log format["ExileZ Mod: SpawnZombie: Group : %1 | Position : %2 | Vest : %3 | Loot : %4 | ZGroup : %5",_group,_position,_vestGroup,_lootGroup,_zombieGroup];
};

if (count _this == 7) then
{
	_MaxSpawnDistance =    _this select 6;	
}
else
{
	_MaxSpawnDistance = EZM_MaxSpawnDistance;
};


// Try 5 times to get a valid position near the given position
for "_i" from 1 to 5 do {
	//Get random position
	if !(count _position == 0) then 
	{
		_TempPosition = [_position,EZM_MinSpawnDistance,_MaxSpawnDistance] call EZM_GetRandomLocation;
	};
	//Validate location
	_validLocation = [_TempPosition] call EZM_VerifyLocation;
	if (_validLocation) exitWith {_validLocation};
	uisleep 0.05;
};
_position = _TempPosition;

EZM_GetZombieClass =
{
	_return = 0;
	_maxValue = (_this select ((count _this) - 1)) select 1;	//Count how many type, remove 1 because index start a 0, select the last index, select the highest value.
	
	if (EZM_Debug) then
	{
		diag_log format["ExileZ Mod: Zombie Group Highest Compound Weight : %1",_MaxValue];
	};
	_result = ceil random (_maxValue);
	
	if (EZM_Debug) then
	{
		diag_log format["ExileZ Mod: Randomly Selected Value : %1",_result];
	};
	
	{
		if((_x select 1) >= _result) exitwith
		{
			if (EZM_Debug) then
			{
				diag_log format["ExileZ Mod: Selected Zombie Group : %1		Compound Weight : %2",(_x select 0),(_x select 1)];
			};
			_return = ((_x select 0) call BIS_fnc_selectRandom) select 0;
		};
	}foreach _this;
	
	if (EZM_Debug) then
	{
		diag_log format["ExileZ Mod: Selected Zombie Class : %1",_return];
	};
	_return;
};

if !(_validLocation) then
{
	if (EZM_Debug) then
	{
		diag_log format["ExileZ Mod: No suitable spawn location found for a Zombie near %1 ",_position];
	};
}
else
{	
	//Get a Zombie Class
	_zClass = _zombieGroup call EZM_GetZombieClass;

	if (EZM_Debug) then
	{
		diag_log format["ExileZ Mod: Spawning 1 Zombie	|	Position : %1	|	Class : %2 ",_position,_zClass];
	};

	// Old Spawn Zombie Method
	/*_zClass createUnit 
	[
		_position,
		_group,
		"
		if !(call _vestGroup=='') then {this addVest call _vestGroup};
		if !(call _lootGroup=='' && call _vestGroup=='') then {this addItemToVest call _lootGroup};
		doStop this;
		this disableAI 'FSM';
		this enableAI 'ANIM';
		this disableConversation true;
		this addMPEventHandler ['MPKilled', {_this spawn ZMPKilled;}];
		nul = [this] spawn ZombieDeleter;
		"
		
	];*/
	
	// New Spawn Zombie Method	
	_tempGroup = createGroup EZM_ZombieSide;
	_tempGroup setCombatMode "BLUE";
	_tempGroup allowFleeing 0;
	_tempGroup enableAttack false;
	
	_zombie = _tempGroup createUnit [_zClass, _position, [], 0, "NONE"];
	[_zombie] joinSilent _group;
	deleteGroup _tempGroup;
	_zombie disableAI "FSM";
	_zombie enableAI "ANIM";
	_zombie disableConversation true;
	_zombie addMPEventHandler ["MPKilled", {_this call EZM_ZMPKilled;}];
	
	// Add Zombie Loot
	if !(call _vestGroup == "") then
	{
		_zombie addVest call _vestGroup;
	
		if !(call _lootGroup == "") then
		{
			_zombie addItemToVest call _lootGroup;
		};
	};

	// Fixes Zombie Faces
	_zedFaceArray = ["RyanZombieFace1", "RyanZombieFace2", "RyanZombieFace3", "RyanZombieFace4", "RyanZombieFace5", "RyanZombieFace6"]; 
	_face = selectRandom _zedFaceArray; 
	_zombie setface _face;
	
	// Add to Zombie Monitor
	EZM_aliveZombies pushback _zombie;
	
	if (EZM_ExtendedLogging) then
	{
		diag_log "ExileZ Mod: Spawning 1 Zombie	and adding it to the Monitor";
	};
	
};

//return
_validLocation;