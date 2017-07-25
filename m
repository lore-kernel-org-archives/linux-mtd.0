Received: from regular1.263xmail.com ([211.150.99.132])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dZwqM-0005SO-CE
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 10:13:36 +0000
From: Andy Yan <andy.yan@rock-chips.com>
To: cyrille.pitchen@wedev4u.fr
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 computersforpeace@gmail.com, richard@nod.at, dwmw2@infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4] mtd: spi-nor: add support for GD25Q256
Date: Tue, 25 Jul 2017 18:12:54 +0800
Message-Id: <1500977574-15915-1-git-send-email-andy.yan@rock-chips.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for GD25Q256, a 32MiB SPI Nor
flash from Gigadevice.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v4:
- add SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB

Changes in v3:
- rebase on top of spi-nor tree
- add SPI_NOR_4B_OPCODES flag

Changes in v2:
- drop one line unnecessary modification

 drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 196b52f..e4145cd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -986,6 +986,11 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
@@ -2365,6 +2370,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 				   SNOR_HWCAPS_PP_QUAD)) {
 		switch (JEDEC_MFR(info)) {
 		case SNOR_MFR_MACRONIX:
+		case SNOR_MFR_GIGADEVICE:
 			params->quad_enable = macronix_quad_enable;
 			break;
 
-- 
2.7.4
