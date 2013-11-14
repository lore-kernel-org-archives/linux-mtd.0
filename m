Received: from mail-oa0-x233.google.com ([2607:f8b0:4003:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vh6Bg-0008Oo-Lu
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 23:19:01 +0000
Received: by mail-oa0-f51.google.com with SMTP id i4so3108405oah.10
 for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2013 15:18:39 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: pxa3xx: make ECC configuration checks more explicit
Date: Thu, 14 Nov 2013 15:18:28 -0800
Message-Id: <1384471108-28188-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Armada BCH configuration in this driver uses one of the two
following ECC schemes:

 16-bit correction per 2048 bytes
 16-bit correction per 1024 bytes

These are sufficient for mapping to the 4-bit per 512-bytes and 8-bit
per 512-bytes (respectively) minimum correctability requirements of many
common NAND.

The current code only checks for the required strength (4-bit or 8-bit)
without checking the ECC step size that is associated with that strength
(and simply assumes it is 512). While that is often a safe assumption to
make, let's make it explicit, since we have that information.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index cec81f0..3d143fe 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1364,9 +1364,13 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 
 static int armada370_ecc_init(struct pxa3xx_nand_info *info,
 			      struct nand_ecc_ctrl *ecc,
-			      int strength, int page_size)
+			      int strength, int ecc_stepsize, int page_size)
 {
-	if (strength == 4 && page_size == 4096) {
+	/*
+	 * Required ECC: 4-bit correction per 512 bytes
+	 * Select: 16-bit correction per 2048 bytes
+	 */
+	if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 2048;
 		info->spare_size = 32;
@@ -1377,7 +1381,11 @@ static int armada370_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->strength = 16;
 		return 1;
 
-	} else if (strength == 8 && page_size == 4096) {
+	/*
+	 * Required ECC: 8-bit correction per 512 bytes
+	 * Select: 16-bit correction per 1024 bytes
+	 */
+	} else if (strength == 8 && ecc_stepsize == 512 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 1024;
 		info->spare_size = 0;
@@ -1485,6 +1493,7 @@ KEEP_CONFIG:
 	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
 		ret = armada370_ecc_init(info, &chip->ecc,
 				   chip->ecc_strength_ds,
+				   chip->ecc_step_ds,
 				   mtd->writesize);
 	else
 		ret = pxa_ecc_init(info, &chip->ecc,
-- 
1.8.4.2
