Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OUHDp-0004RC-FB
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2010 10:42:21 +0000
From: Sukumar Ghorai <s-ghorai@ti.com>
To: linux-omap@vger.kernel.org
Subject: [PATCH v2 0/4] nand prefetch-irq support and ecc layout chanage
Date: Thu,  1 Jul 2010 16:12:11 +0530
Message-Id: <1277980935-24070-1-git-send-email-s-ghorai@ti.com>
Cc: linux-mtd@lists.infradead.org, Sukumar Ghorai <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

   The following set of patches applies on top of for-next branch. And
   is dependent on the following patches not yet applied onto this branch.
	1. http://www.mail-archive.com/linux-omap@vger.kernel.org/msg30305.html
	2. http://www.mail-archive.com/linux-omap@vger.kernel.org/msg30735.html
   
   v2: Rebase on latest codebase and previous patch(posted).	
   v1: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg26666.html

Sukumar Ghorai (4):
	omap3: nand: prefetch in irq mode support
	omap: nand: configurable fifo threshold to gain the throughput
	omap: nand: ecc layout select from board file
	omap: nand: making ecc layout as compatible with romcode ecc

 arch/arm/mach-omap2/board-flash.c              |    4 +-
 arch/arm/mach-omap2/gpmc.c                     |   18 ++-
 arch/arm/mach-omap2/include/mach/board-flash.h |    3 +
 arch/arm/plat-omap/include/plat/gpmc.h         |    8 +-
 arch/arm/plat-omap/include/plat/nand.h         |    7 +
 drivers/mtd/nand/Kconfig                       |   14 +-
 drivers/mtd/nand/omap2.c                       |  280 +++++++++++++++++++++---
 7 files changed, 300 insertions(+), 34 deletions(-)
