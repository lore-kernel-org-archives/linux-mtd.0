Received: from mail-sn1nam02on0041.outbound.protection.outlook.com
 ([104.47.36.41] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMUsi-0001KI-A3
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:16:42 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [RFC 01/10] mtd: spi-nor: Add support of 1-2-2,
 1-4-4 IO READ protocols
Date: Wed, 6 Dec 2017 13:45:32 +0530
Message-ID: <1512548141-3319-2-git-send-email-prabhakar.kushwaha@nxp.com>
In-Reply-To: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
References: <1512548141-3319-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

IO READ protocols transfers both address and data on multiple
data bits. 1-2-2(DUAL IO), 1-4-4(QUAD IO) transfer address on 2
data bits or 4 bits per rising edge of SCK respectively.

This patch update spi_nor_flash_parameter->spi_nor_read_command
array based on DUAL or QUAD IO flag enabled in flash_info for a flash.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 19c00072..7d3b52f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -61,7 +61,7 @@ struct flash_info {
 	u16		page_size;
 	u16		addr_width;
 
-	u16		flags;
+	u32		flags;
 #define SECT_4K			BIT(0)	/* SPINOR_OP_BE_4K works uniformly */
 #define SPI_NOR_NO_ERASE	BIT(1)	/* No erase command needed */
 #define SST_WRITE		BIT(2)	/* use SST byte programming */
@@ -89,6 +89,8 @@ struct flash_info {
 #define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
+#define SPI_NOR_DUAL_IO_READ	BIT(15)	/* Flash supports Dual IO Read */
+#define SPI_NOR_QUAD_IO_READ	BIT(16)	/* Flash supports Quad IO Read */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -2399,6 +2401,13 @@ static int spi_nor_init_params(struct spi_nor *nor,
 					  SNOR_PROTO_1_1_2);
 	}
 
+	if (info->flags & SPI_NOR_DUAL_IO_READ) {
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_2_2],
+					  0, 8, SPINOR_OP_READ_1_2_2,
+					  SNOR_PROTO_1_2_2);
+	}
+
 	if (info->flags & SPI_NOR_QUAD_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
@@ -2406,6 +2415,14 @@ static int spi_nor_init_params(struct spi_nor *nor,
 					  SNOR_PROTO_1_1_4);
 	}
 
+	if (info->flags & SPI_NOR_QUAD_IO_READ) {
+		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_4_4;
+		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_4_4],
+					  0, 10, SPINOR_OP_READ_1_4_4,
+					  SNOR_PROTO_1_4_4);
+	}
+
+
 	/* Page Program settings. */
 	params->hwcaps.mask |= SNOR_HWCAPS_PP;
 	spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP],
@@ -2432,7 +2449,8 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	/* Override the parameters with data read from SFDP tables. */
 	nor->addr_width = 0;
 	nor->mtd.erasesize = 0;
-	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
+	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+	    SPI_NOR_DUAL_IO_READ | SPI_NOR_QUAD_IO_READ)) &&
 	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
 		struct spi_nor_flash_parameter sfdp_params;
 
-- 
2.7.4
