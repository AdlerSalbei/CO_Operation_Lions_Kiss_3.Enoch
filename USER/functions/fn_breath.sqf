if (isNil "MISSION_ROOT") then {
    if(isDedicated) then {
        MISSION_ROOT = "mpmissions\__CUR_MP." + worldName + "\";
    } else {
        MISSION_ROOT = str missionConfigFile select [0, count str missionConfigFile - 15];
    };
};

private _sound = selectRandom [["breathing_1", 2], ["breathing_2", 2], ["coughing", 5]];
playSound3D [format ["%1", (MISSION_ROOT + "data\" + (_sound select 0)) + ".ogg"], player, false, getPosASL player, 1, 1, 0];

[{
    ((player getVariable ["ACE_isUnconscious", false]) || {!(isNull (getAssignedCuratorLogic player))})
},{}, [], _sound select 1,
{
    [] call grad_user_fnc_breath;
}] call CBA_fnc_waitUntilAndExecute;