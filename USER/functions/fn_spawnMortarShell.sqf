params ["_pos"];
_pos set [2, 500];

//Create our projectile
private _projectile = "Sh_82mm_AMOS" createVehicle [0,0,100];
_projectile setPosATL _pos;
_projectile setVelocity [0,0,-100];
_projectile call CBRN_fnc_handleProjectile;

[
	{
		(((getPosATL _this) select 2) < 30)
	},
	{
		private _pos = getPos _this;
		private _detonator = "SLAMDirectionalMine_Wire_Ammo" createVehicle [0,0,0];
		_detonator setPos _pos;
		_detonator setDamage 1;
		deleteVehicle _this;	
	},
	_projectile
] call CBA_fnc_waitUntilAndExecute;


