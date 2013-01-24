Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TyPqe-0005to-Vo
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 16:40:22 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org
Subject: [PATCH 4/6] mtd: bcm47xxnflash: register this as normal driver
Date: Thu, 24 Jan 2013 17:39:57 +0100
Message-Id: <1359045599-1305-5-git-send-email-hauke@hauke-m.de>
In-Reply-To: <1359045599-1305-1-git-send-email-hauke@hauke-m.de>
References: <1359045599-1305-1-git-send-email-hauke@hauke-m.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, zajec5@gmail.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When platform_driver_probe() is used and no device is registered for
this driver -ENODEV is returned and and error message is shown. Not all
BCM47xx SoC have a nand flash chip controller and chip and for them an
error message was shown.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/bcm47xxnflash/main.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 616b56a..f674979 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -77,6 +77,7 @@ static int bcm47xxnflash_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver bcm47xxnflash_driver = {
+	.probe	= bcm47xxnflash_probe,
 	.remove = bcm47xxnflash_remove,
 	.driver = {
 		.name = "bcma_nflash",
@@ -88,11 +89,7 @@ static int __init bcm47xxnflash_init(void)
 {
 	int err;
 
-	/*
-	 * Platform device "bcma_nflash" exists on SoCs and is registered very
-	 * early, it won't be added during runtime (use platform_driver_probe).
-	 */
-	err = platform_driver_probe(&bcm47xxnflash_driver, bcm47xxnflash_probe);
+	err = platform_driver_register(&bcm47xxnflash_driver);
 	if (err)
 		pr_err("Failed to register bcm47xx nand flash driver: %d\n", err);
 
-- 
1.7.10.4
