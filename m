Received: from bear.ext.ti.com ([192.94.94.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STs0R-0007YT-3e
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 09:55:56 +0000
From: Afzal Mohammed <afzal@ti.com>
To: <tony@atomide.com>, <dwmw2@infradead.org>,
 <artem.bityutskiy@linux.intel.com>, <dedekind1@gmail.com>,
 <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/4] mtd: nand: omap2: obtain memory from resource
Date: Mon, 14 May 2012 15:09:23 +0530
Message-ID: <82b93b66affd517a54c7454dbd031b77c9eb15a4.1336985941.git.afzal@ti.com>
In-Reply-To: <cover.1336985941.git.afzal@ti.com>
References: <cover.1336985941.git.afzal@ti.com>
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

gpmc initialization done by platform code now updates struct resource
with the address space alloted for nand. Use this interface to obtain
memory rather than relying on platform data field - phys_base.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 arch/arm/plat-omap/include/plat/nand.h |    1 -
 drivers/mtd/nand/omap2.c               |   19 +++++++++++++++----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/plat-omap/include/plat/nand.h b/arch/arm/plat-omap/include/plat/nand.h
index 86e4d9c..290cef5 100644
--- a/arch/arm/plat-omap/include/plat/nand.h
+++ b/arch/arm/plat-omap/include/plat/nand.h
@@ -26,7 +26,6 @@ struct omap_nand_platform_data {
 	bool			dev_ready;
 	int			gpmc_irq;
 	enum nand_io		xfer_type;
-	unsigned long		phys_base;
 	int			devsize;
 	enum omap_ecc           ecc_opt;
 	struct gpmc_nand_regs	reg;
diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 25f930c..f69ecc1 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -128,6 +128,7 @@ struct omap_nand_info {
 
 	int				gpmc_cs;
 	unsigned long			phys_base;
+	unsigned long			mem_size;
 	struct completion		comp;
 	int				dma_ch;
 	int				gpmc_irq;
@@ -1049,6 +1050,7 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 	struct omap_nand_platform_data	*pdata;
 	int				err;
 	int				i, offset;
+	struct resource			*res;
 
 	pdata = pdev->dev.platform_data;
 	if (pdata == NULL) {
@@ -1068,7 +1070,6 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 	info->pdev = pdev;
 
 	info->gpmc_cs		= pdata->cs;
-	info->phys_base		= pdata->phys_base;
 	info->reg		= pdata->reg;
 
 	info->mtd.priv		= &info->nand;
@@ -1081,13 +1082,23 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 	/* NAND write protect off */
 	gpmc_cs_configure(info->gpmc_cs, GPMC_CONFIG_WP, 0);
 
-	if (!request_mem_region(info->phys_base, NAND_IO_SIZE,
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res == NULL) {
+		err = -EINVAL;
+		dev_err(&pdev->dev, "error getting memory resource\n");
+		goto out_free_info;
+	}
+
+	info->phys_base = res->start;
+	info->mem_size = resource_size(res);
+
+	if (!request_mem_region(info->phys_base, info->mem_size,
 				pdev->dev.driver->name)) {
 		err = -EBUSY;
 		goto out_free_info;
 	}
 
-	info->nand.IO_ADDR_R = ioremap(info->phys_base, NAND_IO_SIZE);
+	info->nand.IO_ADDR_R = ioremap(info->phys_base, info->mem_size);
 	if (!info->nand.IO_ADDR_R) {
 		err = -ENOMEM;
 		goto out_release_mem_region;
@@ -1229,7 +1240,7 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 	return 0;
 
 out_release_mem_region:
-	release_mem_region(info->phys_base, NAND_IO_SIZE);
+	release_mem_region(info->phys_base, info->mem_size);
 out_free_info:
 	kfree(info);
 
-- 
1.7.10
