Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3kzV-0001lO-E4
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 09:43:17 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <artem.bityutskiy@linux.intel.com>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 02/10] ARM: OMAP2+: gpmc-nand: update gpmc-nand regs
Date: Tue, 21 Aug 2012 15:13:07 +0530
Message-ID: <0631b257f7acb9964f66715d8487ad8bb5bb2188.1344609341.git.afzal@ti.com>
In-Reply-To: <cover.1344609341.git.afzal@ti.com>
References: <cover.1344609341.git.afzal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: ivan.djelic@parrot.com, Afzal Mohammed <afzal@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GPMC has NAND registers, update nand platform data with those details
so that NAND driver can configure those by itself instead of using
exported symbols.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 arch/arm/mach-omap2/gpmc-nand.c        |    2 ++
 arch/arm/plat-omap/include/plat/nand.h |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-omap2/gpmc-nand.c b/arch/arm/mach-omap2/gpmc-nand.c
index 386dec8..d4e803c 100644
--- a/arch/arm/mach-omap2/gpmc-nand.c
+++ b/arch/arm/mach-omap2/gpmc-nand.c
@@ -108,6 +108,8 @@ int __init gpmc_nand_init(struct omap_nand_platform_data *gpmc_nand_data)
 		gpmc_cs_configure(gpmc_nand_data->cs, GPMC_CONFIG_RDY_BSY, 1);
 	}
 
+	gpmc_update_nand_reg(&gpmc_nand_data->reg, gpmc_nand_data->cs);
+
 	err = platform_device_register(&gpmc_nand_device);
 	if (err < 0) {
 		dev_err(dev, "Unable to register NAND device\n");
diff --git a/arch/arm/plat-omap/include/plat/nand.h b/arch/arm/plat-omap/include/plat/nand.h
index 67fc506..86e4d9c 100644
--- a/arch/arm/plat-omap/include/plat/nand.h
+++ b/arch/arm/plat-omap/include/plat/nand.h
@@ -29,6 +29,7 @@ struct omap_nand_platform_data {
 	unsigned long		phys_base;
 	int			devsize;
 	enum omap_ecc           ecc_opt;
+	struct gpmc_nand_regs	reg;
 };
 
 /* minimum size for IO mapping */
-- 
1.7.1
