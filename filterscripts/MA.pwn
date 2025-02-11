/*
Pasado A PAWNO
*/

#include <a_samp>

#define COLOR_CELESTE 0x00FFFFFF
#define COLOR_AMARILLO 0xFFFF00FF
#define COLOR_ROJO 0xFF0000AA
#define COLOR_NARANJA2 0xFF9900AA
#define COLOR_AZUL 0x00FFFFAA
#define COLOR_DORADO 0xE5E52BAA
#define COLOR_BLANCO 0xFFFFFFAA
#define COLOR_VIOLETA 0x9f1488ff
#define COLOR_GRIS 0x00ff00ff

new string[128];
new playername[128];
new Playerid;
new Mensaje;
new RMsg[MAX_PLAYERS];

public OnFilterScriptInit()
{
    print("MA: message auto is on");
	SetTimer("MensajesAutomaticos", 150000, 1); 
	return 1;
}

forward MensajesAutomaticos();
public MensajesAutomaticos()
{
	Mensaje = random(6);
	if(Mensaje == 0)
	{
	    for(Playerid = 0; Playerid <= 500; Playerid++)
		{
		    if(IsPlayerConnected(Playerid) && RMsg[Playerid] == 0)
		    {
    			format(string, sizeof(string),"Quieres escuhar musica? usa /emisoras para Sintonizar Una)", playername);
			    SendClientMessage(Playerid,COLOR_AMARILLO,string);
		    }
		}
	}
	else if(Mensaje == 1)
	{
	    for(Playerid = 0; Playerid <= 500; Playerid++)
		{
		    if(IsPlayerConnected(Playerid) && RMsg[Playerid] == 0)
		    {
    			format(string, sizeof(string),"Usa /update para saber todo de la Actualizacion Actual.)", playername);
			    SendClientMessage(Playerid,COLOR_ROJO,string);
		    }
		}
	}
	else if(Mensaje == 2)
	{
	    for(Playerid = 0; Playerid <= 500; Playerid++)
		{
		    if(IsPlayerConnected(Playerid) && RMsg[Playerid] == 0)
		    {
   			 	format(string, sizeof(string),"El Servidor se encuentra en una version beta si encuentras algun error toma captura y usa /soporte para comunicarte con el equipo desarrollador", playername);
	    		SendClientMessage(Playerid,COLOR_ROJO,string);
		    }
		}
	}
	else if(Mensaje == 3)
	{
	    for(Playerid = 0; Playerid <= 500; Playerid++)
		{
		    if(IsPlayerConnected(Playerid) && RMsg[Playerid] == 0)
		    {
    			format(string, sizeof(string),"message: text_client_message", playername);
			    SendClientMessage(Playerid,COLOR_ROJO,string);
		    }
		}
	}
 	else if(Mensaje == 4)
	{
	    for(Playerid = 0; Playerid <= 500; Playerid++)
		{
		    if(IsPlayerConnected(Playerid) && RMsg[Playerid] == 0)
		    {
     			format(string, sizeof(string),"message: text_client_message1)", playername);
     			SendClientMessage(Playerid,COLOR_ROJO,string);
		    }
		}
}
    else if(Mensaje == 5)
	{
	    for(Playerid = 0; Playerid <= 500; Playerid++)
		{
		    if(IsPlayerConnected(Playerid) && RMsg[Playerid] == 0)
		    {
    			format(string, sizeof(string),"Quieres Pertencer a las fuerzas policiales de San Andreas? Vez a un cyber y entra a la pagina oficial de la policia.", playername);
			    SendClientMessage(Playerid,COLOR_ROJO,string);
		    }
		}
}
	return 1;
}

public OnFilterScriptExit()
{
	print("Mensajes Automaticos Finalizados!");
	return 1;
}

public OnPlayerConnect(playerid)
{
	RMsg[playerid] = 0;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	RMsg[playerid] = 0;
	return 1;
}



