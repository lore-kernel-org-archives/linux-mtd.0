From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <anuragku@xilinx.com>, <cyrille.pitchen@microchip.com>,
 <nicolas.ferre@microchip.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH v2 3/3] mtd: spi-nor: add support for Microchip SST26 QSPI
 flash memories
Date: Tue, 11 Sep 2018 11:22:32 +0300
Message-ID: <20180911082232.28678-4-tudor.ambarus@microchip.com>
In-Reply-To: <20180911082232.28678-1-tudor.ambarus@microchip.com>
References: <20180911082232.28678-1-tudor.ambarus@microchip.com>
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

The flash memories are write-protected by default at power-on and
must be unlocked first, before being erased, then programmed.

The erase block sizes are not uniform. The memory layout is uniform
just for the 4K sector blocks.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ba0fd8b..dc8757e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1164,10 +1164,30 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
 	{
+		"sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			UNLOCK_GLOBAL_BLOCK)
+	},
+	{
+		"sst26vf032b", INFO(0xbf2642, 0, 64 * 1024, 64,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			UNLOCK_GLOBAL_BLOCK)
+	},
+	{
 		"sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			UNLOCK_GLOBAL_BLOCK)
 	},
+	{
+		"sst26vf040b", INFO(0xbf2654, 0, 64 * 1024, 8,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			UNLOCK_GLOBAL_BLOCK)
+	},
+	{
+		"sst26vf080b", INFO(0xbf2658, 0, 64 * 1024, 16,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			UNLOCK_GLOBAL_BLOCK)
+	},
 
 	/* ST Microelectronics -- newer production may have feature updates */
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
-- 
2.9.4
