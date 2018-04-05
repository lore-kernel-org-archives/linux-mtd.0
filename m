Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4AH9-0001Yd-AC
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 19:10:25 +0000
From: thor.thayer@linux.intel.com
To: marek.vasut@gmail.com, dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	thor.thayer@linux.intel.com
Subject: [PATCH] mtd: spi-nor: Add Micron MT25QU02 support
Date: Thu,  5 Apr 2018 14:12:49 -0500
Message-Id: <1522955569-19927-1-git-send-email-thor.thayer@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Thor Thayer <thor.thayer@linux.intel.com>

Add support for a new Micron 2Gb Flash memory part.
Datasheet is available: mt25q_qlkt_l_02g_cbb_0.pdf

Testing was done on a Stratix10 SoCFPGA Development Kit.

Reported-by: Sujith Chidurala <sujith.chakra.chidurala@intel.com>
Tested-by: Paul Kim <paul.kim@intel.com>
Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5bfa36e95f35..8b459766a4ca 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1087,6 +1087,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
+	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
-- 
2.7.4
