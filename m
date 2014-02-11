Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDAuQ-0006jW-4A
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 10:49:47 +0000
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: m25p80: set erasesize to 1 if device doesn't need erase
Date: Tue, 11 Feb 2014 11:49:09 +0100
Message-Id: <1392115749-5940-1-git-send-email-m.grzeschik@pengutronix.de>
Cc: marex@denx.de, computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver currently set eraseblocksize to sector_size if the device has
the SECT_4K{,_PMC} flag not set. The mtdpart layer will check the
partitions to be bound to eraseblock size bounderies. Devices which do
not need to be erased before use, like e.g. mrams, this will always
trigger if the partition is smaller then the sectorsize. This patch
fixes this by setting the eraseblocksize 1 for such devices.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/mtd/devices/m25p80.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index ad1913909702..c7bdce75f574 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -1203,8 +1203,10 @@ static int m25p_probe(struct spi_device *spi)
 		flash->mtd.erasesize = info->sector_size;
 	}
 
-	if (info->flags & M25P_NO_ERASE)
+	if (info->flags & M25P_NO_ERASE) {
 		flash->mtd.flags |= MTD_NO_ERASE;
+		flash->mtd.erasesize = 1;
+	}
 
 	ppdata.of_node = spi->dev.of_node;
 	flash->mtd.dev.parent = &spi->dev;
-- 
1.8.5.3
