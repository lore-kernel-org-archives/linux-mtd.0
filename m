Received: from regular1.263xmail.com ([211.150.99.139])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdwfc-0007sr-TE
 for linux-mtd@lists.infradead.org; Wed, 15 Feb 2017 10:18:47 +0000
From: Andy Yan <andy.yan@rock-chips.com>
To: cyrille.pitchen@atmel.com,
	marek.vasut@gmail.com
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 richard@nod.at, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3] mtd: spi-nor: add support for GD25Q256
Date: Wed, 15 Feb 2017 18:15:38 +0800
Message-Id: <1487153738-1096-1-git-send-email-andy.yan@rock-chips.com>
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

Changes in v3:
- rebase on top of spi-nor tree
- add SPI_NOR_4B_OPCODES flag

Changes in v2:
- drop one line unnecessary modification

 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 70e52ff..34327ab 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -995,6 +995,11 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES)
+	},
 
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
-- 
2.7.4
