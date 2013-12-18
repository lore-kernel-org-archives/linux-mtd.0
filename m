Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtOun-0004dn-Rb
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 21:44:27 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH RESEND 3/3] mtd: nand: pxa3xx: Consolidate ECC initialization
Date: Wed, 18 Dec 2013 18:44:10 -0300
Message-Id: <1387403050-23965-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1387403050-23965-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1387403050-23965-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 Seif Mazareeb <seif@marvell.com>, Simon Guinot <sguinot@lacie.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In order to avoid code duplication, let's consolidate the ECC setting
for all SoC variants. Such decision is based on page size and ECC
strength requirements.

Also, provide a default value for the case where such ECC information
is not provided (non-ONFI devices).

Tested-by: Arnaud Ebalard <arno@natisbad.org>
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index f722ba7..0599a88 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1332,13 +1332,9 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 
 static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 			struct nand_ecc_ctrl *ecc,
-			int strength, int page_size)
+			int strength, int ecc_stepsize, int page_size)
 {
-	/*
-	 * We don't use strength here as the PXA variant
-	 * is used with non-ONFI compliant devices.
-	 */
-	if (page_size == 2048) {
+	if (strength == 1 && ecc_stepsize == 512 && page_size == 2048) {
 		info->chunk_size = 2048;
 		info->spare_size = 40;
 		info->ecc_size = 24;
@@ -1347,7 +1343,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->strength = 1;
 		return 1;
 
-	} else if (page_size == 512) {
+	} else if (strength == 1 && ecc_stepsize == 512 && page_size == 512) {
 		info->chunk_size = 512;
 		info->spare_size = 8;
 		info->ecc_size = 8;
@@ -1355,19 +1351,12 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->size = 512;
 		ecc->strength = 1;
 		return 1;
-	}
-	return 0;
-}
 
-static int armada370_ecc_init(struct pxa3xx_nand_info *info,
-			      struct nand_ecc_ctrl *ecc,
-			      int strength, int ecc_stepsize, int page_size)
-{
 	/*
 	 * Required ECC: 4-bit correction per 512 bytes
 	 * Select: 16-bit correction per 2048 bytes
 	 */
-	if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
+	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 2048;
 		info->spare_size = 32;
@@ -1408,6 +1397,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	uint32_t id = -1;
 	uint64_t chipsize;
 	int i, ret, num;
+	uint16_t ecc_strength, ecc_step;
 
 	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
 		goto KEEP_CONFIG;
@@ -1502,15 +1492,17 @@ KEEP_CONFIG:
 		}
 	}
 
-	if (info->variant == PXA3XX_NAND_VARIANT_ARMADA370)
-		ret = armada370_ecc_init(info, &chip->ecc,
-				   chip->ecc_strength_ds,
-				   chip->ecc_step_ds,
-				   mtd->writesize);
-	else
-		ret = pxa_ecc_init(info, &chip->ecc,
-				   chip->ecc_strength_ds,
-				   mtd->writesize);
+	ecc_strength = chip->ecc_strength_ds;
+	ecc_step = chip->ecc_step_ds;
+
+	/* Set default ECC strength requirements on non-ONFI devices */
+	if (ecc_strength < 1 && ecc_step < 1) {
+		ecc_strength = 1;
+		ecc_step = 512;
+	}
+
+	ret = pxa_ecc_init(info, &chip->ecc, ecc_strength,
+			   ecc_step, mtd->writesize);
 	if (!ret) {
 		dev_err(&info->pdev->dev,
 			"ECC strength %d at page size %d is not supported\n",
-- 
1.8.1.5
