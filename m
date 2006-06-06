Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fnd4o-0003jx-GV
	for linux-mtd@lists.infradead.org; Tue, 06 Jun 2006 16:02:39 +0100
Subject: Re: NAND OOB Questions...
From: Thomas Gleixner <tglx@linutronix.de>
To: Steve Finney <saf76@earthlink.net>
In-Reply-To: <15200571.1149603155027.JavaMail.root@elwamui-darkeyed.atl.sa.earthlink.net>
References: <15200571.1149603155027.JavaMail.root@elwamui-darkeyed.atl.sa.earthlink.net>
Content-Type: text/plain
Date: Tue, 06 Jun 2006 17:03:41 +0200
Message-Id: <1149606221.11983.47.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-06 at 07:12 -0700, Steve Finney wrote:
> >Yeah. I did not think about that abstruse scenario :) What the hell is
> >this for ?
> 
> Well, I didn't go looking for bugs :-). The hardware is the board I'm working on,
> and what I wanted to do was force single bit errors to verify that the read correction
> code worked. My way of doing that was to let the kernel write the correct ECC, 
> and then read it back, corrupt a single data bit, and write the data +OOB back with unchanged
> OOB. It didn't work :-(.

Ok. Makes sense.

> As long as I'm here...is there any clever way of clearing a bad block marker? I realize
> you do _not_ want to do this in the real world, but I created a few fake bad blocks for
> testing purposes and there seems to be no way to get rid of them; neither Linux nor U-Boot
> will let you call erase on a bad block. You can recompile U-Boot to allow it to do so, but
> I'm wondering if there's any other way.

Yes, switch the bad block stuff off in the kernel. :) You can do this
also from your module by overriding the block_bad function.

	tglx
