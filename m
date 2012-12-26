Received: from mail-ea0-f178.google.com ([209.85.215.178])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TnqVG-0006wv-Cq
 for linux-mtd@lists.infradead.org; Wed, 26 Dec 2012 12:54:35 +0000
Received: by mail-ea0-f178.google.com with SMTP id k11so3596340eaa.9
 for <linux-mtd@lists.infradead.org>; Wed, 26 Dec 2012 04:54:31 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: bcm47xxsflash: adjust names of bus-specific functions
Date: Wed, 26 Dec 2012 13:54:26 +0100
Message-Id: <1356526466-27360-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is needed to add clean support for other buses (like SSB) in the
future.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/devices/bcm47xxsflash.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 4714584..f293682 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -40,7 +40,7 @@ static void bcm47xxsflash_fill_mtd(struct bcma_sflash *sflash,
 	mtd->writebufsize = mtd->writesize = 1;
 }
 
-static int bcm47xxsflash_probe(struct platform_device *pdev)
+static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 {
 	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
 	int err;
@@ -66,7 +66,7 @@ out:
 	return err;
 }
 
-static int bcm47xxsflash_remove(struct platform_device *pdev)
+static int bcm47xxsflash_bcma_remove(struct platform_device *pdev)
 {
 	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
 
@@ -77,7 +77,7 @@ static int bcm47xxsflash_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver bcma_sflash_driver = {
-	.remove = bcm47xxsflash_remove,
+	.remove = bcm47xxsflash_bcma_remove,
 	.driver = {
 		.name = "bcma_sflash",
 		.owner = THIS_MODULE,
@@ -88,7 +88,8 @@ static int __init bcm47xxsflash_init(void)
 {
 	int err;
 
-	err = platform_driver_probe(&bcma_sflash_driver, bcm47xxsflash_probe);
+	err = platform_driver_probe(&bcma_sflash_driver,
+				    bcm47xxsflash_bcma_probe);
 	if (err)
 		pr_err("Failed to register BCMA serial flash driver: %d\n",
 		       err);
-- 
1.7.7
