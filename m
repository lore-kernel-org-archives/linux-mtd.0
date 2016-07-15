Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bO6XQ-0000jr-7a
 for linux-mtd@lists.infradead.org; Fri, 15 Jul 2016 17:04:32 +0000
Received: by mail-pf0-x22a.google.com with SMTP id p64so9326398pfb.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jul 2016 10:04:11 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: computersforpeace@gmail.com
Cc: ezequiel@vanguardiasur.com.ar, cyrille.pitchen@atmel.com,
 moritz.fischer.private@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Moritz Fischer <moritz.fischer@ettus.com>,
 David Woodhouse <dwmw2@infradead.org>, Jagan Teki <jteki@openedev.com>
Subject: [PATCH v2] mtd: spi-nor: Add support for N25Q016A
Date: Fri, 15 Jul 2016 10:03:48 -0700
Message-Id: <1468602228-25154-1-git-send-email-moritz.fischer@ettus.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds support in the spi-nor driver for the
N25Q016A, a 16Mbit SPI NOR flash from Micron.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Jagan Teki <jteki@openedev.com>

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c52e455..33fd27d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -861,6 +861,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
 	/* Micron */
+	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
 	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
-- 
2.7.4
