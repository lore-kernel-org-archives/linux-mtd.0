Received: from mail-qk0-x22c.google.com ([2607:f8b0:400d:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZUIZ-0000IM-OF
 for linux-mtd@lists.infradead.org; Sat, 27 Feb 2016 02:08:00 +0000
Received: by mail-qk0-x22c.google.com with SMTP id o6so38916262qkc.2
 for <linux-mtd@lists.infradead.org>; Fri, 26 Feb 2016 18:07:39 -0800 (PST)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH] mtd: spi-nor: update flags for n25q128a
Date: Fri, 26 Feb 2016 23:07:16 -0300
Message-Id: <1456538836-27449-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron n25q128a support subsector (4K) erase, and the hardware
protection TB (Top/Bottom) bit. Let's update its flags.

Tested on n25q128a13.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1348a3247472..37f661bd14f3 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -864,8 +864,12 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
-	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SPI_NOR_QUAD_READ) },
+	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256,
+		 SECT_4K | SPI_NOR_QUAD_READ |
+		 SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256,
+		 SECT_4K | SPI_NOR_QUAD_READ |
+		 SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-- 
2.7.0
