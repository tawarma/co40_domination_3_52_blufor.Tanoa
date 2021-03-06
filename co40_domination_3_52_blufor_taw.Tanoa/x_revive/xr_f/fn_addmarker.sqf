// by Xeno
//#define __DEBUG__
#define THIS_FILE "x_revive\xr_f\fn_addmarker.sqf"
#include "..\..\x_macros.sqf"

if (!isServer) exitWith {};

params ["_unit"];
if (!alive _unit) exitWith {};
private _mname = format ["%1_xr_dead", _unit];
if (markerPos _mname isEqualTo [0,0,0]) then {
	[_mname, param [1], "ICON", "ColorBlue", [0.4,0.4], format [localize "STR_DOM_MISSIONSTRING_910", name _unit], 0, "mil_marker"] call d_fnc_CreateMarkerGlobal;
	if (!isNil "d_tt_ver" && {d_tt_ver}) then {
		_unit setVariable ["xr_dml_jip_id", _mname remoteExecCall ["deleteMarkerLocal", if (side (group _unit) == blufor) then {opfor} else {blufor}], true];
	};
};
