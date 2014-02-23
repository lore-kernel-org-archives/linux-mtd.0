Received: from mail-ea0-x231.google.com ([2a00:1450:4013:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHXK2-0008BG-RQ
 for linux-mtd@lists.infradead.org; Sun, 23 Feb 2014 11:34:15 +0000
Received: by mail-ea0-f177.google.com with SMTP id h10so1112061eak.22
 for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2014 03:33:52 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC 1/3] Revert "mtd: bcm47xxnflash: Use module_platform_driver"
Date: Sun, 23 Feb 2014 12:33:41 +0100
Message-Id: <1393155221-7524-1-git-send-email-zajec5@gmail.com>
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

This reverts commit 994bbd0e91c0dfa4dcda9097b0716607aeec5470.

We're going to add support for more NAND flashes and the new ones are
not registered as platform devices. So we need our own init function.
---
 drivers/mtd/nand/bcm47xxnflash/main.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 1074459..52611ef 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -77,4 +77,22 @@ static struct platform_driver bcm47xxnflash_driver = {
 	},
 };
 
-module_platform_driver(bcm47xxnflash_driver);
+static int __init bcm47xxnflash_init(void)
+{
+	int err;
+
+	err = platform_driver_register(&bcm47xxnflash_driver);
+	if (err)
+		pr_err("Failed to register bcm47xx nand flash driver: %d\n",
+		       err);
+
+	return err;
+}
+
+static void __exit bcm47xxnflash_exit(void)
+{
+	platform_driver_unregister(&bcm47xxnflash_driver);
+}
+
+module_init(bcm47xxnflash_init);
+module_exit(bcm47xxnflash_exit);
-- 
1.8.4.5
