Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HyABD-0003La-Q9
	for linux-mtd@lists.infradead.org; Tue, 12 Jun 2007 13:29:24 -0400
Subject: Re: [PATCH] JFFS2 appears to "freeze" during erase, version 2
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <1181657226.30670.218.camel@gentoo-jocke.transmode.se>
References: <1181029875.30670.23.camel@gentoo-jocke.transmode.se>
	<1181550846.30670.139.camel@gentoo-jocke.transmode.se>
	<1181571319.30670.169.camel@gentoo-jocke.transmode.se>
	<1181657226.30670.218.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Jun 2007 19:28:56 +0200
Message-Id: <1181669336.30670.252.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-12 at 16:07 +0200, Joakim Tjernlund wrote:
> On Mon, 2007-06-11 at 16:15 +0200, Joakim Tjernlund wrote:
> > On Mon, 2007-06-11 at 10:34 +0200, Joakim Tjernlund wrote:
> > > On Tue, 2007-06-05 at 09:51 +0200, Joakim Tjernlund wrote:
> > > > Here is an updated version that contains all everything in one patch. I hope
> > > > this one can be applied as is.
> > > > 
> > > >  Jocke
> > > > 
> > > > >From 87cd93db5895e1506a6abb0dbc891587e96d8547 Mon Sep 17 00:00:00 2001
> > > > From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > > > Date: Tue, 5 Jun 2007 09:38:53 +0200
> > > > Subject: [PATCH] JFFS2 appears to "freeze" during erase
> > > > Radoslaw Bisewski <radbis@googlemail.com> writes:
> > > > With current desing erase_free_sem is locked every time the flash
> > > > block is being erased. For NOR flashes - ~1 second is needed to erase
> > > > single flash block. In the worst case scenario erase_free_sem may be
> > > > locked for a couple of seconds when the number of blocks is being
> > > > erased (e.g. after large file was removed). When erase_free_sem is
> > > > locked all read/write operations for given JFFS2 partition are locked
> > > > too - in effect from time to time access to the JFFS2 partition is
> > > > locked for a number of seconds. This fix makes critical section in
> > > > flash erasing procedure shorter - now erase_free_sem is locked around
> > > > erase_completion_lock spinlock only.
> > > > 
> > > > Additional bug fixes by me.
> > > > 
> > > > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > > > ---
> > > [SNIP patch]
> > > 
> > > After running our boards a few days with the above patch we have seen
> > > a new hang during SW upgrade of the board.
> > > 
> > > A simple script that is run to do some validation of the new SW
> > > sometimes takes about 2 minutes to complete instead of 1 second.
> > > 
> > > FS I/O  part of that script is:
> > >   BOARD=`fw_printenv genBoardType | sed 's/^.*=//' | sed 's/^cu.*/cu/'`
> > >   TMP_FILE=/tmp/.swu_operations.log
> > >   echo "Some text 1" >> $TMP_FILE
> > >   echo "Some text 2" >> $TMP_FILE
> > >   echo `date` >> $TMP_FILE
> > >   echo "Some text 3" >> $TMP_FILE
> > > 
> > > fw_printenv is an utility that accesses(reads) the u-boots environment
> > > via /dev/mtd.
> > > /tmp is mounted as a tmpfs:
> > > none            /tmp            tmpfs   defaults                        0 0
> > > 
> > > This is on 2.6.20 with cfi_cmdset_0001 driver
> > > 
> > > Any ideas what is going on is most welcome.
> > > 
> > >  Jocke
> > 
> > looking into the /dev/mtd driver, mtdchar.c I wonder about something in
> > mtd_close:
> > 	if (mtd->sync)
> > 		mtd->sync(mtd);
> > 
> > Should the mtd->sync call be here? I think this might be the cause
> > for the long stalls we see from time to time. If an long erase is on
> > going, this calls won't return until all sectors are erased, me thinks.
> > 
> >  Jocke
> 
> Managed to get a strace -T when running fw_printenv and there I could
> see that the stalls came when closing a /dev/mtd device:
> open("/dev/mtd1", O_RDONLY)             = 3 <0.000143>
> lseek(3, 0, SEEK_SET)                   = 0 <0.000063>
> read(3, "\344\tU\214\0", 5)             = 5 <0.000086>
> read(3, "bootcmd=setenv bootargs root=/de"..., 8187) = 8187 <0.002510>
> close(3)                                = 0 <115.221334>
> open("/dev/mtd2", O_RDONLY)             = 3 <0.000124>
> lseek(3, 0, SEEK_SET)                   = 0 <0.000057>
> read(3, "X\226\255\325\1", 5)           = 5 <0.000078>
> read(3, "bootcmd=setenv bootargs root=/de"..., 8187) = 8187 <0.002502>
> close(3)                                = 0 <34.448065>
> 
> 115 resp. 34 seconds to close a readonly device!
> 
> Whats going on?

OK, this fixes that hanging fw_printenv I am seeing.
Not sure why a yield() is needed but it make a big difference.

>From c39777d86aa1bef8e053c3f78a5df0981e3a45a9 Mon Sep 17 00:00:00 2001
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Date: Tue, 12 Jun 2007 19:25:56 +0200
Subject: [PATCH] Fix hanging close for /dev/mtd
When pdflush is erasing lots of sectors, drivers calling
mtd->sync will hang until all blocks are erased.

Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
---
 fs/jffs2/erase.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index 24a48e9..33e5f13 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -150,7 +150,7 @@ void jffs2_erase_pending_blocks(struct jffs2_sb_info *c, int count)
 		}
 
 		/* Be nice */
-		cond_resched();
+		yield();
 		down(&c->erase_free_sem);
 		spin_lock(&c->erase_completion_lock);
 	}
-- 
1.5.2.1
