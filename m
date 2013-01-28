Received: from mail-wg0-f45.google.com ([74.125.82.45])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tzlum-0006kZ-QV
 for linux-mtd@lists.infradead.org; Mon, 28 Jan 2013 10:26:13 +0000
Received: by mail-wg0-f45.google.com with SMTP id dq12so1571449wgb.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2013 02:26:09 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH V2 3/6] mtd: bcm47xxnflash: fix message
Date: Mon, 28 Jan 2013 11:25:47 +0100
Message-Id: <1359368750-19763-3-git-send-email-zajec5@gmail.com>
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

This is not a serial flash driver, but a nand flash driver

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
V2: break line to match 80 chars
---
 drivers/mtd/nand/bcm47xxnflash/main.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 8363a9a..3e20762 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -94,7 +94,8 @@ static int __init bcm47xxnflash_init(void)
 	 */
 	err = platform_driver_probe(&bcm47xxnflash_driver, bcm47xxnflash_probe);
 	if (err)
-		pr_err("Failed to register serial flash driver: %d\n", err);
+		pr_err("Failed to register bcm47xx nand flash driver: %d\n",
+		       err);
 
 	return err;
 }
-- 
1.7.10.4
