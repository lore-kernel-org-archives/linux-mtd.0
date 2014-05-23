Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wng6R-0000US-1W
 for linux-mtd@lists.infradead.org; Fri, 23 May 2014 03:25:04 +0000
Received: by mail-vc0-f180.google.com with SMTP id hy4so5515577vcb.39
 for <linux-mtd@lists.infradead.org>; Thu, 22 May 2014 20:24:40 -0700 (PDT)
From: "ted.juan" <ted.juan@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop error
Date: Fri, 23 May 2014 11:24:34 +0800
Message-Id: <1400815474-7871-1-git-send-email-ted.juan@gmail.com>
In-Reply-To: <1400813650-7417-1-git-send-email-ted.juan@gmail.com>
References: <1400813650-7417-1-git-send-email-ted.juan@gmail.com>
Cc: "ted.juan" <ted_juan@weintek.com>, linux-mtd@lists.infradead.org,
 pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "ted.juan" <ted_juan@weintek.com>

 Fixes:  2c9f2365d1e1d0e318b068f683f18c99515b80f8
 mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch4 in omap_calculate_ecc_bch

 Fixes: 7bcd1dca1d587ad29f9825ba4414620440e8c8da
 mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch8 in omap_calculate_ecc_bch

CC: <stable@vger.kernel.org> # 3.13.x+
Signed-off-by: ted.juan <ted.juan@gmail.com>
Acked-by: Pekon Gupta <pekon@ti.com>
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
