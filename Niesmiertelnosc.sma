#include <amxmodx>
#include <amxmisc>
#include <fun>
#include <hamsandwich>
#include <engine>
#include <fakemeta>
#include <cstrike>

#define PLUGIN "Godmode"
#define VERSION "1.0"
#define AUTHOR ".minD"

enum godmody
{
godmodeon,
godmodeofff
}

new godmody:godmode123[33];

public plugin_init() 
{
	register_plugin(PLUGIN, VERSION, AUTHOR)
	register_logevent("Poczatek_Rundy", 2, "1=Round_Start")  
	
	register_clcmd ("say /godmode", "godmode")
	register_clcmd ("say /god", "godmode")
	
	register_clcmd ("say /godmodeoff", "godmodeoff")
	register_clcmd ("say /godoff", "godmodeoff")
}

public godmode(id)
{
	set_user_godmode (id, 1)
	client_print (id, print_chat, "Jestes teraz niesmiertelny!")
	godmode123[id] = godmodeon
	return PLUGIN_HANDLED
}
public client_putinserver(id)
{
	set_user_godmode (id, 0)
}

public godmodeoff(id)
{
	set_user_godmode (id, 0)
	client_print (id, print_chat, "Wylaczyles niesmiertelnosc!")
	godmode123[id] = godmodeofff
}
public client_disconnect(id)
{
	set_user_godmode (id, 0)
}
public Poczatek_Rundy()
{
		if(godmode123[id] = godmodeon)
		{
			set_user_godmode (id, 1)
		}
		else
		{
			set_user_godmode (id, 0)
		}
}