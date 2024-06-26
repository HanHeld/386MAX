extern	void *get_mem(unsigned int s);
extern	char *str_mem(char *str);
extern	char *keyword_part(struct _CfgText *p);
extern	char *path_part(struct _CfgText *p);
extern	char *fname_part(struct _CfgText *p);
extern	char *pro_part(struct _CfgText *p);
extern	char *archive(int extent);
extern	void error(int err_code,char *fmt,...);
extern	void do_backslash(char *temp);
extern	void calc_crcinfo(void );
extern	int adjust_pfne(char *pfne,char dfltdrv,unsigned short Mask);
extern	unsigned short exec_stripmgr(char *dir);
extern	int scan_mda(void );
extern	void exec_maximize(char *optlist);
extern	void profile_add(void );
extern	int check_shell_sub(struct _CfgText *p);
extern	void check_shell(void );
extern	void writefiles(void );
extern	unsigned int warn_b8(void );
extern	int read_doshelp(void );
extern	unsigned long check_altsub(char *src,char altdrive,int missing,int docopy);
extern	unsigned long check_altfiles(char *fmt,char *arg1,char *arg2,char altdrive,int attr,int docopy);
extern	unsigned long check_altpath(int docopy);
