extern	int do_browse(int ndx,int first,int last,int grouping,char *intromsg,int helpnum,char (*actcolors)[2][2],char (*txtcolors)[2][2],char *(*bldfn)(struct _dsptext *),char *(*acttext)(struct _dsptext *),int (*toggle)(int ,int ,int ,struct _windesc *,struct _windesc *,struct _texthd ** ,int ,int ,int ,int ,char *(*)(struct _dsptext *)));
static	unsigned short br_input(struct _inputevent *event);
extern	void br_freedsp(struct _texthd **dsp );
extern	int br_buildln(struct _dsptext *ts,char *(*bldfn)(struct _dsptext *),struct _texthd **head ,struct _texthd **tail );
extern	char *br_buildcfg(struct _dsptext *t);
extern	char *br_buildbat(struct _dsptext *t);
extern	char *br_gldprm(struct _dsptext *t);
extern	void br_wrtact(struct _windesc *actwin,char *action,char attr,int row);
extern	void br_wrttext(struct _windesc *txtwin,char *text,char attr,int row,int ccol);
extern	void br_highlight(struct _windesc *actwin,struct _windesc *txtwin,int row,char attr1,char attr2);
extern	void br_setup(char *filename,struct _windesc *mainwin,struct _windesc *actwin,struct _windesc *txtwin,int grouping);
extern	void br_clear(struct _windesc *mainwin);
