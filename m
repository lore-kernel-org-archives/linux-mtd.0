Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOfVg-0004Dn-2y
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 05:52:49 +0000
Received: by mail-pa0-x242.google.com with SMTP id gi1so1444895pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2016 21:52:27 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, djkurtz@chromium.org
Subject: [PATCH 8/8] mtd: spi-nor: support lock/unlock for a few Winbond chips
Date: Wed, 27 Jan 2016 21:51:47 -0800
Message-Id: <1453960307-10181-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These are recent Winbond models that are known to have lock/unlock
support via writing the Status Register, and that also support the TB
(Top/Bottom) protection bit.

Tested on w25q32dw.

[Note on style: these entries are getting pretty long lines, so I picked
a style that seems reasonable for splitting up the flags separate from
the other mostly-similar fields.]

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c |   18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5e84e3c543aa..cd3908e26712 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -942,11 +942,23 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{
+		"w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{
+		"w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
-- 
1.7.9.5
