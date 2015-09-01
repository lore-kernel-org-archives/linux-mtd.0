Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWriC-00030d-Jr
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 19:59:21 +0000
Received: by pacfv12 with SMTP id fv12so5916425pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 12:59:02 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 08/10] mtd: spi-nor: add DUAL_READ for w25q{32,64}dw
Date: Tue,  1 Sep 2015 12:57:13 -0700
Message-Id: <1441137435-52862-9-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These flash support dual and quad read. Tested dual read on the 32 Mbit
version.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c4fb1205f1d3..c05ee8340e5e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -794,10 +794,10 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "w25x16", INFO(0xef3015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "w25x32", INFO(0xef3016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "w25q32", INFO(0xef4016, 0, 64 * 1024,  64, SECT_4K) },
-	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "w25q32dw", INFO(0xef6016, 0, 64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SECT_4K) },
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
-	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "w25q64dw", INFO(0xef6017, 0, 64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SECT_4K) },
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
-- 
2.5.0.457.gab17608
