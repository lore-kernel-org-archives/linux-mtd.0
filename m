Received: from mail-pa0-f68.google.com ([209.85.220.68])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bXDqM-0000Wp-Fk
 for linux-mtd@lists.infradead.org; Tue, 09 Aug 2016 20:41:47 +0000
Received: by mail-pa0-f68.google.com with SMTP id vy10so1475925pac.0
 for <linux-mtd@lists.infradead.org>; Tue, 09 Aug 2016 13:41:26 -0700 (PDT)
From: Jagan Teki <jteki@openedev.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Jagan Teki <jteki@openedev.com>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 6/6] mtd: spi-nor: Enable QPP for winbond parts
Date: Wed, 10 Aug 2016 02:10:25 +0530
Message-Id: <1470775225-19787-6-git-send-email-jteki@openedev.com>
In-Reply-To: <1470775225-19787-1-git-send-email-jteki@openedev.com>
References: <1470775225-19787-1-git-send-email-jteki@openedev.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Enable QPP support for winbond flash parts.

Cc: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Jagan Teki <jteki@openedev.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 66d6e0b..838f6ea 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -981,28 +981,28 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "w25x80", INFO(0xef3014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_QUAD_WRITE) },
 	{
 		"w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			SPI_NOR_QUAD_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_QUAD_WRITE) },
 	{
 		"w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			SPI_NOR_QUAD_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{
 		"w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			SPI_NOR_QUAD_WRITE | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
-	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
-	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
+	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K | SPI_NOR_QUAD_WRITE) },
+	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K | SPI_NOR_QUAD_WRITE) },
+	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_QUAD_WRITE) },
+	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_QUAD_WRITE) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
 	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
-- 
2.7.4
