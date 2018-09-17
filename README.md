# ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

This is a total overhaul/modification of ExileZ 2.0 by Patrix87. The file scructure has been cleaned up, along with a number of edits to fix or update functionality. The intention of this modification is to build upon the work done with ExileZ 2.0 and to add functionality with ease of configuration in mind.

## Features

Dynamic Zombie spawning

Location based Zombie spawning

Harassing Zombies

Hordes

Built in Zombie mission (for specific maps)

Working safezone and territory detection

Supports ANY map (and includes a number of map specific configs)

Highly configurable Zombie options

Blacklist areas from Zombies spawning

Supports Infections (See here for required additional files: http://steamcommunity.com/sharedfiles/filedetails/?id=614815221)

## Requirements

Zombies and Demons (http://steamcommunity.com/sharedfiles/filedetails/?id=501966277)

ExileMod (http://www.exilemod.com/downloads/)

## Changes

Fixed Safezone detection

Fixed Territory detection

Optimised file structure

Added specific map configs

Added support for ANY map

Integrated Zombie Monitor for better performance

Optimised Harassing and Horde loops

## Upcoming Changes

AI offloading

Code optimisation

More map configs

## Download

https://github.com/kuplion/ExileZ-Mod

## Installation

1: Edit main settings in 'exilez_mod\config.sqf'.

2: Edit triggers and settings (if required) in 'exilez_mod\triggers\'.

3: Edit zombie classes and loot in 'exilez_mod\zombies\'.

4: Edit the Zombie mission loot in 'exilez_mod\mission\zMissionLootCrate.sqf'.

5: Pack exilez_mod.pbo with either PBO Manager 1.4b x64 (http://www.armaholic.com/page.php?id=16369) or Eliteness/MikeRo tools if you have them.

6: Place exilez_mod.pbo in your '@ExileServer\addons\' folder.

7: Add "ryanzombies" & "ryanzombiesfunctions" to the "addons" section of your mission.sqm (don't forget to adjust your commas accordingly!!)

addOns[]=
{
	"exile_client",
	"a3_map_altis",
	"Ryanzombies",
	"ryanzombiesfunctions" // Make sure the last entry does not have a comma after it!!
};

## Optional Steps for Database additions

1: Run the SQL file on your database.

2: Add the contents of exile.ini (for your version of extDB3) to the existing exile.ini in the player related queries section.

3: Enable "EZM_EnableZombieStatKill" in the config.

## Configuration

The script is configured to run with Altis, Tanoa, Namalsk, Malden, Chernarus (Normal, Redux, Winter, Summer, and Isles), Napf, Bornholm, Esseker, Al Rayak, Taviana, and Taunus, with all the features enabled by default but will still run on ANY map if an unsupported map is detected.

Almost all of the information related to the configuration is in 'exilez_mod\config.sqf'.

## How to export Triggers positions

1: Open arma with NO MODS other than the map you are using.

2: Open Eden Editor and DO NOT load a mission file.

3: Place an Elliptic Marker *(not a trigger) on every region you want a spawner and set its radius.

4: Start the scenario (run the mission).

5: Copy Paste the code from GetMarkerCmd.txt inside the debug console (press ESC to see it).

6: Execute the code.

7: Open Notepad, CTRL+V / (Paste).

8: ???

9: Profit!

## Donations

If you feel so inclined, donations can be sent to myself via PayPal donate@FriendlyPlayerShooting.com or to Patrix87 via PayPal patrix87@gmail.com

## Credits

Original code base by Patrix87. Trigger Generator by Second_Coming. Taunus and Chernarus Redux triggers by yukihito23. Chernobyl Zone (and Chernobyl Zone Autumn) triggers by lusu007. Stratis triggers by AKA Tony. Trigger weighting fix by glam4x.

## Special Mentions

Credit to DS/DP/RM/OMG/WTF/LOLBBQ for copying Exile code for database saving. Well done you!! Have a gold sticker!

Credit to RyanD(ickhead) for being so stupid and making me lololololol! Moron.

## License
Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)
