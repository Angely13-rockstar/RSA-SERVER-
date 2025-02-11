//Usa los includes para aÃ±adir liberias pones algo mal y todo se va a la mierda
#include <a_samp>
#include <core>
#include <float>
#include <streamer>
#include <zcmd>
#include <sscanf2>
#include <filemanager>

 
//Los Colores usan Formato Hex
//Link de los Colores hex : https://www.color-hex.com/
 
//defines de cuadro de dialogos
#if !defined DIALOG_SKINS
    #define DIALOG_SKINS 1 
#endif


//defines de sistemas
#define YOUTUBER_PASSWORD "hola123" // Contraseña login de youtubers 

//define FLEMANAGER
#define FILENAME "test.txt"


//Colores 
#define C_BLANCO     0xFFFFFFAA
#define C_LIMA       0x10F441AA
#define C_AMARILLO   0xFFFF0000
#define C_ROJO       0xFF0000FF
#define C_AZUL       0xFFFF0000
#define C_CELESTE    0x00FFFFFF
#define C_NARANJA    0xFF9900AA
#define C_DORADO     0xE5E52BAA
#define C_VIOLETA    0x9f1488ff
#define C_GRIS       0x00ff00ff


//define de comandos con teclas


//TP POS custom
#define tp_pos_x_y_Z  -1847.8390,58.4249,1076.7141

#define tp_interior_test  14

//Enum
 
enum TrabajoPolicia
{
	Policia
 
};
new PlayerInfo[MAX_PLAYERS][TrabajoPolicia];

//

enum EquipoRoles {
    
    Youtuber,    
};

new TeamRoles[MAX_PLAYERS][EquipoRoles];

//

enum SorteoEstado {
    SORTEO_INACTIVO,
    SORTEO_ACTIVO,
    SORTEO_FINALIZADO,
};

//---------------------------------------------------------------------------------------
 
//News

//new tiempo de espera de /gb
new pCooldown[MAX_PLAYERS];

//News de sistema de sorteo
new SorteoEstado:EstadoDelSorteo = SORTEO_INACTIVO;
new SorteoParticipantes[MAX_PLAYERS];
new SorteoParticipantesCount;


//---------------------------------------------------------------------------------------

//Pubilcs Mods del sistema del sorteo
public IniciarSorteo(playerid) {
    if (TeamRoles[playerid][Youtuber] != 1) {
        SendClientMessage(playerid, C_ROJO, "No tienes permiso para iniciar un sorteo!");
        return;
    }

    EstadoDelSorteo = SORTEO_ACTIVO;
    SorteoParticipantesCount = 0;
    SendClientMessageToAll(C_LIMA, "Un nuevo sorteo ha comenzado! Usa /participar para inscribirte.");
    GameTextForAll("~g~SORTEO COMENZADO", 5000, 4);
}

public AgregarParticipante(playerid) {
    // Verificar si el jugador ya está inscrito
    for (new i = 0; i < SorteoParticipantesCount; i++) {
        if (SorteoParticipantes[i] == playerid) {
            SendClientMessage(playerid, C_ROJO, "Ya estás inscrito en el sorteo.");
            return 1;
        }
    }
    
    // Agregar al jugador al sorteo
    SorteoParticipantes[SorteoParticipantesCount] = playerid;
    SorteoParticipantesCount++;
    SendClientMessage(playerid, C_LIMA, "Te has inscrito para participar en el sorteo.");
    return 1;
}

public ContarParticipantes() {
    return SorteoParticipantesCount;
}

public FinalizarSorteo(playerid) {
    if (TeamRoles[playerid][Youtuber] != 1) {
        SendClientMessage(playerid, C_ROJO, "No tienes permiso para finalizar el sorteo!");
        return;
    }

    if (SorteoParticipantesCount == 0) {
        SendClientMessageToAll(C_ROJO, "No hay participantes en el sorteo.");
        return;
    }

    new ganador = random(SorteoParticipantesCount);
    new ganadorId = SorteoParticipantes[ganador];
    
    new playerName[MAX_PLAYER_NAME];
    GetPlayerName(ganadorId, playerName, sizeof(playerName));

    new message[128];
    format(message, sizeof(message), "¡%s ha ganado el sorteo!", playerName);
    SendClientMessageToAll(C_LIMA, message);

    EstadoDelSorteo = SORTEO_INACTIVO;
    SorteoParticipantesCount = 0;
}
//-----------------------------------------------------------------------------------------
 
// el main funciona para informar que la gamemode inicio si no sale nada en la consola
//es porque no inicio o no cargo la gamemode
 
main()
{
	print("Bluid0.0.1.amx Iniciado - Version Inestable");
	print("Revisar el log para encontrar las versiones estables");
	print("Editor : Visual Studio Code");
}

//--------------------------------Forwards------------------------------------------------
//----------------------------------------------------------------------------------
 
public OnGameModeInit()
{
	//Configuracion del Servidor [Remplaza el server.cfg para mas Seguridad]
	//Usa esto SendRconCommand y no uses Server.cfg si no quieres hackeos
	SendRconCommand("hostname [ESP] - RS SERVER - Uwu");
	SendRconCommand("webrul www.samp.com");
	SendRconCommand("mapname San Andreas");
	SendRconCommand("language EspaÃ±ol - America del Sur");
	SetGameModeText("Idefinido");
	LimitGlobalChatRadius(30.0);
	UsePlayerPedAnims(); // Dejar esto en en blanco para dejar las amins de CJ
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);

    //CODIGO DE TESTEO
	return 1;
}
 
public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}
 
//----------------------------------------------------------------------------------
 
public OnPlayerConnect(playerid)
{
    //Sistema de Aviso de entrada con nombre
    new playerName[MAX_PLAYER_NAME];
    GetPlayerName(playerid, playerName, sizeof(playerName));
 
    new mensaje[128];
    format(mensaje, sizeof(mensaje), "%s ha entrado al servidor.", playerName);
 
 
    SendClientMessageToAll(C_LIMA, mensaje);

	return 1;
}
 
//---------------------------------------------------------------------------------------
 
public OnPlayerDisconnect(playerid, reason)
{
	//Sistema de Aviso de Salida con Nombres

	 new playerName[MAX_PLAYER_NAME];
    GetPlayerName(playerid, playerName, sizeof(playerName));
 
    new mensaje[128];
    format(mensaje, sizeof(mensaje), "%s ha abandonado el servidor.", playerName);
 
 
    SendClientMessageToAll(C_LIMA, mensaje);

	return 1;
}
 
//----------------------------------------------------------------------------------------
 
public OnPlayerSpawn(playerid)
{
	//No tener Permiso para usar comandos de policia al menos que acepte el trabajo
	PlayerInfo[playerid][Policia] = 0;
	//No tener el rango youtuber cuando entre al servidor
	TeamRoles[playerid][Youtuber] = 0;
	return 1;
}
 
//-----------------------------------------------------------------------------------------
 
public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}
 
public OnVehicleSpawn(vehicleid)
{
	return 1;
}
 
public OnPlayerText(playerid, text[])
{
	return 1;
}
 


//--------------------------------------------------------------------------------
 
public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		return 1;
	}
	return 0;
}
  
//Comandos Inecesarios de mierda
 
CMD:info(playerid, params[])
{
    SendClientMessage(playerid, C_BLANCO, "Name : [ESP] - Bluid 0.0.1 - Inestable");
	SendClientMessage(playerid, C_BLANCO, "Mode :  Idefinido");
	SendClientMessage(playerid, C_BLANCO, "language : EspaÃ±ol - America del Sur");
	SendClientMessage(playerid, C_BLANCO, "IP : 0.0.0.0:0000");
	SendClientMessage(playerid, C_BLANCO, "Plataforma : SA-MP, Retrocompatible con Open-MP");
    return 1;
}
 
//Comandos Multimedia 
//Nota : Las Emisoras se pueden crear con ZenoMedia o Otros porgarmas 
CMD:emisoras(playerid, params[])
{
	SendClientMessage(playerid, C_BLANCO, "Radio X - {2700FF}/radiox");
    SendClientMessage(playerid, C_BLANCO, "Lips 105 - {2700FF}/lips105");
    SendClientMessage(playerid, C_BLANCO, "The Liberty Jam - {2700FF}/libertyjam");
	SendClientMessage(playerid, C_BLANCO, "Recuerda que puedes apagar la emisora con {2700FF}/emisoraoff");
	return 1;
} 
 
//Comando para apagar la emisora muy basico
CMD:emisoraoff(playerid, params[])
{
	PlayAudioStreamForPlayer(playerid);
	SendClientMessage(playerid, C_LIMA, "Has Apagado la Emiosora.");
	return 1;
}
 
CMD:radiox(playerid)
{
	//Para esto usa los Format me dio error al superar los limites de escritura. 
    new link[128];
    format(link, sizeof(link), "https://stream.zeno.fm/xxgoaz2muycvv");
 
    PlayAudioStreamForPlayer(playerid, link, 0.0, 0.0, 0.0, 0.0, 0);
 
    new mensaje[256];
    format(mensaje, sizeof(mensaje), "Estas Escuchando Radio X");
    SendClientMessage(playerid, C_LIMA, mensaje);
 
    return 1;
}

CMD:kjah(playerid)
{ 
    new link[128];
    format(link, sizeof(link), "https://www.youtube.com/watch?v=-izQMpJgYTU");
 
    PlayAudioStreamForPlayer(playerid, link, 0.0, 0.0, 0.0, 0.0, 0);
 
    new mensaje[256];
    format(mensaje, sizeof(mensaje), "Estas Escuchando K-JAH West");
    SendClientMessage(playerid, C_LIMA, mensaje);
 
    return 1;
}
 
//Comandos de Teleport
CMD:ls(playerid)
{
	SetPlayerPos(playerid,1513.9352,-1673.7258,14.0469);
	SendClientMessage(playerid, C_AMARILLO, "Bienvenido a Los Santos");
	return 1;
}
 
//Comandos para Testear
CMD:nrg(playerid)
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
 
    CreateVehicle(522, x, y, z, 0.0, -1, -1, 100);
 
    return 1;
}
 
CMD:angely(playerid, params[])
{
	SendClientMessage(playerid, -1, "debug: You have using skin angely");
	SetPlayerSkin(playerid, 172);
	return 1;
}
 
CMD:nopolice(playerid, params[])
{
    PlayerInfo[playerid][Policia] = 0;
    SendClientMessage(playerid, -1, "debug: You have left the police rank");
    return 1;
}

CMD:yespolice(playerid, params[])
{
    PlayerInfo[playerid][Policia] = 5;
    SendClientMessage(playerid, -1, "debug: You have obtonied the police rank 5");
    return 1;
}

CMD:ineedmoney(playerid, params[])
{
    GivePlayerMoney(playerid,9999999);
    SendClientMessage(playerid, -1, "debug: You have obtonied 2M$");
    return 1;
}

CMD:tpcustom(playerid, params[])
{
    SetPlayerPos(playerid,tp_pos_x_y_Z);   // Desactivar con //
    SetPlayerInterior(playerid, tp_interior_test);
    SendClientMessage(playerid, -1, "debug: welcome to pos custom");
    return 1;
}

//Comandos para rolear y chat golbal
CMD:me(playerid, params[])
{
    new playerName[MAX_PLAYER_NAME];
    new mensaje[128];
 
    GetPlayerName(playerid, playerName, sizeof(playerName));
 
    format(mensaje, sizeof(mensaje), "* %s %s", playerName, params);
    LimitGlobalChatRadius(25.0);
    SendClientMessageToAll(C_LIMA, mensaje);
 
    return 1;
}
 
CMD:do(playerid, params[])
{
    new playerName[MAX_PLAYER_NAME];
    new mensaje[128];
 
    GetPlayerName(playerid, playerName, sizeof(playerName));
 
    format(mensaje, sizeof(mensaje), "** %s %s", playerName, params);
 
    SendClientMessageToAll(C_LIMA, mensaje);
 
    return 1;
}
 
CMD:gb(playerid, params[])
{
    if (params[0] == '\0')
    {
        SendClientMessage(playerid, -1, "Uso: /gb [mensaje]");
        return 1;
    }
 
    new playerName[MAX_PLAYER_NAME];
    new mensaje[144];
 
    if (GetTickCount() - pCooldown[playerid] < 15000)
    {
        SendClientMessage(playerid, -1, "{F0164E}Debes esperar 15 segundos para poder enviar otro mensaje.");
        return 1;
    }
 
    GetPlayerName(playerid, playerName, sizeof(playerName));
 
    format(mensaje, sizeof(mensaje), "{16F02A}[Chat Global] %s: %s", playerName, params);
 
    SendClientMessageToAll(-1, mensaje);
 
    pCooldown[playerid] = GetTickCount();
 
    return 1;
}
 
//Comandos de Informacion General

CMD:update(playerid)
{
    SendClientMessage(playerid, C_ROJO, "debug : el texdraw no se encuentra en la variable");
    return 1;
}

//Comandos del Banco LSPD

//Comando de youtubers

CMD:youtuberlogin(playerid, params[]) {
    if (strlen(params) == 0) {
        SendClientMessage(playerid, C_ROJO, "Uso: /youtuberlogin <password>");
        return 1;
    }

    if (strcmp(params, YOUTUBER_PASSWORD, true) != 0) {
        SendClientMessage(playerid, C_ROJO, "Contraseña incorrecta.");
        SendClientMessage(playerid, C_ROJO, "No intentes iniciar login como youtuber si no tienes la contraseña.");
        SendClientMessage(playerid, C_ROJO, "Tu actividad fue enviada a la base de datos.");
        return 1;
    }

    SendClientMessage(playerid, 0xFF00FF00, "¡Contraseña correcta! Has iniciado sesión como youtuber en el servidor.");
    SendClientMessage(playerid, 0xFF00FF00, "Usa /youtuber cmds para echarle un vistazo a los comandos de Youtuber.");

    new playerName[MAX_PLAYER_NAME];
    GetPlayerName(playerid, playerName, sizeof(playerName));

    new message[128];
    format(message, sizeof(message), "%s ha iniciado sesion como Youtuber!", playerName);
    SendClientMessageToAll(C_ROJO, message);

    TeamRoles[playerid][Youtuber] = 1;

    return 1;
}

CMD:saliryoutuber(playerid, params[]) {
    if (TeamRoles[playerid][Youtuber] == 1) {
        TeamRoles[playerid][Youtuber] = 0;
        SendClientMessage(playerid, -1, "Has salido como Rango de Youtuber, Tu Actividad fue enviada a la base de datos");
    }
    return 1;
}

//Sistema de crear sorteo
CMD:crear_sorteo(playerid, params[]) {
    if (EstadoDelSorteo != SORTEO_INACTIVO) {
        SendClientMessage(playerid, C_ROJO, "Ya hay un sorteo en curso.");
        return 1;
    }
    IniciarSorteo(playerid);
    return 1;
}

CMD:participar(playerid, params[]) {
    if (EstadoDelSorteo != SORTEO_ACTIVO) {
        SendClientMessage(playerid, C_ROJO, "No hay ningun sorteo activo en este momento.");
        return 1;
    }
    AgregarParticipante(playerid);
    return 1;
}

CMD:finalizar_sorteo(playerid, params[]) {
    if (EstadoDelSorteo != SORTEO_ACTIVO) {
        SendClientMessage(playerid, C_ROJO, "No hay ningun sorteo activo para finalizar.");
        return 1;
    }
    FinalizarSorteo(playerid);
    return 1;
}

CMD:participantes(playerid, params[]) {
    new numParticipantes = ContarParticipantes();
    new message[128];
    format(message, sizeof(message), "Hay %d participantes en el sorteo.", numParticipantes);
    SendClientMessage(playerid, C_LIMA, message);
    return 1;
}

//Comandos Policia  
CMD:trabajar(playerid, params[])
{
    if (IsPlayerInRangeOfPoint(playerid, 2.0, 235.0688, 79.5305, 1005.0391))
    {
        PlayerInfo[playerid][Policia] = 5;
        SendClientMessage(playerid, C_AMARILLO, "Felicidades! Desde Ahora eres Policia\n{002BFF}Dirigete a la Sala de Uniformes para empezar a trabajar");
    }
    else
    {
        SendClientMessage(playerid, C_ROJO, "No estÃ¡s en el punto de trabajo. AcÃ©rcate al punto para trabajar.");
    }
    return 1;
}
 
CMD:chaleco(playerid, params[])
{
	if(PlayerInfo[playerid][Policia] == 5)
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.0, 253.2845,77.4962,1003.6406 ))
		SetPlayerArmour(playerid, 100.0);
		SendClientMessage(playerid, 0xFFFF00FF, "Has Agarrado un chaleco");
 
	} else return SendClientMessage(playerid, C_ROJO, "No Puedes Agarrar un Chaleco, No eres Policia");
	return 1;
}
 
CMD:armas1(playerid, params[])
{
    if (IsPlayerInRangeOfPoint(playerid, 1.0, 258.5159,78.1829,1003.6406))
	{
		if(PlayerInfo[playerid][Policia] == 5)
        GivePlayerWeapon(playerid, 3,   1);
		GivePlayerWeapon(playerid, 24,  1000);
		GivePlayerWeapon(playerid, 25,  1000);
		GivePlayerWeapon(playerid, 31,  5000);
		GivePlayerWeapon(playerid, 29,  5000);
	    SendClientMessage(playerid, 0xFFFF00FF, "Has agarrado del casillero el armamento numero 1");
 
 	} else return SendClientMessage(playerid, C_ROJO, "No puedes agarrar armas del casillero no eres policia");
    return 1; 
}

CMD:armas2(playerid, params[])
{
    if (IsPlayerInRangeOfPoint(playerid, 1.0, 258.5191,76.8288,1003.6406))
    {
        if(PlayerInfo[playerid][Policia] == 5)
        GivePlayerWeapon(playerid, 3,   1);
        GivePlayerWeapon(playerid, 24,  1000);
        GivePlayerWeapon(playerid, 27,  5000);
        GivePlayerWeapon(playerid, 29,  5000);
        GivePlayerWeapon(playerid, 31,  5000);
        SendClientMessage(playerid, 0xFFFF00FF, "Has agarrado del casillero el armamento numero 2");
        
    } else return SendClientMessage(playerid, C_ROJO, "No puedes agarrar armas del casillero no eres policia");
    return 1;
}
 
 
CMD:c(playerid, params[]) //Comando para poner cargos ojo con eliminar algo
{
    if (PlayerInfo[playerid][Policia] != 5)
    {
        SendClientMessage(playerid, C_ROJO, "No Eres Policia, No puedes usar este comando.");
        return 1;
    }
 
    if (params[0] == '\0')
    {
        SendClientMessage(playerid, -1, "Uso: /c [ID del jugador] [nivel]");
        return 1;
    }
 
    new targetid, level;
    if (sscanf(params, "ud", targetid, level))
    {
        SendClientMessage(playerid, -1, "Uso: /c [ID del jugador] [nivel]");
        return 1;
    }
 
    // Verifica que el nivel esta en el rango valido (0-6)
    if (level < 0 || level > 6)
    {
        SendClientMessage(playerid, C_ROJO, "El nivel debe estar entre 0 y 6.");
        return 1;
    }
 
    SetPlayerWantedLevel(targetid, level);
 
    SetPlayerColor(targetid, 0xFF0000FF); 
 
    // Obtener el nombre del jugador objetivo
    new targetName[MAX_PLAYER_NAME];
    GetPlayerName(targetid, targetName, sizeof(targetName));
 
    new mensaje[128];
    format(mensaje, sizeof(mensaje), "{09F402}Has asignado %d estrellas al jugador %d.", level, targetid);
    SendClientMessage(playerid, -1, mensaje);
 
    format(mensaje, sizeof(mensaje), "{F21212}Te han asignado %d estrellas de busqueda.", level);
    SendClientMessage(targetid, -1, mensaje);
 
    new globalMensaje[128];
    format(globalMensaje, sizeof(globalMensaje), "{2A12F2}[S.A.P.D] {12F22D}%s esta siendo buscado por la policia", targetName);
    SendClientMessageToAll(-1, globalMensaje);
 
    return 1;
} 
 
CMD:uniformes(playerid, params[])
{
    if (PlayerInfo[playerid][Policia] == 5)
    {
        if (IsPlayerInRangeOfPoint(playerid, 2.0, 255.3744, 77.3506, 1003.6406))
        {
            ShowPlayerDialog(playerid, DIALOG_SKINS, DIALOG_STYLE_LIST, "Selecciona tu skin", "Uniforme Masculino\nUniforme Femenino", "Seleccionar", "Cancelar");
        }
    }
    else
    {
        SendClientMessage(playerid, C_ROJO, "No Eres Policia, No Puedes ponerte el uniforme");
    }
    return 1;
}

CMD:motosapd(playerid, params[])
{
    if (PlayerInfo[playerid][Policia] == 5)
    {
        if (IsPlayerInRangeOfPoint(playerid, 1.0, 1587.2825, -1709.4152, 5.8906))
        {
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x, y, z);
            CreateVehicle(523, x, y, z, 0.0, -1, -1, 100);
            SendClientMessage(playerid, C_LIMA, "Has Spawneado una Moto S.A.P.D");
        }
    }
    else
    {
        SendClientMessage(playerid, C_ROJO, "No eres policia");
        return 1;
    }
    return 1;
}

CMD:autolspd(playerid, params[])
{
    if (PlayerInfo[playerid][Policia] ==5)
    {
        if (IsPlayerInRangeOfPoint(playerid, 1.0, 1583.4900, -1709.2543, 5.8906))
        {
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x, y, z);
            CreateVehicle(596, x, y, z, 0.0, -1, -1, 100);
            SendClientMessage(playerid, C_LIMA, "Has Spawneado un auto LSPD.");
        }
    }
    else
    {
        SendClientMessage(playerid, C_ROJO, "No eres policia");
        return 1;
    }
    return 1;
}    

CMD:repararauto(playerid, params[])
{
    if (PlayerInfo[playerid][Policia] ==5)
    {
        if (IsPlayerInRangeOfPoint(playerid, 2.0, 1545.8242,-1668.1470,5.6124))
        {
            RepairVehicle(GetPlayerVehicleID(playerid));
            SendClientMessage(playerid, C_AMARILLO, "Hugo Mecanico : Ya repare tu coche, sigue capturando a esos delicuentes");
            GivePlayerMoney(playerid, -100);
        }
    }
    else
    {
        SendClientMessage(playerid, C_AMARILLO, "Hugo Mecanico : No voy a reparar tu coche no eres personal autorizado");
        SendClientMessage(playerid, C_AMARILLO, "Supervisor : Vaya, Vaya, Parece que tenemos a un intruso en el parking");
        SendClientMessage(playerid, C_AMARILLO, "Sera mejor que te vallas si no quieres problemas.");
        SetPlayerColor(playerid, C_ROJO);
        SetPlayerWantedLevel(playerid, 2);
    }
    return 1;
}

//-----------------------------------------------------------------------------

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if (dialogid == DIALOG_SKINS) // Di�logo de las skins de LSPD
    {
        if (response)
        {
            switch (listitem)
            {
                case 0:
                    SetPlayerSkin(playerid, 300); // Asignar skin ID 300
                case 1:
                    SetPlayerSkin(playerid, 306); // Asignar skin ID 306
            }
            SendClientMessage(playerid, -1, "Te has equipado tu uniforme");
        }
        else
        {
            SendClientMessage(playerid, -1, "Has cancelado la selecion de uniformes");
        }
        return 1;
    }
    return 0;
}

//---------------------------------------------------------------------------
 
public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    return 1;
}
 
 
//--------------------------------------------------------------------------
 
public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
   return 1;
}
 
//---------------------------------------------------------------------------
 
public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}
 
//----------------------------------------------------------------------------

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    return 1;
}

//-------------------------------------------------------------------------------
 
public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}
 
public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}
 
public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}
 
public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}
 
public OnRconCommand(cmd[])
{
	return 1;
}
 
public OnPlayerRequestSpawn(playerid)
{
	return 1;
}
 
public OnObjectMoved(objectid)
{
	return 1;
}
 
public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}
 
public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}
 
public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}
 
public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}
 
public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}
 
public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}
 
public OnPlayerExitedMenu(playerid)
{
	return 1;
}
 
public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}
 
public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}
 
public OnPlayerUpdate(playerid)
{
	return 1;
}
 
public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}
 
public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}
 
public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}
 
public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}
 
public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}	
