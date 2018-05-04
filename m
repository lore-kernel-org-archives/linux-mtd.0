Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEd1Y-0002uk-N9
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 15:53:34 +0000
From: Radu Pirea <radu.pirea@microchip.com>
To: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <Zhiqiang.Hou@nxp.com>, <pp@emlix.com>, <richard@nod.at>,
 <boris.brezillon@bootlin.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>, <marek.vasut@gmail.com>, Radu Pirea
 <radu.pirea@microchip.com>
Subject: [PATCH] mtd: spi-nor: add support for Microchip 25LC256
Date: Fri, 4 May 2018 18:54:04 +0300
Message-ID: <20180504155404.5285-1-radu.pirea@microchip.com>
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

Added geometry description for Microchip 25LC256 memory.

Signed-off-by: Radu Pirea <radu.pirea@microchip.com>
---
 drivers/mtd/devices/m25p80.c  | 3 +++
 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index a4e18f6aaa33..1e359d811261 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -372,6 +372,9 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mr25h10" },  /*   1 Mib, 40 MHz */
 	{ "mr25h40" },  /*   4 Mib, 40 MHz */
 
+	/* Microchip */
+	{ "25lc256" },
+
 	{ },
 };
 MODULE_DEVICE_TABLE(spi, m25p_ids);
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d445a4d3b770..6341c86be647 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1076,6 +1076,9 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx66l1g45g",  INFO(0xc2201b, 0, 64 * 1024, 2048, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
+	/* Microchip */
+	{ "25lc256", CAT25_INFO(32 * 1024, 1, 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
+
 	/* Micron */
 	{ "n25q016a",	 INFO(0x20bb15, 0, 64 * 1024,   32, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
-- 
2.16.2
