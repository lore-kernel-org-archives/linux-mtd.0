Received: from we-in-x022c.1e100.net ([2a00:1450:400c:c03::22c]
 helo=mail-we0-x22c.google.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tzlur-0006nK-A8
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 10:26:18 +0000
Received: by mail-we0-f172.google.com with SMTP id x10so1412117wey.3
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2013 02:26:14 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH V2 4/6] mtd: bcm47xxnflash: register this as normal driver
Date: Mon, 28 Jan 2013 11:25:48 +0100
Message-Id: <1359368750-19763-4-git-send-email-zajec5@gmail.com>
In-Reply-To: <1359368750-19763-3-git-send-email-zajec5@gmail.com>
References: <1359368750-19763-3-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hauke Mehrtens <hauke@hauke-m.de>

When platform_driver_probe() is used and no device is registered for
this driver -ENODEV is returned and and error message is shown. Not all
BCM47xx SoC have a nand flash chip controller and chip and for them an
error message was shown.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
V2: rebase after change in V2 of 3/6
---
 drivers/mtd/nand/bcm47xxnflash/main.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 3e20762..a52acdc 100644
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
 		pr_err("Failed to register bcm47xx nand flash driver: %d\n",
 		       err);
-- 
1.7.10.4
