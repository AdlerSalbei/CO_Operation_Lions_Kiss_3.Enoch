["Initialize"] call BIS_fnc_dynamicGroups;

["grad_changeWeather", {_this call grad_user_fnc_setTimeAndWeather;}] call CBA_fnc_addEventHandler;
["grad_hideObjectServer", {(_this select 0) hideObjectGlobal (_this select 1);}] call CBA_fnc_addEventHandler;

private _nextWeatherSet = [date, overcast, rain, [wind select 0, wind select 1, true], fogParams];
[{
    !(isNil "GRAD_USER_introOver")
},{
    ["grad_changeWeather", _this] call CBA_fnc_serverEvent;
}, _nextWeatherSet] call CBA_fnc_waitUntilAndExecute;

grad_user_intelFound = [];
publicVariable "grad_user_intelFound";


grad_user_intelFoundMaxAmount = [
    ["Land_Camera_01_F", 1],
    ["Land_HandyCam_F", 5],
    ["Land_Laptop_F", 3],
    ["Land_Tablet_01_F", 4],
    ["Land_MobilePhone_smart_F", 3],
    ["Land_MobilePhone_old_F", 2]
];
publicVariable "grad_user_intelFoundMaxAmount";

INDEPENDENT setFriend [EAST, 1];
EAST setFriend [INDEPENDENT, 1];



