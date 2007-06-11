Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hxkg2-0004gX-BI
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2007 10:15:29 -0400
Subject: Re: [PATCH] JFFS2 appears to "freeze" during erase, version 2
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
In-Reply-To: <1181550846.30670.139.camel@gentoo-jocke.transmode.se>
References: <1181029875.30670.23.camel@gentoo-jocke.transmode.se>
	<1181550846.30670.139.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 11 Jun 2007 16:15:19 +0200
Message-Id: <1181571319.30670.169.camel@gentoo-jocke.transmode.se>
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

On Mon, 2007-06-11 at 10:34 +0200, Joakim Tjernlund wrote:
> On Tue, 2007-06-05 at 09:51 +0200, Joakim Tjernlund wrote:
> > Here is an updated version that contains all everything in one patch. I hope
> > this one can be applied as is.
> > 
> >  Jocke
> > 
> > >From 87cd93db5895e1506a6abb0dbc891587e96d8547 Mon Sep 17 00:00:00 2001
> > From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > Date: Tue, 5 Jun 2007 09:38:53 +0200
> > Subject: [PATCH] JFFS2 appears to "freeze" during erase
> > Radoslaw Bisewski <radbis@googlemail.com> writes:
> > With current desing erase_free_sem is locked every time the flash
> > block is being erased. For NOR flashes - ~1 second is needed to erase
> > single flash block. In the worst case scenario erase_free_sem may be
> > locked for a couple of seconds when the number of blocks is being
> > erased (e.g. after large file was removed). When erase_free_sem is
> > locked all read/write operations for given JFFS2 partition are locked
> > too - in effect from time to time access to the JFFS2 partition is
> > locked for a number of seconds. This fix makes critical section in
> > flash erasing procedure shorter - now erase_free_sem is locked around
> > erase_completion_lock spinlock only.
> > 
> > Additional bug fixes by me.
> > 
> > Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> > ---
> [SNIP patch]
> 
> After running our boards a few days with the above patch we have seen
> a new hang during SW upgrade of the board.
> 
> A simple script that is run to do some validation of the new SW
> sometimes takes about 2 minutes to complete instead of 1 second.
> 
> FS I/O  part of that script is:
>   BOARD=`fw_printenv genBoardType | sed 's/^.*=//' | sed 's/^cu.*/cu/'`
>   TMP_FILE=/tmp/.swu_operations.log
>   echo "Some text 1" >> $TMP_FILE
>   echo "Some text 2" >> $TMP_FILE
>   echo `date` >> $TMP_FILE
>   echo "Some text 3" >> $TMP_FILE
> 
> fw_printenv is an utility that accesses(reads) the u-boots environment
> via /dev/mtd.
> /tmp is mounted as a tmpfs:
> none            /tmp            tmpfs   defaults                        0 0
> 
> This is on 2.6.20 with cfi_cmdset_0001 driver
> 
> Any ideas what is going on is most welcome.
> 
>  Jocke

looking into the /dev/mtd driver, mtdchar.c I wonder about something in
mtd_close:
	if (mtd->sync)
		mtd->sync(mtd);

Should the mtd->sync call be here? I think this might be the cause
for the long stalls we see from time to time. If an long erase is on
going, this calls won't return until all sectors are erased, me thinks.

 Jocke
