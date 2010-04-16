Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O2jpa-0007tf-1b
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2010 11:35:30 +0000
From: Sukumar Ghorai <s-ghorai@ti.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/6] omap-3630 NAND: enable NAND io in prefetch-irq mode
Date: Fri, 16 Apr 2010 17:05:23 +0530
Message-Id: <1271417723-4426-1-git-send-email-s-ghorai@ti.com>
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

Update config file to enable NAND in prefetch IRQ mode for ZOOM3 and 3630SDP .

Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
---
 arch/arm/configs/omap_3630sdp_defconfig |    1 +
 arch/arm/configs/omap_zoom3_defconfig   |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/omap_3630sdp_defconfig b/arch/arm/configs/omap_3630sdp_defconfig
index a623927..9dfce1a
--- a/arch/arm/configs/omap_3630sdp_defconfig
+++ b/arch/arm/configs/omap_3630sdp_defconfig
@@ -525,6 +525,7 @@ CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_OMAP2=y
 CONFIG_MTD_NAND_OMAP_PREFETCH=y
 # CONFIG_MTD_NAND_OMAP_PREFETCH_DMA is not set
+CONFIG_MTD_NAND_OMAP_PREFETCH_IRQ=y
 CONFIG_MTD_NAND_IDS=y
 # CONFIG_MTD_NAND_DISKONCHIP is not set
 # CONFIG_MTD_NAND_NANDSIM is not set
diff --git a/arch/arm/configs/omap_zoom3_defconfig b/arch/arm/configs/omap_zoom3_defconfig
index 1a12e3e..27b16ed
--- a/arch/arm/configs/omap_zoom3_defconfig
+++ b/arch/arm/configs/omap_zoom3_defconfig
@@ -534,6 +534,7 @@ CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_OMAP2=y
 CONFIG_MTD_NAND_OMAP_PREFETCH=y
 # CONFIG_MTD_NAND_OMAP_PREFETCH_DMA is not set
+CONFIG_MTD_NAND_OMAP_PREFETCH_IRQ=y
 CONFIG_MTD_NAND_IDS=y
 # CONFIG_MTD_NAND_DISKONCHIP is not set
 # CONFIG_MTD_NAND_NANDSIM is not set
-- 
1.5.4.7
