Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zljn6-0005Ua-O3
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2015 20:33:53 +0000
Received: by pacex6 with SMTP id ex6so8616397pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 13:33:32 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 1/2] mtd: pxa3xx_nand: don't duplicate MTD suspend/resume
Date: Mon, 12 Oct 2015 13:33:11 -0700
Message-Id: <1444681992-4208-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd_{suspend,resume}() get called from mtdcore in a class suspend/resume
callback. We don't need to call them again here. In practice, this would
actually work OK, as nand_base actually handles nesting OK -- it just
might print warnings.

Untested, but there are few (no?) users of PM for this driver AFAIK.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 232c7074624a..cce5a32eef60 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1892,32 +1892,19 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
-	struct pxa3xx_nand_platform_data *pdata;
-	struct mtd_info *mtd;
-	int cs;
 
-	pdata = dev_get_platdata(&pdev->dev);
 	if (info->state) {
 		dev_err(&pdev->dev, "driver busy, state = %d\n", info->state);
 		return -EAGAIN;
 	}
 
-	for (cs = 0; cs < pdata->num_cs; cs++) {
-		mtd = info->host[cs]->mtd;
-		mtd_suspend(mtd);
-	}
-
 	return 0;
 }
 
 static int pxa3xx_nand_resume(struct platform_device *pdev)
 {
 	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
-	struct pxa3xx_nand_platform_data *pdata;
-	struct mtd_info *mtd;
-	int cs;
 
-	pdata = dev_get_platdata(&pdev->dev);
 	/* We don't want to handle interrupt without calling mtd routine */
 	disable_int(info, NDCR_INT_MASK);
 
@@ -1935,10 +1922,6 @@ static int pxa3xx_nand_resume(struct platform_device *pdev)
 	 * all status before resume
 	 */
 	nand_writel(info, NDSR, NDSR_MASK);
-	for (cs = 0; cs < pdata->num_cs; cs++) {
-		mtd = info->host[cs]->mtd;
-		mtd_resume(mtd);
-	}
 
 	return 0;
 }
-- 
2.6.0.rc2.230.g3dd15c0
