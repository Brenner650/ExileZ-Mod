/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

{
	{
		_x setDamage 0.95;
	}foreach(getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition") nearObjects [_x,20000]);
}
foreach
[
	"Land_LightHouse_F",
	"Land_Lighthouse_small_F",
	"Land_LampAirport_F",
	"Land_LampDecor_F",
	"Land_LampHalogen_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_LampSolar_F",
	"Land_LampStreet_F",
	"Land_LampStreet_small_F",
	"Land_FloodLight_F",
	"Land_PortableLight_single_F",
	"Land_PortableLight_double_F",
	"Land_PowerPoleWooden_L_F"
];

if (EZM_ExtendedLogging) then
{
	diag_log "ExileZ Mod: Turning off the lights.. SPOOKY!!";
};