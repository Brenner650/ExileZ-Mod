/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

private ["_zombie","_zombiePos","_zombieClass"];

if (EZM_ExtendedLogging) then
{
	diag_log format["ExileZ Mod: Monitored Dead Zombies	|	%1	", (count EZM_deadZombies)];
};

{
	_zombie = _x;
	_zombieClass = typeOf _zombie;
	_zombiePos = getPos _zombie;		
	_killedAt = _zombie getVariable ["ZedKilledAt", diag_tickTime];
	
	//diag_log format["ExileZ Mod: Dead Zombie Killed at Variable	 : %1",_killedAt];
	
	if ((diag_tickTime - _killedAt) > EZM_MaxTimeDead) then
	{
		if ((isNull _zombie) || (!(alive _zombie))) then
		{
			deleteVehicle _zombie;
			EZM_deadZombies = EZM_deadZombies - [_zombie];
			
			if (EZM_ExtendedLogging) then
			{
				diag_log format["ExileZ Mod: Removing 1 Probably dead Zombie	|	Position : %1	|	Class : %2",_zombiePos,_zombieClass];
			};		
		};
	};
	
}
forEach EZM_deadZombies;
