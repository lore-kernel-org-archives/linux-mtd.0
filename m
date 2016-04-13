Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqOY7-0002bH-BI
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 17:26:00 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH RFC 6/8] mtd: spi-nor: add support for Micron Dual and Quad
 SPI memories
Date: Wed, 13 Apr 2016 19:23:38 +0200
Message-ID: <77da9867290d0efcb301aba6e07eaed6ba1578c7.1460567256.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1460567255.git.cyrille.pitchen@atmel.com>
References: <cover.1460567255.git.cyrille.pitchen@atmel.com>
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

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 275 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h   |   1 +
 2 files changed, 265 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3573cc708b16..260ba5b9d010 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -807,6 +807,214 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
+struct spi_nor_read_id {
+	u32			id_mode;
+	u8			opcode;
+};
+
+static int spi_nor_read_id_multi_io(struct spi_nor *nor,
+				    u8 *id, size_t id_len,
+				    u32 id_modes,
+				    const struct spi_nor_read_id *configs,
+				    size_t num_configs,
+				    u8 mfr_id);
+
+static int spi_nor_micron_read_id(struct spi_nor *nor, u8 *id, size_t id_len,
+				  u32 id_modes)
+{
+	static const struct spi_nor_read_id configs[] = {
+		{SNOR_MODE_1_1_1, SPINOR_OP_RDID},
+		{SNOR_MODE_4_4_4, SPINOR_OP_MIO_RDID},
+		{SNOR_MODE_2_2_2, SPINOR_OP_MIO_RDID},
+	};
+
+	return spi_nor_read_id_multi_io(nor, id, id_len, id_modes,
+					configs, ARRAY_SIZE(configs),
+					SNOR_MFR_MICRON);
+}
+
+static int micron_set_protocol(struct spi_nor *nor, u8 mask, u8 val,
+			       enum spi_nor_protocol proto)
+{
+	u8 evcr;
+	int ret;
+
+	/* Read the Enhanced Volatile Configuration Register (EVCR). */
+	ret = nor->read_reg(nor, SPINOR_OP_RD_EVCR, &evcr, 1);
+	if (ret < 0) {
+		dev_err(nor->dev, "error while reading EVCR register\n");
+		return ret;
+	}
+
+	/* Check whether we need to update the protocol bits. */
+	if ((evcr & mask) == val)
+		return 0;
+
+	/* Set EVCR protocol bits. */
+	write_enable(nor);
+	evcr = (evcr & ~mask) | val;
+	ret = nor->write_reg(nor, SPINOR_OP_WD_EVCR, &evcr, 1);
+	if (ret < 0) {
+		dev_err(nor->dev, "error while writing EVCR register\n");
+		return ret;
+	}
+
+	/* Switch reg protocol now before accessing any other registers. */
+	nor->reg_proto = proto;
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret)
+		return ret;
+
+	/* Read EVCR and check it. */
+	ret = nor->read_reg(nor, SPINOR_OP_RD_EVCR, &evcr, 1);
+	if (ret < 0 || (evcr & mask) != val) {
+		dev_err(nor->dev, "Micron EVCR protocol bits not updated\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int micron_set_quad_mode(struct spi_nor *nor)
+{
+	int ret;
+
+	/* Clear Quad bit to select the Quad SPI mode */
+	ret = micron_set_protocol(nor,
+				  EVCR_QUAD_EN_MICRON, 0,
+				  SNOR_PROTO_4_4_4);
+	if (ret) {
+		dev_err(nor->dev, "Failed to set Micron Quad SPI mode\n");
+		return ret;
+	}
+
+	nor->read_proto  = SNOR_PROTO_4_4_4;
+	nor->write_proto = SNOR_PROTO_4_4_4;
+	nor->erase_proto = SNOR_PROTO_4_4_4;
+	return 0;
+}
+
+static int micron_set_dual_mode(struct  spi_nor *nor)
+{
+	int ret;
+
+	/* Set Quad/Dual bits to 10 to select the Dual SPI mode */
+	ret = micron_set_protocol(nor,
+				  EVCR_QUAD_EN_MICRON | EVCR_DUAL_EN_MICRON,
+				  EVCR_QUAD_EN_MICRON,
+				  SNOR_PROTO_2_2_2);
+	if (ret) {
+		dev_err(nor->dev, "Failed to set Micron Dual SPI mode\n");
+		return ret;
+	}
+
+	nor->read_proto  = SNOR_PROTO_2_2_2;
+	nor->write_proto = SNOR_PROTO_2_2_2;
+	nor->erase_proto = SNOR_PROTO_2_2_2;
+	return 0;
+}
+
+static int micron_set_extended_spi_mode(struct spi_nor *nor)
+{
+	int ret;
+
+	/* Set Quad/Dual bits to 11 to select the Extended SPI mode */
+	ret = micron_set_protocol(nor,
+				  EVCR_QUAD_EN_MICRON | EVCR_DUAL_EN_MICRON,
+				  EVCR_QUAD_EN_MICRON | EVCR_DUAL_EN_MICRON,
+				  SNOR_PROTO_1_1_1);
+	if (ret) {
+		dev_err(nor->dev, "Failed to set Micron Extended SPI mode\n");
+		return ret;
+	}
+
+	nor->write_proto = SNOR_PROTO_1_1_1;
+	nor->erase_proto = SNOR_PROTO_1_1_1;
+	return 0;
+}
+
+static int spi_nor_micron_enable_4_4_4(struct spi_nor *nor, bool enable)
+{
+	if (enable)
+		return micron_set_quad_mode(nor);
+	return micron_set_extended_spi_mode(nor);
+}
+
+static int spi_nor_micron_enable_2_2_2(struct spi_nor *nor, bool enable)
+{
+	if (enable)
+		return micron_set_dual_mode(nor);
+	return micron_set_extended_spi_mode(nor);
+}
+
+#define SNOR_MICRON_RD_MODES			\
+	(SNOR_MODE_SLOW |			\
+	 SNOR_MODE_1_1_1 |			\
+	 SNOR_MODE_1_1_2 |			\
+	 SNOR_MODE_1_2_2 |			\
+	 SNOR_MODE_2_2_2 |			\
+	 SNOR_MODE_1_1_4 |			\
+	 SNOR_MODE_1_4_4 |			\
+	 SNOR_MODE_4_4_4)
+
+#define SNOR_MICRON_WR_MODES			\
+	(SNOR_MODE_1_1_1 |			\
+	 SNOR_MODE_2_2_2 |			\
+	 SNOR_MODE_1_1_4 |			\
+	 SNOR_MODE_4_4_4)
+
+static const struct spi_nor_basic_flash_parameter micron_params = {
+	.rd_modes		= SNOR_MICRON_RD_MODES,
+	.reads[SNOR_MIDX_SLOW]	= SNOR_OP_READ(0, 0, SPINOR_OP_READ),
+	.reads[SNOR_MIDX_1_1_1]	= SNOR_OP_READ(0, 8, SPINOR_OP_READ_FAST),
+	.reads[SNOR_MIDX_1_1_2]	= SNOR_OP_READ(0, 8, SPINOR_OP_READ_1_1_2),
+	.reads[SNOR_MIDX_1_2_2]	= SNOR_OP_READ(1, 7, SPINOR_OP_READ_1_2_2),
+	.reads[SNOR_MIDX_2_2_2]	= SNOR_OP_READ(1, 7, SPINOR_OP_READ_1_2_2),
+	.reads[SNOR_MIDX_1_1_4]	= SNOR_OP_READ(1, 7, SPINOR_OP_READ_1_1_4),
+	.reads[SNOR_MIDX_1_4_4]	= SNOR_OP_READ(1, 9, SPINOR_OP_READ_1_4_4),
+	.reads[SNOR_MIDX_4_4_4]	= SNOR_OP_READ(1, 9, SPINOR_OP_READ_1_4_4),
+
+	.wr_modes		= SNOR_MICRON_WR_MODES,
+	.page_programs[SNOR_MIDX_1_1_1]	= SPINOR_OP_PP,
+	.page_programs[SNOR_MIDX_2_2_2]	= SPINOR_OP_PP,
+	.page_programs[SNOR_MIDX_1_1_4]	= SPINOR_OP_PP_1_1_4,
+	.page_programs[SNOR_MIDX_4_4_4]	= SPINOR_OP_PP_1_1_4,
+
+	.erase_types[0]		= SNOR_OP_ERASE_64K(SPINOR_OP_SE),
+
+	.read_id		= spi_nor_micron_read_id,
+	.enable_4_4_4		= spi_nor_micron_enable_4_4_4,
+	.enable_2_2_2		= spi_nor_micron_enable_2_2_2,
+};
+
+static const struct spi_nor_basic_flash_parameter micron_4k_params = {
+	.rd_modes		= SNOR_MICRON_RD_MODES,
+	.reads[SNOR_MIDX_SLOW]	= SNOR_OP_READ(0, 0, SPINOR_OP_READ),
+	.reads[SNOR_MIDX_1_1_1]	= SNOR_OP_READ(0, 8, SPINOR_OP_READ_FAST),
+	.reads[SNOR_MIDX_1_1_2]	= SNOR_OP_READ(0, 8, SPINOR_OP_READ_1_1_2),
+	.reads[SNOR_MIDX_1_2_2]	= SNOR_OP_READ(1, 7, SPINOR_OP_READ_1_2_2),
+	.reads[SNOR_MIDX_2_2_2]	= SNOR_OP_READ(1, 7, SPINOR_OP_READ_1_2_2),
+	.reads[SNOR_MIDX_1_1_4]	= SNOR_OP_READ(1, 7, SPINOR_OP_READ_1_1_4),
+	.reads[SNOR_MIDX_1_4_4]	= SNOR_OP_READ(1, 9, SPINOR_OP_READ_1_4_4),
+	.reads[SNOR_MIDX_4_4_4]	= SNOR_OP_READ(1, 9, SPINOR_OP_READ_1_4_4),
+
+	.wr_modes		= SNOR_MICRON_WR_MODES,
+	.page_programs[SNOR_MIDX_1_1_1]	= SPINOR_OP_PP,
+	.page_programs[SNOR_MIDX_2_2_2]	= SPINOR_OP_PP,
+	.page_programs[SNOR_MIDX_1_1_4]	= SPINOR_OP_PP_1_1_4,
+	.page_programs[SNOR_MIDX_4_4_4]	= SPINOR_OP_PP_1_1_4,
+
+	.erase_types[0]		= SNOR_OP_ERASE_64K(SPINOR_OP_SE),
+	.erase_types[1]		= SNOR_OP_ERASE_4K(SPINOR_OP_BE_4K),
+
+	.read_id		= spi_nor_micron_read_id,
+	.enable_4_4_4		= spi_nor_micron_enable_4_4_4,
+	.enable_2_2_2		= spi_nor_micron_enable_2_2_2,
+};
+
+#define PARAMS(_name) .params = &_name##_params
+
 /* Used when the "_ext_id" is two bytes at most */
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
 		.id = {							\
@@ -820,7 +1028,7 @@ static int spi_nor_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		.sector_size = (_sector_size),				\
 		.n_sectors = (_n_sectors),				\
 		.page_size = 256,					\
-		.flags = (_flags),
+		.flags = (_flags)
 
 #define INFO6(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
 		.id = {							\
@@ -923,16 +1131,16 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, SPI_NOR_QUAD_READ) },
 
 	/* Micron */
-	{ "n25q032",	 INFO(0x20ba16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
-	{ "n25q032a",	 INFO(0x20bb16, 0, 64 * 1024,   64, SPI_NOR_QUAD_READ) },
-	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
-	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "n25q032",     INFO(0x20ba16, 0, 64 * 1024,   64, 0), PARAMS(micron) },
+	{ "n25q032a",    INFO(0x20bb16, 0, 64 * 1024,   64, 0), PARAMS(micron) },
+	{ "n25q064",     INFO(0x20ba17, 0, 64 * 1024,  128, 0), PARAMS(micron_4k) },
+	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, 0), PARAMS(micron_4k) },
+	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0), PARAMS(micron_4k) },
+	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0), PARAMS(micron_4k) },
+	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, 0), PARAMS(micron_4k) },
+	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, USE_FSR), PARAMS(micron_4k) },
+	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR), PARAMS(micron_4k) },
+	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, USE_FSR), PARAMS(micron_4k) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
@@ -1358,6 +1566,51 @@ static int spi_nor_midx2proto(int midx, enum spi_nor_protocol *proto)
 	return 0;
 }
 
+static int spi_nor_read_id_multi_io(struct spi_nor *nor,
+				    u8 *id, size_t id_len,
+				    u32 id_modes,
+				    const struct spi_nor_read_id *configs,
+				    size_t num_configs,
+				    u8 mfr_id)
+{
+	size_t i;
+	int err;
+
+	memset(id, 0, id_len);
+	for (i = 0; i < num_configs; ++i) {
+		const struct spi_nor_read_id *config = &configs[i];
+		enum spi_nor_protocol proto;
+		int id_midx;
+
+		/* Skip unsupported modes. */
+		if (!(config->id_mode & id_modes))
+			continue;
+
+		/* Set SPI protocols */
+		id_midx = fls(config->id_mode) - 1;
+		if (spi_nor_midx2proto(id_midx, &proto)) {
+			dev_err(nor->dev,
+				"Invalid spi-nor mode to read the JEDEC ID\n");
+			return -EINVAL;
+		}
+		nor->reg_proto   = proto;
+		nor->read_proto  = proto;
+		nor->write_proto = proto;
+		nor->erase_proto = proto;
+
+		err = nor->read_reg(nor, config->opcode, id, id_len);
+		if (err)
+			return err;
+
+		if (id[0] == mfr_id)
+			break;
+
+		memset(id, 0, id_len);
+	}
+
+	return 0;
+}
+
 static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
 			 const struct spi_nor_basic_flash_parameter *params,
 			 const struct spi_nor_modes *modes)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 770ea84370d0..d857f628b5ed 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -101,6 +101,7 @@
 #define SR_QUAD_EN_MX		BIT(6)	/* Macronix Quad I/O */
 
 /* Enhanced Volatile Configuration Register bits */
+#define EVCR_DUAL_EN_MICRON	BIT(6)	/* Micron Dual I/O */
 #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
 
 /* Flag Status Register bits */
-- 
1.8.2.2
