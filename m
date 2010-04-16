Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O2jmu-0003EV-K4
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2010 11:32:45 +0000
From: Sukumar Ghorai <s-ghorai@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/6] nand prefetch-irq support and ecc layout chanage
Date: Fri, 16 Apr 2010 17:02:28 +0530
Message-Id: <1271417548-4346-1-git-send-email-s-ghorai@ti.com>
In-Reply-To: <Sukumar Ghorai <s-ghorai@ti.com>
References: <Sukumar Ghorai <s-ghorai@ti.com>
Cc: leochen@broadcom.com, tony@atomide.com, vimal.newwork@gmail.com,
	Sukumar Ghorai <s-ghorai@ti.com>, linux-omap@vger.kernel.org,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

   The main motivations behind this patch series are -
	1. support NAND I/O in irq mode.
	2. support of different ECC schema. 
	3. also to make ecc layout as like in romcode ecc layout

   The following set of patches applies on top of the master branch. And
   is dependent on the following patches not yet applied onto this branch.
	https://patchwork.kernel.org/patch/92220/
	https://patchwork.kernel.org/patch/92232/
	https://patchwork.kernel.org/patch/92221/
	https://patchwork.kernel.org/patch/92230/
	https://patchwork.kernel.org/patch/92224/
	https://patchwork.kernel.org/patch/92222/
	https://patchwork.kernel.org/patch/92223/
	https://patchwork.kernel.org/patch/92229/

Sukumar Ghorai (6):
	omap: NAND: Making ecc layout as compatible with romcode ecc 
	omap: NAND: ecc layout select from board file 
	omap-3630 NAND: enable NAND io in prefetch-irq mode 
	OMAP NAND: configurable fifo threshold to gain the throughput
	omap3: NAND Prefetch in IRQ mode support
	omap3: GPMC register definition at common location

 arch/arm/configs/omap_3630sdp_defconfig |    1 +
 arch/arm/configs/omap_zoom3_defconfig   |    1 +
 arch/arm/mach-omap2/board-sdp-flash.c   |    2 +
 arch/arm/mach-omap2/board-zoom-flash.c  |    2 +
 arch/arm/mach-omap2/gpmc.c              |   47 +-----
 arch/arm/plat-omap/include/plat/gpmc.h  |   41 ++++-
 arch/arm/plat-omap/include/plat/nand.h  |    5 +
 drivers/mtd/nand/Kconfig                |   14 ++-
 drivers/mtd/nand/omap2.c                |  275 +++++++++++++++++++++++++++----
 9 files changed, 309 insertions(+), 79 deletions(-)
