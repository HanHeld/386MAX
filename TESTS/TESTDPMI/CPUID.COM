
´	Í!è èç Sã± ÓëÑãþ[´	Í!è@èSãp±ÓëÑã[´	Í!Sã ±ÓëÑã([´	Í!Sã ±ÓëÑã¸[´	Í!Sã ±	ÓëÑãj[´	Í!¡$>Yè­(´	Í!¡$´LÍ!PRV¾ èR ¬<tI</u8¬ >¹ ò®u*ïÑçÿ¥ 2´	Í! ëÌf´	Í! @ë¼´	Í!¸ÿLÍ!^ZXÃ¬< tû<	t÷NÃPQW3ÛTX;ÄuèG ë» ±!°ÿÒàu» èUã»  èY;$v$ÿ&uí>$vËèyãË èÈ_YXÃP¸ ðPX© ðt,è. rèb rËë ËëèÒ sË èo rË
ëËëËXÃfUfìfäüÿ  fPffgf$   fffXf©   uføëfùfXfåf]ÃfPfS ÀfØfàï"À À"Ãf©   uùf[fXÃ÷Ã tSfPfSfQfRf¸    ¢f£Ü	f_
fc
fg
f¸   ¢f£ä	fà	f%   fÁè<r àf£è	øfZfYf[fXõÃUøffìfN     fff÷F     tfNff]Ã¹ÿÿûPVó&¬^XÃPSRVWý¹ >°C´¾ 3Òú3Û÷ö÷ö÷ö÷öª&e#ÛtItéçûûü_^Z[XÃPUì¸  Øúí &£ì	È &£î	¹ X PëÏèûÿIëUì~é]wÏ&¡ì	£ &¡î	£ ûå]XÃPQWè© ÷ u/Ã% = t
= t=
 u÷ @uÍ© tè ëuËëoÛãë >ÿ	è± ï&Ù=ë ë &þ	ÿï>ÿ	u7÷ @uÍ© uË &þ	ÿÙ.þ	ÛáÙ>þ	÷þ	 uèA ëË ë÷ @uÍ© tË _YXÃ÷ @uûufPf3ÀÍf©   tË fXÃÙ6ð	ÛãÙèÙîÞùÙÀÙàÞÙßàÙ&ð	tË@ëË0ÃPQW±ÓïÁÏ¸ÿ+ÈsÁ3ÉÁ_±ÓàçøYXÃQ¹ è YÃQ¹ è YÃPSfRýfÐ+
ùWOÂ$&×ªfÁêâó_fZ[XÃfPRW÷Ã tA;
´	Í!f¡ä	>
èµÿp
´	Í!f¡à	>³
è¢ÿ
´	Í!f¡Ü	>èÿè
´	Í!_ZfXÃfPSRWãûuf¡è	>Ü
èjÿ¿
´	Í!_Z[fXÃ                                                      CPUID    -- Version 2.23
$0123456789ABCDEFThe Pentium CPU manufacturer ID is "            ".
$The Pentium CPU ID is ________.
$The Pentium CPU feature bits are ________.
$The Pentium CPU CR4 value is ________.
$The highest CPUID function supported is ________.
$  rb¹É  
 The length of the pre-fetch instruction queue is ____h.
$CPU is an Intel 8088.
$CPU is an Intel 8086.
$CPU is an NEC V20.
$CPU is an NEC V30.
$CPU is an Intel 80188.
$CPU is an Intel 80186.
$CPU is an Intel 80286.
$CPU is an Intel 80286.
$CPU is an Intel 80386.
$CPU is an Intel 80386 DX.
$CPU is an Intel 80486.
$CPU is an Intel 80486.
$CPU is an Intel 80386 SX.
$CPU is an Intel 80386 SX.
$CPU is an Intel Pentium CPU.
$CPU is an Intel Pentium CPU.
$ bz§¼Õî 9Un£¿Þ,BUm·NDP is not present.
$NDP is untested.
$NDP is an Intel 8087.
$NDP is an Intel 80287.
$NDP is an Intel 80387.
$NDP is a Weitek 1167.
$$¼½$*** CPU incorrectly allows interrupts after a change to SS ***
It should be replaced with a more recent version as it could crash the
system at seemingly random times.
$no$*** The system board switch which indicates whether or not there is
an NDP installed in the system is not properly set.  To correct this,
flip switch 2 of switch block 1 on the system board.
$ÍÍ> Using real code to detect math coprocessor...
$ÍÍ> Bypassing INT 11h test of system board switch...
$CPUID.COM determines the CPU and NDP models in use.  In particular, it can
distinguish from each other any of the following CPUs and NDPs:

   Intel 8086, 8087, 8088, 80186, 80188, 80286, 80287, 80386, 80387, 80486,
   Pentium CPU, NEC V20, V30, Weitek 1167

It also reports on faulty 8086/8088s.  Such a CPU is faulty if it allows an
interrupt immediately after a change to the SS register.  If the program
indicates you have a faulty CPU, you should replace it.  The program also
checks on the system board's NDP switch in case there is an NDP installed.

The program's syntax is as follows:
     CPUID     to run the program
     CPUID /r  to run the program using real code to detect a 287 or 387
     CPUID /b  to run the program but bypass the INT 11h test for correctly
                  set system board NDP switch

If the program reports results at variance with your knowledge of the system,
please contact the author:
     Bob Smith     301-907-6700
     Qualitas, Inc., Suite 1386
     7101 Wisconsin Ave.
     Bethesda, MD  20814
$