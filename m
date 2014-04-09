Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXliD-0001OF-DV
 for linux-mtd@lists.infradead.org; Wed, 09 Apr 2014 06:10:18 +0000
Received: by mail-pa0-f51.google.com with SMTP id kq14so2055814pab.24
 for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2014 23:09:53 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: EXPORT symbols which could be used by module
 drivers
Date: Tue,  8 Apr 2014 23:09:41 -0700
Message-Id: <1397023781-1103-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix errors like this:

    ERROR: "spi_nor_ids" [drivers/mtd/devices/m25p80.ko] undefined!
    ERROR: "spi_nor_scan" [drivers/mtd/devices/m25p80.ko] undefined!
    make[1]: *** [__modpost] Error 1
    make: *** [modules] Error 2

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Based on l2-mtd.git:spinor

 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f7c9e638623b..2c292f95142e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -584,6 +584,7 @@ const struct spi_device_id spi_nor_ids[] = {
 	{ "cat25128", CAT25_INFO(2048, 8, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
 	{ },
 };
+EXPORT_SYMBOL(spi_nor_ids);
 
 static const struct spi_device_id *spi_nor_read_id(struct spi_nor *nor)
 {
@@ -1081,6 +1082,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 				mtd->eraseregions[i].numblocks);
 	return 0;
 }
+EXPORT_SYMBOL(spi_nor_scan);
 
 const struct spi_device_id *spi_nor_match_id(char *name)
 {
@@ -1093,6 +1095,7 @@ const struct spi_device_id *spi_nor_match_id(char *name)
 	}
 	return NULL;
 }
+EXPORT_SYMBOL(spi_nor_match_id);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Huang Shijie <shijie8@gmail.com>");
-- 
1.8.3.2
