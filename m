Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpxwV-0001es-VR
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 10:20:01 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: nand: pxa3xx: Consolidate ECC initialization
Date: Mon,  9 Dec 2013 07:19:44 -0300
Message-Id: <1386584384-6379-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1386584384-6379-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1386584384-6379-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
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
index 1840d33..945eb62 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1342,13 +1342,9 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 
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
@@ -1357,7 +1353,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->strength = 1;
 		return 1;
 
-	} else if (page_size == 512) {
+	} else if (strength == 1 && ecc_stepsize == 512 && page_size == 512) {
 		info->chunk_size = 512;
 		info->spare_size = 8;
 		info->ecc_size = 8;
@@ -1365,19 +1361,12 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
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
@@ -1418,6 +1407,7 @@ static int pxa3xx_nand_scan(struct mtd_info *mtd)
 	uint32_t id = -1;
 	uint64_t chipsize;
 	int i, ret, num;
+	uint16_t ecc_strength, ecc_step;
 
 	if (pdata->keep_config && !pxa3xx_nand_detect_config(info))
 		goto KEEP_CONFIG;
@@ -1512,15 +1502,17 @@ KEEP_CONFIG:
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
