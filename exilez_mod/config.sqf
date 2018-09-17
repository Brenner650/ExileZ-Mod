/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

// Logging Settings
EZM_Debug							= false;			// debug messages.
EZM_ExtendedLogging					= true;				// Slightly more information in logs.

// Global Settings
EZM_MaxZombies						= 100;				// How many Zombies overall?
EZM_ZombieSide						= EAST;             // zombie team side east, west and Civilian can be used.
EZM_MinSpawnDistance				= 20;               // Closest distance from any player to spawn a zombie.
EZM_MaxSpawnDistance				= 100;              // Max distance a zombie should spawn from a player.
EZM_MaxDistance						= 300;              // Max distance to players before delete.
EZM_MaxTime							= 30;               // Max time away from a player before delete.
EZM_MaxTimeDead						= 300;				// Max time for a dead Zombie to stay before delete. (Default 5 minutes)
EZM_RemoveZfromTraders				= true;             // Will kill zombies when they get too close to a safezone. (the check is done every MaxTime)
EZM_RemoveZfromTerritory			= true;             // Will kill zombies when they get too close to a flag. (the check is done every MaxTime)
EZM_TriggerGroupScaling				= 0;				// 1 player = Groupsize, 2 player in trigger = Groupsize + (GroupSize * TriggerGroupScalling * number of player in the trigger) set at 0 to disable scaling

// Night settings
EZM_LightsOff						= true;             // Kill all the light on map except the player lights.           
EZM_NightStartTime					= 18;               // Time at which it is night in hours
EZM_NightEndTime					= 6;                // Time at which it is no longer night in hours

// Explosive zombies          
EZM_ExplosiveZombies				= true;				// randomly boobie trapped zombies exploding a few seconds after dying.
EZM_ExplosiveZombiesRatio			= 2;                // percentage of explosive zombies
EZM_ExplosiveZombieWarning			= "IT'S A TRAP !!!";// Message that will display a few seconds before the explosion of a zombie.
EZM_ExplosionDelay					= 3;                // self-explanatory
EZM_ExplosiveType					= "Grenade";		// "mini_Grenade" for small almost non-lethal explosion or "Grenade" Big and dangerous explosion.
EZM_ExplosiveRespect				= 100;              // Bonus respect for Exploding zombies

// Killing zombies settings
EZM_EnableMoneyOnPlayer				= false;            // Money goes directly on killer
EZM_EnableMoneyOnCorpse				= true;             // Money stays on corpse for looting
EZM_ZombieMoney						= 5;                // Money per zombie kill
EZM_ZombieMaxMoney					= 15;               // Max Money per zombie kill-random amount put on corpses

// Stats settings
EZM_EnableStatKill					= false;				// Enable stat tracking for Kills DB entry
EZM_EnableZombieStatKill			= false;			// Enable stat tracking for ZedKills DB entry
EZM_EnableRankChange				= false;			// Enable Rank change
EZM_EnableHumanityChange			= false;			// Enable GR8's Humanity change
EZM_ExileZombieKillRankChange		= 5;				// Both Rank and Humanity are dependant on this config

// Respect settings
EZM_EnableRespectOnKill				= true;				// Self Explanatory
EZM_ZombieRespect					= 10;				// Respect per zombie kill

// Frag settings
EZM_RoadKillBonus					= 10;				// Bonus Respect if roadkill
EZM_MinDistance						= 50;				// Minimal distance for range bonus
EZM_CqbDistance						= 10;				// Minimal ditance for close quarter bonus
EZM_CqbBonus						= 40;				// Respect for close quarter bonus at 1 meter
EZM_DistanceBonusDivider			= 10;				// Distance divided by that number = respect E.G. 300m / [20] = 15 Respect

// Zombie settings : SET TO -1 TO DISABLE AND USE DEFAULT FROM RYANZOMBIES
EZM_Ryanzombiesdamagecaliberneeded			= -1;		// -1 for RZ default, 0 for always explode, set it to anything else to manually configure it..
EZM_ryanzombieglowingeyes					= -1;		// Glowing Eyes
EZM_ryanzombieshealth						= 0.8;		// Health, *(initial damage level 0 is no damage 1 is dead)
EZM_ryanzombieshealthdemon					= 0.5;		// Health, *(initial damage level 0 is no damage 1 is dead)
EZM_ryanzombiesattackspeed					= 1.5;		// Attack speed, *(Time is seconds between attacks)
EZM_ryanzombiesattackdistance				= 2;		// Attack distance, *(in meters)
EZM_ryanzombiesattackstrenth				= 0;		// Attack strength *(Knockback strength) *(TYPO IS NORMAL)
EZM_ryanzombiesdamage						= 0.09;		// Attack damage *(% of players life per hit, 1 is 100%)
EZM_ryanzombiesdamagecar					= 0.05;		// Attack damage to car *(% of car health per hit, 1 is 100%)
EZM_ryanzombiesdamageair					= 0.01;		// Attack damage to air *(% of car health per hit, 1 is 100%)
EZM_ryanzombiesdamagetank					= 0.005;	// Attack damage to tank *(% of car health per hit, 1 is 100%)
EZM_ryanzombiesdamagecarstrenth				= 1.5;		// Car attack strength *(Knockback strength in M/S)
EZM_ryanzombiesdamageairstrenth				= 1;		// Air attack strength *(Knockback strength M/S)
EZM_ryanzombiesdamagetankstrenth			= 0.4;		// Tank attack strength *(Knockback strength M/S)
                                                    
EZM_ryanzombiescanthrow						= -1;		// Enable or disable Throwing for zombies
EZM_ryanzombiescanthrowtank					= -1;		// Enable or disable Throwing tank for zombies                                              
EZM_ryanzombiescanthrowdistance				= 10;		// Max throw distance
EZM_ryanzombiescanthrowtankdistance			= 0;		// Max throw distance for tanks                         
                                                    
EZM_ryanzombiescanthrowdemon				= 1;		// Enable or disable Throwing for demons
EZM_ryanzombiescanthrowtankdemon			= 1;		// Enable or disable Throwing tank for demons
EZM_ryanzombiescanthrowdistancedemon		= 50;		// Max throw distance demon
EZM_ryanzombiescanthrowtankdistancedemon	= 10;		// Max throw distance for tanks      

EZM_ryanzombiesdisablebleeding				= 1;		// 1 to DISABLE player bleeding on hit, -1 to ENABLE player bleeding on hit.
EZM_ryanzombiesstartinganim					= 1;		// Enable Spawning animation
EZM_ryanzombieslimit						= 100;		// Player detection distance in meters
		
EZM_ryanzombiesdisablemoaning				= -1;		// No idle sound
EZM_ryanzombiesdisableaggressive			= -1;		// No aggressive sounds
EZM_ryanzombiescivilianattacks				= -1;		// Attack civilians
EZM_ryanzombieslogicroam					= -1;		// Roam ***roaming can be heavy on cpu
EZM_ryanzombieslogicroamdemon				= -1;		// Demon Roam
                                                 
EZM_ryanzombiesjump							= -1;		// Jumping Zombies
EZM_ryanzombiesjumpdemon					= 1;		// Jumping Demons
                                                    
EZM_ryanzombiesfeed							= -1;		// Feeding Zombies
EZM_ryanzombiesfeeddemon					= 1;		// Feeding Demons

// Infection Settings
EZM_ryanzombiesinfection					= -1;		// Enable infections *(-1 to disable)
EZM_ryanzombiesinfectedchance				= 0;		// Precent chances to be infected on hit (Default 0)
EZM_ryanzombiesinfectedrate					= 0.05;		// Damage per minute when infected (+/- 30 minutes to live)
EZM_ryanzombiesinfectedsymptoms				= 0.9;		// Symptomes showed when infected 0.9 = Normal 0.7 = Less 0.5 = None
EZM_ryanzombiesinfecteddeath				= 0.9;		// 0.9 = Scream on death 0.7 = Silent death
EZM_ryanzombiesantivirusduration			= 300;		// Antivirus duration *(5 minutes)

// http://steamcommunity.com/sharedfiles/filedetails/?id=614815221 must be installed on the client for the cure to work
// You also need to overide an Exile script, Details here : http://www.exilemod.com/topic/10999-rz-infection-for-exile/

EZM_ryanzombiesmovementspeedwalker			= 1;		// Animation speed for walker zombies
EZM_ryanzombiesmovementspeedslow			= 1;		// Animation speed for slow zombies
EZM_ryanzombiesmovementspeedmedium			= 1;		// Animation speed for medium zombies
EZM_ryanzombiesmovementspeedfast			= 1;		// Animation speed for fast zombies
EZM_ryanzombiesmovementspeeddemon			= 1;		// Animation speed for demons
EZM_ryanzombiesmovementspeedspider			= 1;		// Animation speed for spider
EZM_ryanzombiesmovementspeedcrawler			= 1;		// Animation speed for crawler

// Harassing Zombies Config
EZM_UseHarassingZombies						= true;		// Spawn harassing zombies around the player.
EZM_HarassingZedChance						= 100;		// Percent chance per player for a harassing Zed to spawn on them
EZM_HarassingZombieAtNightOnly				= false;	// Spawn harassing zombies at night only.
EZM_HarassingLoopTime						= 180;		// Check for players to harass every X seconds (Default 180 seconds)
EZM_HarassingConfig = [
/* 0 Groups Size  */         2,							// maximum number of zombies around a player
/* 1 Vest group */           EZM_Nothing,				// Vest function defined in ZVest.sqf
/* 2 Loot group */           EZM_Nothing,				// Loot function defined in ZLoot.sqf
/* 3 Zombie group */         EZM_Easy					// Group function defined in ZClasses.sqf
];

// Hordes Config
EZM_UseHorde								= true;		// Use the horde spawner  
EZM_HordeLoopTime							= 30;		// Spawn a Horde every X Minutes. (Default 30 mins)
EZM_HordeConfig = [
/* 0 Groups Size  */         15,						// maximum number of zombies around a player
/* 1 Vest group */           EZM_Basic,					// Vest function defined in ZVest.sqf
/* 2 Loot group */           EZM_DocAndAmmo,			// Loot function defined in ZLoot.sqf
/* 3 Zombie group */         EZM_MediumMix,				// Group function defined in ZClasses.sqf
/* 4 Horde density */        25							// Radius in which the zombies will spawn should be lower than Min Spawn Distance.
];

// Blacklisted Areas Config
EZM_UseAreaBlacklist						= true;
EZM_BlacklistedPositions =								// Manual blacklisted areas
[
	//[[CoordinatesX,CoordinatesY],Radius]				// Example
	//[[14599,16797],175],
	//[[23334,24188],175],
	[[2998,18175],175]
];
EZM_BlacklistExtendTraders					= true;		// Extend the Traders Blacklist area
EZM_BlacklistExtendDistance					= 200;		// Extend the Traders Blacklist area by this much

// Use Map Triggers as well as Hordes and Harassing Zombies?
EZM_UseTriggers								= true;

// Check Config Compiled
EZM_CompiledOkay							= true;
