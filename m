Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpevL-0003lF-3M
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 14:33:47 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb1so11171507pad.9
 for <linux-mtd@lists.infradead.org>; Wed, 28 May 2014 07:33:26 -0700 (PDT)
From: Ted Juan <ted.juan@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop error
Date: Wed, 28 May 2014 22:33:06 +0800
Message-Id: <1401287586-5443-1-git-send-email-ted.juan@gmail.com>
In-Reply-To: <20140528090933.GD4285@norris-Latitude-E6410>
References: <20140528090933.GD4285@norris-Latitude-E6410>
Cc: Ted Juan <ted.juan@gmail.com>, linux-mtd@lists.infradead.org, pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

>>Sorry, this patch does not apply to l2-mtd.git. I think it conflicts
>>with some recent changes from Pekon. Please rebase and resend.

ok, this should fix it.

>>Can you format your name properly, without the dot, for proper
>>authorship attribution?

ok, thank you.


 Fixes:  2c9f2365d1e1d0e318b068f683f18c99515b80f8
 mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch4 in omap_calculate_ecc_bch

 Fixes: 7bcd1dca1d587ad29f9825ba4414620440e8c8da
 mtd: nand: omap: ecc.calculate: merge omap3_calculate_ecc_bch8 in omap_calculate_ecc_bch

CC: <stable@vger.kernel.org> # 3.13.x+
Signed-off-by: Ted Juan <ted.juan@gmail.com>
Acked-by: Pekon Gupta <pekon@ti.com>
---
 drivers/mtd/nand/omap2.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index cbe87a8..f0ed92e 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1180,7 +1180,7 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
 	u8 *ecc_code;
 	unsigned long nsectors, bch_val1, bch_val2, bch_val3, bch_val4;
 	u32 val;
-	int i;
+	int i, j;
 
 	nsectors = ((readl(info->reg.gpmc_ecc_config) >> 4) & 0x7) + 1;
 	for (i = 0; i < nsectors; i++) {
@@ -1263,8 +1263,8 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
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
@@ -1273,8 +1273,8 @@ static int __maybe_unused omap_calculate_ecc_bch(struct mtd_info *mtd,
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
