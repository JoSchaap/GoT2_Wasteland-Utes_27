//  @file Version: 1.0
//  @file Name: midGroup.sqf
//	@file Author: [404] Deadbeat
//	@file Created: 08/12/2012 21:58
//	@file Args:

if(!X_Server) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6","_man7"];

_group = _this select 0;
_pos = _this select 1;

//Anti Vehicle
_leader = _group createunit ["Pilot", [(_pos select 0) + 10, _pos select 1, 0], [], 0.5, "Form"];
_leader addMagazine "SMAW_HEDP";
_leader addMagazine "SMAW_HEDP";
_leader addMagazine "SMAW_HEDP";
_leader addWeapon "SMAW";
_leader addMagazine "30Rnd_556x45_G36";
_leader addMagazine "30Rnd_556x45_G36";
_leader addWeapon "M8_compact";

//Support
_man2 = _group createunit ["Pilot", [(_pos select 0) - 30, _pos select 1, 0], [], 0.5, "Form"];
_man2 addMagazine "100Rnd_556x45_BetaCMag";
_man2 addMagazine "100Rnd_556x45_BetaCMag";
_man2 addWeapon "M8_SAW";

//Rifle_man
_man3 = _group createunit ["Pilot", [_pos select 0, (_pos select 1) + 30, 0], [], 0.5, "Form"];
_man3 addMagazine "30Rnd_556x45_G36";
_man3 addMagazine "30Rnd_556x45_G36";
_man3 addMagazine "30Rnd_556x45_G36";
_man3 addWeapon "M8_carbine";

//Rifle_man
_man4 = _group createunit ["Pilot", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man4 addMagazine "30Rnd_556x45_G36";
_man4 addMagazine "30Rnd_556x45_G36";
_man4 addMagazine "30Rnd_556x45_G36";
_man4 addWeapon "M8_carbine";

//Rifle_man
_man5 = _group createunit ["Pilot", [_pos select 0, (_pos select 1) + 40, 0], [], 0.5, "Form"];
_man5 addMagazine "30Rnd_556x45_G36";
_man5 addMagazine "30Rnd_556x45_G36";
_man5 addMagazine "30Rnd_556x45_G36";
_man5 addWeapon "M8_carbine";

//Sniper
_man6 = _group createunit ["Pilot", [_pos select 0, (_pos select 1) - 30, 0], [], 0.5, "Form"];
_man6 addMagazine "30Rnd_556x45_G36";
_man6 addMagazine "30Rnd_556x45_G36";
_man6 addMagazine "30Rnd_556x45_G36";
_man6 addMagazine "30Rnd_556x45_G36";
_man6 addMagazine "30Rnd_556x45_G36";
_man6 addMagazine "30Rnd_556x45_G36";
_man6 addWeapon "M8_sharpshooter";

//Grenadier
_man7 = _group createunit ["Pilot", [_pos select 0, (_pos select 1) - 40, 0], [], 0.5, "Form"];
_man7 addMagazine "30Rnd_556x45_G36";
_man7 addMagazine "30Rnd_556x45_G36";
_man7 addMagazine "30Rnd_556x45_G36";
_man7 addMagazine "1Rnd_HE_M203";
_man7 addMagazine "1Rnd_HE_M203";
_man7 addMagazine "1Rnd_HE_M203";
_man7 addWeapon "M8_carbineGL";

_leader = leader _group;
_leader setVehicleInit "null = [group this,(getPos this)] execVM 'server\functions\defendArea.sqf'";
processInitCommands;
