extern	void setColors(int mono);
extern	void do_logo(int doit);
extern	void do_intro(void );
extern	void warning_panel(char *msg,int helpnum);
extern	void message_panel(char *msg,int helpnum);
extern	int action_panel(char *msg,int helpnum);
extern	void do_getdrv(void );
extern	char *do_filereq(void );
extern	unsigned short do_refdsk(char *line,int nline);
extern	void do_quickmax(void );
extern	void wput_cf(struct _windesc *wp,char __far *fstr);
extern	void init_progress(char *msgtext);
extern	void __far __loadds show_progress(struct _opt_prog __far *ps);
extern	int __far __loadds confirm_abesc(int cb_type);
extern	void end_progress(void );
extern	void InsertStartup(char *pszINI);
extern	void do_compsub(int highonly,struct _windesc *pwin,struct _sumfit *psumfit,struct _iobuf *pfSumm);
extern	void do_complete(struct _sumfit __far *psumfit);
static	void fillit(struct _windesc *win,unsigned short *line);
extern	unsigned short do_emshelp(void);
extern	int ask_probe(void );
extern	int ask_vgaswap(void );
extern	void rebootmsg(void );
extern	void dofndbat(char *buff);
extern	unsigned short do_bootmsg(char *text);
extern	void do_textarg(int num,char *arg);
extern	void istdwind(void );
extern	void paintback(void );
extern	void cstdwind(void );
extern	void do_prodname(void );
extern	void clearscreen(void );
extern	void do_error(char *text,int abort);
extern	void do_warning(char *text,int helpnum);
extern	int do_mistake(char *msg,int helpnum);
extern	void do_abreboot(void );
extern	unsigned short ask_backup(int seedmax);
extern	int CopyIniXSect(char *pszDestPath,char *pszSourcePath,char *pszExclude);
