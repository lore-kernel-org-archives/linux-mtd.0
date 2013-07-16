Received: from mail-pb0-x22f.google.com ([2607:f8b0:400e:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uyyed-0001cE-Ea
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2013 06:22:32 +0000
Received: by mail-pb0-f47.google.com with SMTP id rr13so336331pbb.6
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2013 23:22:07 -0700 (PDT)
From: wangyuhang <wangyuhang2014@gmail.com>
To: marex@denx.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH] m25p80: fix the malloc space without being freed when probe
 failed
Date: Tue, 16 Jul 2013 14:20:56 +0800
Message-Id: <1373955657-10363-1-git-send-email-wangyuhang2014@gmail.com>
Cc: wangyuhang <wangyuhang2014@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

space allocated can not be freed when probe failed, So we use
devm_kzalloc() to instead of kzalloc().
flash->fast_read is used without being initialized, here
move it to the certain position.

Signed-off-by: wangyuhang <wangyuhang2014@gmail.com>
---
 drivers/mtd/devices/m25p80.c |   13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5b6b072..70f3c54 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -955,15 +955,9 @@ static int m25p_probe(struct spi_device *spi)
 		}
 	}
 
-	flash = kzalloc(sizeof *flash, GFP_KERNEL);
+	flash = devm_kzalloc(&spi->dev, sizeof *flash, GFP_KERNEL);
 	if (!flash)
 		return -ENOMEM;
-	flash->command = kmalloc(MAX_CMD_SIZE + (flash->fast_read ? 1 : 0),
-					GFP_KERNEL);
-	if (!flash->command) {
-		kfree(flash);
-		return -ENOMEM;
-	}
 
 	flash->spi = spi;
 	mutex_init(&flash->lock);
@@ -1032,6 +1026,11 @@ static int m25p_probe(struct spi_device *spi)
 	flash->fast_read = true;
 #endif
 
+	flash->command = devm_kzalloc(&spi->dev,
+		MAX_CMD_SIZE + (flash->fast_read ? 1 : 0), GFP_KERNEL);
+	if (!flash->command)
+		return -ENOMEM;
+
 	if (info->addr_width)
 		flash->addr_width = info->addr_width;
 	else {
-- 
1.7.9.5
