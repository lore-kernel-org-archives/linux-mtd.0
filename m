Received: from msr39.hinet.net ([168.95.4.139])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lw7aQ-00077U-OE
	for linux-mtd@lists.infradead.org; Tue, 21 Apr 2009 04:28:05 +0000
From: Thomas Chou <thomas@wytron.com.tw>
To: Nios2 development list <nios2-dev@sopc.et.ntust.edu.tw>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD][NAND] fix section error in plat_nand
Date: Tue, 21 Apr 2009 12:27:34 +0800
Message-Id: <1240288054-11396-1-git-send-email-thomas@wytron.com.tw>
Cc: Thomas Chou <thomas@wytron.com.tw>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With CONFIG_HOTPLUG=n, the following eror occurred during link:
local symbol 0: discarded in section `.devexit.text' from
drivers/built-in.o

It was caused by improper section reference. The __devexit_p()
should be added to the .remove function.

Signed-off-by: Thomas Chou <thomas@wytron.com.tw>
---
 drivers/mtd/nand/plat_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 75f9f48..1b67619 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -128,7 +128,7 @@ static int __devexit plat_nand_remove(struct platform_device *pdev)
 
 static struct platform_driver plat_nand_driver = {
 	.probe		= plat_nand_probe,
-	.remove		= plat_nand_remove,
+	.remove		= __devexit_p(plat_nand_remove),
 	.driver		= {
 		.name	= "gen_nand",
 		.owner	= THIS_MODULE,
-- 
1.6.0.6
