Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6r3L-00045U-3O
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 02:33:55 +0000
Received: by pfnn128 with SMTP id n128so39729383pfn.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 18:33:34 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>,
 Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH] mtd: brcmnand: defer to devm_ioremap_resource() for error
 checking
Date: Wed,  9 Dec 2015 18:33:17 -0800
Message-Id: <1449714797-27492-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

devm_ioremap_resource() does error checking on the 'res' argument, so
drop the error check in bcm6368_nand.c.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Simon Arlott <simon@fire.lp0.eu>
---
Compile tested only

 drivers/mtd/nand/brcmnand/bcm6368_nand.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/brcmnand/bcm6368_nand.c b/drivers/mtd/nand/brcmnand/bcm6368_nand.c
index 7f5359be24f2..34c91b0e1e69 100644
--- a/drivers/mtd/nand/brcmnand/bcm6368_nand.c
+++ b/drivers/mtd/nand/brcmnand/bcm6368_nand.c
@@ -105,9 +105,6 @@ static int bcm6368_nand_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev,
 		IORESOURCE_MEM, "nand-int-base");
-	if (!res)
-		return -EINVAL;
-
 	priv->base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
-- 
2.6.0.rc2.230.g3dd15c0
