Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9WJS-0004Tc-J7
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 09:24:47 +0000
From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: atmel_nand: add pmecc support for 512, 1k, 4k,
 8k page size
Date: Tue, 22 Jul 2014 17:24:18 +0800
Message-ID: <1406021058-5490-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Josh Wu <josh.wu@atmel.com>, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

PMECC can support 512, 1k, 2k, 4k, 8k page size.
The driver currently only support 2k page size nand flash. So this patch
add support to 512, 1k, 4k and 8k page size nand flash.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 371afdd..33826a0 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1174,7 +1174,17 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 
 	/* set ECC page size and oob layout */
 	switch (mtd->writesize) {
+	case 512:
+	case 1024:
 	case 2048:
+	case 4096:
+	case 8192:
+		if (sector_size > mtd->writesize) {
+			dev_err(host->dev, "pmecc sector size is bigger than the page size!\n");
+			err_no = -EINVAL;
+			goto err;
+		}
+
 		host->pmecc_degree = (sector_size == 512) ?
 			PMECC_GF_DIMENSION_13 : PMECC_GF_DIMENSION_14;
 		host->pmecc_cw_len = (1 << host->pmecc_degree) - 1;
@@ -1201,13 +1211,9 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 
 		nand_chip->ecc.layout = &atmel_pmecc_oobinfo;
 		break;
-	case 512:
-	case 1024:
-	case 4096:
-		/* TODO */
+	default:
 		dev_warn(host->dev,
 			"Unsupported page size for PMECC, use Software ECC\n");
-	default:
 		/* page size not handled by HW ECC */
 		/* switching back to soft ECC */
 		nand_chip->ecc.mode = NAND_ECC_SOFT;
-- 
1.9.1
