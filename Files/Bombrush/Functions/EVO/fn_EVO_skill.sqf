_unit 	= _this select 0;
_skill 	= _this select 1;

if(_skill < 5) then {
    _aiSkillBase = 1.0;

    switch (_skill) do
    {
        case 0: //conscript very low skill
        {
            _aiSkillBase = 0;
        };
        case 1: //rebels low skill
        {
            _aiSkillBase = 0.25;
        };
        case 2: //regular fair skill
        {
            _aiSkillBase = 0.5;
        };
        case 3: //elite soldiers medium skill
        {
            _aiSkillBase = 0.75;
        };
        case 4: // specops good skill
        {
            _aiSkillBase = 1;
        };
    };

    _unit setskill _aiSkillBase;
    _unit setskill ["general", _aiSkillBase];
    _unit setskill ["aimingAccuracy", (_aiSkillBase * 0.25)];
    _unit setskill ["aimingShake", (_aiSkillBase * 0.30)];
    _unit setskill ["aimingSpeed", (_aiSkillBase * 0.40)];
    _unit setskill ["endurance", _aiSkillBase];
    _unit setskill ["spotDistance", (_aiSkillBase * 0.25)];
    _unit setskill ["spotTime", (_aiSkillBase * 0.50)];
    _unit setskill ["courage", _aiSkillBase];
    _unit setskill ["reloadSpeed", (_aiSkillBase * 0.80)];
    _unit setskill ["commanding", (_aiSkillBase * 0.75)];
};