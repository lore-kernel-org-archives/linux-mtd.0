Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2GOf-0004gA-6d
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 07:23:22 +0000
Received: by mail-ee0-f49.google.com with SMTP id d4so2896917eek.22
 for <linux-mtd@lists.infradead.org>; Sun, 03 Feb 2013 23:23:18 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH V2] mtd: bcm47xxsflash: adjust names of bus-specific functions
Date: Mon,  4 Feb 2013 08:23:08 +0100
Message-Id: <1359962588-25866-1-git-send-email-zajec5@gmail.com>
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


Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
V2: rebased on top of
[PATCH 0/6] mtd: bcm47xx: some fixes for the flash drivers
(plus two extra comments)
---
 drivers/mtd/devices/bcm47xxsflash.c |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/bcm47xxsflash.c b/drivers/mtd/devices/bcm47xxsflash.c
index 729ca5f..9526628 100644
--- a/drivers/mtd/devices/bcm47xxsflash.c
+++ b/drivers/mtd/devices/bcm47xxsflash.c
@@ -44,7 +44,11 @@ static void bcm47xxsflash_fill_mtd(struct bcm47xxsflash *b47s)
 	mtd->writebufsize = mtd->writesize = 1;
 }
 
-static int bcm47xxsflash_probe(struct platform_device *pdev)
+/**************************************************
+ * BCMA
+ **************************************************/
+
+static int bcm47xxsflash_bcma_probe(struct platform_device *pdev)
 {
 	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
 	struct bcm47xxsflash *b47s;
@@ -77,7 +81,7 @@ out:
 	return err;
 }
 
-static int bcm47xxsflash_remove(struct platform_device *pdev)
+static int bcm47xxsflash_bcma_remove(struct platform_device *pdev)
 {
 	struct bcma_sflash *sflash = dev_get_platdata(&pdev->dev);
 	struct bcm47xxsflash *b47s = sflash->priv;
@@ -89,14 +93,18 @@ static int bcm47xxsflash_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver bcma_sflash_driver = {
-	.probe	= bcm47xxsflash_probe,
-	.remove = bcm47xxsflash_remove,
+	.probe	= bcm47xxsflash_bcma_probe,
+	.remove = bcm47xxsflash_bcma_remove,
 	.driver = {
 		.name = "bcma_sflash",
 		.owner = THIS_MODULE,
 	},
 };
 
+/**************************************************
+ * Init
+ **************************************************/
+
 static int __init bcm47xxsflash_init(void)
 {
 	int err;
-- 
1.7.10.4
