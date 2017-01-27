Received: from mail7.hitachi.co.jp ([133.145.228.42])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWvi0-000318-78
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2017 01:52:14 +0000
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
To: linux-mtd@lists.infradead.org
Cc: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>,
 Jagan Teki <jagan@openedev.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: Add support for N25Q256A13 as N25Q256A
Date: Fri, 27 Jan 2017 10:51:37 +0900
Message-Id: <1485481897-6368-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
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
but ID is different. And this fixes N25Q256A to N25Q256 to fit chip
name to other n25q chip names.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
CC: Jagan Teki <jagan@openedev.com>
CC: Marek Vasut <marek.vasut@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index da7cd69d4857..a2a6922e356f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -887,7 +887,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q256",     INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q256a",    INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-- 
2.11.0
