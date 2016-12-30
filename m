Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMxA5-0004UU-JN
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2016 13:23:58 +0000
Received: by mail-lf0-x241.google.com with SMTP id y21so34542600lfa.0
 for <linux-mtd@lists.infradead.org>; Fri, 30 Dec 2016 05:23:39 -0800 (PST)
From: Marcin Krzeminski <mar.krzeminski@gmail.com>
To: cyrille.pitchen@atmel.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, mar.krzeminski@gmail.com
Subject: [PATCH v2 2/2] Disable chip erase for Micron n25q00
Date: Fri, 30 Dec 2016 14:23:25 +0100
Message-Id: <20161230132325.14337-3-mar.krzeminski@gmail.com>
In-Reply-To: <20161230132325.14337-1-mar.krzeminski@gmail.com>
References: <20161230132325.14337-1-mar.krzeminski@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron n25q00 are stacked chips, thus do not support chip erase.
>From now spi-nor framework will not send chip erase command.

Signed-off-by: Marcin Krzeminski <mar.krzeminski@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b6656b2..3b416d6 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -950,8 +950,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
+	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
-- 
2.9.3
