Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0WzJ-0007b3-8n
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 13:46:36 +0000
From: Pekon Gupta <pekon@ti.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v5 4/4] mtd: nand: omap: ecc.calculate: merge
 omap3_calculate_ecc_bch8 in omap_calculate_ecc_bch
Date: Tue, 7 Jan 2014 19:15:46 +0530
Message-ID: <1389102346-1455-5-git-send-email-pekon@ti.com>
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

This patch merges omap3_calculate_ecc_bch8() into omap_calculate_ecc_bch()
to re-use common code between BCH8_HW and BCH8_HW_DETECTION_SW

+---------------------+-------------------------------------------------------+
|ecc-scheme           | implementations for nand_chip->calculate()            |
+---------------------+-------------------------------------------------------+
|HAM1_ECC             | omap_calculate_ecc()                                  |
+---------------------+-------------------------------------------------------+
|BCH4_HW_DETECTION_SW | omap_calculate_ecc_bch()                              |
|BCH4_HW              | omap_calculate_ecc_bch()                              |
|BCH8_HW_DETECTION_SW | omap3_calculate_ecc_bch8() -> omap_calculate_ecc_bch()|
|BCH8_HW              | omap_calculate_ecc_bch()                              |
+---------------------+-------------------------------------------------------+

Signed-off-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c | 59 ++++++++----------------------------------------
 1 file changed, 10 insertions(+), 49 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 26db491..72d5f23 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -142,6 +142,8 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 #endif
 static u8  bch4_polynomial[] = {0x28, 0x13, 0xcc, 0x39, 0x96, 0xac, 0x7f};
+static u8  bch8_polynomial[] = {0xef, 0x51, 0x2e, 0x09, 0xed, 0x93, 0x9a, 0xc2,
+				0x97, 0x79, 0xe5, 0x24, 0xb5};
 
 /* oob info generated runtime depending on ecc algorithm and layout selected */
 static struct nand_ecclayout omap_oobinfo;
@@ -1123,54 +1125,6 @@ static void omap3_enable_hwecc_bch(struct mtd_info *mtd, int mode)
 }
 #endif
 
-#ifdef CONFIG_MTD_NAND_ECC_BCH
-/**
- * omap3_calculate_ecc_bch8 - Generate 13 bytes of ECC bytes
- * @mtd: MTD device structure
- * @dat: The pointer to data on which ecc is computed
- * @ecc_code: The ecc_code buffer
- */
-static int omap3_calculate_ecc_bch8(struct mtd_info *mtd, const u_char *dat,
-				    u_char *ecc_code)
-{
-	struct omap_nand_info *info = container_of(mtd, struct omap_nand_info,
-						   mtd);
-	unsigned long nsectors, val1, val2, val3, val4;
-	int i;
-
-	nsectors = ((readl(info->reg.gpmc_ecc_config) >> 4) & 0x7) + 1;
-
-	for (i = 0; i < nsectors; i++) {
-
-		/* Read hw-computed remainder */
-		val1 = readl(info->reg.gpmc_bch_result0[i]);
-		val2 = readl(info->reg.gpmc_bch_result1[i]);
-		val3 = readl(info->reg.gpmc_bch_result2[i]);
-		val4 = readl(info->reg.gpmc_bch_result3[i]);
-
-		/*
-		 * Add constant polynomial to remainder, in order to get an ecc
-		 * sequence of 0xFFs for a buffer filled with 0xFFs.
-		 */
-		*ecc_code++ = 0xef ^ (val4 & 0xFF);
-		*ecc_code++ = 0x51 ^ ((val3 >> 24) & 0xFF);
-		*ecc_code++ = 0x2e ^ ((val3 >> 16) & 0xFF);
-		*ecc_code++ = 0x09 ^ ((val3 >> 8) & 0xFF);
-		*ecc_code++ = 0xed ^ (val3 & 0xFF);
-		*ecc_code++ = 0x93 ^ ((val2 >> 24) & 0xFF);
-		*ecc_code++ = 0x9a ^ ((val2 >> 16) & 0xFF);
-		*ecc_code++ = 0xc2 ^ ((val2 >> 8) & 0xFF);
-		*ecc_code++ = 0x97 ^ (val2 & 0xFF);
-		*ecc_code++ = 0x79 ^ ((val1 >> 24) & 0xFF);
-		*ecc_code++ = 0xe5 ^ ((val1 >> 16) & 0xFF);
-		*ecc_code++ = 0x24 ^ ((val1 >> 8) & 0xFF);
-		*ecc_code++ = 0xb5 ^ (val1 & 0xFF);
-	}
-
-	return 0;
-}
-#endif /* CONFIG_MTD_NAND_ECC_BCH */
-
 /**
  * omap_calculate_ecc_bch - Generate bytes of ECC bytes
  * @mtd:	MTD device structure
@@ -1195,6 +1149,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 	for (i = 0; i < nsectors; i++) {
 		ecc_code = ecc_calc;
 		switch (ecc_opt) {
+		case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
 		case OMAP_ECC_BCH8_CODE_HW:
 			bch_val1 = readl(gpmc_regs->gpmc_bch_result0[i]);
 			bch_val2 = readl(gpmc_regs->gpmc_bch_result1[i]);
@@ -1243,6 +1198,12 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 			/* Set  8th ECC byte as 0x0 for ROM compatibility */
 			ecc_calc[eccbytes - 1] = 0x0;
 			break;
+		case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
+			/* Add constant polynomial to remainder, so that
+			 * ECC of blank pages results in 0x0 on reading back */
+			for (i = 0; i < eccbytes; i++)
+				ecc_calc[i] ^= bch8_polynomial[i];
+			break;
 		case OMAP_ECC_BCH8_CODE_HW:
 			/* Set 14th ECC byte as 0x0 for ROM compatibility */
 			ecc_calc[eccbytes - 1] = 0x0;
@@ -1862,7 +1823,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 		nand_chip->ecc.strength		= 8;
 		nand_chip->ecc.hwctl		= omap3_enable_hwecc_bch;
 		nand_chip->ecc.correct		= nand_bch_correct_data;
-		nand_chip->ecc.calculate	= omap3_calculate_ecc_bch8;
+		nand_chip->ecc.calculate	= omap_calculate_ecc_bch;
 		/* define ECC layout */
 		ecclayout->eccbytes		= nand_chip->ecc.bytes *
 							(mtd->writesize /
-- 
1.8.1
