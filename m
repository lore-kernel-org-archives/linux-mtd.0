Received: from mail7.hitachi.co.jp ([133.145.228.42])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brcq6-0001TD-NT
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 03:25:51 +0000
From: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 tatsuaki.osafune.uv@hitachi.com,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
Subject: [PATCH] mtd: spi-nor: Add support for N25Q256A13
Date: Wed,  5 Oct 2016 12:25:10 +0900
Message-Id: <1475637910-2324-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Micron N25Q256A13 256Mbit NOR Flash in the list of supported
devices. This chip is the same structure as the N25Q256A but ID
is different.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
---

 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..ce67ccd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -884,6 +884,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "n25q256a13",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-- 
2.9.3
