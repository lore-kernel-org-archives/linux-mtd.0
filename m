From: Sukumar Ghorai <s-ghorai@ti.com>
To: linux-omap@vger.kernel.org
Subject: [PATCH v3 0/4] nand prefetch-irq support and ecc layout chanage
Date: Tue, 13 Jul 2010 10:15:33 +0530
Message-Id: <1278996337-25172-1-git-send-email-s-ghorai@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Sukumar Ghorai <s-ghorai@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

   The following set of patches applies on top of for-next branch. And
   is dependent on the following patches 
	1. http://www.mail-archive.com/linux-omap@vger.kernel.org/msg30305.html
   
   v3: Rebase on latest codebase and previous patch(posted).	
	http://www.mail-archive.com/linux-omap@vger.kernel.org/msg31963.html

   v2: Rebase on latest codebase and previous patch(posted).	
	http://www.mail-archive.com/linux-omap@vger.kernel.org/msg31471.html

   v1: http://www.mail-archive.com/linux-omap@vger.kernel.org/msg26666.html

Sukumar Ghorai (4):
	omap3: nand: prefetch in irq mode support
	omap: nand: configurable fifo threshold to gain the throughput
	omap: nand: ecc layout select from board file
	omap: nand: making ecc layout as compatible with romcode ecc

 arch/arm/mach-omap2/board-flash.c              |    4 +-
 arch/arm/mach-omap2/gpmc.c                     |   15 +-
 arch/arm/mach-omap2/include/mach/board-flash.h |    3 +
 arch/arm/plat-omap/include/plat/gpmc.h         |    9 +-
 arch/arm/plat-omap/include/plat/nand.h         |    7 +
 drivers/mtd/nand/Kconfig                       |   14 ++-
 drivers/mtd/nand/omap2.c                       |  277 +++++++++++++++++++++---
 7 files changed, 295 insertions(+), 34 deletions(-)
