Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17biue-0003iP-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 15:32:48 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Disk blocks for long periods 
Date: Mon, 5 Aug 2002 16:32:46 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLMEHKFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <25084.1028556726@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> 
> joakim.tjernlund@lumentis.se said:
> >  I am on PPC and SysRq-T does not display anything useful :-( Perhaps
> > readprofile?
> 
> SysRq-T should work on PPC. It's mostly generic code. What's wrong with it?
Maybe I spoke too soon, but I can not make sense of it:
SysRq: Show State                                                               
                                                                                
                         free                        sibling                    
  task             PC    stack   pid father child younger older                 
init      S 0FF86418     0     1      0   159  (NOTLB)                          
keventd   S 00000000     0     2      1        (L-TLB)       3                  
kswapd    S 00000000     0     3      1        (L-TLB)       4     2            
kreclaimd  S 00000000     0     4      1        (L-TLB)       5     3           
bdflush   S 00000000     0     5      1        (L-TLB)       6     4            
kupdate   D 00000000     0     6      1        (L-TLB)       7     5            
mtdblockd  S 00000000     0     7      1        (L-TLB)       8     6           
jffs2_gcd_mtd4  S 00000000     0     8      1        (L-TLB)      51     7      
syslogd   S 0FF86418    28    51      1        (NOTLB)      53     8            
klogd     R 0FF7EB04   144    53      1        (NOTLB)      58    51            
inetd     S 0FF86418     0    58      1   163  (NOTLB)      72    53            
te_server  S 0FF42A84     0    72      1        (NOTLB)      75    58           
te_log    S 0FF3C418    28    75      1        (NOTLB)      77    72            
te        S 0FF3C418     0    77      1        (NOTLB)      79    75            
ntpd      S 0FDE4418     0    79      1        (NOTLB)      81    77
alib_psupd  S 0FED6418     0    81      1        (NOTLB)      83    79          
icn_server  S 0FF18418     0    83      1        (NOTLB)      85    81          
cp_cm     S 0FED6418     0    85      1        (NOTLB)      87    83            
cp_cop    S 0FED6418     0    87      1        (NOTLB)      89    85            
cp_pbh    S 0FED6418     0    89      1        (NOTLB)      91    87            
alib_swusd  S 0FED6418     0    91      1        (NOTLB)      93    89          
mgmt_named  S 0FEAC418     0    93      1        (NOTLB)      95    91          
mgmt_invd  S 0FD6A418  3520    95      1        (NOTLB)      97    93           
eq_rh     S 0FD6A418     0    97      1        (NOTLB)      99    95            
mgmt_pmd  S 0FC45418     0    99      1        (NOTLB)     101    97            
eq_bh_superviso  S 0FE3E418  3520   101      1        (NOTLB)     103    99     
eq_bh     S 0FE3E418     0   103      1        (NOTLB)     105   101            
mgmt_backupd  S 0FC45418  3520   105      1        (NOTLB)     107   103        
mgmt_alarmd  S 0FD6A418   124   107      1        (NOTLB)     109   105         
tosv_server  S 0FED6418     0   109      1        (NOTLB)     111   107         
tosv_supervisor  S 0FED6418     0   111      1        (NOTLB)     113   109     
snmpd     S 0FB4B418     8   113      1   161  (NOTLB)     115   111            
sys_sysconfd  S 0FD6A418  3168   115      1        (NOTLB)     117   113        
sys_ipconfd  S 0FD6A418     0   117      1        (NOTLB)     120   115         
umi_sim   S 0FED6418    76   120      1        (NOTLB)     122   117            
uxi_sim   S 0FED6418     0   122      1        (NOTLB)     124   120            
upi_sim   S 0FED6418     0   124      1        (NOTLB)     126   122            
cp_sim    S 0FED6418   260   126      1        (NOTLB)     128   124            
eq_tm_mgr  S 0FD6A418     0   128      1        (NOTLB)     130   126
eq_mxm_mgr  S 0FD6A418     0   130      1        (NOTLB)     132   128          
eq_gbem_mgr  S 0FD6A418    24   132      1        (NOTLB)     134   130         
eq_xm_mgr  S 0FD6A418     0   134      1        (NOTLB)     136   132           
eq_cpm_mgr  S 0FD6A418     4   136      1   160  (NOTLB)     138   134          
eq_pbm_mgr  S 0FD6A418     4   138      1        (NOTLB)     140   136          
eq_bm_mgr  S 0FD6A418     0   140      1        (NOTLB)     142   138           
eq_topm_mgr  S 0FD6A418     0   142      1        (NOTLB)     144   140         
eq_spfm_mgr  S 0FD6A418  3136   144      1        (NOTLB)     146   142         
eq_pm_mgr  S 0FD6A418     0   146      1        (NOTLB)     148   144           
ne_swumd  S 0FED6418     0   148      1        (NOTLB)     150   146            
ne_rc     S 0FED6418   428   150      1        (NOTLB)     152   148            
ne_rc_superviso  S 0FF3C418     0   152      1        (NOTLB)     154   150     
pppd      S 0FF86418   152   154      1        (NOTLB)     156   152            
zebra     S 0FD29418   128   156      1        (NOTLB)     158   154            
ospfd     S 0FD97418  3520   158      1        (NOTLB)     159   156            
bash      S 0FEC35AC   416   159      1   181  (NOTLB)           158            
eq_cpm_child  S 0FD6A418    68   160    136        (NOTLB)                      
snmpd     S 0FB51B84     0   161    113   162  (NOTLB)                          
snmpd     S 0FAB3370     0   162    161        (NOTLB)                          
in.telnetd  S 0FF64418     0   163     58   164  (NOTLB)                        
bash      S 0FEE0B04     0   164    163        (NOTLB)                          
bash      S 0FEC35AC  3156   180    159   182  (NOTLB)     181                  
cp        D 0FF7EB14  2868   181    159        (NOTLB)           180            
cp        D 0FF7EB14  1996   182    180        (NOTLB)



> 
> The profile _may_ help but it's most likely to tell us that the CPU spend
> most time sleeping, without actually telling us _where_ each process was
> sleeping.
> 
> >  Perhaps kupdate is holding some VFS specific block? I am on a MV
> > 2.4.2 kernel 
> 
> I'd care more if you could reproduce it with something a little more 
> recent. I'm assuming you're using v1.100 of cfi_cmdset_0001.c, since you 
> committed that change.
> 

Sorry, but It's a major job to upgrade our kernel, so that will have to wait.
No, I am not running the v1.100 of cfi_cmdset_0001.c but I have made sure that
the relevant fixes are in.

When I last looked(many months ago) there was no 2.4 branch of the MTD layer and there
was much NAND activity so I kept the one I had. Is the latest CVS of drivers/mtd the stable one?
Is it in 2.4.19?

   Jocke 
