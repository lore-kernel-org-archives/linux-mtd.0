Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCPT-0000wq-8p
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:27:00 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Vignesh R <vigneshr@ti.com>,
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 02/34] mtd: spi-nor: Add a post SFDP fixup hook for
 gd25q256
Date: Fri,  7 Dec 2018 10:26:05 +0100
Message-Id: <20181207092637.18687-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181207092637.18687-1-boris.brezillon@bootlin.com>
References: <20181207092637.18687-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

gd25q256 needs to tweak the ->quad_enable() implementation and the
->post_sfdp() fixup hook is the perfect place to do that. This way,
if we ever need to tweak more things for this flash, we won't have to
add new fields in flash_info.

We can get rid of the flash_info->quad_enable field as gd25q256 was
the only user.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b2b36b2ea251..6b458ff4effa 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -287,8 +287,6 @@ struct flash_info {
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
-
-	int	(*quad_enable)(struct spi_nor *nor);
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -1687,6 +1685,18 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
 		.addr_width = 3,					\
 		.flags = SPI_NOR_NO_FR | SPI_S3AN,
 
+static int gd25q256_post_sfdp_fixups(struct spi_nor *nor,
+				     struct spi_nor_flash_parameter *params)
+{
+	params->quad_enable = macronix_quad_enable;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups gd25q256_fixups = {
+	.post_sfdp = gd25q256_post_sfdp_fixups,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -1800,7 +1810,7 @@ static const struct flash_info spi_nor_ids[] = {
 		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-			.quad_enable = macronix_quad_enable,
+		.fixups = &gd25q256_fixups,
 	},
 
 	/* Intel/Numonyx -- xxxs33b */
@@ -3356,15 +3366,6 @@ static int spi_nor_init_params(struct spi_nor *nor,
 			params->quad_enable = spansion_quad_enable;
 			break;
 		}
-
-		/*
-		 * Some manufacturer like GigaDevice may use different
-		 * bit to set QE on different memories, so the MFR can't
-		 * indicate the quad_enable method for this case, we need
-		 * set it in flash info list.
-		 */
-		if (info->quad_enable)
-			params->quad_enable = info->quad_enable;
 	}
 
 	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
-- 
2.17.1
