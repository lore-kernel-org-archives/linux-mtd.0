Received: from po-out-1718.google.com ([72.14.252.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KMzkp-0006yv-3F
	for linux-mtd@lists.infradead.org; Sun, 27 Jul 2008 06:29:15 +0000
Received: by po-out-1718.google.com with SMTP id b23so7863214poe.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 26 Jul 2008 23:29:14 -0700 (PDT)
From: Bryan Wu <cooloney@kernel.org>
To: dwmw2@infradead.org,
	akpm@linux-foundation.org
Subject: [PATCH 4/7] [MTD] Blackfin NFC Driver: add proper devinit/devexit
	markings to probe/remove functions
Date: Sun, 27 Jul 2008 14:27:56 +0800
Message-Id: <1217140079-20014-5-git-send-email-cooloney@kernel.org>
In-Reply-To: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
References: <1217140079-20014-1-git-send-email-cooloney@kernel.org>
Sender: Bryan Wu <cooloney.lkml@gmail.com>
Cc: Bryan Wu <cooloney@kernel.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>
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
---
 drivers/mtd/nand/bf5xx_nand.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 3555f6b..e259a7b 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -640,7 +640,7 @@ static int bf5xx_nand_add_partition(struct bf5xx_nand_info *info)
 #endif
 }
 
-static int bf5xx_nand_remove(struct platform_device *pdev)
+static int __devexit bf5xx_nand_remove(struct platform_device *pdev)
 {
 	struct bf5xx_nand_info *info = to_nand_info(pdev);
 	struct mtd_info *mtd = NULL;
@@ -673,7 +673,7 @@ static int bf5xx_nand_remove(struct platform_device *pdev)
  * it can allocate all necessary resources then calls the
  * nand layer to look for devices
  */
-static int bf5xx_nand_probe(struct platform_device *pdev)
+static int __devinit bf5xx_nand_probe(struct platform_device *pdev)
 {
 	struct bf5xx_nand_platform *plat = to_nand_plat(pdev);
 	struct bf5xx_nand_info *info = NULL;
@@ -815,7 +815,7 @@ static int bf5xx_nand_resume(struct platform_device *dev)
 /* driver device registration */
 static struct platform_driver bf5xx_nand_driver = {
 	.probe		= bf5xx_nand_probe,
-	.remove		= bf5xx_nand_remove,
+	.remove		= __devexit_p(bf5xx_nand_remove),
 	.suspend	= bf5xx_nand_suspend,
 	.resume		= bf5xx_nand_resume,
 	.driver		= {
-- 
1.5.6
