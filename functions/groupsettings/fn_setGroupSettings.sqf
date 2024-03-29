/*  Sets group names and radio channels
*
*/

#include "component.hpp"

private _allgroups = [] call GRAD_groupsettings_fnc_findPlayableGroups;

if (isServer) then {
    [_allGroups] call GRAD_groupsettings_fnc_setDynamicGroupNames;
};

if (hasInterface) then {
    [{!isNull player && {!isNull leader (group player)}}, {
        [group player] call GRAD_groupsettings_fnc_setGroupChannels;
    }, []] call CBA_fnc_waitUntilAndExecute;
};
