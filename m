Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zd3qA-0000WA-Av
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 22:09:10 +0000
Received: by pacex6 with SMTP id ex6so61519735pac.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Sep 2015 15:08:49 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Furquan Shaikh <furquan@google.com>,
 Stephen Barber <smbarber@chromium.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: [PATCH] mtd: spi-nor: add support for w25q128fw
Date: Fri, 18 Sep 2015 15:08:14 -0700
Message-Id: <1442614094-38680-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tested only with single I/O, but the datasheet says it supports dual and
quad.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7defce09ab9a..9f32f9f3fca1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -717,6 +717,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "w25q128fw", INFO(0xef6018, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
-- 
2.6.0.rc0.131.gf624c3d
