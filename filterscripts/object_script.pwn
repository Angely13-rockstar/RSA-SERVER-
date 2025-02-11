//Object Script - Rockstar Games Exclusive Use


#define FILTERSCRIPT

//COLORES
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


#include <a_samp>
#include <streamer>
#include <sscanf2>

#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	print("\n----------------------------------");
	print(" Object Script - RSA Server         ");
	print(" CreateDynamicObject - 64           ");
	print(" CreateVehicle - 3                  ");
	print(" CreateDynamicActor - 2             ");
	print(" CreateDynamic3DTextLabel - 13      ");
	print(" CreateDynamicPickup - 10           ");
	print(" CreateDynamicMapIcon - 3           ");
	print(" 4 KB -                             ");
	print("----------------------------------\n");
}

#else

main()
{
	print("\n----------------------------------");
	print(" MAP_DAT IS READY :D                ");
	print(" CreateDynamicObject - 16           ");
	print(" CreateVehicle - 3                  ");
	print(" ");
	print("----------------------------------\n");
}

#endif

public OnFilterScriptExit()
{
	return 1;
}

public OnGameModeInit()
{
	////////////////////////////////////////////MAPS///////////////////////////////////////////////////////////////////////////
	//MAP_LS_CRUSING_1
	 new tmpobjid;
    tmpobjid = CreateDynamicObject(19482, 73.391021, -1529.550659, 11.270715, 0.000000, 0.000000, -8.699998, -1, -1, -1, 300.00, 300.00); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    SetDynamicObjectMaterialText(tmpobjid, 0, "{ffffff}Buen Viaje!", 40, "Calibri", 20, 0, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObject(19126, 67.589370, -1531.892333, 4.653419, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19126, 48.167869, -1528.334594, 4.854677, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19126, 56.209300, -1529.897583, 4.679794, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19126, 40.981876, -1527.111572, 4.923038, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19126, 67.504608, -1536.104370, 4.714978, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19126, 55.601917, -1534.372192, 4.841968, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19126, 40.986167, -1532.399780, 4.909197, 0.000000, 0.000000, -1.399999, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19127, 47.751186, -1533.450073, 4.805209, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19972, 67.228012, -1522.723266, 3.735061, 0.000000, 0.000000, 85.499992, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(18720, 57.645427, -1521.918823, 4.361200, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3578, 61.791320, -1524.892456, 4.513848, 0.000000, 0.000000, -5.599998, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3578, 51.187911, -1523.888671, 4.555006, 0.000000, 0.200001, -5.199998, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3578, 40.671699, -1520.933715, 4.673676, 0.000000, 0.000000, -28.500001, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1282, 67.045822, -1524.038330, 4.607590, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(7246, 72.619949, -1531.745971, 8.341841, 0.000000, 0.000000, 80.200027, -1, -1, -1, 300.00, 300.00); // LS
    tmpobjid = CreateDynamicObject(3578, 40.288867, -1540.455932, 5.008451, 0.000000, 0.000000, 10.700003, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3578, 50.645629, -1540.276855, 4.941940, 0.000000, 0.000000, -7.600000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(3578, 61.064125, -1541.658569, 4.919440, 0.000000, 0.000000, -7.199999, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1282, 36.611965, -1538.348144, 4.905922, 0.000000, 0.000000, -18.300003, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(1282, 65.535003, -1544.927246, 4.673395, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 
    tmpobjid = CreateDynamicObject(19989, 35.417167, -1531.764282, 4.295331, 0.000000, 0.000000, -97.699966, -1, -1, -1, 300.00, 300.00); 

    //MAP_HILLIS_1
    tmpobjid = CreateDynamicObject(19482, -454.253448, -833.809814, 51.583843, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.29, 300.29); 
    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    SetDynamicObjectMaterialText(tmpobjid, 0, "{ffffff}Bienvenidos a\nFlint County", 120, "Ariel", 20, 1, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObject(19951, -399.666168, -820.926635, 46.820903, 0.000000, 0.000000, 26.299997, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(19951, -408.609771, -820.926025, 47.173572, 0.000000, 0.000000, 20.100000, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(19951, -417.633636, -821.120483, 47.615955, 0.000000, 0.000000, 25.199998, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(19951, -427.743835, -822.582824, 47.985630, 0.000000, 0.000000, 27.500007, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(19951, -438.106811, -825.361511, 48.369586, 0.000000, 0.000000, 30.600004, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(19951, -447.051208, -830.629394, 48.677265, 0.000000, 0.000000, 40.299999, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(19980, -454.300598, -833.779785, 49.013393, 0.000000, 0.000000, 91.500022, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -466.300537, -841.258728, 53.528594, 0.000000, 0.000000, 111.099998, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -496.258941, -862.173095, 55.571781, 0.000000, 0.000000, 125.500007, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -523.167846, -887.978942, 57.954380, -1.099998, 0.000000, 142.300003, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -542.772888, -907.373535, 59.856060, 0.000000, 0.000000, 121.599983, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -557.291809, -922.940307, 61.405292, 0.000000, 0.000000, 134.000015, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -571.071044, -937.911315, 62.906658, 0.000000, 0.000000, 128.199966, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -585.323303, -952.683288, 64.703552, 0.000000, 0.000000, 128.799987, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -602.261230, -964.823242, 66.500144, 0.000000, 0.000000, 119.200004, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -623.942565, -980.601013, 68.881233, 0.000000, 0.000000, 114.700004, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -645.067687, -991.136413, 71.078689, 0.000000, 0.000000, 99.499984, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -664.160644, -997.117309, 72.845893, -4.400000, 0.000000, 104.400001, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(3425, -625.235961, -1004.412475, 79.034843, 0.000000, 0.000000, -86.000007, -1, -1, -1, 1000.29, 1000.29); // remolino
    tmpobjid = CreateDynamicObject(1226, -686.714050, -1001.905822, 74.909599, 0.000000, 0.000000, 91.999954, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -705.788208, -1002.604492, 76.523429, 0.000000, 0.000000, 91.899986, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(19992, -669.417053, -997.049072, 69.498901, 0.000000, 0.000000, 89.400001, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -729.632080, -1002.636230, 78.353607, 0.000000, 0.000000, 81.199981, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -752.749511, -999.940246, 79.758911, -9.199997, 0.000000, 79.300003, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -774.214233, -998.737731, 81.485389, 0.000000, 0.000000, 78.399993, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -796.654296, -999.623107, 83.659576, 0.999999, 0.000000, 93.000007, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -814.784057, -1003.738342, 85.076385, 0.000000, -1.499998, 96.500030, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -833.744506, -1012.495544, 87.478607, 0.999999, 0.000000, 108.599990, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -847.131835, -1025.074951, 89.764991, 2.200000, 0.000000, 130.099975, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(19980, -857.647460, -1032.559082, 87.344535, 40.100055, 0.000000, 113.700019, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -859.317138, -1038.577636, 92.123619, 0.000000, 0.000000, 135.699966, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -866.484558, -1050.531127, 93.736640, 0.000000, 0.000000, 146.000000, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -874.060058, -1067.706298, 95.915428, 2.799999, 0.000000, 154.300003, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -881.384033, -1083.835693, 98.103660, 0.000000, 0.000000, 158.900009, -1, -1, -1, 300.29, 300.29); 
    tmpobjid = CreateDynamicObject(1226, -885.193115, -1100.604736, 100.841804, 0.000000, 0.000000, 159.000045, -1, -1, -1, 300.29, 300.29); 


	//MAP_LS_LSPD_OFF_VEHICLE
	CreateDynamicObject(1236, 1551.019531, -1655.028320, 5.840629, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00); 

	////////////////////////////////////////CARS_SPAWN////////////////////////////////////////////////////////////////////////////
	//MAP_LS_CARS_LSPD
	CreateVehicle(402,1530.7443,-1646.2684,5.6142, 0.0, -1, -1, 100);
    CreateVehicle(596,529.9785,-1688.1166,5.6138, 0.0, -1, -1, 100);
    CreateVehicle(596,1529.2937,-1684.0266,5.6119, 0.0, -1, -1, 100);

	///////////////////////////////////////ACTOR_SPAWN////////////////////////////////////////////////////////////////////////////
	//NPC_LS_LSPD_1
	CreateDynamicActor(306, 251.2600,66.7643,1003.6406,90.7813); 
	CreateDynamicActor(300, 251.2588,68.8661,1003.6406,90.7813);  

	///////////////////////////////////////LABLES_3D_RENDER////////////////////////////////////////////////////////////////////////
	CreateDynamic3DTextLabel("Los Santos", 0xFFFF00FF, 1513.9352, -1673.7258, 14.0469, 25.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Departamento de Policia de Los Santos LSPD", C_BLANCO, 1552.6299,-1675.6852,16.1953, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Usa /autolspd para spawnear un vehiculo LSPD", C_BLANCO, 1583.4900,-1709.2543,5.8906, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Usa /repararauto para que Hugo te repare el vehiculo", C_BLANCO, 1545.8242,-1668.1470,5.6124, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Presiona [H] para ir al estacionamiento", C_BLANCO, 246.3974,88.0084,1003.6406, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Trabajo de Policia\n{FFFFFF}Usa /trabajar para ser Policia", 0xFF0000FF, 235.0624, 79.5296, 1005.0391, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Usa /uniformes para equiparte tu uniforme", C_BLANCO, 255.3847, 77.9602, 1003.6406, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Usa /chaleco para equiparte un chaleco", C_BLANCO, 253.2845, 77.4962, 1003.6406, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Usa /armas1 para agarrar el armamento numero 1", C_BLANCO, 258.5159,78.1829,1003.6406, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Usa /armas2 para agarrar el armamento numero 2", C_BLANCO,258.5191,76.8288,1003.6406, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Estacionamiento del Departamento de Policia de Los Santos", C_BLANCO, 1588.3311,-1637.8988,13.4280, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Usa /motosapd  para spawnear una moto sapd del estacionamiento", C_BLANCO, 1587.2825,-1709.4152,5.8906, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
    CreateDynamic3DTextLabel("Banco de Los Santos\nUsa /entrar Para Acceder al Banco!", C_LIMA, 1498.4368,-1580.5173,13.5498, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0);
 
    ///////////////////////////////////////PIKUCS_RENDER//////////////////////////////////////////////////////////////////////////////
	CreateDynamicPickup(1275,0,255.3847,77.9602,1003.6406,0);
    CreateDynamicPickup(1242,0,253.2845,77.4962,1003.6406,0);
	CreateDynamicPickup(2044,0,258.5159,78.1829,1003.6406,0);
    CreateDynamicPickup(2044,0,258.5191,76.8288,1003.6406,0);
    CreateDynamicPickup(1318,0,1587.2825,-1709.4152,5.8906,0);
    CreateDynamicPickup(1318,0,1583.4900,-1709.2543,5.8906,0);
    CreateDynamicPickup(1318,0,1545.8242,-1668.1470,5.6124,0);
    CreateDynamicPickup(1318,0,1498.4368,-1580.5173,13.5498,0);
	CreateDynamicPickup(1248,0,1513.9352,-1673.7258,14.0469,0);
	CreateDynamicPickup(1240,0,1552.6299,-1675.6852,16.1953,0);

	/////////////////////////////////////////ICONS_RADAR/////////////////////////////////////////////////////////////////////////////
	CreateDynamicMapIcon(1513.9352,-1673.7258,14.0469, 44, -1, 0, 0);
    CreateDynamicMapIcon(1546.5450,-1675.4380,13.5625, 30, -1, 0, 0);
    CreateDynamicMapIcon(1498.4368,-1580.5173,13.5498, 52, -1, 0, 0);

	return 1;
}
