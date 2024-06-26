#' $Header:   P:/PVCS/MAX/MAX.MAV   1.15   07 Apr 1997 14:59:04   BOB  $
#
# MAX.MAK - Top-level makefile for MAX 8
#
# This makefile builds everything.
#
# Requires: NMAKE (1.40), CL (v8.0), ML6 (Masm 6.0), LIB (3.40),
#	    LINK (5.60), RC (3.11), RCPPP (named RCPP.EXE, with original
#	    RCPP.EXE named _RCPP.EXE in same directory), VDIR,
#	    XC, MASM5 (5.10B for flat model VxD code), MASM (5.10)
#

# Assert required environment variables
!if "$(MAXROOT)" == ""
  !error MAXROOT is not defined.  Ex: SET MAXROOT=c:\max\
!endif

# Needed only for C runtime (shared between projects)
!if "$(CATROOT)" == ""
  !error CATROOT is not defined.  Ex: SET CATROOT=c:\qdisp\
!endif

# Get common definitions
CORECODE=X							# X for 386MAX, U for BlueMAX, V for Move'EM
!include $(MAXROOT)include\maxnames.mak
# (maxnames.mak defines defaults for LANG and BETA)

# Other values to be overridden on command line
DEBUG = 0							# 0 to generate non-debug (retail) version
BINDIR = $(MAXROOT)lib\ 			# Where to copy .EXE and .DLL files
LIBDIR = $(MAXROOT)lib\ 			# Where to copy .LIB files
TARGETS = BUILD 					# Targets to run on each makefile
GETCMD =							# Name of batch file containing "get ..."
DALL = 1							# Delete everything.  If 0 skip CodeBase
									# and C runtime (not mutable).
LIBINT3 = 0							# Puts Int 3 in each LibMain()
MFCDBG = 0							# Links CodeView info with MFC apps
# We displayed all four version numbers in the RC1 version by mistake.
# We're continuing to do it intentionally for now.
# Not any more as this forces beta numbering in 386MAX.
!if "$(DEBUG)" == "0"
BETA = 0							# Turn on display of build/module numbers
!else
BETA = 1							# Turn on full version display
!endif
ALPHA = 							# Non-empty for informal alpha build

# Other definitions
MRF = $(MAXROOT)max.mrf 			# Make response file
NET = p:\max\						# Network MAXROOT
X = $(TOOLS)						# Where tools like PACKAGE.EXE live
BCF = x:\apps\release\bcf\			# Source directory for @*.BCF files

!if "$(TARGETS)" == "BUILD"
BTARGS=ALL
!else
BTARGS=$(TARGETS)
!endif

# Define projects to build.  If the project .MAK file has the same
# basename as the directory, use *.  All directories are relative
# to MAXROOT.

# Things nearly everyone may depend on (like include and C run-time)
# and miscellaneous stuff like text (which may copy needed .LIB files)
# and any .LIB files.  DOS help files, which need no mappings, live here
# as well.
NEEDNOTHING=CRT.TRG INCLUDE.TRG INC.TRG TEXT.TRG QUILIB.TRG ASQENG.TRG\
	DOSHELP.TRG TOOLS.TRG TEXT.TRG

# DLLs that need other libraries or DLLs built first
NEEDLIB=\

# Applications (which may need DLLs or .LIBs)
NEEDDLL=\
	386DISK.TRG\
	386LOAD.TRG\
	386MAX.TRG\
	ASQ.TRG\
	BATPROC.TRG\
	DOSMAX16.TRG\
	EXTRADOS.TRG\
	GOAHEAD.TRG\
	INSTALL.TRG\
	MAX.TRG\
	MAXCTRL.TRG\
	MAXEDIT.TRG\
	MAXHELP.TRG\
	MAXIMIZE.TRG\
	MAXMETER.TRG\
	MAXSETUP.TRG\
	MAXVXD.TRG\
	MEMLIMIT.TRG\
	QMT.TRG\
	QPIFEDIT.TRG\
	QPOPUP.TRG\
	ROMSRCH.TRG\
	SNAPSHOT.TRG\
	STRIPMGR.TRG\
	WINMXMZ.TRG\
	XLAT.TRG

# Define some targets for BlueMAX only
#!IF "$(CORECODE)" == "U"
NEEDDLL=$(NEEDDLL)\
	RAMBASIC.TRG
#!ENDIF


# The first target will get built if nothing specified.  Note
# that we must identify prerequisites first.  *.TRG files must
# never exist; these names are used as targets only.
ALL:: NOTHING
	@echo --------------------------
	@echo $(TARGETS) libraries with no requirements: done
	@echo --------------------------
	vdir -c $(BINDIR)
!if "$(BINDIR)" != "$(MAXROOT)lib\"
	vdir -c $(MAXROOT)lib
!endif

ALL:: $(NEEDNOTHING)
	@echo --------------------------
	@echo $(TARGETS) .LIBs and miscellaneous stuff: done
	@echo --------------------------

ALL:: $(NEEDLIB)
	@echo --------------------------
	@echo $(TARGETS) Dynamic Link Libraries: done
	@echo --------------------------

ALL:: $(NEEDDLL)
	@echo --------------------------
	@echo $(TARGETS) applications: done
	@echo --------------------------

HELP:
	@echo Possible targets for MAX.MAK:
	@echo Low-level targets:
	@echo $(NEEDNOTHING)
	@echo.
	@echo DLLs:
	@$(COMSPEC) /c <<temp1.bat
	@echo off
	$(NEEDLIB: =^
	@echo )
<<KEEP
	@echo.
	@echo Applications:
	@$(COMSPEC) /c <<temp2.bat
	@echo off
	$(NEEDDLL: =^
	@echo )
<<KEEP
	@echo.
	@echo Predefined targets:
	@echo ALL DISK
	@echo.
	@echo TARGETS= values:
	@echo BUILD (default) GET DEL
	@echo.
	@echo Examples:
	@echo nmake /f max.mak NET=
	@echo nmake /f max.mak TARGETS=GET GETCMD="c:\max\myget.bat"
	@echo nmake /f max.mak TARGETS=DEL DALL=0
	@echo nmake /f max.mak BINDIR=z:\clip\henry\win\ asq.trg
	@echo nmake /f max.mak 386max.trg

NOTHING:
!if "$(TARGETS)" == "BUILD"
	@echo Creating local definitions:
	@type <<$(MAXROOT)include\_lcldefs.h
#define BUILD_BETA		$(BETA) 			// Beta (not a retail) build
#define BUILD_ALPHA		"$(ALPHA)"                      // Alpha build suffix
<<KEEP
!endif

ALWAYS: NOTHING
	@echo Creating <<$(MAXROOT)maxcmd.bat
@echo off
REM Arg %1 - directory relative to %MAXROOT% (no trailing BS)
REM Arg %2 - makefile name
REM Arg %3 - nmake response file
REM Arg %4 - Models to build (L, LM, LMS, or empty for default)
REM
REM Directory need not exist and makefile need not exist (or be
REM up to date).
REM
REM Change drive
if not "%MBLDOUT%" == "" echo %0 %1 %2 %3 %4
%MAXROOT%
REM Make sure directory exists
vdir -c %MAXROOT%%1
REM Make it the current directory
cd %MAXROOT%%1
!if "$(NET)" != ""
REM Get makefile and any .INC files it needs
@echo on
if exist $(NET)%1\makefile  xc /n/a/t $(NET)%1\makefile  %MAXROOT%%1
if exist $(NET)%1\*.mak     xc /n/a/t $(NET)%1\*.mak	 %MAXROOT%%1
if exist $(NET)%1\*.inc     xc /n/a/t $(NET)%1\*.inc	 %MAXROOT%%1
@echo off
!endif
REM Invoke the makefile
echo **************************** Invoking %1\%2
!if "$(BTARGS)" != "GET"
for %%f in (L LM LMS LSM LS M ML MLS MSL MS) do if "%4" == "%%f" goto domodels
!endif
$(MAKE) -$(MAKEFLAGS) -f %2 @%3
if errorlevel 1 goto end
goto complete
!if "$(BTARGS)" != "GET"
:domodels
for %%f in (M MS) do if "%4" == "%%f" goto nolarge
$(MAKE) -$(MAKEFLAGS) -f %2 MODEL=L @%3
if errorlevel 1 goto end
:nolarge
for %%f in (L LS) do if "%4" == "%%f" goto nomedium
$(MAKE) -$(MAKEFLAGS) -f %2 MODEL=M @%3
if errorlevel 1 goto end
:nomedium
for %%f in (L LM M ML) do if "%4" == "%%f" goto complete
$(MAKE) -$(MAKEFLAGS) -f %2 MODEL=S @%3
if errorlevel 1 goto end
!endif
:complete
cd %MAXROOT%.
:end
echo **************************** %1 done.
<<KEEP

$(MRF): $(MAXROOT)max.mak ALWAYS
	@echo Options passed to project makefiles:
	@type <<$(MRF)
BINDIR=$(BINDIR)\\
DEBUG=$(DEBUG)
MSVC=$(MSVC)\
WIN=$(WIN)
X=$(X)\
LIBINT3=$(LIBINT3)
BCF=$(BCF)
MFCDBG=$(MFCDBG)
ALPHA=$(ALPHA)
BETA=$(BETA)
LANG=$(LANG)
GETCMD="$(GETCMD)"
VERSION=$(VERSION)
$(BTARGS)
<<KEEP

DISK: $(MRF) DISK.TRG

DISK.TRG:
	@maxcmd disk disk.mak $(MRF)

###############################################################################
# Targets without dependencies (including all code not belonging to Qualitas) #
###############################################################################

# Text and binary files distributed with product (but not built)
TEXT.TRG: $(MRF) TOOLS.TRG
	@maxcmd text text.mak $(MRF)

# Header files and some .inc files (relevant only to GET action)
INCLUDE.TRG: $(MRF)
	@maxcmd include include.mak $(MRF)

# MASM .inc files (relevant only to GET action)
INC.TRG: $(MRF)
	@maxcmd inc inc.mak $(MRF)

# Odds and ends in the tool department
TOOLS.TRG: $(MRF)
	@maxcmd tools tools.mak $(MRF)

# Modified C run-time library (under CATROOT)
CRT.TRG: $(MRF)
!if "$(TARGETS)" == "DEL" && $(DALL) == 0
	@echo Skipping $* (DALL=0)
!else
	chdrv $(CATROOT)
	vdir -c $(CATROOT)crt
	cd $(CATROOT)crt
!if "$(NET)" != ""
	xc /n/a/t p:\cat\crt\*.mak $(CATROOT)crt
	xc /n/a/t p:\cat\crt\*.inc $(CATROOT)crt
!endif
# Note that we must override the library output directory
!if "$(BTARGS)" != "GET"
	$(MAKE) WIN= OS=DOS L=$(LIBDIR) -$(MAKEFLAGS) -f crt.mak MODEL=L @$(MRF)
	$(MAKE) WIN= OS=DOS L=$(LIBDIR) -$(MAKEFLAGS) -f crt.mak MODEL=M @$(MRF)
	$(MAKE) WIN= OS=DOS L=$(LIBDIR) -$(MAKEFLAGS) -f crt.mak MODEL=S @$(MRF)
!else
	$(MAKE) WIN= OS=DOS L=$(LIBDIR) -$(MAKEFLAGS) -f crt.mak @$(MRF)
!endif
	chdrv $(MAXROOT)
	cd $(MAXROOT).
!endif


##############################################################
# Static link libraries.  Some of these have dependencies as #
# there are shared .OBJ files.				     #
##############################################################

# QUI library (used by MAX shell, ASQ, etc.)
QUILIB.TRG: $(MRF)
	@maxcmd quilib makefile $(MRF) LS

# ASQ engine code
ASQENG.TRG: $(MRF)
	@maxcmd asqeng makefile $(MRF) LS


##########################
# Product help files	 #
##########################

DOSHELP.TRG: $(MRF)
	@maxcmd doshelp maxhelp.mak $(MRF)

##########################
# Dynamic link libraries #
##########################


################
# Applications #
################

386DISK.TRG: $(MRF)
	@maxcmd 386disk makefile $(MRF)

386LOAD.TRG: $(MRF) 386MAX.TRG
	@maxcmd 386load makefile $(MRF)

386MAX.TRG: $(MRF)
	@maxcmd 386max makefile $(MRF)

ASQ.TRG: $(MRF) TEXT.TRG CRT.TRG ASQENG.TRG QUILIB.TRG
	@maxcmd asq makefile $(MRF)

BATPROC.TRG: $(MRF) CRT.TRG
	@maxcmd batproc makefile $(MRF)

DOSMAX16.TRG: $(MRF) TEXT.TRG
	@maxcmd dosmax16 dosmax16.mak $(MRF)

EXTRADOS.TRG: $(MRF)
	@maxcmd extrados makefile $(MRF)

GOAHEAD.TRG: $(MRF) TEXT.TRG
	@maxcmd goahead makefile $(MRF)

INSTALL.TRG: $(MRF) CRT.TRG TOOLS.TRG QUILIB.TRG
	@maxcmd install makefile $(MRF)

MAX.TRG: $(MRF) CRT.TRG TOOLS.TRG QUILIB.TRG
	@maxcmd max makefile $(MRF)

MAXCTRL.TRG: $(MRF) TEXT.TRG
	@maxcmd maxctrl maxctrl.mak $(MRF)

MAXEDIT.TRG: $(MRF) TEXT.TRG
	@maxcmd maxedit maxedit.mak $(MRF)

MAXHELP.TRG: $(MRF) TOOLS.TRG
	@maxcmd maxhelp maxhelp.mak $(MRF)

MAXIMIZE.TRG: $(MRF) CRT.TRG TOOLS.TRG QUILIB.TRG 386MAX.TRG
	@maxcmd maximize makefile $(MRF)

MAXMETER.TRG: $(MRF)
	@maxcmd maxmeter maxmeter.mak $(MRF)

MAXSETUP.TRG: $(MRF) TEXT.TRG QUILIB.TRG
	@maxcmd maxsetup setup.mak $(MRF)

MAXVXD.TRG: $(MRF)
	@maxcmd vxd makefile $(MRF)

MEMLIMIT.TRG: $(MRF)
	@maxcmd memlimit makefile $(MRF)

MOVE.TRG: $(MRF)
	@maxcmd move makefile $(MRF)

QMT.TRG: $(MRF)
	@maxcmd qmt makefile $(MRF)

QPIFEDIT.TRG: $(MRF) TEXT.TRG MAXVXD.TRG
	@maxcmd qpifedit makefile $(MRF)

QPOPUP.TRG: $(MRF)
	@maxcmd qpopup makefile $(MRF)

RAMBASIC.TRG: $(MRF) TOOLS.TRG
	@maxcmd rambasic makefile $(MRF)

ROMSRCH.TRG: $(MRF) TOOLS.TRG 386MAX.TRG
	@maxcmd romsrch makefile $(MRF)

SNAPSHOT.TRG: $(MRF) ASQ.TRG CRT.TRG ASQENG.TRG QUILIB.TRG
	@maxcmd snapshot makefile $(MRF)

STATUTIL.TRG: $(MRF)
	@maxcmd statutil statutil.mak $(MRF)

STRIPMGR.TRG: $(MRF)
	@maxcmd stripmgr makefile $(MRF)

WINMXMZ.TRG: $(MRF) QUILIB.TRG TEXT.TRG STATUTIL.TRG
	@maxcmd winmxmz winmxmz.mak $(MRF)

XLAT.TRG: $(MRF)
	@maxcmd xlat makefile $(MRF)


# Setup program and production diskette maker
!if "$(TARGETS)" == "DISK"
SETUP.TRG: $(MRF)
!else
SETUP.TRG: $(MRF)
!endif



###############
# End of file #
###############

