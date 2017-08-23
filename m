Received: from regular1.263xmail.com ([211.150.99.133])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dkSTq-0003tS-42
 for linux-mtd@lists.infradead.org; Wed, 23 Aug 2017 10:01:49 +0000
From: Andy Yan <andy.yan@rock-chips.com>
To: cyrille.pitchen@wedev4u.fr
Cc: boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
 computersforpeace@gmail.com, richard@nod.at, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5] mtd: spi-nor: add support for GD25Q256
Date: Wed, 23 Aug 2017 18:01:06 +0800
Message-Id: <1503482466-27310-1-git-send-email-andy.yan@rock-chips.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for GD25Q256, a 32MiB SPI Nor
flash from GigaDevice.

The GD25Q256 uses S6 to set QE, which is
different with other supported memories
from GigaDevice that use S9. So we introduce
a quad_enable function which can be set per
memory in the flash_info list.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
- set quad_enable in flash_info list, thanks the guidance by Cyrille.

Changes in v4:
- add SPI_NOR_HAS_LOCK and SPI_NOR_HAS_TB

Changes in v3:
- rebase on top of spi-nor tree
- add SPI_NOR_4B_OPCODES flag

Changes in v2:
- drop one line unnecessary modification

 drivers/mtd/spi-nor/spi-nor.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index cf1d4a1..dc89ef2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -89,6 +89,8 @@ struct flash_info {
 #define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
+
+	int	(*quad_enable)(struct spi_nor *nor);
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -870,6 +872,8 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
+static int macronix_quad_enable(struct spi_nor *nor);
+
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
 		.id = {							\
@@ -997,6 +1001,12 @@ static const struct flash_info spi_nor_ids[] = {
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
@@ -2388,6 +2398,15 @@ static int spi_nor_init_params(struct spi_nor *nor,
 			params->quad_enable = spansion_quad_enable;
 			break;
 		}
+
+		/*
+		 * Some manufacturer like GigaDevice may use different
+		 * bit to set QE on different memories, so the MFR can't
+		 * indicate the quad_enable method for this case, we need
+		 * set it in flash info list.
+		 */
+		if (info->quad_enable)
+			params->quad_enable = info->quad_enable;
 	}
 
 	/* Override the parameters with data read from SFDP tables. */
-- 
2.7.4
