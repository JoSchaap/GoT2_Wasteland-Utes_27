/**
 * Initialise un objet d�pla�able/h�liportable/remorquable/transportable
 * 
 * @param 0 l'objet
 * 
 * Copyright (C) 2010 madbull ~R3F~
 * 
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

private ["_objet", "_est_desactive", "_est_transporte_par", "_est_deplace_par", "_objectState", "_doLock", "_doUnlock"];

_objet = _this select 0;

_doLock = 0;
_doUnlock = 1;

_est_desactive = _objet getVariable "R3F_LOG_disabled";
if (isNil "_est_desactive") then
{
	_objet setVariable ["R3F_LOG_disabled", false];
};

// D�finition locale de la variable si elle n'est pas d�finie sur le r�seau
_est_transporte_par = _objet getVariable "R3F_LOG_est_transporte_par";
if (isNil "_est_transporte_par") then
{
	_objet setVariable ["R3F_LOG_est_transporte_par", objNull, false];
};

// D�finition locale de la variable si elle n'est pas d�finie sur le r�seau
_est_deplace_par = _objet getVariable "R3F_LOG_est_deplace_par";
if (isNil "_est_deplace_par") then
{
	_objet setVariable ["R3F_LOG_est_deplace_par", objNull, false];
};

// Ne pas monter dans un v�hicule qui est en cours de transport => I have deleted this feature because IRL you can enter TOWed vehicles too. If You want to re-enable this again, just remove the //'s.
//_objet addEventHandler ["GetIn",
//{
//	if (_this select 2 == player) then
//	{
//		_this spawn
//		{
//			if ((!(isNull (_this select 0 getVariable "R3F_LOG_est_deplace_par")) && (alive (_this select 0 getVariable "R3F_LOG_est_deplace_par"))) || !(isNull (_this select 0 getVariable "R3F_LOG_est_transporte_par"))) then
//			{
//				player action ["eject", _this select 0];
//				player globalChat STR_R3F_LOG_transport_en_cours;
//			};
//		};
//	};
//}];

if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
{
	_objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_deplacer_objet + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\deplacer.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_deplacer_objet_valide && !(_target getVariable ['objectLocked', false])"];
	_objet addAction [("<t color=""#21DE31"">" + STR_LOCK_OBJECT + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\objectLockStateMachine.sqf", _doLock, -5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_deplacer_objet_valide && Object_canLock"];
	_objet addAction [("<t color=""#E01B1B"">" + STR_UNLOCK_OBJECT + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\objet_deplacable\objectLockStateMachine.sqf", _doUnlock, -5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_deplacer_objet_valide && !Object_canLock"];
};

if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_remorquables > 0) then
{
	if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
	{
		_objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_remorquer_deplace + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\remorquer_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_remorquer_deplace_valide"];
	};
	
	_objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_selectionner_objet_remorque + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\selectionner_objet.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_selectionner_objet_remorque_valide && Object_canLock"];
	
	_objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_detacher + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\remorqueur\detacher.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_detacher_valide"];
};

if ({_objet isKindOf _x} count R3F_LOG_classes_objets_transportables > 0) then
{
	if ({_objet isKindOf _x} count R3F_LOG_CFG_objets_deplacables > 0) then
	{
		_objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_charger_deplace + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\transporteur\charger_deplace.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_charger_deplace_valide"];
	};
	
	_objet addAction [("<t color=""#dddd00"">" + STR_R3F_LOG_action_selectionner_objet_charge + "</t>"), "addons\R3F_ARTY_AND_LOG\R3F_LOG\transporteur\selectionner_objet.sqf", nil, 5, false, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_selectionner_objet_charge_valide && Object_canLock"];
};