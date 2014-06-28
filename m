Received: from mv-drv-hcb004.ocn.ad.jp ([118.23.109.134])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0u8R-0001ja-4k
 for linux-mtd@lists.infradead.org; Sat, 28 Jun 2014 15:01:48 +0000
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: maps: rbtx4939-flash: delete an unused variable in
 rbtx4939_flash_remove
Date: Sun, 29 Jun 2014 00:01:18 +0900
Message-Id: <1403967678-4216-1-git-send-email-anemo@mba.ocn.ne.jp>
Cc: dwmw2@infradead.org, ralf@linux-mips.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/maps/rbtx4939-flash.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 146b604..a84fdfb 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -35,8 +35,6 @@ static int rbtx4939_flash_remove(struct platform_device *dev)
 		return 0;
 
 	if (info->mtd) {
-		struct rbtx4939_flash_data *pdata = dev_get_platdata(&dev->dev);
-
 		mtd_device_unregister(info->mtd);
 		map_destroy(info->mtd);
 	}
-- 
1.7.9.5
