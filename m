Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXPVb-0006A1-Ao
 for linux-mtd@lists.infradead.org; Mon, 25 Jun 2018 11:18:12 +0000
Received: by mail-wm0-x244.google.com with SMTP id x6-v6so8777161wmc.3
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jun 2018 04:18:00 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Robert Marko <robimarko@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: Add Winbond w25q128jv support
Date: Mon, 25 Jun 2018 13:17:48 +0200
Message-Id: <20180625111748.5108-1-robimarko@gmail.com>
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

Changes in v2:
	- Correct the title
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
