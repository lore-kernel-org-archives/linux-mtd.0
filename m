Received: from mail-ve0-x22b.google.com ([2607:f8b0:400c:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnPjy-0005AC-4K
 for linux-mtd@lists.infradead.org; Thu, 22 May 2014 09:56:46 +0000
Received: by mail-ve0-f171.google.com with SMTP id oz11so4064936veb.16
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 02:56:22 -0700 (PDT)
From: "ted.juan" <ted.juan@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop error
Date: Thu, 22 May 2014 17:56:16 +0800
Message-Id: <1400752576-23110-1-git-send-email-ted.juan@gmail.com>
Cc: "ted.juan" <ted.juan@gmail.com>, linux-mtd@lists.infradead.org,
 pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "ted.juan" <ted.juan@gmail.com>


I am sorry that I didn't use the git-send-mail last time.


Signed-off-by: ted.juan <ted.juan@gmail.com>
---
 drivers/mtd/nand/omap2.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 1ff49b8..e21145a 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1162,7 +1162,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 	struct gpmc_nand_regs	*gpmc_regs = &info->reg;
 	u8 *ecc_code;
 	unsigned long nsectors, bch_val1, bch_val2, bch_val3, bch_val4;
-	int i;
+	int i, j;
 
 	nsectors = ((readl(info->reg.gpmc_ecc_config) >> 4) & 0x7) + 1;
 	for (i = 0; i < nsectors; i++) {
@@ -1210,8 +1210,8 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 		case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
 			/* Add constant polynomial to remainder, so that
 			 * ECC of blank pages results in 0x0 on reading back */
-			for (i = 0; i < eccbytes; i++)
-				ecc_calc[i] ^= bch4_polynomial[i];
+			for (j = 0; j < eccbytes; j++)
+				ecc_calc[j] ^= bch4_polynomial[j];
 			break;
 		case OMAP_ECC_BCH4_CODE_HW:
 			/* Set  8th ECC byte as 0x0 for ROM compatibility */
@@ -1220,8 +1220,8 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 		case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
 			/* Add constant polynomial to remainder, so that
 			 * ECC of blank pages results in 0x0 on reading back */
-			for (i = 0; i < eccbytes; i++)
-				ecc_calc[i] ^= bch8_polynomial[i];
+			for (j = 0; j < eccbytes; j++)
+				ecc_calc[j] ^= bch8_polynomial[j];
 			break;
 		case OMAP_ECC_BCH8_CODE_HW:
 			/* Set 14th ECC byte as 0x0 for ROM compatibility */
-- 
1.7.9.5
