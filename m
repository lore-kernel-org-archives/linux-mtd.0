Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMggx-00014r-Nr
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2013 16:03:05 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/21] mtd: nand: pxa3xx: Add driver-specific ECC BCH support
Date: Thu, 19 Sep 2013 13:01:29 -0300
Message-Id: <1379606505-2529-6-git-send-email-ezequiel.garcia@free-electrons.com>
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

This commit adds the BCH ECC support available in NFCv2 controller.
Depending on the detected required strength the respective ECC layout
is selected.

This commit adds an empty ECC layout, since support to access large
pages is first required. Once that support is added, a proper ECC
layout will be added as well.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 53 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index a0dabe6..86c343e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -56,6 +56,7 @@
 #define NDPCR		(0x18) /* Page Count Register */
 #define NDBDR0		(0x1C) /* Bad Block Register 0 */
 #define NDBDR1		(0x20) /* Bad Block Register 1 */
+#define NDECCCTRL	(0x28) /* ECC control */
 #define NDDB		(0x40) /* Data Buffer */
 #define NDCB0		(0x48) /* Command Buffer0 */
 #define NDCB1		(0x4C) /* Command Buffer1 */
@@ -197,6 +198,7 @@ struct pxa3xx_nand_info {
 
 	int			cs;
 	int			use_ecc;	/* use HW ECC ? */
+	int			ecc_bch;	/* using BCH ECC? */
 	int			use_dma;	/* use DMA ? */
 	int			use_spare;	/* use spare ? */
 
@@ -270,6 +272,12 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 	.pattern = bb_mirror_pattern
 };
 
+static struct nand_ecclayout ecc_layout_4KB_bch4bit = {
+	.eccbytes = 0,
+	.eccpos = {},
+	.oobfree = {}
+};
+
 /* Define a default flash type setting serve as flash detecting only */
 #define DEFAULT_FLASH_TYPE (&builtin_flash_types[0])
 
@@ -329,7 +337,10 @@ static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
 
 	switch (host->page_size) {
 	case 2048:
-		info->oob_size = (info->use_ecc) ? 40 : 64;
+		if (info->ecc_bch)
+			info->oob_size = (info->use_ecc) ? 32 : 64;
+		else
+			info->oob_size = (info->use_ecc) ? 40 : 64;
 		break;
 	case 512:
 		info->oob_size = (info->use_ecc) ? 8 : 16;
@@ -349,10 +360,15 @@ static void pxa3xx_nand_start(struct pxa3xx_nand_info *info)
 
 	ndcr = info->reg_ndcr;
 
-	if (info->use_ecc)
+	if (info->use_ecc) {
 		ndcr |= NDCR_ECC_EN;
-	else
+		if (info->ecc_bch)
+			nand_writel(info, NDECCCTRL, 0x1);
+	} else {
 		ndcr &= ~NDCR_ECC_EN;
+		if (info->ecc_bch)
+			nand_writel(info, NDECCCTRL, 0x0);
+	}
 
 	if (info->use_dma)
 		ndcr |= NDCR_DMA_EN;
@@ -1117,10 +1133,6 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	pxa3xx_flash_ids[1].name = NULL;
 	def = pxa3xx_flash_ids;
 KEEP_CONFIG:
-	chip->ecc.mode = NAND_ECC_HW;
-	chip->ecc.size = host->page_size;
-	chip->ecc.strength = 1;
-
 	if (info->reg_ndcr & NDCR_DWIDTH_M)
 		chip->options |= NAND_BUSWIDTH_16;
 
@@ -1130,8 +1142,35 @@ KEEP_CONFIG:
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 	}
 
+	/* Device detection must be done with ECC disabled */
+	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
+		nand_writel(info, NDECCCTRL, 0x0);
+
 	if (nand_scan_ident(mtd, 1, def))
 		return -ENODEV;
+
+	/* 1-step ECC over the entire detected page size */
+	chip->ecc.mode = NAND_ECC_HW;
+	chip->ecc.size = mtd->writesize;
+
+	/*
+	 * Armada370 variant supports BCH, which provides 4-bit strength
+	 * and needs to be supported in a special way.
+	 */
+	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370 &&
+	    chip->ecc_strength_ds == 4) {
+	        chip->ecc.layout = &ecc_layout_4KB_bch4bit;
+		chip->ecc.strength = chip->ecc_strength_ds;
+		info->ecc_bch = 1;
+	} else if (mtd->writesize <= 2048) {
+		/*
+		 * This is the default ECC Hamming 1-bit strength case,
+		 * which works for page sizes of 512 and 2048 bytes.
+		 * The ECC layout will be automatically configured.
+		 */
+		chip->ecc.strength = 1;
+	}
+
 	/* calculate addressing information */
 	if (mtd->writesize >= 2048)
 		host->col_addr_cycles = 2;
-- 
1.8.1.5
