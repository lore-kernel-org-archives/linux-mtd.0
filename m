Received: from mail-sn1nam02on0071.outbound.protection.outlook.com
 ([104.47.36.71] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eMUt6-0001Ll-1j
 for linux-mtd@lists.infradead.org; Wed, 06 Dec 2017 08:17:06 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>
CC: <dedekind1@gmail.com>, <computersforpeace@gmail.com>,
 <boris.brezillon@free-electrons.com>, Prabhakar Kushwaha
 <prabhakar.kushwaha@nxp.com>
Subject: [RFC 08/10] mtd: spi-nor: Add support of SPANSION S25FS-S flash
Date: Wed, 6 Dec 2017 13:45:39 +0530
Message-ID: <1512548141-3319-9-git-send-email-prabhakar.kushwaha@nxp.com>
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

S25FS512S is a 512 Mbit, 1.8 V Serial Peripheral Interface with
Multi-I/O Flash. It provide support of read (Fast, Dual I/O,
Quad I/O, DDR Quad I/O), program and erase(hybrid, uniform sector).

Read commands require latency cycles which are configured via volatile
configurations register 2 (CR2V). Dual I/O and Quad I/O read require
mode cycles.

This patch add support SPANSION S25FS-S flash family and update
required structure, registers.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 68 ++++++++++++++++++++++++++++++++++++++-----
 include/linux/mtd/spi-nor.h   | 10 +++++++
 2 files changed, 71 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index dd1a771..58c37f6f 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -93,7 +93,8 @@ struct flash_info {
 #define SPI_NOR_QUAD_IO_READ	BIT(16)	/* Flash supports Quad IO Read */
 };
 
-#define JEDEC_MFR(info)	((info)->id[0])
+#define JEDEC_MFR(info)		((info)->id[0])
+#define JEDEC_EXT_ID(info)	((info)->id[5])
 
 static const struct flash_info *spi_nor_match_id(const char *name);
 
@@ -1056,6 +1057,7 @@ static const struct flash_info spi_nor_ids[] = {
 	 */
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_IO_READ | SPI_NOR_QUAD_IO_READ) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl512s",  INFO(0x010220, 0x4d00, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
@@ -1663,6 +1665,33 @@ static int micron_dummy_config(struct spi_nor *nor, u8 num_wait_states,
 	return 0;
 }
 
+static int spansion_dummy_config(struct spi_nor *nor, u8 num_wait_states,
+				 const struct flash_info *info)
+{
+	int ret;
+	u8 val;
+
+	if (JEDEC_EXT_ID(info) == SPINOR_S25FS_FAMILY_ID) {
+		ret = nor->read_anyreg(nor, SPINOR_OP_RDAR, SPANSION_CR2V_OFF,
+				       &val, 1);
+		if (ret < 0) {
+			dev_err(nor->dev, "error %d reading CR2V\n", ret);
+			return ret;
+		}
+		val &= 0xF0;
+		val |= num_wait_states;
+
+		ret = nor->write_anyreg(nor, SPINOR_OP_WRAR, SPANSION_CR2V_OFF,
+					&val, 1);
+		if (ret < 0) {
+			dev_err(nor->dev, "error %d writing CR2V\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int spi_nor_check(struct spi_nor *nor)
 {
 	if (!nor->dev || !nor->read || !nor->write ||
@@ -1801,6 +1830,10 @@ spi_nor_set_read_settings(struct spi_nor_read_command *read,
 		read->dummy_config = micron_dummy_config;
 		break;
 
+	case SNOR_MFR_SPANSION:
+		read->dummy_config = spansion_dummy_config;
+		break;
+
 	default:
 		read->dummy_config = NULL;
 		break;
@@ -2413,6 +2446,8 @@ static int spi_nor_init_params(struct spi_nor *nor,
 			       const struct flash_info *info,
 			       struct spi_nor_flash_parameter *params)
 {
+	u8 mode = 0;
+
 	/* Set legacy flash parameters as default. */
 	memset(params, 0, sizeof(*params));
 
@@ -2423,41 +2458,60 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	/* (Fast) Read settings. */
 	params->hwcaps.mask |= SNOR_HWCAPS_READ;
 	spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ],
-				  0, 0, SPINOR_OP_READ,
+				  mode, 0, SPINOR_OP_READ,
 				  SNOR_PROTO_1_1_1, info);
 
 	if (!(info->flags & SPI_NOR_NO_FR)) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_FAST;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_FAST],
-					  0, 8, SPINOR_OP_READ_FAST,
+					  mode, 8, SPINOR_OP_READ_FAST,
 					  SNOR_PROTO_1_1_1, info);
 	}
 
 	if (info->flags & SPI_NOR_DUAL_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_2;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_2],
-					  0, 8, SPINOR_OP_READ_1_1_2,
+					  mode, 8, SPINOR_OP_READ_1_1_2,
 					  SNOR_PROTO_1_1_2, info);
 	}
 
 	if (info->flags & SPI_NOR_DUAL_IO_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_2_2;
+
+		switch (JEDEC_EXT_ID(info)) {
+		case SPINOR_S25FS_FAMILY_ID:
+			mode = 4;
+			break;
+		default:
+			mode = 0;
+			break;
+		}
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_2_2],
-					  0, 8, SPINOR_OP_READ_1_2_2,
+					  mode, 8, SPINOR_OP_READ_1_2_2,
 					  SNOR_PROTO_1_2_2, info);
 	}
 
 	if (info->flags & SPI_NOR_QUAD_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_4;
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_1_4],
-					  0, 8, SPINOR_OP_READ_1_1_4,
+					  mode, 8, SPINOR_OP_READ_1_1_4,
 					  SNOR_PROTO_1_1_4, info);
 	}
 
 	if (info->flags & SPI_NOR_QUAD_IO_READ) {
 		params->hwcaps.mask |= SNOR_HWCAPS_READ_1_4_4;
+
+		switch (JEDEC_EXT_ID(info)) {
+		case SPINOR_S25FS_FAMILY_ID:
+			mode = 2;
+			break;
+		default:
+			mode = 0;
+			break;
+		}
+
 		spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_1_4_4],
-					  0, 10, SPINOR_OP_READ_1_4_4,
+					  mode, 10, SPINOR_OP_READ_1_4_4,
 					  SNOR_PROTO_1_4_4, info);
 	}
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b6dfa25..9ff96cb 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -29,6 +29,8 @@
 #define SNOR_MFR_SST		CFI_MFR_SST
 #define SNOR_MFR_WINBOND	0xef /* Also used by some Spansion */
 
+#define SPINOR_S25FS_FAMILY_ID	0x81
+
 /*
  * Note on opcode nomenclature: some opcodes have a format like
  * SPINOR_OP_FUNCTION{4,}_x_y_z. The numbers x, y, and z stand for the number
@@ -106,6 +108,14 @@
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 #define SPINOR_OP_CLSR		0x30	/* Clear status register 1 */
+#define SPINOR_OP_RDAR		0x65	/* Read any register */
+#define SPINOR_OP_WRAR		0x71	/* Write any register */
+#define SPANSION_SR1V_OFF	0x00800000 /* SR1V offset */
+#define SPANSION_SR2V_OFF	0x00800001 /* SR2V offset */
+#define SPANSION_CR1V_OFF	0x00800002 /* CR1V offset */
+#define SPANSION_CR2V_OFF	0x00800003 /* CR2V offset */
+#define SPANSION_CR3V_OFF	0x00800004 /* CR3V offset */
+
 
 /* Used for Micron flashes only. */
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-- 
2.7.4
