extern	void init_fstat(void );
extern	struct _iobuf *cfopen(char *filename,char *mode,int abort);
extern	void cfprintf(struct _iobuf *fp,char *fmt,...);
extern	char *cfgets(char *buff,unsigned int buffsize,struct _iobuf *fp);
extern	void cfputs(char *buff,struct _iobuf *fp);
extern	void read_cfg(int fromexe);
extern	char cfg_flag(char *pathname);
extern	void add2maxpro(unsigned char NewOwner,char *line,...);
extern	struct _ProText *find_pro(char *keyword,char *arg1,char *arg2);
extern	struct _ProText *find_comment(char *s,int n);
extern	void remove_pro(char *keyword,char *arg1,char *arg2);
extern	int is_exception(char *pathname);
extern	int edit_config_sub(struct _CfgText *p);
extern	int chk_smartdrv_sub(struct _CfgText *p);
extern	int remove_xbios(struct _CfgText *p);
extern	int cswapsub(char driveltr,char *directory);
extern	void check_swapfile(void );
extern	void edit_config(void );
extern	int locate_winfles(char *sysini_path);
extern	void reset_batch(int newtarget);
extern	void clear_batch(void );
extern	int process_stream(char *infile,char *outfile,int (*output_unit)(struct _iobuf *,char *,long ));
extern	void cpreinst_sub(char *backup_fname,char *fname,char altdrive,char altdrive2);
extern	void create_preinst_file(void );
extern	int remove_smartdrv(struct _CfgText *p);
extern	int find_cbuffers(struct _CfgText *p);
extern	int change_buffers(struct _CfgText *p);
extern	int qutil_label(struct _iobuf *fp,char *line,long streampos);
extern	int process_qutil(char *pathname,char *chklabel);
extern	int find_batline(struct _iobuf *fp,char *line,long streampos);
extern	int place_qcache(struct _iobuf *fp,char *line,long streampos);
extern	int place_qutil(struct _iobuf *fp,char *line,long streampos);
extern	void install_qmt(unsigned short key);
extern	struct _CfgText *add2cfg(struct _CfgText *prev,struct _CfgText *next,unsigned char NewOwner);
extern	void update_qutil(int btval);
extern	void scatter_line(struct _CfgText *p);
extern	void install_qcache(int replace,unsigned short key);
extern	int find_setpath(struct _iobuf *fp,char *line,long streampos);
extern	void check_maxpath(void );
extern	int check_rdonly(char *pathname);
extern	void edit_maxcfg(char *keyword,char *comment,int add);
extern	unsigned short ud_csum(unsigned short seed,unsigned char *data,unsigned short len);
extern	int wwrite(int fh,char *fdata,unsigned short *pwOff,unsigned short len,unsigned short *pwCsum);
