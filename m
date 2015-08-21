Received: from mail-qg0-f42.google.com ([209.85.192.42])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSrPo-0005gJ-GU
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 18:51:49 +0000
Received: by qgeg42 with SMTP id g42so52568491qge.1
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 11:51:26 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] nand: pxa3xx: Remove unused platform-data flash specification
Date: Fri, 21 Aug 2015 15:47:28 -0300
Message-Id: <1440182848-8254-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver supports board files specificating the flash
device, by passing a pxa3xx_nand_flash struct (with
flash parameters) in the platform data struct.

Currently this support is not being used by any board file.
Moreover, we'd like to deprecate such usage in favor of
using the device table in nand_ids.c.

So let's remove the ad-hoc flash specification.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/nand/pxa3xx_nand.c                | 33 ++++++++++++++++++++++-----
 include/linux/platform_data/mtd-nand-pxa3xx.h | 27 ----------------------
 2 files changed, 27 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 740983a..165112c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -252,6 +252,30 @@ static bool use_dma = 1;
 module_param(use_dma, bool, 0444);
 MODULE_PARM_DESC(use_dma, "enable DMA for data transferring to/from NAND HW");
 
+struct pxa3xx_nand_timing {
+	unsigned int	tCH;  /* Enable signal hold time */
+	unsigned int	tCS;  /* Enable signal setup time */
+	unsigned int	tWH;  /* ND_nWE high duration */
+	unsigned int	tWP;  /* ND_nWE pulse time */
+	unsigned int	tRH;  /* ND_nRE high duration */
+	unsigned int	tRP;  /* ND_nRE pulse width */
+	unsigned int	tR;   /* ND_nWE high to ND_nRE low for read */
+	unsigned int	tWHR; /* ND_nWE high to ND_nRE low for status read */
+	unsigned int	tAR;  /* ND_ALE low to ND_nRE low delay */
+};
+
+struct pxa3xx_nand_flash {
+	char		*name;
+	uint32_t	chip_id;
+	unsigned int	page_per_block; /* Pages per block (PG_PER_BLK) */
+	unsigned int	page_size;	/* Page size in bytes (PAGE_SZ) */
+	unsigned int	flash_width;	/* Width of Flash memory (DWIDTH_M) */
+	unsigned int	dfc_width;	/* Width of flash controller(DWIDTH_C) */
+	unsigned int	num_blocks;	/* Number of physical blocks in Flash */
+
+	struct pxa3xx_nand_timing *timing;	/* NAND Flash timing */
+};
+
 static struct pxa3xx_nand_timing timing[] = {
 	{ 40, 80, 60, 100, 80, 100, 90000, 400, 40, },
 	{ 10,  0, 20,  40, 30,  40, 11123, 110, 10, },
@@ -1491,19 +1515,16 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 		return -EINVAL;
 	}
 
-	num = ARRAY_SIZE(builtin_flash_types) + pdata->num_flash - 1;
+	num = ARRAY_SIZE(builtin_flash_types) - 1;
 	for (i = 0; i < num; i++) {
-		if (i < pdata->num_flash)
-			f = pdata->flash + i;
-		else
-			f = &builtin_flash_types[i - pdata->num_flash + 1];
+		f = &builtin_flash_types[i + 1];
 
 		/* find the chip in default list */
 		if (f->chip_id == id)
 			break;
 	}
 
-	if (i >= (ARRAY_SIZE(builtin_flash_types) + pdata->num_flash - 1)) {
+	if (i >= (ARRAY_SIZE(builtin_flash_types) - 1)) {
 		dev_err(&info->pdev->dev, "ERROR!! flash not defined!!!\n");
 
 		return -EINVAL;
diff --git a/include/linux/platform_data/mtd-nand-pxa3xx.h b/include/linux/platform_data/mtd-nand-pxa3xx.h
index ac4ea2e..394d155 100644
--- a/include/linux/platform_data/mtd-nand-pxa3xx.h
+++ b/include/linux/platform_data/mtd-nand-pxa3xx.h
@@ -4,30 +4,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 
-struct pxa3xx_nand_timing {
-	unsigned int	tCH;  /* Enable signal hold time */
-	unsigned int	tCS;  /* Enable signal setup time */
-	unsigned int	tWH;  /* ND_nWE high duration */
-	unsigned int	tWP;  /* ND_nWE pulse time */
-	unsigned int	tRH;  /* ND_nRE high duration */
-	unsigned int	tRP;  /* ND_nRE pulse width */
-	unsigned int	tR;   /* ND_nWE high to ND_nRE low for read */
-	unsigned int	tWHR; /* ND_nWE high to ND_nRE low for status read */
-	unsigned int	tAR;  /* ND_ALE low to ND_nRE low delay */
-};
-
-struct pxa3xx_nand_flash {
-	char		*name;
-	uint32_t	chip_id;
-	unsigned int	page_per_block; /* Pages per block (PG_PER_BLK) */
-	unsigned int	page_size;	/* Page size in bytes (PAGE_SZ) */
-	unsigned int	flash_width;	/* Width of Flash memory (DWIDTH_M) */
-	unsigned int	dfc_width;	/* Width of flash controller(DWIDTH_C) */
-	unsigned int	num_blocks;	/* Number of physical blocks in Flash */
-
-	struct pxa3xx_nand_timing *timing;	/* NAND Flash timing */
-};
-
 /*
  * Current pxa3xx_nand controller has two chip select which
  * both be workable.
@@ -63,9 +39,6 @@ struct pxa3xx_nand_platform_data {
 
 	const struct mtd_partition		*parts[NUM_CHIP_SELECT];
 	unsigned int				nr_parts[NUM_CHIP_SELECT];
-
-	const struct pxa3xx_nand_flash * 	flash;
-	size_t					num_flash;
 };
 
 extern void pxa3xx_set_nand_info(struct pxa3xx_nand_platform_data *info);
-- 
2.4.6
