Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkdSU-0007S3-L5
 for linux-mtd@lists.infradead.org; Wed, 14 May 2014 17:59:15 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3 2/4] mtd: nand: pxa3xx: Clean pxa_ecc_init() error handling
Date: Wed, 14 May 2014 14:58:07 -0300
Message-Id: <1400090289-24581-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1400090289-24581-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1400090289-24581-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Simon Guinot <simon.guinot@sequanux.org>,
 Tawfik Bayouk <tawfik@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Let's make pxa_ecc_init() return a negative errno on error or zero
if succesful, which is standard kernel practice. Also, report the
selected ECC strength and step size, which is important information.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 940e6c7..3b66a64 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1354,7 +1354,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->mode = NAND_ECC_HW;
 		ecc->size = 512;
 		ecc->strength = 1;
-		return 1;
 
 	} else if (strength == 1 && ecc_stepsize == 512 && page_size == 512) {
 		info->chunk_size = 512;
@@ -1363,7 +1362,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->mode = NAND_ECC_HW;
 		ecc->size = 512;
 		ecc->strength = 1;
-		return 1;
 
 	/*
 	 * Required ECC: 4-bit correction per 512 bytes
@@ -1378,7 +1376,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->size = info->chunk_size;
 		ecc->layout = &ecc_layout_2KB_bch4bit;
 		ecc->strength = 16;
-		return 1;
 
 	} else if (strength == 4 && ecc_stepsize == 512 && page_size == 4096) {
 		info->ecc_bch = 1;
@@ -1389,7 +1386,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->size = info->chunk_size;
 		ecc->layout = &ecc_layout_4KB_bch4bit;
 		ecc->strength = 16;
-		return 1;
 
 	/*
 	 * Required ECC: 8-bit correction per 512 bytes
@@ -1404,8 +1400,15 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->size = info->chunk_size;
 		ecc->layout = &ecc_layout_4KB_bch8bit;
 		ecc->strength = 16;
-		return 1;
+	} else {
+		dev_err(&info->pdev->dev,
+			"ECC strength %d at page size %d is not supported\n",
+			strength, page_size);
+		return -ENODEV;
 	}
+
+	dev_info(&info->pdev->dev, "ECC strength %d, ECC step size %d\n",
+		 ecc->strength, ecc->size);
 	return 0;
 }
 
@@ -1527,12 +1530,8 @@ KEEP_CONFIG:
 
 	ret = pxa_ecc_init(info, &chip->ecc, ecc_strength,
 			   ecc_step, mtd->writesize);
-	if (!ret) {
-		dev_err(&info->pdev->dev,
-			"ECC strength %d at page size %d is not supported\n",
-			ecc_strength, mtd->writesize);
-		return -ENODEV;
-	}
+	if (ret)
+		return ret;
 
 	/* calculate addressing information */
 	if (mtd->writesize >= 2048)
-- 
1.9.1
