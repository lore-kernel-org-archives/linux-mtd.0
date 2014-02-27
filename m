Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ4Wy-0005Ky-SA
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2014 17:13:57 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: nand: pxa3xx: Print actual ECC strength in error
 message
Date: Thu, 27 Feb 2014 14:13:26 -0300
Message-Id: <1393521206-4623-3-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1393521206-4623-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1393521206-4623-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The actual ECC strength used to select the ECC scheme is 'ecc_strength'.
Use it in the error message.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 1e136a6..7588fe2 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1530,7 +1530,7 @@ KEEP_CONFIG:
 	if (!ret) {
 		dev_err(&info->pdev->dev,
 			"ECC strength %d at page size %d is not supported\n",
-			chip->ecc_strength_ds, mtd->writesize);
+			ecc_strength, mtd->writesize);
 		return -ENODEV;
 	}
 
-- 
1.8.1.5
