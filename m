Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlEbh-0008ED-Ij
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 09:39:14 +0000
Received: by mail-qg0-f52.google.com with SMTP id a108so3729563qge.39
 for <linux-mtd@lists.infradead.org>; Fri, 16 May 2014 02:38:51 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 16 May 2014 17:38:51 +0800
Message-ID: <CAE94FHH66=h0Px23dw8LX9_Hu+GtA1c6qVOqwo6U4uHq+d1zUw@mail.gmail.com>
Subject: [PATCH] mtd: nand: omap: fix omap_calculate_ecc_bch() for-loop error
From: Ted Juan <ted.juan@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch is mirror issue that the for-loop use the same variable.


Signed-off-by: ted.juan <ted.juan@gmail.com>
---
 drivers/mtd/nand/omap2.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index 1ff49b8..e21145a 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1162,7 +1162,7 @@ static int __maybe_unused
omap_calculate_ecc_bch(struct mtd_info *mtd,
        struct gpmc_nand_regs   *gpmc_regs = &info->reg;
        u8 *ecc_code;
        unsigned long nsectors, bch_val1, bch_val2, bch_val3, bch_val4;
-       int i;
+       int i, j;

        nsectors = ((readl(info->reg.gpmc_ecc_config) >> 4) & 0x7) + 1;
        for (i = 0; i < nsectors; i++) {
@@ -1210,8 +1210,8 @@ static int __maybe_unused
omap_calculate_ecc_bch(struct mtd_info *mtd,
                case OMAP_ECC_BCH4_CODE_HW_DETECTION_SW:
                        /* Add constant polynomial to remainder, so that
                         * ECC of blank pages results in 0x0 on reading back */
-                       for (i = 0; i < eccbytes; i++)
-                               ecc_calc[i] ^= bch4_polynomial[i];
+                       for (j = 0; j < eccbytes; j++)
+                               ecc_calc[j] ^= bch4_polynomial[j];
                        break;
                case OMAP_ECC_BCH4_CODE_HW:
                        /* Set  8th ECC byte as 0x0 for ROM compatibility */
@@ -1220,8 +1220,8 @@ static int __maybe_unused
omap_calculate_ecc_bch(struct mtd_info *mtd,
                case OMAP_ECC_BCH8_CODE_HW_DETECTION_SW:
                        /* Add constant polynomial to remainder, so that
                         * ECC of blank pages results in 0x0 on reading back */
-                       for (i = 0; i < eccbytes; i++)
-                               ecc_calc[i] ^= bch8_polynomial[i];
+                       for (j = 0; j < eccbytes; j++)
+                               ecc_calc[j] ^= bch8_polynomial[j];
                        break;
                case OMAP_ECC_BCH8_CODE_HW:
                        /* Set 14th ECC byte as 0x0 for ROM compatibility */
-- 
1.7.9.5
