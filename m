Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBWQp-0002GJ-4y
 for linux-mtd@lists.infradead.org; Sun, 27 Jul 2014 21:56:40 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Huang Shijie <b32955@freescale.com>
Subject: [PATCH] mtd: spi-nor: add support for Micron M25PX80
Date: Sun, 27 Jul 2014 23:56:08 +0200
Message-Id: <1406498168-13379-1-git-send-email-thomas.petazzoni@free-electrons.com>
Cc: Gregory Clement <gregory.clement@free-electrons.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds the support in the spi-nor driver of the Micron
M25PX80 flash, a 8 Mbit SPI flash from Micron.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c713c86..8d7df6c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -562,6 +562,7 @@ const struct spi_device_id spi_nor_ids[] = {
 	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64, SECT_4K) },
 	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
 	{ "m25px64",    INFO(0x207117,  0, 64 * 1024, 128, 0) },
+	{ "m25px80",    INFO(0x207114,  0, 64 * 1024, 16, 0) },
 
 	/* Winbond -- w25x "blocks" are 64K, "sectors" are 4KiB */
 	{ "w25x10", INFO(0xef3011, 0, 64 * 1024,  2,  SECT_4K) },
-- 
2.0.0
