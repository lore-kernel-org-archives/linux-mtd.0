Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5I02-0005oj-B1
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2018 22:09:45 +0000
From: Lukasz Majewski <lukma@denx.de>
To: Frieder Schrempf <frieder.schrempf@exceet.de>, boris.brezillon@bootlin.com,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, yogeshnarayan.gaur@nxp.com, richard@nod.at,
 Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>,
 Fabio Estevam <fabio.estevam@nxp.com>, prabhakar.kushwaha@nxp.com,
 han.xu@nxp.com, broonie@kernel.org, david.wolfe@nxp.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, albert.aribaud@3adev.fr,
 Lukasz Majewski <lukma@denx.de>
Subject: [RFC/RFT PATCH v1 9/9] mtd: spi: Skip reading the Serial Flash
 Discoverable Parameters
Date: Thu, 27 Sep 2018 00:07:39 +0200
Message-Id: <20180926220739.620-10-lukma@denx.de>
In-Reply-To: <20180926220739.620-1-lukma@denx.de>
References: <20180926220739.620-1-lukma@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The fsl-quadspi.c driver is not supporting SPINOR_OP_RDSFDP (0x5a)
read opcode - in the legacy driver we do read some garbage
data from AHB mapped area and then return on the first check
(L2376 @ ./mtd/spi-nor/spi-nor.c)

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 442102be174e..c79b8c33aeeb 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1103,7 +1103,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
+	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ | SPI_NOR_SKIP_SFDP) },
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-- 
2.11.0
