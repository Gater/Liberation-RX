// Exit SoG tunnel with AI

private _unit_list = player getVariable ["SOG_unit_list", []];

[_unit_list] spawn {
    params ["_list"];
     sleep 1;
    {
        if (lifestate _x == 'INCAPACITATED') then { 
            deleteVehicle _x;
        } else {
            _x setpos (player getPos [1, random 360]);
            _x doFollow player;
            sleep 0.3;
        }
    } forEach _list;
};

showMap true;
player setVariable ["SOG_exit_tunnel", round (time + 300)];
player setVariable ["SOG_player_in_tunnel", nil];
player setVariable ["SOG_unit_list", []];
