From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 08/10] mtd: spi-nor: add more read transfer flags for
 n25q256a
Date: Mon, 28 Apr 2014 11:53:45 +0800
Message-ID: <1398657227-20721-9-git-send-email-b32955@freescale.com>
In-Reply-To: <1398657227-20721-1-git-send-email-b32955@freescale.com>
References: <1398657227-20721-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NOR flash can supports dual/quad/ddr-quad read.
Add more flags for these read transfers.

>From the datasheet, the chip support the 64K sector erase operation.
So remove the SECT_4K for the chip which makes the flash_erase faster.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e0bc11a..07d249c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -500,7 +500,7 @@ const struct spi_device_id spi_nor_ids[] = {
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, 0) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
-	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
+	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | SPI_NOR_DDR_QUAD_READ) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
 
 	/* PMC */
-- 
1.7.2.rc3
