Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTHdU-0003qN-EA
 for linux-mtd@lists.infradead.org; Sun, 14 Sep 2014 21:47:08 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Subject: [PATCH] mtd: spi-nor: add support for the Winbond W25X05 flash
Date: Sun, 14 Sep 2014 23:46:41 +0200
Message-Id: <1410731201-27521-1-git-send-email-hauke@hauke-m.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 Gabor Juhos <juhosg@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 03e0ab8..7a08076 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -614,6 +614,7 @@ const struct spi_device_id spi_nor_ids[] = {
 	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16, 0) },
 
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
+	{ "w25x05", INFO(0xef3010, 0, 64 * 1024,  1,  SECT_4K) },
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
 	{ "w25x20", INFO(0xef3012, 0, 64 * 1024,  4,  SECT_4K) },
 	{ "w25x40", INFO(0xef3013, 0, 64 * 1024,  8,  SECT_4K) },
-- 
1.9.1
