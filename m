Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TyPqa-0005sH-C1
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2013 16:40:17 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org
Subject: [PATCH 3/6] mtd: bcm47xxnflash: fix message
Date: Thu, 24 Jan 2013 17:39:56 +0100
Message-Id: <1359045599-1305-4-git-send-email-hauke@hauke-m.de>
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

This is not a serial flash driver, but a nand flash driver

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/bcm47xxnflash/main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/bcm47xxnflash/main.c b/drivers/mtd/nand/bcm47xxnflash/main.c
index 8363a9a..616b56a 100644
--- a/drivers/mtd/nand/bcm47xxnflash/main.c
+++ b/drivers/mtd/nand/bcm47xxnflash/main.c
@@ -94,7 +94,7 @@ static int __init bcm47xxnflash_init(void)
 	 */
 	err = platform_driver_probe(&bcm47xxnflash_driver, bcm47xxnflash_probe);
 	if (err)
-		pr_err("Failed to register serial flash driver: %d\n", err);
+		pr_err("Failed to register bcm47xx nand flash driver: %d\n", err);
 
 	return err;
 }
-- 
1.7.10.4
