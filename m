Received: from mail-eopbgr20097.outbound.protection.outlook.com ([40.107.2.97]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdxnV-0006Xl-Sp
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 13:07:47 +0000
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
To: linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] mtd: spi-nor: Add support for mx25u12835f
Date: Fri, 13 Jul 2018 15:06:46 +0200
Message-Id: <20180713130646.30523-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This chip supports dual and quad read and uniform 4K-byte erase.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

Based on spi-nor/next branch of git://git.infradead.org/l2-mtd.git

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d9c368c44194..f9832293b689 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1088,6 +1088,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
+	{ "mx25u12835f", INFO(0xc22538, 0, 64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx25u25635f", INFO(0xc22539, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_4B_OPCODES) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
-- 
2.18.0
