Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMggn-00013T-Nb
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:02:47 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/21] mtd: nand: pxa3xx: Add bad block handling
Date: Thu, 19 Sep 2013 13:01:28 -0300
Message-Id: <1379606505-2529-5-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1379606505-2529-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for flash-based bad block table using Marvell's
custom in-flash bad block table layout. The support is enabled
a 'flash_bbt' platform data or device tree parameter.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c                | 31 +++++++++++++++++++++++++++
 include/linux/platform_data/mtd-nand-pxa3xx.h |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index fba91c2..a0dabe6 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -24,6 +24,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_mtd.h>
 
 #if defined(CONFIG_ARCH_PXA) || defined(CONFIG_ARCH_MMP)
 #define ARCH_HAS_DMA
@@ -246,6 +247,29 @@ static struct pxa3xx_nand_flash builtin_flash_types[] = {
 { "256MiB 16-bit", 0xba20,  64, 2048, 16, 16, 2048, &timing[3] },
 };
 
+static u8 bb_pattern[] = {'M', 'V', 'B', 'b', 't', '0' };
+static u8 bb_mirror_pattern[] = {'1', 't', 'b', 'B', 'V', 'M' };
+
+static struct nand_bbt_descr bbt_main_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION,
+	.offs =	8,
+	.len = 6,
+	.veroffs = 14,
+	.maxblocks = 8,		/* Last 8 blocks in each chip */
+	.pattern = bb_pattern
+};
+
+static struct nand_bbt_descr bbt_mirror_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION,
+	.offs =	8,
+	.len = 6,
+	.veroffs = 14,
+	.maxblocks = 8,		/* Last 8 blocks in each chip */
+	.pattern = bb_mirror_pattern
+};
+
 /* Define a default flash type setting serve as flash detecting only */
 #define DEFAULT_FLASH_TYPE (&builtin_flash_types[0])
 
@@ -1100,6 +1124,12 @@ KEEP_CONFIG:
 	if (info->reg_ndcr & NDCR_DWIDTH_M)
 		chip->options |= NAND_BUSWIDTH_16;
 
+	if (pdata->flash_bbt) {
+		chip->bbt_td = &bbt_main_descr;
+		chip->bbt_md = &bbt_mirror_descr;
+		chip->bbt_options |= NAND_BBT_USE_FLASH;
+	}
+
 	if (nand_scan_ident(mtd, 1, def))
 		return -ENODEV;
 	/* calculate addressing information */
@@ -1318,6 +1348,7 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 	if (of_get_property(np, "marvell,nand-keep-config", NULL))
 		pdata->keep_config = 1;
 	of_property_read_u32(np, "num-cs", &pdata->num_cs);
+	pdata->flash_bbt = of_get_nand_on_flash_bbt(np);
 
 	pdev->dev.platform_data = pdata;
 
diff --git a/include/linux/platform_data/mtd-nand-pxa3xx.h b/include/linux/platform_data/mtd-nand-pxa3xx.h
index ffb8019..a941471 100644
--- a/include/linux/platform_data/mtd-nand-pxa3xx.h
+++ b/include/linux/platform_data/mtd-nand-pxa3xx.h
@@ -55,6 +55,9 @@ struct pxa3xx_nand_platform_data {
 	/* indicate how many chip selects will be used */
 	int	num_cs;
 
+	/* use an flash-based bad block table */
+	bool	flash_bbt;
+
 	const struct mtd_partition		*parts[NUM_CHIP_SELECT];
 	unsigned int				nr_parts[NUM_CHIP_SELECT];
 
-- 
1.8.1.5
