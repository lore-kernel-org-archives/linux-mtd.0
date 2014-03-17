Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WPZlk-0006wD-Qy
 for linux-mtd@lists.infradead.org; Mon, 17 Mar 2014 15:48:07 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/4] mtd: nand: pxa3xx: Normalize ECC strength for ECC scheme
 selection
Date: Mon, 17 Mar 2014 12:47:04 -0300
Message-Id: <1395071227-31909-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1395071227-31909-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395071227-31909-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Simon Guinot <sguinot@lacie.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As preparation work to use the ECC devicetree binding, let's normalize
the ECC strength to a 512B step size. This will allow comparison between
different strengths.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 7588fe2..0196e33 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1344,10 +1344,9 @@ static int pxa3xx_nand_sensing(struct pxa3xx_nand_info *info)
 }
 
 static int pxa_ecc_init(struct pxa3xx_nand_info *info,
-			struct nand_ecc_ctrl *ecc,
-			int strength, int ecc_stepsize, int page_size)
+			struct nand_ecc_ctrl *ecc, int strength, int page_size)
 {
-	if (strength == 1 && ecc_stepsize == 512 && page_size == 2048) {
+	if (strength == 1 && page_size == 2048) {
 		info->chunk_size = 2048;
 		info->spare_size = 40;
 		info->ecc_size = 24;
@@ -1356,7 +1355,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->strength = 1;
 		return 1;
 
-	} else if (strength == 1 && ecc_stepsize == 512 && page_size == 512) {
+	} else if (strength == 1 && page_size == 512) {
 		info->chunk_size = 512;
 		info->spare_size = 8;
 		info->ecc_size = 8;
@@ -1369,7 +1368,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 	 * Required ECC: 4-bit correction per 512 bytes
 	 * Select: 16-bit correction per 2048 bytes
 	 */
-	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 2048) {
+	} else if (strength == 4 && page_size == 2048) {
 		info->ecc_bch = 1;
 		info->chunk_size = 2048;
 		info->spare_size = 32;
@@ -1380,7 +1379,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->strength = 16;
 		return 1;
 
-	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
+	} else if (strength == 4 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 2048;
 		info->spare_size = 32;
@@ -1395,7 +1394,7 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 	 * Required ECC: 8-bit correction per 512 bytes
 	 * Select: 16-bit correction per 1024 bytes
 	 */
-	} else if (strength == 8 && ecc_stepsize == 512 && page_size == 4096) {
+	} else if (strength == 8 && page_size == 4096) {
 		info->ecc_bch = 1;
 		info->chunk_size = 1024;
 		info->spare_size = 0;
@@ -1525,8 +1524,8 @@ KEEP_CONFIG:
 		ecc_step = 512;
 	}
 
-	ret = pxa_ecc_init(info, &chip->ecc, ecc_strength,
-			   ecc_step, mtd->writesize);
+	ret = pxa_ecc_init(info, &chip->ecc, (ecc_strength * ecc_step) / 512,
+			   mtd->writesize);
 	if (!ret) {
 		dev_err(&info->pdev->dev,
 			"ECC strength %d at page size %d is not supported\n",
-- 
1.9.0
