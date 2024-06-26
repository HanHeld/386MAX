
# Dependencies generated by DepScan v1.10

ADF_DEP =\
	$(H)commdef.h\
	$(H)engine.h\
	adf.h\
	$(H)commfunc.h\
	$(H)saveadf.h\
	engtext.h

BIOSID_ADEP =

BUSINFO_ADEP =

CFG_INFO_DEP =\
	$(H)engine.h\
	info.h\
	sysinfo.h\
	$(H)commfunc.h\
	$(H)libtext.h\
	engtext.h

CPUTEXT_DEP =\
	$(H)cputext.h\
	$(H)cpu.h\
	$(H)libtext.h

ENGINE_DEP =\
	sysinfo.h\
	info.h\
	$(H)engine.h\
	$(H)myalloc.h\
	mem_info.h\
	cfg_info.h\
	hdw_info.h

FLEXROMS_ADEP =\
	$(Q)EMM2CALL.INC\
	$(Q)QMAX_CTL.INC\
	$(Q)QMAX_FLX.INC\
	$(Q)QMAX_DBG.INC\
	$(Q)QMAXINFO.INC

GETBCRC_ADEP =\
	$(Q)EMM2CALL.INC

GLIST_DEP =\
	$(H)commfunc.h\
	$(H)myalloc.h\
	glist.h\
	engtext.h

HDW_INFO_DEP =\
	$(H)commfunc.h\
	$(H)dcache.h\
	$(H)engine.h\
	$(H)libtext.h\
	$(H)pnp.h\
	$(H)video.h\
	info.h\
	sysinfo.h\
	engtext.h

INFO_DEP =\
	$(H)hmem.h\
	info.h\
	$(H)libtext.h

MAPINFO_DEP =\
	testmem.h\
	sysinfo.h\
	mapinfo.h\
	qtas.h\
	$(H)commfunc.h\
	engtext.h

MEM_INFO_DEP =\
	$(H)engine.h\
	info.h\
	sysinfo.h\
	$(H)commfunc.h\
	$(H)libtext.h\
	engtext.h

MULTIME_ADEP =

PROFILE_DEP =\
	$(H)commdef.h\
	sysinfo.h\
	$(H)commfunc.h\
	$(H)screen.h\
	engtext.h\
	profile.h

QTAS_DEP =\
	$(H)engine.h\
	$(H)myalloc.h\
	sysinfo.h\
	$(H)commfunc.h\
	qtas.h\
	engtext.h

QTAS_MAC_ADEP =\
	$(H)PSPSTR.INC\
	$(Q)LOAD_SEG.INC\
	$(Q)EMM2CALL.INC

READSYS_DEP =\
	$(H)commfunc.h\
	$(H)dcache.h\
	mapinfo.h\
	$(H)myalloc.h\
	sysinfo.h\
	systext.h\
	$(H)intmsg.h

SYSBUF_DEP =\
	$(H)commfunc.h\
	sysinfo.h

SYSINFO_DEP =\
	$(H)asqvers.h\
	$(H)asqshare.h\
	$(H)bioscrc.h\
	$(H)dcache.h\
	$(H)commfunc.h\
	$(H)engine.h\
	$(H)gameport.h\
	$(H)libtext.h\
	$(H)mbparse.h\
	$(H)myalloc.h\
	$(H)pnp.h\
	$(H)svga_inf.h\
	$(H)video.h\
	businfo.h\
	mapinfo.h\
	mfrlist.h\
	profile.h\
	qtas.h\
	engtext.h\
	sysinfo.h

TESTHEAP_DEP =\
	$(H)testheap.h

TESTMEM_ADEP =\
	$(Q)EMM2CALL.INC\
	$(Q)QMAX_RAM.INC\
	$(H)RAMSCAN.INC\
	$(H)VENDINFO.INC

TIMER_ADEP =

WRITSYS_DEP =\
	$(H)commfunc.h\
	$(H)dcache.h\
	mapinfo.h\
	sysinfo.h\
	systext.h

XMSINFO_ADEP =


# Header dependencies

adf.h:\
	$(H)commdef.h\
	$(H)mca_pos.h\
	sysbuf.h

businfo.h:\
	$(H)pnp.h

cfg_info.h:\
	$(H)commdef.h

hdw_info.h:\
	$(H)commdef.h

info.h:\
	$(H)commdef.h

mapinfo.h:\
	$(H)commdef.h

mem_info.h:\
	$(H)commdef.h

qtas.h:\
	$(H)commdef.h

sysbuf.h:\
	$(H)commdef.h\
	glist.h

sysinfo.h:\
	$(H)commdef.h\
	$(H)c_tload.h\
	$(H)cpu.h\
	$(H)emsinfo.h\
	$(H)listlist.h\
	$(H)mca_pos.h\
	adf.h\
	biosid.h\
	flexroms.h\
	glist.h\
	sysbuf.h\
	timer.h\
	xmsinfo.h

