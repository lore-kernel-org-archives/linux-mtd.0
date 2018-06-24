Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXBy7-0000B6-FO
 for linux-mtd@lists.infradead.org; Sun, 24 Jun 2018 20:50:48 +0000
Received: by mail-wr0-x244.google.com with SMTP id e18-v6so11561144wrs.5
 for <linux-mtd@lists.infradead.org>; Sun, 24 Jun 2018 13:50:32 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH] mtd: spi-nor: Add Winbond w25q32jv support
Date: Sun, 24 Jun 2018 22:50:20 +0200
Message-Id: <20180624205020.20493-1-robimarko@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Datasheet:
http://www.winbond.com/resource-files/w25q128jv%20revf%2003272018%20plus.pdf

Testing done on Mikrotik Routerboard  wAP R board.
It does not support Dual or Quad modes.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d9c368c44194..3501dddc3167 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1239,6 +1239,11 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"w25q128jv", INFO(0xef7018, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
-- 
2.17.1
