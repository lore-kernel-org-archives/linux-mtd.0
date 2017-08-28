Received: from regular1.263xmail.com ([211.150.99.134])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dm9N8-0001Hj-2t
 for linux-mtd@lists.infradead.org; Mon, 28 Aug 2017 02:01:52 +0000
From: Andy Yan <andy.yan@rock-chips.com>
To: cyrille.pitchen@wedev4u.fr
Cc: linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, computersforpeace@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v7 2/2] mtd: spi-nor: add support for GD25Q256
Date: Mon, 28 Aug 2017 10:00:46 +0800
Message-Id: <1503885646-25401-1-git-send-email-andy.yan@rock-chips.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for GD25Q256, a 32MiB SPI Nor flash
from GigaDevice.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 drivers/mtd/spi-nor/spi-nor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3b94308..dc89ef2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -872,6 +872,8 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
+static int macronix_quad_enable(struct spi_nor *nor);
+
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
 		.id = {							\
@@ -999,6 +1001,12 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+			.quad_enable = macronix_quad_enable,
+	},
 
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
-- 
2.7.4
