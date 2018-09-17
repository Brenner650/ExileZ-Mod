/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

// Verify validity of spawning location

//_validLocation = [_triggerPosition,false] call VerifyLocation;

// Return True if valid
private ["_flags","_validLocation","_distance","_radius","_position","_ignorePlayer"];

_ignorePlayer = false;

_position = _this select 0;
if (count _this == 2) then
{
	_ignorePlayer = _this select 1;
};

_validLocation = true;

// Check if empty
if ((count _position) == 0) then
{
	_validLocation = false;
};

// Check for Water
if (_validLocation) then 
{
	if (surfaceIsWater _position) then
	{
		_validLocation = false;
	};
};

// Check for Blacklisted Areas
if (_validLocation) then 
{
	if (EZM_UseAreaBlacklist) then
	{
		{
			if (_position distance (_x select 0) <= _x select 1) then
			{
				_validLocation = false
			};
		}
		forEach EZM_BlacklistedPositions;
	};
};

// Check for SafeZones
if (_validLocation) then 
{
	if (EZM_RemoveZfromTraders) then
	{
		if ((_position) call ExileClient_util_world_isInTraderZone) then
		{
			_validLocation = false;
		};
	};
};

// Check for Flags
if (_validLocation) then 
{
	if (EZM_RemoveZfromTerritory) then
	{
		if ((_position) call ExileClient_util_world_isInTerritory) then
		{
			_validLocation = false;
		};
	};
};

// Check for players too close
if (_validLocation && !_ignorePlayer) then 
{
	if ({isplayer _x} count (_position nearEntities EZM_MinSpawnDistance) == 1) then
	{
		_validLocation = false;
	};
};

// Check for absence of players near
if (_validLocation && !_ignorePlayer) then 
{
	if ({isplayer _x} count (_position nearEntities EZM_MaxSpawnDistance) == 0) then
	{
		_validLocation = false;
	};
};


// return
_validLocation;