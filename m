Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15u9qw-0005iE-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 10:52:38 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Question/suggestion 
Date: Thu, 18 Oct 2001 12:00:53 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLMEJPEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <30104.1003305614@redhat.com>
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
> >  Does JFFS2 erase the blocks that are already erased?
> 
> Yes, because they might not be _completely_ erased - unless they have a 
> cleanmarker node at the beginning, then it's possible that they're only 
> partly-erased. So it erases them again, just to make sure.
> 
> > I also noticed that an umount hangs until kupdate is finished, should it?
> 
> There's no real reason for it to do so - can you get a backtrace (SysRq-T) 
> and find out what it's waiting for? That should be fixable.

OK, here it is:

root@localhost:~# umount /jffs2/
SysRq: Show State
                 
                         free                        sibling
  task             PC    stack   pid father child younger older
init      S 0FF86418     0     1      0    90  (NOTLB)         
keventd   S 00000000     0     2      1        (L-TLB)       3
kswapd    S 00000000     0     3      1        (L-TLB)       4     2
kreclaimd  S 00000000     0     4      1        (L-TLB)       5     3
bdflush   S 00000000     4     5      1        (L-TLB)       6     4 
kupdate   R current      0     6      1        (L-TLB)       7     5
mtdblockd  S 00000000    12     7      1        (L-TLB)       8     6
rpciod    S 00000000     0     8      1        (L-TLB)      66     7 
syslogd   S 0FF86418     0    66      1        (NOTLB)      68     8
klogd     R 0FF7EB04     0    68      1        (NOTLB)      73    66
inetd     S 0FF86418     0    73      1        (NOTLB)      74    68
bash      S 0FEC35AC   192    74      1    93  (NOTLB)      90    73
jffs2_gcd_mtd4  S 00000000     0    90      1        (L-TLB)            74
umount    D 0FF8CA54     0    93     74        (NOTLB)                    

 Jocke
> 
> > Is it safe to power cycle the board during this initial formating? 
> 
> Yes. The formatting is done specifically to make sure it's safe to power 
> cycle at any time.
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
