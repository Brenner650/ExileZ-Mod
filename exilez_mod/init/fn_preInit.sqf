/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

// Get EZM version
exileZmod_version = getText (configFile >> "CfgPatches" >> "exilez_mod" >> "exileZmod_version");

// Log stuff
diag_log format["ExileZ Mod: Version %1 | Loading Configs at %2", exileZmod_version, time];

// Get the Zombie Configs/Loot/Vests/Classes
// Get the Zombie Classes List
call compileFinal preprocessFileLineNumbers "exilez_mod\zombies\zClassesList.sqf";
if (isNil "EZM_zClassesListCompiledOkay") exitWith
{
	diag_log format["ExileZ Mod: Failed to read exilez_mod\zombies\zClassesList.sqf, check for typos (time: %1)",time];
};

// Get the Zombie Loot
call compileFinal preprocessFileLineNumbers "exilez_mod\zombies\zLoot.sqf";
if (isNil "EZM_zLootCompiledOkay") exitWith
{
	diag_log format["ExileZ Mod: Failed to read exilez_mod\zombies\zLoot.sqf, check for typos (time: %1)",time];
};

// Get the Zombie Vests
call compileFinal preprocessFileLineNumbers "exilez_mod\zombies\zVest.sqf";
if (isNil "EZM_zVestCompiledOkay") exitWith
{
	diag_log format["ExileZ Mod: Failed to read exilez_mod\zombies\zVest.sqf, check for typos (time: %1)",time];
};

// Get the Zombie Classes
call compileFinal preprocessFileLineNumbers "exilez_mod\zombies\zClasses.sqf";
if (isNil "EZM_zClassesCompiledOkay") exitWith
{
	diag_log format["ExileZ Mod: Failed to read exilez_mod\zombies\zClasses.sqf, check for typos (time: %1)",time];
};

// Get the config for ExileZ Mod
call compileFinal preprocessFileLineNumbers "exilez_mod\config.sqf";
if (isNil "EZM_CompiledOkay") exitWith
{
	diag_log format["ExileZ Mod: Failed to read exilez_mod\config.sqf, check for typos (time: %1)",time];
};

// Create Zombie Monitor
EZM_aliveZombies = [];
publicVariable "EZM_aliveZombies";

// Create Dead Zombie Monitor
EZM_deadZombies = [];
publicVariable "EZM_deadZombies";

// Create Blacklist Arrays
EZM_BlacklistedPositions = [];
EZM_BlacklistedTraders = [];

// Compile World Trigger Positions
switch (toLower worldName) do
{

	default
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\defaultTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\defaultZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\defaultTriggerSettings.sqf";
	};

	case "altis":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\altisTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\altisZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\altisTriggerSettings.sqf";
	};

	case "tanoa":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\tanoaTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\tanoaZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\tanoaTriggerSettings.sqf";
	};

	case "namalsk":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\namalskTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\namalskZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\namalskTriggerSettings.sqf";
	};

	case "chernarus":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\chernarusZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusTriggerSettings.sqf";
	};

	case "chernarus_isles":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusIslesTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\chernarusZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusTriggerSettings.sqf";
	};

	case "chernarus_winter":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\chernarusZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusTriggerSettings.sqf";
	};

	case "chernarus_summer":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\chernarusZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusTriggerSettings.sqf";
	};

	case "napf":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\napfTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\napfZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\napfTriggerSettings.sqf";
	};

	case "pja310": // Al Rayak
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\alRayakTriggerPosition.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\alRayakZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\alRayakTriggerSettings.sqf";
	};

	case "esseker":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\essekerTriggerPosition.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\essekerZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\essekerTriggerSettings.sqf";
	};

	case "bornholm":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\bornholmTriggerPosition.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\bornholmZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\bornholmTriggerSettings.sqf";
	};

	case "taviana":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\tavianaTriggerPosition.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\tavianaZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\tavianaTriggerSettings.sqf";
	};

	case "xcam_taunus": // Taunus
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\taunusTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\taunusZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\taunusTriggerSettings.sqf";
	};

	case "chernobylzone":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernobylZoneTriggerPosition.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\chernobylZoneZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernobylZoneTriggerSettings.sqf";
	};
	
	case "chernobylzoneautumn":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernobylZoneTriggerPosition.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\chernobylZoneZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernobylZoneTriggerSettings.sqf";
	};

	case "stratis":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\stratisTriggerPosition.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\stratisZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\stratisTriggerSettings.sqf";
	};

	case "malden":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\maldenTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\maldenZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\maldenTriggerSettings.sqf";
	};
	
	case "chernarusredux":
	{
		// Trigger Positions
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusReduxTriggerPositions.sqf";

		//Loot Crate and Mission Objects
		EZM_triggerMission = compileFinal preprocessFileLineNumbers "exilez_mod\mission\chernarusReduxZedMission.sqf";
		EZM_triggerLootCrate = compileFinal preprocessFileLineNumbers "exilez_mod\mission\zMissionLootCrate.sqf";

		// Trigger Settings
		call compileFinal preprocessFileLineNumbers "exilez_mod\triggers\chernarusReduxTriggerSettings.sqf";
	};

};

// Check Triggers Compiled Correctly
if (isNil "EZM_TriggersCompiledOkay") exitWith
{
	diag_log format["ExileZ Mod: Failed to read exilez_mod\triggers\(worldNameHere)TriggerPosition.sqf, check for typos (time: %1)", time];
};

// Check Trigger Settings Compiled Correctly
if (isNil "EZM_SettingsCompiledOkay") exitWith
{
	diag_log format["ExileZ Mod: Failed to read exilez_mod\triggers\(worldNameHere)TriggerSettings.sqf, check for typos (time: %1)", time];
};

// Log more stuff
diag_log format["ExileZ Mod: Version %1 | Loaded all Configs at %2", exileZmod_version, time];
