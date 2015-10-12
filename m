Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZljnA-0005Vz-6D
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2015 20:33:57 +0000
Received: by padhy16 with SMTP id hy16so162479658pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 13:33:35 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] mtd: pxa3xx_nand: switch to device PM
Date: Mon, 12 Oct 2015 13:33:12 -0700
Message-Id: <1444681992-4208-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
References: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The old PM model is deprecated. This is equivalent.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index cce5a32eef60..e074a3b406f6 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1889,21 +1889,21 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM
-static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_t state)
+static int pxa3xx_nand_suspend(struct device *dev)
 {
-	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
+	struct pxa3xx_nand_info *info = dev_get_drvdata(dev);
 
 	if (info->state) {
-		dev_err(&pdev->dev, "driver busy, state = %d\n", info->state);
+		dev_err(dev, "driver busy, state = %d\n", info->state);
 		return -EAGAIN;
 	}
 
 	return 0;
 }
 
-static int pxa3xx_nand_resume(struct platform_device *pdev)
+static int pxa3xx_nand_resume(struct device *dev)
 {
-	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
+	struct pxa3xx_nand_info *info = dev_get_drvdata(dev);
 
 	/* We don't want to handle interrupt without calling mtd routine */
 	disable_int(info, NDCR_INT_MASK);
@@ -1934,11 +1934,13 @@ static struct platform_driver pxa3xx_nand_driver = {
 	.driver = {
 		.name	= "pxa3xx-nand",
 		.of_match_table = pxa3xx_nand_dt_ids,
+		.pm = {
+			.suspend	= pxa3xx_nand_suspend,
+			.resume		= pxa3xx_nand_resume,
+		},
 	},
 	.probe		= pxa3xx_nand_probe,
 	.remove		= pxa3xx_nand_remove,
-	.suspend	= pxa3xx_nand_suspend,
-	.resume		= pxa3xx_nand_resume,
 };
 
 module_platform_driver(pxa3xx_nand_driver);
-- 
2.6.0.rc2.230.g3dd15c0
