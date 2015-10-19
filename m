Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZoGAg-0005VK-SJ
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2015 19:32:39 +0000
Received: by padhk11 with SMTP id hk11so38135916pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 19 Oct 2015 12:32:18 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Frans Klaver <fransklaver@gmail.com>
Subject: [PATCH] mtd: maps: rbtx4939-flash: fix compile error
Date: Mon, 19 Oct 2015 12:31:59 -0700
Message-Id: <1445283119-96697-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We got the syntax wrong here. Compile tested this time!

Error:

   drivers/mtd/maps/rbtx4939-flash.c: In function 'rbtx4939_flash_probe':
>> drivers/mtd/maps/rbtx4939-flash.c:99:11: error: request for member 'dev' in something not a structure or union
     info->mtd.dev.parent = &dev->dev;
              ^

Fixes: 9aa7e50276c1 ("mtd: maps: rbtx4939-flash: show parent device in sysfs")
Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/maps/rbtx4939-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 18ee361455a2..3a06ecfc55ff 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -96,7 +96,7 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
 		err = -ENXIO;
 		goto err_out;
 	}
-	info->mtd.dev.parent = &dev->dev;
+	info->mtd->dev.parent = &dev->dev;
 	err = mtd_device_parse_register(info->mtd, NULL, NULL, pdata->parts,
 					pdata->nr_parts);
 
-- 
2.6.0.rc2.230.g3dd15c0
