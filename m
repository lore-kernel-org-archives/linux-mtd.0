Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eRzwy-0004gz-7s
 for linux-mtd@lists.infradead.org; Thu, 21 Dec 2017 12:27:49 +0000
Received: by mail-lf0-x244.google.com with SMTP id g63so5660205lfl.11
 for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2017 04:27:38 -0800 (PST)
From: Rafael Gago <rafael.gago@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, Rafael Gago <rgc@hms.se>
Subject: [PATCH v2] mtd: spi-nor: Add support for s25fl128l and s25fl256l
Date: Thu, 21 Dec 2017 13:27:30 +0100
Message-Id: <1513859250-510-1-git-send-email-rgc@hms.se>
In-Reply-To: <1513859069-32567-1-git-send-email-rgc@hms.se>
References: <1513859069-32567-1-git-send-email-rgc@hms.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

They are exactly the same than the s25fl064l but bigger.

Signed-off-by: Rafael Gago Castano <rgc@hms.se>
---

Changes from v2:
  The commit message named two times the 128 M device.

 drivers/mtd/spi-nor/spi-nor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bc266f7..b2a065d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1065,7 +1065,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
 	{ "pm25lq032",   INFO(0x7f9d46, 0, 64 * 1024,   64, SECT_4K) },
 
-	/* Spansion -- single (large) sector size only, at least
+	/* Spansion/Cypress -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
@@ -1094,6 +1094,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "s25fl208k",  INFO(0x014014,      0,  64 * 1024,  16, SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
+	{ "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
-- 
2.7.4
