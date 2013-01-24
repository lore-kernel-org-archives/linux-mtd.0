Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TyPqX-0005qv-L9
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 16:40:14 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org
Subject: [PATCH 2/6] mtd: bcm47xxsflash: register this as normal driver
Date: Thu, 24 Jan 2013 17:39:55 +0100
Message-Id: <1359045599-1305-3-git-send-email-hauke@hauke-m.de>
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
BCM47xx SoC have a serial flash chip controller and chip and for them
an error message was shown.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/devices/bcm47xxsflash.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 61a45cb..729ca5f 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -89,6 +89,7 @@ static int bcm47xxsflash_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver bcma_sflash_driver = {
+	.probe	= bcm47xxsflash_probe,
 	.remove = bcm47xxsflash_remove,
 	.driver = {
 		.name = "bcma_sflash",
@@ -100,7 +101,7 @@ static int __init bcm47xxsflash_init(void)
 {
 	int err;
 
-	err = platform_driver_probe(&bcma_sflash_driver, bcm47xxsflash_probe);
+	err = platform_driver_register(&bcma_sflash_driver);
 	if (err)
 		pr_err("Failed to register BCMA serial flash driver: %d\n",
 		       err);
-- 
1.7.10.4
