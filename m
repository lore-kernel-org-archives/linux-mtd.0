Received: from [213.115.205.20] (helo=gw1.transmode.se)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NSCng-0001oy-02
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 17:02:36 +0000
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910DFCE341F@SJEXCHCCR01.corp.ad.broadcom.com>
References: <a64f67eb1001041649u500f3a6bx40d443c4a3415f1b@mail.gmail.com>	<Pine.LNX.4.64.1001050905071.5028@lnxricardw.se.axis.com>
	<a64f67eb1001050013wd122746iab32bdfc93ba1aee@mail.gmail.com>	<Pine.LNX.4.64.1001051016020.5028@lnxricardw.se.axis.com>
	<B125D8217ABC4B43826503DE00A2D44910DFCE341F@SJEXCHCCR01.corp.ad.broadcom.com>
Subject: RE: JFFS2 - speed up while booting
To: "Darwin Rambo" <drambo@broadcom.com>
Message-ID: <OF8A2BBBA0.AB41AC26-ONC12576A2.005C2B63-C12576A2.005D212F@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 5 Jan 2010 17:57:13 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	linux newbie <linux.newbie79@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
>
> > It can take a few minutes to complete the erase procedure
> > though; if you do a 'top' on your system you'll see the pdflush task at
> > the top while it is in progress, so if you reboot your system several
> > times in succession JFFS2 might not have time to complete the erase of all
> > unused blocks.
>
> This pdflush activity can take much longer on very large flash parts and be
> almost unnoticable on small devices. The reboot command in busybox (and any
> command that tries to flush data to flash) is also stalled until this operation
> is complete. You might think the system is hung at this point but it isn't.

I posted a patch for that quite some while ago. It didn't
get into the repo because it was racy w.r.t module unload. I am still
using it so I guess it applies to the current tree.

>
> This is the typical erase cycle for one block:
>
> Starting erase of pending block 0x1b200000
> Freeing all node refs for eraseblock offset 0x1b200000
> jffs2_erase_block(): erase block 0x1b200000 (range 0x1b200000-0x1b280000)
> Erase completed successfully at 0x1b200000
> Verifying erase at 0x1b200000
> Writing erased marker to block at 0x1b200000
>
>
> The real reason for the long delay is not the erase time, but the time to
> validate that the erase actually worked and that all the data is 0xff.
> If you comment out the jffs2_block_check_erase function below
> as shown, then in my case, the 4.5 minute pdflush delay dropped to 2-3
> seconds! I was using a 16Gbit large page flash for this test.

Ah, that make sense. Some new NOR parts form Numonyx has a new CFI command,
Blank Check, that indicates if it is all ones or not. That could be handy
to use in this case. You could even use that instead of erasing empty
block because they miss a clean marker.

>
> static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct
> jffs2_eraseblock *jeb)
> {
>    size_t retlen;
>    int ret;
>    uint32_t uninitialized_var(bad_offset);
>
> #if 0
>    switch (jffs2_block_check_erase(c, jeb, &bad_offset)) {
>    case -EAGAIN:   goto refile;
>    case -EIO:   goto filebad;
>    }
> #endif
>
>
> Darwin
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
