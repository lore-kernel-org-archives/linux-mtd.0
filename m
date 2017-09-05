Received: from mail-pg0-x24a.google.com ([2607:f8b0:400e:c05::24a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dpKOD-00089s-Br
 for linux-mtd@lists.infradead.org; Tue, 05 Sep 2017 20:24:06 +0000
Received: by mail-pg0-x24a.google.com with SMTP id 6so7324293pgh.4
 for <linux-mtd@lists.infradead.org>; Tue, 05 Sep 2017 13:23:43 -0700 (PDT)
MIME-Version: 1.0
Date: Tue,  5 Sep 2017 13:23:39 -0700
Message-Id: <20170905202339.20732-1-wak@google.com>
Subject: [PATCH] mtd: powernv: Support MTD_NO_ERASE
From: "William A. Kennington III" <wak@google.com>
To: linux-mtd@lists.infradead.org
Cc: wak@google.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As of skiboot@ba99af9b149d02438347b055e6e7d6bd15e33551, we now support
adding a device tree entry which marks a flash device as not needing
erase. This patch adds support for setting MTD_NO_ERASE on powernvflash
devices which have the property no-erase.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 drivers/mtd/devices/powernv_flash.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index f5396f26ddb4..fab9f9121b4c 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -196,6 +196,8 @@ static int powernv_flash_set_driver_info(struct device *dev,
 	mtd->name = of_get_property(dev->of_node, "name", NULL);
 	mtd->type = MTD_NORFLASH;
 	mtd->flags = MTD_WRITEABLE;
+	if (of_property_read_bool(dev->of_node, "no-erase"))
+		mtd->flags |= MTD_NO_ERASE;
 	mtd->size = size;
 	mtd->erasesize = erase_size;
 	mtd->writebufsize = mtd->writesize = 1;
-- 
2.13.1
