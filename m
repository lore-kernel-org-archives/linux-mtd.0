Received: from mo31.po.2iij.net ([210.128.50.54])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IW6VX-0007kf-Dg
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 04:26:40 -0400
Message-Id: <200709140826.l8E8QGrB005934@po-mbox300.hop.2iij.net>
Date: Fri, 14 Sep 2007 17:26:16 +0900
From: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
To: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: [PATCH] MTD: remove Momenco Ocelot support
In-Reply-To: <Pine.LNX.4.64.0709140321360.28776@localhost.localdomain>
References: <1189329262.8320.9.camel@pmac.infradead.org>
	<20070909233525.237b6c7c.yoichi_yuasa@tripeaks.co.jp>
	<Pine.LNX.4.64.0709140321360.28776@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	yoichi_yuasa@tripeaks.co.jp
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 14 Sep 2007 03:25:21 -0400 (EDT)
"Robert P. J. Day" <rpjday@mindspring.com> wrote:

> On Sun, 9 Sep 2007, Yoichi Yuasa wrote:
> 
> > Hello David,
> >
> > Please queue this patch too.
> >
> > ---
> >
> > This patch has removed Momenco Ocelot support from MTD.
> > Ocelot support has already removed.
> 
> you might want to do a more thorough scan of the source tree as there
> are still a number of references to "OCELOT", some of which might also
> be removable at the same time as this patch.
> 
> $ grep -r OCELOT *
> arch/arm/tools/mach-types:ocelot                        MACH_OCELOT             OCELOT                  489

It's ARM board.
Momenco Ocelot is MIPS board.

> drivers/mtd/maps/Kconfig:config MTD_OCELOT
> drivers/mtd/maps/Kconfig:       depends on MOMENCO_OCELOT
> drivers/mtd/maps/ocelot.c:#define OCELOT_PLD 0x2c000000
> drivers/mtd/maps/ocelot.c:      pld = ioremap(OCELOT_PLD, 0x10);
> drivers/mtd/maps/Makefile:obj-$(CONFIG_MTD_OCELOT)      += ocelot.o
> drivers/mtd/devices/docprobe.c:#elif defined(CONFIG_MOMENCO_OCELOT_G)
> drivers/mtd/nand/diskonchip.c:#elif defined(CONFIG_MOMENCO_OCELOT_G)

Already queue in mtd-2.6.git.

> include/asm-mips/bootinfo.h:#define  MACH_MOMENCO_OCELOT        0
> include/asm-mips/bootinfo.h:#define  MACH_MOMENCO_OCELOT_G      1       /* no more supported (may 2007) */
> include/asm-mips/bootinfo.h:#define  MACH_MOMENCO_OCELOT_C      2       /* no more supported (jun 2007) */
> include/asm-mips/bootinfo.h:#define  MACH_MOMENCO_OCELOT_3      4

I'll send it to linux-mips soon.

Thanks,

Yoichi
