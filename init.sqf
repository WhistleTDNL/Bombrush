//////////////////////////////////////////////////////////////////////////////////////////////
//
// init.sqf
// Bombrush by Whistle
//
//////////////////////////////////////////////////////////////////////////////////////////////

// Set the time of day
//SYNTAX setDate [year, month, day, hour, minute]
if ((paramsarray select 1) == 60) then {
	 setdate [2014, 8, 17, random (24), random (60)];
	} else {
	 setdate [2014, 8, 17, (paramsarray select 1), 0];
};

// Set the weather
execVM "Files\Weather\randomWeather.sqf";

if ((paramsarray select 9) == 1) then {
	0 = [5,1000,15,2,1] execvm "Files\Ambiance\tpw_cars.sqf";
	0 = [5,150,15,5,4,50,0,10,15,1] execvm "Files\Ambiance\tpw_civs.sqf";
};

// Fatigue
_fatigue = if (paramsarray select 14 == 1) then {true} else {false};
player enableFatigue _fatigue;

// When arsenal is closed, save the loadout of the player. When he respawns he will get that loadout again.
[missionNamespace, "arsenalClosed", {
	_currentLoadout = getUnitLoadout [player, true];
	player setVariable ["current_loadout",_currentLoadout,false];
}] call BIS_fnc_addScriptedEventHandler;

// Ammoboxes for the boats sometimes bug, so this is why i did this...
_ammoboxes = [ammobox1, ammobox2, ammobox3, ammobox4];
_pos3 = getpos ammobox3;
ammobox3 setpos [_pos3 select 0, _pos3 select 1, 1];
_pos4 = getpos ammobox4;
ammobox4 setpos [_pos4 select 0, _pos4 select 1, 1];

call compileFinal preprocessFileLineNumbers "Files\Bombrush\bombrush_init.sqf";