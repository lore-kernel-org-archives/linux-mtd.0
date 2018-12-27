Received: from smtp1.guifi.net ([2a00:1508:1000::6d45:935]
 helo=smtp1.elserrat.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcXDA-0002KQ-JU
 for linux-mtd@lists.infradead.org; Thu, 27 Dec 2018 15:04:40 +0000
From: Roger Pueyo Centelles <roger.pueyo@guifi.net>
To: linux-mtd@lists.infradead.org
Cc: marek.vasut@gmail.com,
	Roger Pueyo Centelles <roger.pueyo@guifi.net>
Subject: [PATCH] mtd: spi-nor: Add support for en25qh64
Date: Thu, 27 Dec 2018 16:03:48 +0100
Message-Id: <20181227150348.12093-1-roger.pueyo@guifi.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Eon EN25QH64 is a 64 Mbit SPI NOR flash memory chip found
on recent wireless routers. Its 32, 128 and 256 Mbit siblings
are alredy supported.

Tested on a COMFAST CF-E120A v3 board.

Signed-off-by: Roger Pueyo Centelles <roger.pueyo@guifi.net>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..4bb6f4d203dc 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1741,6 +1741,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
 	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
 	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
+	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128, 0) },
 	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
 	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
 	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
-- 
2.19.2
