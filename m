Received: from antares.kleine-koenig.org ([2a01:4f8:c0c:3a97::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPSV7-0001nU-Vt
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2018 13:25:07 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: kernel@penugtronix.de,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Add support for IS25LP032/064/128
Date: Wed, 21 Nov 2018 14:24:49 +0100
Message-Id: <20181121132449.12149-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The datasheet is publically available at
http://www.issi.com/WW/pdf/IS25LP032-064-128.pdf. The parameters fit to
what is already available for IS25LP256.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f028277fb1ce..1b6b819bc1eb 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1064,6 +1064,12 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "is25lp032",  INFO(0x9d6016, 0, 64 * 1024,  64,
+			SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "is25lp064",  INFO(0x9d6017, 0, 64 * 1024, 128,
+			SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "is25lp128",  INFO(0x9d6018, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25lp256",  INFO(0x9d6019, 0, 64 * 1024, 512,
 			SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "is25wp032",  INFO(0x9d7016, 0, 64 * 1024,  64,
-- 
2.19.1
