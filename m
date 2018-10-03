Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7iKg-0002SJ-AW
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 14:40:59 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Mason Yang <masonccyang@mxic.com.tw>,
 <zhengxunli@mxic.com.tw>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 1/8] mtd: spi-nor: Set SPI_NOR_4B_OPCODES on all >16MB
 Spansion NORs
Date: Wed,  3 Oct 2018 16:40:36 +0200
Message-Id: <20181003144043.21529-2-boris.brezillon@bootlin.com>
In-Reply-To: <20181003144043.21529-1-boris.brezillon@bootlin.com>
References: <20181003144043.21529-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The code was treating >16MB Spansion NORs as a special case, while they
could just be flagged with SPI_NOR_4B_OPCODES and be treated as other
NORs.

This change simplifies the code and makes it explicit that those parts
are supporting 4B addressing.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
I've checked the datasheet of s25fl512s, s70fl01gs, s25fl256s0 and
s25fl256s1, and they indeed support 4B opcodes. Other Spansion NORs
might also support 4B opcodes, but those that do not already have
SPI_NOR_4B_OPCODES set are anyway <=16MB in size.

Also, I kept NOR definitions on a single line, since those were already
over 80chars. Marek, let me know if you want me to change that for the
GigaDevice formatting:

        {
                "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
                        SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
                        SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
        },

Changes in v2:
- Add SPI_NOR_4B_OPCODES to s25fl256s0 and s25fl256s1 entries
---
 drivers/mtd/spi-nor/spi-nor.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9407ca5f9443..27ea10dc0395 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1414,10 +1414,10 @@ static const struct flash_info spi_nor_ids[] = {
 	 */
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
-	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
-	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
+	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR | SPI_NOR_4B_OPCODES) },
+	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR | SPI_NOR_4B_OPCODES) },
+	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR | SPI_NOR_4B_OPCODES) },
+	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, SPI_NOR_4B_OPCODES) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
 	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
@@ -3551,7 +3551,6 @@ static int spi_nor_init(struct spi_nor *nor)
 	}
 
 	if ((nor->addr_width == 4) &&
-	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
 	    !(nor->info->flags & SPI_NOR_4B_OPCODES)) {
 		/*
 		 * If the RESET# pin isn't hooked up properly, or the system
@@ -3585,7 +3584,6 @@ void spi_nor_restore(struct spi_nor *nor)
 {
 	/* restore the addressing mode */
 	if ((nor->addr_width == 4) &&
-	    (JEDEC_MFR(nor->info) != SNOR_MFR_SPANSION) &&
 	    !(nor->info->flags & SPI_NOR_4B_OPCODES) &&
 	    (nor->flags & SNOR_F_BROKEN_RESET))
 		set_4byte(nor, nor->info, 0);
@@ -3742,8 +3740,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	} else if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
-		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
-		    info->flags & SPI_NOR_4B_OPCODES)
+		if (info->flags & SPI_NOR_4B_OPCODES)
 			spi_nor_set_4byte_opcodes(nor, info);
 	} else {
 		nor->addr_width = 3;
-- 
2.14.1
