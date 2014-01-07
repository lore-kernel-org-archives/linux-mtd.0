Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0WzH-0007b1-OZ
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 13:46:34 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 3/4] mtd: nand: omap: ecc.calculate: merge
 omap3_calculate_ecc_bch4 in omap_calculate_ecc_bch
Date: Tue, 7 Jan 2014 19:15:45 +0530
Message-ID: <1389102346-1455-4-git-send-email-pekon@ti.com>
In-Reply-To: <1389102346-1455-1-git-send-email-pekon@ti.com>
References: <1389102346-1455-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>, Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

chip->ecc.calculate() is used for calculating and fetching of ECC syndrome by
processing the data passed during Read/Write accesses.
All H/W ECC schemes use GPMC controller for ECC syndrome calculation,but each
ecc-scheme implements its own calback to config, process and fetch ECC syndrome.

This patch merges omap3_calculate_ecc_bch4() into omap_calculate_ecc_bch()
to re-use common code between BCH4_HW and BCH4_HW_DETECTION_SW

+---------------------+-------------------------------------------------------+
|ecc-scheme           | implementations for nand_chip->calculate()            |
+---------------------+-------------------------------------------------------+
|HAM1_ECC             | omap_calculate_ecc()                                  |
+---------------------+-------------------------------------------------------+
|BCH4_HW_DETECTION_SW | omap3_calculate_ecc_bch4() -> omap_calculate_ecc_bch()|
|BCH4_HW              | omap_calculate_ecc_bch()                              |
|BCH8_HW_DETECTION_SW | omap3_calculate_ecc_bch8()                            |
|BCH8_HW              | omap_calculate_ecc_bch()                              |
+---------------------+-------------------------------------------------------+

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 51 ++++++++++--------------------------------------
 1 file changed, 10 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index dabea92..26db491 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -141,6 +141,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 	0xac, 0x6b, 0xff, 0x99, 0x7b};
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 #endif
+static u8  bch4_polynomial[] = {0x28, 0x13, 0xcc, 0x39, 0x96, 0xac, 0x7f};
 
 /* oob info generated runtime depending on ecc algorithm and layout selected */
 static struct nand_ecclayout omap_oobinfo;
@@ -1124,45 +1125,6 @@ static void omap3_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 
 #ifdef CONFIG_MTD_NAND_ECC_BCH
 /**
- * omap3_calculate_ecc_bch4 - Generate 7 bytes of ECC bytes
- * @mtd: MTD device structure
- * @dat: The pointer to data on which ecc is computed
- * @ecc_code: The ecc_code buffer
- */
-static int omap3_calculate_ecc_bch4(struct mtd_info *mtd, const u_char *dat,
-				    u_char *ecc_code)
-{
-	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
-						   mtd);
-	unsigned long nsectors, val1, val2;
-	int i;
-
-	nsectors = ((readl(info->reg.gpmc_ecc_config) >> 4) & 0x7) + 1;
-
-	for (i = 0; i < nsectors; i++) {
-
-		/* Read hw-computed remainder */
-		val1 = readl(info->reg.gpmc_bch_result0[i]);
-		val2 = readl(info->reg.gpmc_bch_result1[i]);
-
-		/*
-		 * Add constant polynomial to remainder, in order to get an ecc
-		 * sequence of 0xFFs for a buffer filled with 0xFFs; and
-		 * left-justify the resulting polynomial.
-		 */
-		*ecc_code++ = 0x28 ^ ((val2 >> 12) & 0xFF);
-		*ecc_code++ = 0x13 ^ ((val2 >>  4) & 0xFF);
-		*ecc_code++ = 0xcc ^ (((val2 & 0xF) << 4)|((val1 >> 28) & 0xF));
-		*ecc_code++ = 0x39 ^ ((val1 >> 20) & 0xFF);
-		*ecc_code++ = 0x96 ^ ((val1 >> 12) & 0xFF);
-		*ecc_code++ = 0xac ^ ((val1 >> 4) & 0xFF);
-		*ecc_code++ = 0x7f ^ ((val1 & 0xF) << 4);
-	}
-
-	return 0;
-}
-
-/**
  * omap3_calculate_ecc_bch8 - Generate 13 bytes of ECC bytes
  * @mtd: MTD device structure
  * @dat: The pointer to data on which ecc is computed
@@ -1209,7 +1171,6 @@ static int omap3_calculate_ecc_bch8(struct mtd_info *mtd, const u_char *dat,
 }
 #endif /* CONFIG_MTD_NAND_ECC_BCH */
 
-#ifdef CONFIG_MTD_NAND_OMAP_BCH
 /**
  * omap_calculate_ecc_bch - Generate bytes of ECC bytes
  * @mtd:	MTD device structure
@@ -1253,6 +1214,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 			*ecc_code++ = ((bch_val1 >> 8) & 0xFF);
 			*ecc_code++ = (bch_val1 & 0xFF);
 			break;
+		case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
 		case OMAP_ECC_BCH4_CODE_HW:
 			bch_val1 = readl(gpmc_regs->gpmc_bch_result0[i]);
 			bch_val2 = readl(gpmc_regs->gpmc_bch_result1[i]);
@@ -1271,6 +1233,12 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 
 		/* ECC scheme specific syndrome customizations */
 		switch (ecc_opt) {
+		case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
+			/* Add constant polynomial to remainder, so that
+			 * ECC of blank pages results in 0x0 on reading back */
+			for (i = 0; i < eccbytes; i++)
+				ecc_calc[i] ^= bch4_polynomial[i];
+			break;
 		case OMAP_ECC_BCH4_CODE_HW:
 			/* Set  8th ECC byte as 0x0 for ROM compatibility */
 			ecc_calc[eccbytes - 1] = 0x0;
@@ -1289,6 +1257,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 	return 0;
 }
 
+#ifdef CONFIG_MTD_NAND_OMAP_BCH
 /**
  * omap_elm_correct_data - corrects page data area in case error reported
  * @mtd:	MTD device structure
@@ -1823,7 +1792,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		nand_chip->ecc.strength		= 4;
 		nand_chip->ecc.hwctl		= omap3_enable_hwecc_bch;
 		nand_chip->ecc.correct		= nand_bch_correct_data;
-		nand_chip->ecc.calculate	= omap3_calculate_ecc_bch4;
+		nand_chip->ecc.calculate	= omap_calculate_ecc_bch;
 		/* define ECC layout */
 		ecclayout->eccbytes		= nand_chip->ecc.bytes *
 							(mtd->writesize /
-- 
1.8.1
