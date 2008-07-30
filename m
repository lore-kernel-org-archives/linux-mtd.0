Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOHS5-0000pz-3A
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 19:35:13 +0000
Message-Id: <200807301935.m6UJZ2nk012300@imap1.linux-foundation.org>
Subject: [patch 08/13] Blackfin NFC Driver: add proper devinit/devexit
	markings to probe/remove functions
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:35:02 -0700
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	cooloney@kernel.org, vapier.adi@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/bf5xx_nand.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -puN drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-add-proper-devinit-devexit-markings-to-probe-remove-functions drivers/mtd/nand/bf5xx_nand.c
--- a/drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-add-proper-devinit-devexit-markings-to-probe-remove-functions
+++ a/drivers/mtd/nand/bf5xx_nand.c
@@ -640,7 +640,7 @@ static int bf5xx_nand_add_partition(stru
 #endif
 }
 
-static int bf5xx_nand_remove(struct platform_device *pdev)
+static int __devexit bf5xx_nand_remove(struct platform_device *pdev)
 {
 	struct bf5xx_nand_info *info = to_nand_info(pdev);
 	struct mtd_info *mtd = NULL;
@@ -673,7 +673,7 @@ static int bf5xx_nand_remove(struct plat
  * it can allocate all necessary resources then calls the
  * nand layer to look for devices
  */
-static int bf5xx_nand_probe(struct platform_device *pdev)
+static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 {
 	struct bf5xx_nand_platform *plat = to_nand_plat(pdev);
 	struct bf5xx_nand_info *info = NULL;
@@ -815,7 +815,7 @@ static int bf5xx_nand_resume(struct plat
 /* driver device registration */
 static struct platform_driver bf5xx_nand_driver = {
 	.probe		= bf5xx_nand_probe,
-	.remove		= bf5xx_nand_remove,
+	.remove		= __devexit_p(bf5xx_nand_remove),
 	.suspend	= bf5xx_nand_suspend,
 	.resume		= bf5xx_nand_resume,
 	.driver		= {
_
