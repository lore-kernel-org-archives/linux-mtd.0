Received: from mho-01-ewr.mailhop.org ([204.13.248.71])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9QHm-0002UV-Sz
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 22:08:15 +0000
Date: Tue, 4 May 2010 15:08:03 -0700
From: Tony Lindgren <tony@atomide.com>
To: linux-omap@vger.kernel.org
Subject: Upcoming merge window and omap NAND patches
Message-ID: <20100504220803.GN29604@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Artem Bityutski <Artem.Bityutskiy@nokia.com>,
	Sukumar Ghorai <s-ghorai@ti.com>, Steve Sakoman <sakoman@gmail.com>,
	Vimal Singh <vimal.newwork@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

There are several omap NAND patches pending, but some basic things
should be fixed first.

1. The NAND driver needs to stop tinkering with the GPMC registers

The omap General Purpose Memory Controller (GPMC) registers are omap
specific, and not driver specific. Tinkering with these registers
can cause issues with the other devices on the GPMC.

To find out what needs to disappear fomr the NAND driver, just do:

$ grep baseaddr drivers/mtd/nand/omap2.c

Any GPMC register tinkering needs to happen in arch/arm/mach-omap2/gpmc.c.
If there are not currently GPMC functions to do something in gpmc.c, then
let's add the necessary support there.

2. Passing hardcoded GPMC_CS0_BASE needs to go from the board files

Passing hardcoded GPMC virtual addressess is sure way to mess up
things. This should all become unnecessary once the NAND drivers
stops messing with the GPMC registers directly.

So, as a result, I'm not planning on pushing any omap NAND related
patches until these basic issues are fixed. I'll mark these patches
as "Changes requested" in patchwork.kernel.org even if these patches
don't have anything else wrong with them.

Let's fix the basic things for good, and put the other patches on
hold for a while. Sorry if this causes problems!

Cheers,

Tony
