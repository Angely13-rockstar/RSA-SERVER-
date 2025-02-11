#define GRABACION "car_lspd_1"
#define TIPO_GRABACION 1  //<<--- Aqui va un 1 si tu NPC es en veh�culo y un 2 si es a Pie

#include <a_npc>
    main(){}
    public OnRecordingPlaybackEnd() StartRecordingPlayback(TIPO_GRABACION, GRABACION);

    #if TIPO_GRABACION == 1
        public OnNPCEnterVehicle(vehicleid, seatid) StartRecordingPlayback(TIPO_GRABACION, GRABACION);
        public OnNPCExitVehicle() StopRecordingPlayback(); 
    #else 
        public OnNPCSpawn() StartRecordingPlayback(TIPO_GRABACION, GRABACION);
       #endif
