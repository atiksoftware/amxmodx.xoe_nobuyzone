#include <amxmodx>
#include <fakemeta>

public plugin_init( ) {
	register_plugin( "[XOE] No Buyzone", "1.0", "atiksoftware" ); 
	register_message( get_user_msgid( "StatusIcon" ), "Msg_StatusIcon" );
}

public Msg_StatusIcon( msgid, msgdest, id ) {

	new CurrentMap[64]
	get_mapname(CurrentMap,63);
	strtolower(CurrentMap)
	new pos = contain(CurrentMap,"jail_")
	if( pos != -1 ){
		static szMsg[ 8 ];
		get_msg_arg_string( 2, szMsg, 7 );
	    
		if( equal( szMsg, "buyzone" ) && get_msg_arg_int( 1 ) ) {
			set_pdata_int( id, 235, get_pdata_int( id, 235 ) & ~( 1 << 0 ) );
			return PLUGIN_HANDLED;
		}
	}
    
	return PLUGIN_CONTINUE;
}  