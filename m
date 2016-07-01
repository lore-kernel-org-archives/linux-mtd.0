Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bJ6sb-0006Wr-2T
 for linux-mtd@lists.infradead.org; Fri, 01 Jul 2016 22:25:46 +0000
Received: by mail-pf0-x243.google.com with SMTP id c74so10954979pfb.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Jul 2016 15:25:24 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] mtd: spi-nor: support dual, quad, and WP for Gigadevice
Date: Fri,  1 Jul 2016 15:25:16 -0700
Message-Id: <1467411916-110528-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gigadevice flash support BP{0,1,2,3,4} bits, where BP3 means the same as
the existing supported TB (Top/Bottom), and BP4 means the same as the
not-yet-supported 4K bit used on other flash (e.g., Winbond). Let's
support lock/unlock with the same feature flags as w25q32dw/w25q64dw.

Tested on gd25lq64c, but I checked datasheets for the other 3, to make
sure.

While I was at it, I noticed that these all support dual and quad as
well. I noted them, but can't test them at the moment, since my test
system only supports standard 1x SPI.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9551e41699c8..aa4d76fff70b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -870,10 +870,26 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) },
 
 	/* GigaDevice */
-	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "gd25q128", INFO(0xc84018, 0, 64 * 1024, 256, SECT_4K) },
+	{
+		"gd25q32", INFO(0xc84016, 0, 64 * 1024,  64,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25q64", INFO(0xc84017, 0, 64 * 1024, 128,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25q128", INFO(0xc84018, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
-- 
2.8.0.rc3.226.g39d4020
