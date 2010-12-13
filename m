Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PS7HH-0001Kb-KM
	for linux-mtd@lists.infradead.org; Mon, 13 Dec 2010 12:13:16 +0000
From: Adrian Hunter <adrian.hunter@nokia.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Mon, 13 Dec 2010 14:11:44 +0200
Message-Id: <20101213121144.20650.27903.sendpatchset@ahunter-work.research.nokia.com>
Subject: [PATCH 0/7] OneNAND OMAP patches
Cc: Tony Lindgren <tony@atomide.com>, Kyungmin Park <kyungmin.park@samsung.com>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	Artem.Bityutskiy.dedekind1@gmail.com,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Here are some OneNAND and related OMAP patches.

Adrian Hunter (7):
      mtd: OneNAND: OMAP2/3: add support for command line partitioning
      mtd: OneNAND: add enable / disable methods to onenand_chip
      mtd: OneNAND: OMAP2/3: prevent regulator sleeping while OneNAND is in use
      OMAP2/3: GPMC: put sync_clk value in picoseconds instead of nanoseconds
      OMAP2/3: OneNAND: add 104MHz support
      OMAP2/3: OneNAND: add platform data callback for PM constraints
      mtd: OneNAND: lighten scary initial bad block messages

 arch/arm/mach-omap2/gpmc-nand.c           |    2 +-
 arch/arm/mach-omap2/gpmc-onenand.c        |   19 +++++--
 arch/arm/mach-omap2/gpmc.c                |   12 ++++-
 arch/arm/mach-omap2/usb-tusb6010.c        |    4 +-
 arch/arm/plat-omap/include/plat/gpmc.h    |    9 ++--
 arch/arm/plat-omap/include/plat/onenand.h |    9 +++
 drivers/mtd/onenand/omap2.c               |   85 +++++++++++++++++++++++------
 drivers/mtd/onenand/onenand_base.c        |   26 ++++++----
 drivers/mtd/onenand/onenand_bbt.c         |    4 +-
 include/linux/mtd/onenand.h               |    2 +
 10 files changed, 131 insertions(+), 41 deletions(-) 
 
Regards
Adrian
