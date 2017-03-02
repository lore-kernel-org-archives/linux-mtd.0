Received: from mail4.hitachi.co.jp ([133.145.228.5])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjGi4-0003Rs-N1
 for linux-mtd@lists.infradead.org; Thu, 02 Mar 2017 02:43:18 +0000
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
To: linux-mtd@lists.infradead.org
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>,
 Jagan Teki <jagan@openedev.com>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3] mtd: spi-nor: Add support for N25Q256A13
Date: Thu,  2 Mar 2017 11:42:34 +0900
Message-Id: <1488422554-7644-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add new Micron N25Q256A (N25Q256A13) 256Mbit NOR Flash in the list
of supported devices. This chip has the same structure as the N25Q256A
but ID and voltage (1V8) to use is different. Therefore, this adds
N25Q256A13 as n25q256ax1.

In the future, for new Micron memories we could use the patterns
"n25q*ax1" for 1V8 and "n25q*ax3" for 3V3 memories.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
CC: Jagan Teki <jagan@openedev.com>
CC: Marek Vasut <marek.vasut@gmail.com>
CC: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1ae872bfc3ba..2e02991d93aa 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1031,6 +1031,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-- 
2.11.0
