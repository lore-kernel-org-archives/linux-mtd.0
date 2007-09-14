Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IW5aL-0002E6-Fy
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 08:27:32 +0100
Date: Fri, 14 Sep 2007 03:25:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: Yoichi Yuasa <yoichi_yuasa@tripeaks.co.jp>
Subject: Re: [PATCH] MTD: remove Momenco Ocelot support
In-Reply-To: <20070909233525.237b6c7c.yoichi_yuasa@tripeaks.co.jp>
Message-ID: <Pine.LNX.4.64.0709140321360.28776@localhost.localdomain>
References: <1189329262.8320.9.camel@pmac.infradead.org>
	<20070909233525.237b6c7c.yoichi_yuasa@tripeaks.co.jp>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 9 Sep 2007, Yoichi Yuasa wrote:

> Hello David,
>
> Please queue this patch too.
>
> ---
>
> This patch has removed Momenco Ocelot support from MTD.
> Ocelot support has already removed.

you might want to do a more thorough scan of the source tree as there
are still a number of references to "OCELOT", some of which might also
be removable at the same time as this patch.

$ grep -r OCELOT *
arch/arm/tools/mach-types:ocelot                        MACH_OCELOT             OCELOT                  489
drivers/mtd/maps/Kconfig:config MTD_OCELOT
drivers/mtd/maps/Kconfig:       depends on MOMENCO_OCELOT
drivers/mtd/maps/ocelot.c:#define OCELOT_PLD 0x2c000000
drivers/mtd/maps/ocelot.c:      pld = ioremap(OCELOT_PLD, 0x10);
drivers/mtd/maps/Makefile:obj-$(CONFIG_MTD_OCELOT)      += ocelot.o
drivers/mtd/devices/docprobe.c:#elif defined(CONFIG_MOMENCO_OCELOT_G)
drivers/mtd/nand/diskonchip.c:#elif defined(CONFIG_MOMENCO_OCELOT_G)
include/asm-mips/bootinfo.h:#define  MACH_MOMENCO_OCELOT        0
include/asm-mips/bootinfo.h:#define  MACH_MOMENCO_OCELOT_G      1       /* no more supported (may 2007) */
include/asm-mips/bootinfo.h:#define  MACH_MOMENCO_OCELOT_C      2       /* no more supported (jun 2007) */
include/asm-mips/bootinfo.h:#define  MACH_MOMENCO_OCELOT_3      4

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
