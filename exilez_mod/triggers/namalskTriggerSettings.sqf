/*

ExileZ Mod by [FPS]kuplion - Based on ExileZ 2.0 by Patrix87

*/

EZM_Trigger_1 = [				 //Cities
/* 0  Use this trigger */    True,               // Self - explanatory
/* 1  Trigger Positions */   EZM_Cities,             // The name of the array used to list all trigger position in the TriggerPositions.sqf file
/* 2  Max Zombies */         10,                 // The maximum number of zombies for that trigger.
/* 3  Activation Delay */    15,                 // The delay before the activation of the trigger.
/* 4  Spawn Delay */         15,                 // The delay between each zombie spawn right after the activation until the Max group size is reached.
/* 5  Respawn Delay */       60,                 // The respawn delay after the max group size was reached
/* 6  Show Trigger On Map */ true,               // Put a marker at the location and radius of the trigger on the map
/* 7  Marker Color */        "ColorRed",         // Color of the trigger
/* 8  MarkerBrush */         "Solid",            // "Solid","SolidFull","Horizontal","Vertical","Grid","FDiagonal","BDiagonal","DiagGrid","Cross","Border","SolidBorder"
/* 9  Marker Alpha */        0.2,                // Alpha of the trigger *(0 is invisible 1 is opaque)
/* 10 Marker Text */         "",                 // The text on the trigger
/* 11 Vest group */          EZM_Basic,              // The name of the Array used to list all the possible vest for that trigger. ZVest.sqf
/* 12 Loot group */          EZM_Useful,             // The name of the Array used to list all the possible loot for that trigger. ZLoot.sqf
/* 13 Zombie group */        EZM_MediumCiv,          // The name of the Group used to list the zombies possible for that trigger.  ZClasses.sqf
/* 14 Mission Radius */      0,                  // Up to how far from the center of the trigger the mission LOOT can spawn.
/* 15 Mission SQF */         nil,                // The location of the Mission file related to that trigger *(use M3Editor to create the file.) THIS IS STATIC AND WILL NOT MOVE WITH THE TRIGGER
/* 16 Loot Box */            nil                 // The location of the Missionloot file related to that trigger *(See example file zmissionloot.sqf)
];

EZM_Trigger_2 = [				 //Military
/* 0  Use this trigger */    True,               
/* 1  Trigger Positions */   EZM_Military,        
/* 2  Max Zombies */         10,                 
/* 3  Activation Delay */    15,                 
/* 4  Spawn Delay */         15,                 
/* 5  Respawn Delay */       45,                 
/* 6  Show Trigger On Map */ true,               
/* 7  Marker Color */        "ColorRed",         
/* 8  MarkerBrush */         "Solid",            
/* 9  Marker Alpha */        0.2,                
/* 10 Marker Text */         "",                 
/* 11 Vest group */          EZM_Basic,              
/* 12 Loot group */          EZM_Useful,             
/* 13 Zombie group */        EZM_MediumMil,          
/* 14 Mission Radius */      0,                  
/* 15 Mission SQF */         nil,                
/* 16 Loot Box */            nil                 
];

// List all the trigger group to use here.
EZM_Triggers = [EZM_Trigger_1,EZM_Trigger_2];

// Check Config Compiled
EZM_SettingsCompiledOkay				= true;