Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M5xtG-0006Y8-9a
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 08:08:13 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] plat_nand: add missing __devexit_p()
Date: Mon, 18 May 2009 04:08:01 -0400
Message-Id: <1242634081-16593-1-git-send-email-vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The remove function uses __devexit, so the .remove assignment needs
__devexit_p() to fix a build error with hotplug disabled.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/plat_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 86e1d08..28ffd4e 100644
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
1.6.3
