Received: from mail-pf0-f194.google.com ([209.85.192.194])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bXDq9-0000WM-Vk
 for linux-mtd@lists.infradead.org; Tue, 09 Aug 2016 20:41:34 +0000
Received: by mail-pf0-f194.google.com with SMTP id i6so1443976pfe.0
 for <linux-mtd@lists.infradead.org>; Tue, 09 Aug 2016 13:41:16 -0700 (PDT)
From: Jagan Teki <jteki@openedev.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Jagan Teki <jteki@openedev.com>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 3/6] mtd: spi-nor: Enable QPP for macronix parts
Date: Wed, 10 Aug 2016 02:10:22 +0530
Message-Id: <1470775225-19787-3-git-send-email-jteki@openedev.com>
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

Enable QPP support for micronix flash parts.

Cc: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Jagan Teki <jteki@openedev.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f88bd7e..24a077d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -870,12 +870,12 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
-	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
-	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
-	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
-	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ) },
-	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
+	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SPI_NOR_QUAD_WRITE) },
+	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, SPI_NOR_QUAD_WRITE) },
+	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_QUAD_WRITE) },
+	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, SPI_NOR_QUAD_WRITE) },
+	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, SPI_NOR_QUAD_READ | SPI_NOR_QUAD_WRITE) },
+	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ | SPI_NOR_QUAD_WRITE) },
 
 	/* Micron */
 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
-- 
2.7.4
