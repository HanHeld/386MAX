
# Dependencies generated by DepScan v1.22

E820_ADEP =

LIGHTS_DEP =

MAKEBOOT_DEP =\
	{$(P)}makeboot.h

MEM_A20_ADEP =\
	{$(P)}MEM_SEGS.INC\
	{$(P)}MEM_GL3.INC\
	{$(P)}MEM_A20.INC

MEM_CAL_ADEP =\
	{$(P)}MEM_COM.MAC\
	{$(P)}MEM_TIME.INC

MEM_CMD_ADEP =\
	{$(P)}MEM_OEM.INC\
	{$(P)}MEM_SCRN.INC\
	{$(P)}MEM_GLB.INC\
	{$(P)}MEM_GL2.INC\
	{$(P)}MEM_CMD.INC\
	{$(P)}MEM_DBG.INC

MEM_EPM_ADEP =\
	{$(P)}MEM_DTE.INC\
	{$(P)}MEM_MSGS.INC\
	{$(P)}MEM_OEM.INC\
	{$(P)}MEM_TIME.INC\
	$(Q)EMM2CALL.INC\
	$(Q)QMAX_CTL.INC\
	$(Q)QMAX_VCP.INC\
	{$(P)}MEM_CMD.INC\
	{$(P)}MEM_DBG.INC\
	{$(P)}MEM_GLB.INC\
	{$(P)}MEM_GL2.INC\
	{$(P)}MEM_GL3.INC\
	{$(P)}MEM_CNT.INC\
	{$(P)}MEM_SYS.INC\
	{$(P)}MEM_SHD.INC\
	$(Q)QMAXINFO.INC

MEM_FALT_ADEP =\
	{$(P)}MEM_BLK.INC\
	{$(P)}MEM_SCRN.INC\
	{$(P)}MEM_COM.MAC\
	{$(P)}MEM_OEM.INC\
	{$(P)}MEM_DBG.INC\
	{$(P)}MEM_GL2.INC\
	{$(P)}MEM_GL3.INC\
	{$(P)}MEM_TIME.INC\
	{$(P)}MEM_CMD.INC\
	{$(P)}MEM_CNT.INC

MEM_FCN_ADEP =\
	{$(P)}MEM_BLK.INC\
	{$(P)}MEM_OEM.INC\
	{$(P)}MEM_CMD.INC\
	{$(P)}MEM_CNT.INC\
	{$(P)}MEM_DBG.INC\
	{$(P)}MEM_GL2.INC\
	{$(P)}MEM_GL3.INC

MEM_FMT_ADEP =\
	{$(P)}MEM_GL2.INC\
	{$(P)}MEM_TIME.INC

MEM_HELP_ADEP =\
	{$(P)}MEM_SCRN.INC\
	{$(P)}MEM_OEM.INC\
	{$(P)}MEM_GL2.INC\
	{$(P)}MEM_GL3.INC\
	{$(P)}MEM_TIME.INC

MEM_HTX2_ADEP =\
	{$(P)}WRAPPER.INC\
	{$(P)}MEM_OEM.INC

MEM_HTXT_ADEP =\
	{$(P)}MEM_SCRN.INC

MEM_IDN_ADEP =\
	{$(P)}MEM_SCRN.INC\
	{$(P)}MEM_OEM.INC\
	$(Q)QMAX_IDN.INC

MEM_KEY_ADEP =\
	{$(P)}MEM_GLB.INC

MEM_LID_ADEP =\
	{$(P)}MEM_LID.MAC\
	{$(P)}MEM_CNT.INC\
	{$(P)}MEM_TIME.INC

MEM_LIN_ADEP =\
	{$(P)}MEM_LIN.MAC\
	{$(P)}MEM_CNT.INC\
	{$(P)}MEM_TIME.INC

MEM_MAIN_ADEP =\
	{$(P)}MEM_BLK.INC\
	{$(P)}MEM_DTE.INC\
	{$(P)}MEM_OEM.INC\
	{$(P)}MEM_SCRN.INC\
	{$(P)}MEM_TIME.INC\
	{$(P)}MEM_CMD.INC\
	{$(P)}MEM_CNT.INC\
	{$(P)}MEM_GLB.INC\
	{$(P)}MEM_GL3.INC\
	{$(P)}MEM_SYS.INC\
	{$(P)}MEM_SHD.INC\
	{$(P)}MEM_GL2.INC

MEM_MISC_ADEP =\
	{$(P)}MEM_GL2.INC

MEM_MSGS_ADEP =\
	{$(P)}VERSBETA.INC\
	{$(P)}MEM_OEM.INC\
	{$(P)}MEM_SCRN.INC

MEM_SCRN_ADEP =\
	{$(P)}MEM_BLK.INC\
	{$(P)}MEM_OEM.INC\
	{$(P)}MEM_SCRN.INC\
	{$(P)}MEM_SEGS.INC\
	{$(P)}MEM_GL2.INC

MEM_SYS_ADEP =\
	{$(P)}MEM_TIME.INC\
	{$(P)}MEM_CMD.INC\
	{$(P)}MEM_GL2.INC\
	{$(P)}MEM_GLB.INC\
	{$(P)}MEM_GL3.INC\
	{$(P)}MEM_SYS.INC\
	{$(P)}MEM_SHD.INC

MEM_TIME_ADEP =\
	{$(P)}MEM_OEM.INC\
	{$(P)}MEM_SCRN.INC\
	{$(P)}MEM_DBG.INC\
	{$(P)}MEM_GL2.INC\
	{$(P)}MEM_SHD.INC\
	{$(P)}MEM_TIME.INC

MEM_UID_ADEP =\
	{$(P)}MEM_UID.MAC\
	{$(P)}MEM_CNT.INC\
	{$(P)}MEM_TIME.INC

MEM_UIN_ADEP =\
	{$(P)}MEM_UIN.MAC\
	{$(P)}MEM_CNT.INC\
	{$(P)}MEM_TIME.INC

MEM_USF_ADEP =\
	{$(P)}MEM_USF.MAC\
	{$(P)}MEM_CNT.INC\
	{$(P)}MEM_TIME.INC

MEM_UTF_ADEP =\
	{$(P)}MEM_UTF.MAC\
	{$(P)}MEM_CNT.INC\
	{$(P)}MEM_TIME.INC

VERSBETA_ADEP =

VERSION_ADEP =

VERSRET_ADEP =

WRAPPER_DEP =\
	{$(P)}wrapper.h


# Header dependencies

MEM_LID.MAC:\
	{$(P)}MEM_COM.MAC

MEM_LIN.MAC:\
	{$(P)}MEM_COM.MAC

MEM_UID.MAC:\
	{$(P)}MEM_COM.MAC

MEM_UIN.MAC:\
	{$(P)}MEM_COM.MAC

MEM_USF.MAC:\
	{$(P)}MEM_COM.MAC

MEM_UTF.MAC:\
	{$(P)}MEM_COM.MAC

