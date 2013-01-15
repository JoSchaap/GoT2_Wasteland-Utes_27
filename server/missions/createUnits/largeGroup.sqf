//  @file Version: 1.0
//  @file Name: largeGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7","_man8","_man9","_man10"];

_group = _this select 0;
_pos = _this select 1;

//Anti Air no weapon
_leader = _group createunit ["Rocker4", [(_pos select 0) + 30, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "Stinger";
_leader addMagazine "Stinger";
_leader addMagazine "Stinger";
_leader addMagazine "Stinger";
_leader addWeapon "Stinger";

//Support
_man2 = _group createunit ["Rocker4", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "100Rnd_762x51_M240";
_man2 addMagazine "100Rnd_762x51_M240";
_man2 addWeapon "M240";

//Rifle_man
_man3 = _group createunit ["Rocker4", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addMagazine "30Rnd_556x45_Stanag";
_man3 addWeapon "M16A4";

//Rifle_man
_man4 = _group createunit ["Rocker4", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addMagazine "30Rnd_556x45_Stanag";
_man4 addWeapon "M16A4";

//Sniper
_man5 = _group createunit ["Rocker4", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man5 addMagazine "20Rnd_556x45_Stanag";
_man5 addMagazine "20Rnd_556x45_Stanag";
_man5 addMagazine "20Rnd_556x45_Stanag";
_man5 addWeapon "M4SPR";

//Grenadier
_man6 = _group createunit ["Rocker4", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man6 addMagazine "30Rnd_556x45_Stanag";
_man6 addMagazine "30Rnd_556x45_Stanag";
_man6 addMagazine "30Rnd_556x45_Stanag";
_man6 addMagazine "1Rnd_HE_M203";
_man6 addMagazine "1Rnd_HE_M203";
_man6 addMagazine "1Rnd_HE_M203";
_man6 addWeapon "M4A1_HWS_GL";

//Support
_man7 = _group createunit ["Rocker4", [(_pos select 0) - 40, _pos select 1, 0], [], 0.5, "Form"];
_man7 addMagazine "100Rnd_762x51_M240";
_man7 addMagazine "100Rnd_762x51_M240";
_man7 addWeapon "M240";

//Grenadier
_man8 = _group createunit ["Rocker4", [_pos select 0, (_pos select 1) + 50, 0], [], 0.5, "Form"];
_man8 addMagazine "30Rnd_556x45_Stanag";
_man8 addMagazine "30Rnd_556x45_Stanag";
_man8 addMagazine "30Rnd_556x45_Stanag";
_man8 addMagazine "1Rnd_HE_M203";
_man8 addMagazine "1Rnd_HE_M203";
_man8 addMagazine "1Rnd_HE_M203";
_man8 addWeapon "M4A1_HWS_GL";

//Sniper
_man9 = _group createunit ["Rocker4", [_pos select 0, (_pos select 1) - 50, 0], [], 0.5, "Form"];
_man9 addMagazine "20Rnd_556x45_Stanag";
_man9 addMagazine "20Rnd_556x45_Stanag";
_man9 addMagazine "20Rnd_556x45_Stanag";
_man9 addWeapon "M4SPR";

//Rifle_man
_man10 = _group createunit ["Rocker4", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addMagazine "30Rnd_556x45_Stanag";
_man10 addWeapon "M16A4";

_leader = leader _group;
_leader setVehicleInit "null = [group this,(getPos this)] execVM 'server\functions\defendArea.sqf'";
processInitCommands;
