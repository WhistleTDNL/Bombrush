EGG_EVO_Repair = 
{
	_vec = (vehicle player);
	_type = typeOf vehicle player;

	if(getDammage _vec > 0 or fuel _vec < 0.98 and not (_vec isKindOf "Man")) then
	{
		_inrepairzone = ((_vec in list trig1) or (_vec in list trig2) );//your sensor zones in the mission named "Airportin" or "farp1" etc
		if(((_vec in list trig1) or (_vec in list trig2) ) and _vec != player and speed _vec > -2 and speed _vec < 2 and position _vec select 2 < 2.0 and (local _vec)) then
		{
			 titleText [localize "STR_M04t83", "PLAIN DOWN",0.3];
			 for [{_loop2=0}, {_loop2<1}, {_loop2=_loop2}] do
			 {
			    sleep 0.200;	    		    
			    if (getDammage _vec > 0) then {_vec setDammage ((getDammage _vec)-0.0125);};
			    if (Fuel _vec < 1) then {_vec setFuel ((Fuel _vec)+0.0125);};
			    if (getDammage _vec == 0 and Fuel _vec == 1) then {_loop2=1;};
			    if(_vec != vehicle player or speed _vec < -2 or speed _vec > 2 or position _vec select 2 > 2.0) then {_loop2=1;titleText [localize "STR_M04t84", "PLAIN DOWN",0.3];};
			    _dam = (getDammage _vec)*100;
			    _ful = (Fuel _vec)*100;
			    hint format["Damage: %1\nFuel: %2",Round _dam,Round _ful];
			};
			_vec setVehicleAmmo 1;	
		};
	};
};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{
	[] call EGG_EVO_Repair;
	sleep 1.01;
};