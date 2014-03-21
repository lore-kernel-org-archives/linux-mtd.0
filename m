Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQxji-0001RS-6X
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 11:35:43 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 2/4] mtd: nand: pxa3xx: Clean pxa_ecc_init() error handling
Date: Fri, 21 Mar 2014 08:34:48 -0300
Message-Id: <1395401690-25221-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1395401690-25221-1-git-send-email-ezequiel.garcia@free-electrons.com>
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

Let's make pxa_ecc_init() return a negative errno on error or zero
if succesful, which is standard kernel practice. Also, report the
selected ECC strength and step size, which is important information.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 92b3439..cf7d757 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1353,7 +1353,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->mode = NAND_ECC_HW;
 		ecc->size = 512;
 		ecc->strength = 1;
-		return 1;
 
 	} else if (strength == 1 && page_size == 512) {
 		info->chunk_size = 512;
@@ -1362,7 +1361,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->mode = NAND_ECC_HW;
 		ecc->size = 512;
 		ecc->strength = 1;
-		return 1;
 
 	/*
 	 * Required ECC: 4-bit correction per 512 bytes
@@ -1388,7 +1386,6 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
 		ecc->size = info->chunk_size;
 		ecc->layout = &ecc_layout_4KB_bch4bit;
 		ecc->strength = 16;
-		return 1;
 
 	/*
 	 * Required ECC: 8-bit correction per 512 bytes
@@ -1403,8 +1400,15 @@ static int pxa_ecc_init(struct pxa3xx_nand_info *info,
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
 
@@ -1526,12 +1530,8 @@ KEEP_CONFIG:
 
 	ret = pxa_ecc_init(info, &chip->ecc, (ecc_strength * 512) / ecc_step,
 			   mtd->writesize);
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
1.9.0
