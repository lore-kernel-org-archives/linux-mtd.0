Received: from regular1.263xmail.com ([211.150.99.138])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdR77-0001u4-Le
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 00:37:04 +0000
From: Andy Yan <andy.yan@rock-chips.com>
To: cyrille.pitchen@atmel.com,
	marek.vasut@gmail.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] mtd: spi-nor: add support for GD25Q256
Date: Tue, 14 Feb 2017 08:36:24 +0800
Message-Id: <1487032584-3990-1-git-send-email-andy.yan@rock-chips.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

GD25Q256 is a 32MiB SPI Nor flash from Gigadevice.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 drivers/mtd/spi-nor/spi-nor.c

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
old mode 100644
new mode 100755
index da7cd69..0917dd3
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -852,6 +852,10 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+	},
 
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
@@ -1483,7 +1487,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	else if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
-		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION) {
+		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION ||
+		    JEDEC_MFR(info) == SNOR_MFR_GIGADEVICE) {
 			/* Dedicated 4-byte command set */
 			switch (nor->flash_read) {
 			case SPI_NOR_QUAD:
@@ -1519,7 +1524,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
-
 	dev_dbg(dev,
 		"mtd .name = %s, .size = 0x%llx (%lldMiB), "
 		".erasesize = 0x%.8x (%uKiB) .numeraseregions = %d\n",
-- 
2.7.4
