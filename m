Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF2QY-00051v-FU
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 16:52:02 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH 5/9] mtd: spi-nor: add support of SPI protocols like SPI 1-2-2
 and SPI 1-4-4
Date: Mon, 20 Jun 2016 18:50:04 +0200
Message-ID: <d385cfe4280a465d443d8ab9886ba3a28bb60e10.1466440540.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1466440540.git.cyrille.pitchen@atmel.com>
References: <cover.1466440540.git.cyrille.pitchen@atmel.com>
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

This patch changes the prototype of spi_nor_scan(): its 3rd parameter
is replaced by a const struct spi_nor_modes pointer, which tells the
spi-nor framework about which SPI protocols are supported by the SPI
controller.

Besides, this patch also introduces a new spi_nor_basic_flash_parameter
structure telling the spi-nor framework about the SPI protocols supported
by the SPI memory and the needed op codes to use these SPI protocols.

Currently the struct spi_nor_basic_flash_parameter is filled with legacy
values but a later patch will allow to fill it dynamically by reading the
JESD216 Serial Flash Discoverable Parameter (SFDP) tables from the SPI
memory.

With both structures, the spi-nor framework can now compute the best
match between SPI protocols supported by both the (Q)SPI memory and
controller hence selecting the relevant op codes for (Fast) Read, Page
Program and Sector Erase operations.

The spi_nor_basic_flash_parameter structure also provides the spi-nor
framework with the number of dummy cycles to be used with each Fast Read
commands and the erase block size associated to the erase block op codes.

Finally the spi_nor_basic_flash_parameter structure, through the optional
.enable_quad_io() hook, tells the spi-nor framework how to set the Quad
Enable (QE) bit of the QSPI memory to enable its Quad SPI features.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/devices/m25p80.c        |  17 ++-
 drivers/mtd/spi-nor/atmel-quadspi.c |  83 +++++++----
 drivers/mtd/spi-nor/fsl-quadspi.c   |   8 +-
 drivers/mtd/spi-nor/mtk-quadspi.c   |  16 ++-
 drivers/mtd/spi-nor/nxp-spifi.c     |  21 +--
 drivers/mtd/spi-nor/spi-nor.c       | 278 ++++++++++++++++++++++++++++--------
 include/linux/mtd/spi-nor.h         | 136 ++++++++++++++++--
 7 files changed, 444 insertions(+), 115 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cf7fcd28034..f0a55c01406b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -111,10 +111,10 @@ static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 
 static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
 {
-	switch (nor->flash_read) {
-	case SPI_NOR_DUAL:
+	switch (SNOR_PROTO_DATA_FROM_PROTO(nor->read_proto)) {
+	case 2:
 		return 2;
-	case SPI_NOR_QUAD:
+	case 4:
 		return 4;
 	default:
 		return 0;
@@ -195,7 +195,10 @@ static int m25p_probe(struct spi_device *spi)
 	struct flash_platform_data	*data;
 	struct m25p *flash;
 	struct spi_nor *nor;
-	enum read_mode mode = SPI_NOR_NORMAL;
+	struct spi_nor_modes modes = {
+		.rd_modes = SNOR_MODE_SLOW,
+		.wr_modes = SNOR_MODE_1_1_1,
+	};
 	char *flash_name;
 	int ret;
 
@@ -221,9 +224,9 @@ static int m25p_probe(struct spi_device *spi)
 	flash->spi = spi;
 
 	if (spi->mode & SPI_RX_QUAD)
-		mode = SPI_NOR_QUAD;
+		modes.rd_modes |= SNOR_MODE_1_1_4;
 	else if (spi->mode & SPI_RX_DUAL)
-		mode = SPI_NOR_DUAL;
+		modes.rd_modes |= SNOR_MODE_1_1_2;
 
 	if (data && data->name)
 		nor->mtd.name = data->name;
@@ -240,7 +243,7 @@ static int m25p_probe(struct spi_device *spi)
 	else
 		flash_name = spi->modalias;
 
-	ret = spi_nor_scan(nor, flash_name, mode);
+	ret = spi_nor_scan(nor, flash_name, &modes);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/atmel-quadspi.c b/drivers/mtd/spi-nor/atmel-quadspi.c
index 06d1bf276dd0..d51c3db2110f 100644
--- a/drivers/mtd/spi-nor/atmel-quadspi.c
+++ b/drivers/mtd/spi-nor/atmel-quadspi.c
@@ -275,14 +275,48 @@ static void atmel_qspi_debug_command(struct atmel_qspi *aq,
 
 static int atmel_qspi_run_command(struct atmel_qspi *aq,
 				  const struct atmel_qspi_command *cmd,
-				  u32 ifr_tfrtyp, u32 ifr_width)
+				  u32 ifr_tfrtyp, enum spi_nor_protocol proto)
 {
 	u32 iar, icr, ifr, sr;
 	int err = 0;
 
 	iar = 0;
 	icr = 0;
-	ifr = ifr_tfrtyp | ifr_width;
+	ifr = ifr_tfrtyp;
+
+	/* Set the SPI protocol */
+	switch (proto) {
+	case SNOR_PROTO_1_1_1:
+		ifr |= QSPI_IFR_WIDTH_SINGLE_BIT_SPI;
+		break;
+
+	case SNOR_PROTO_1_1_2:
+		ifr |= QSPI_IFR_WIDTH_DUAL_OUTPUT;
+		break;
+
+	case SNOR_PROTO_1_1_4:
+		ifr |= QSPI_IFR_WIDTH_QUAD_OUTPUT;
+		break;
+
+	case SNOR_PROTO_1_2_2:
+		ifr |= QSPI_IFR_WIDTH_DUAL_IO;
+		break;
+
+	case SNOR_PROTO_1_4_4:
+		ifr |= QSPI_IFR_WIDTH_QUAD_IO;
+		break;
+
+	case SNOR_PROTO_2_2_2:
+		ifr |= QSPI_IFR_WIDTH_DUAL_CMD;
+		break;
+
+	case SNOR_PROTO_4_4_4:
+		ifr |= QSPI_IFR_WIDTH_QUAD_CMD;
+		break;
+
+	default:
+		return -EINVAL;
+	}
 
 	/* Compute instruction parameters */
 	if (cmd->enable.bits.instruction) {
@@ -434,7 +468,7 @@ static int atmel_qspi_read_reg(struct spi_nor *nor, u8 opcode,
 	cmd.rx_buf = buf;
 	cmd.buf_len = len;
 	return atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_READ,
-				      QSPI_IFR_WIDTH_SINGLE_BIT_SPI);
+				      nor->reg_proto);
 }
 
 static int atmel_qspi_write_reg(struct spi_nor *nor, u8 opcode,
@@ -450,7 +484,7 @@ static int atmel_qspi_write_reg(struct spi_nor *nor, u8 opcode,
 	cmd.tx_buf = buf;
 	cmd.buf_len = len;
 	return atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_WRITE,
-				      QSPI_IFR_WIDTH_SINGLE_BIT_SPI);
+				      nor->reg_proto);
 }
 
 static ssize_t atmel_qspi_write(struct spi_nor *nor, loff_t to, size_t len,
@@ -469,7 +503,7 @@ static ssize_t atmel_qspi_write(struct spi_nor *nor, loff_t to, size_t len,
 	cmd.tx_buf = write_buf;
 	cmd.buf_len = len;
 	ret = atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_WRITE_MEM,
-				     QSPI_IFR_WIDTH_SINGLE_BIT_SPI);
+				     nor->write_proto);
 	return (ret < 0) ? ret : len;
 }
 
@@ -484,7 +518,7 @@ static int atmel_qspi_erase(struct spi_nor *nor, loff_t offs)
 	cmd.instruction = nor->erase_opcode;
 	cmd.address = (u32)offs;
 	return atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_WRITE,
-				      QSPI_IFR_WIDTH_SINGLE_BIT_SPI);
+				      nor->reg_proto);
 }
 
 static ssize_t atmel_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
@@ -493,27 +527,8 @@ static ssize_t atmel_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
 	struct atmel_qspi *aq = nor->priv;
 	struct atmel_qspi_command cmd;
 	u8 num_mode_cycles, num_dummy_cycles;
-	u32 ifr_width;
 	ssize_t ret;
 
-	switch (nor->flash_read) {
-	case SPI_NOR_NORMAL:
-	case SPI_NOR_FAST:
-		ifr_width = QSPI_IFR_WIDTH_SINGLE_BIT_SPI;
-		break;
-
-	case SPI_NOR_DUAL:
-		ifr_width = QSPI_IFR_WIDTH_DUAL_OUTPUT;
-		break;
-
-	case SPI_NOR_QUAD:
-		ifr_width = QSPI_IFR_WIDTH_QUAD_OUTPUT;
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
 	if (nor->read_dummy >= 2) {
 		num_mode_cycles = 2;
 		num_dummy_cycles = nor->read_dummy - 2;
@@ -536,7 +551,7 @@ static ssize_t atmel_qspi_read(struct spi_nor *nor, loff_t from, size_t len,
 	cmd.rx_buf = read_buf;
 	cmd.buf_len = len;
 	ret = atmel_qspi_run_command(aq, &cmd, QSPI_IFR_TFRTYP_TRSFR_READ_MEM,
-				     ifr_width);
+				     nor->read_proto);
 	return (ret < 0) ? ret : len;
 }
 
@@ -598,6 +613,20 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
 	int irq, err = 0;
+	struct spi_nor_modes modes = {
+		.rd_modes = (SNOR_MODE_SLOW |
+			     SNOR_MODE_1_1_1 |
+			     SNOR_MODE_1_1_2 |
+			     SNOR_MODE_1_1_4 |
+			     SNOR_MODE_1_2_2 |
+			     SNOR_MODE_1_4_4),
+		.wr_modes = (SNOR_MODE_SLOW |
+			     SNOR_MODE_1_1_1 |
+			     SNOR_MODE_1_1_2 |
+			     SNOR_MODE_1_1_4 |
+			     SNOR_MODE_1_2_2 |
+			     SNOR_MODE_1_4_4),
+	};
 
 	if (of_get_child_count(np) != 1)
 		return -ENODEV;
@@ -688,7 +717,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
 	if (err)
 		goto disable_clk;
 
-	err = spi_nor_scan(nor, name, SPI_NOR_QUAD);
+	err = spi_nor_scan(nor, name, &modes);
 	if (err)
 		goto disable_clk;
 
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 5c82e4ef1904..01e7356d6623 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -980,6 +980,12 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
 	int ret, i = 0;
+	static const struct spi_nor_modes modes = {
+		.rd_modes = (SNOR_MODE_SLOW |
+			     SNOR_MODE_1_1_1 |
+			     SNOR_MODE_1_1_4),
+		.wr_modes = SNOR_MODE_1_1_1,
+	};
 
 	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
 	if (!q)
@@ -1081,7 +1087,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		/* set the chip address for READID */
 		fsl_qspi_set_base_addr(q, nor);
 
-		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
+		ret = spi_nor_scan(nor, NULL, &modes);
 		if (ret)
 			goto mutex_failed;
 
diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index 21c31b373cd3..c07cc2bd3fd7 100644
--- a/drivers/mtd/spi-nor/mtk-quadspi.c
+++ b/drivers/mtd/spi-nor/mtk-quadspi.c
@@ -122,20 +122,20 @@ static void mt8173_nor_set_read_mode(struct mt8173_nor *mt8173_nor)
 {
 	struct spi_nor *nor = &mt8173_nor->nor;
 
-	switch (nor->flash_read) {
-	case SPI_NOR_FAST:
+	switch (SNOR_PROTO_DATA_FROM_PROTO(nor->read_proto)) {
+	case 1:
 		writeb(nor->read_opcode, mt8173_nor->base +
 		       MTK_NOR_PRGDATA3_REG);
 		writeb(MTK_NOR_FAST_READ, mt8173_nor->base +
 		       MTK_NOR_CFG1_REG);
 		break;
-	case SPI_NOR_DUAL:
+	case 2:
 		writeb(nor->read_opcode, mt8173_nor->base +
 		       MTK_NOR_PRGDATA3_REG);
 		writeb(MTK_NOR_DUAL_READ_EN, mt8173_nor->base +
 		       MTK_NOR_DUAL_REG);
 		break;
-	case SPI_NOR_QUAD:
+	case 4:
 		writeb(nor->read_opcode, mt8173_nor->base +
 		       MTK_NOR_PRGDATA4_REG);
 		writeb(MTK_NOR_QUAD_READ_EN, mt8173_nor->base +
@@ -384,6 +384,12 @@ static int mtk_nor_init(struct mt8173_nor *mt8173_nor,
 {
 	int ret;
 	struct spi_nor *nor;
+	static const struct spi_nor_modes modes = {
+		.rd_modes = (SNOR_MODE_SLOW |
+			     SNOR_MODE_1_1_1 |
+			     SNOR_MODE_1_1_2),
+		.wr_modes = SNOR_MODE_1_1_1,
+	};
 
 	/* initialize controller to accept commands */
 	writel(MTK_NOR_ENABLE_SF_CMD, mt8173_nor->base + MTK_NOR_WRPROT_REG);
@@ -400,7 +406,7 @@ static int mtk_nor_init(struct mt8173_nor *mt8173_nor,
 	nor->write_reg = mt8173_nor_write_reg;
 	nor->mtd.name = "mtk_nor";
 	/* initialized with NULL */
-	ret = spi_nor_scan(nor, NULL, SPI_NOR_DUAL);
+	ret = spi_nor_scan(nor, NULL, &modes);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index 73a14f40928b..327c5b5fe9da 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -240,13 +240,12 @@ static int nxp_spifi_erase(struct spi_nor *nor, loff_t offs)
 
 static int nxp_spifi_setup_memory_cmd(struct nxp_spifi *spifi)
 {
-	switch (spifi->nor.flash_read) {
-	case SPI_NOR_NORMAL:
-	case SPI_NOR_FAST:
+	switch (SNOR_PROTO_DATA_FROM_PROTO(spifi->nor.read_proto)) {
+	case 1:
 		spifi->mcmd = SPIFI_CMD_FIELDFORM_ALL_SERIAL;
 		break;
-	case SPI_NOR_DUAL:
-	case SPI_NOR_QUAD:
+	case 2:
+	case 4:
 		spifi->mcmd = SPIFI_CMD_FIELDFORM_QUAD_DUAL_DATA;
 		break;
 	default:
@@ -274,7 +273,10 @@ static void nxp_spifi_dummy_id_read(struct spi_nor *nor)
 static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 				 struct device_node *np)
 {
-	enum read_mode flash_read;
+	struct spi_nor_modes modes = {
+		.rd_modes = (SNOR_MODE_SLOW | SNOR_MODE_1_1_1),
+		.wr_modes = SNOR_MODE_1_1_1,
+	};
 	u32 ctrl, property;
 	u16 mode = 0;
 	int ret;
@@ -308,13 +310,12 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 
 	if (mode & SPI_RX_DUAL) {
 		ctrl |= SPIFI_CTRL_DUAL;
-		flash_read = SPI_NOR_DUAL;
+		modes.rd_modes |= SNOR_MODE_1_1_2;
 	} else if (mode & SPI_RX_QUAD) {
 		ctrl &= ~SPIFI_CTRL_DUAL;
-		flash_read = SPI_NOR_QUAD;
+		modes.rd_modes |= SNOR_MODE_1_1_4;
 	} else {
 		ctrl |= SPIFI_CTRL_DUAL;
-		flash_read = SPI_NOR_NORMAL;
 	}
 
 	switch (mode & (SPI_CPHA | SPI_CPOL)) {
@@ -351,7 +352,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 	 */
 	nxp_spifi_dummy_id_read(&spifi->nor);
 
-	ret = spi_nor_scan(&spifi->nor, NULL, flash_read);
+	ret = spi_nor_scan(&spifi->nor, NULL, &modes);
 	if (ret) {
 		dev_err(spifi->dev, "device scan failed\n");
 		return ret;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e484bfe54c36..29ba0e665fac 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -143,24 +143,6 @@ static int read_cr(struct spi_nor *nor)
 }
 
 /*
- * Dummy Cycle calculation for different type of read.
- * It can be used to support more commands with
- * different dummy cycle requirements.
- */
-static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
-{
-	switch (nor->flash_read) {
-	case SPI_NOR_FAST:
-	case SPI_NOR_DUAL:
-	case SPI_NOR_QUAD:
-		return 8;
-	case SPI_NOR_NORMAL:
-		return 0;
-	}
-	return 0;
-}
-
-/*
  * Write status register 1 byte
  * Returns negative if error occurred.
  */
@@ -1367,8 +1349,204 @@ static int spi_nor_check(struct spi_nor *nor)
 	return 0;
 }
 
-int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
+static inline void spi_nor_set_read_settings(struct spi_nor_read *read,
+					     u8 num_mode_clocks,
+					     u8 num_wait_states,
+					     u8 opcode)
+{
+	read->num_mode_clocks = num_mode_clocks;
+	read->num_wait_states = num_wait_states;
+	read->opcode = opcode;
+}
+
+static inline void spi_nor_set_erase_settings(struct spi_nor_erase_type *erase,
+					      u8 size, u8 opcode)
+{
+	erase->size = size;
+	erase->opcode = opcode;
+}
+
+static int spi_nor_init_params(struct spi_nor *nor,
+			       const struct flash_info *info,
+			       struct spi_nor_basic_flash_parameter *params)
+{
+	// TODO: parse SFDP table
+
+	/* If SFDP tables are not available, use legacy settings. */
+	memset(params, 0, sizeof(*params));
+
+	/* (Fast) Read settings. */
+	params->rd_modes = SNOR_MODE_1_1_1;
+	spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_1_1_1],
+				  0, 8, SPINOR_OP_READ_FAST);
+	if (!(info->flags & SPI_NOR_NO_FR)) {
+		params->rd_modes |= SNOR_MODE_SLOW;
+		spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_SLOW],
+					  0, 0, SPINOR_OP_READ);
+	}
+	if (info->flags & SPI_NOR_DUAL_READ) {
+		params->rd_modes |= SNOR_MODE_1_1_2;
+		spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_1_1_2],
+					  0, 8, SPINOR_OP_READ_1_1_2);
+	}
+	if (info->flags & SPI_NOR_QUAD_READ) {
+		params->rd_modes|= SNOR_MODE_1_1_4;
+		spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_1_1_4],
+					  0, 8, SPINOR_OP_READ_1_1_4);
+	}
+
+	/* Page Program settings. */
+	params->wr_modes = SNOR_MODE_1_1_1;
+	params->page_programs[SNOR_PINDEX_1_1_1] = SPINOR_OP_PP;
+
+	/* Sector Erase settings. */
+	spi_nor_set_erase_settings(&params->erase_types[0],
+				   SNOR_ERASE_64K, SPINOR_OP_SE);
+	if (info->flags & SECT_4K)
+		spi_nor_set_erase_settings(&params->erase_types[1],
+					   SNOR_ERASE_4K, SPINOR_OP_BE_4K);
+	else if (info->flags & SECT_4K_PMC)
+		spi_nor_set_erase_settings(&params->erase_types[1],
+					   SNOR_ERASE_4K, SPINOR_OP_BE_4K_PMC);
+
+	/* Select the procedure to set the Quad Enable bit. */
+	if (params->rd_modes & (SNOR_MODE_1_1_4 |
+				SNOR_MODE_1_4_4 |
+				SNOR_MODE_4_4_4)) {
+		switch (JEDEC_MFR(info)) {
+		case SNOR_MFR_MACRONIX:
+			params->enable_quad_io = macronix_quad_enable;
+			break;
+
+		case SNOR_MFR_MICRON:
+			break;
+
+		default:
+			params->enable_quad_io = spansion_quad_enable;
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static int spi_nor_pindex2proto(int pindex, enum spi_nor_protocol *proto)
+{
+	enum spi_nor_protocol_width pwidth;
+	enum spi_nor_protocol_class pclass;
+	uint8_t width;
+
+	if (pindex < 0)
+		return -EINVAL;
+
+	pwidth = (enum spi_nor_protocol_width)(pindex / SNOR_PCLASS_MAX);
+	pclass = (enum spi_nor_protocol_class)(pindex % SNOR_PCLASS_MAX);
+
+	width = (1 << pwidth) & 0xf;
+	if (!width)
+		return -EINVAL;
+
+	switch (pclass) {
+	case SNOR_PCLASS_1_1_N:
+		*proto = SNOR_PROTO(1, 1, width);
+		break;
+
+	case SNOR_PCLASS_1_N_N:
+		*proto = SNOR_PROTO(1, width, width);
+		break;
+
+	case SNOR_PCLASS_N_N_N:
+		*proto = SNOR_PROTO(width, width, width);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
+			 const struct spi_nor_basic_flash_parameter *params,
+			 const struct spi_nor_modes *modes)
 {
+	bool enable_quad_io;
+	u32 rd_modes, wr_modes, mask;
+	const struct spi_nor_erase_type *erase_type = NULL;
+	const struct spi_nor_read *read;
+	int rd_pindex, wr_pindex, i, err = 0;
+	u8 erase_size = SNOR_ERASE_64K;
+
+	/* 2-2-2 or 4-4-4 modes are not supported yet. */
+	mask = (SNOR_MODE_2_2_2 | SNOR_MODE_4_4_4);
+	rd_modes = modes->rd_modes & ~mask;
+	wr_modes = modes->wr_modes & ~mask;
+
+	/* Setup read operation. */
+	rd_pindex = fls(params->rd_modes & rd_modes) - 1;
+	if (spi_nor_pindex2proto(rd_pindex, &nor->read_proto)) {
+		dev_err(nor->dev, "invalid (fast) read\n");
+		return -EINVAL;
+	}
+	read = &params->reads[rd_pindex];
+	nor->read_opcode = read->opcode;
+	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
+
+	/* Set page program op code and protocol. */
+	wr_pindex = fls(params->wr_modes & wr_modes) - 1;
+	if (spi_nor_pindex2proto(wr_pindex, &nor->write_proto)) {
+		dev_err(nor->dev, "invalid page program\n");
+		return -EINVAL;
+	}
+	nor->program_opcode = params->page_programs[wr_pindex];
+
+	/* Set sector erase op code and size. */
+	erase_type = &params->erase_types[0];
+#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
+	erase_size = SNOR_ERASE_4K;
+#endif
+	for (i = 0; i < SNOR_MAX_ERASE_TYPES; ++i) {
+		if (params->erase_types[i].size == erase_size) {
+			erase_type = &params->erase_types[i];
+			break;
+		}
+	}
+	nor->erase_opcode = erase_type->opcode;
+	nor->mtd.erasesize = (1 << erase_type->size);
+
+
+	enable_quad_io = (SNOR_PROTO_DATA_FROM_PROTO(nor->read_proto) == 4 ||
+			  SNOR_PROTO_DATA_FROM_PROTO(nor->write_proto) == 4);
+
+	/* Enable Quad I/O if needed. */
+	if (enable_quad_io && params->enable_quad_io) {
+		err = params->enable_quad_io(nor);
+		if (err) {
+			dev_err(nor->dev,
+				"failed to enable the Quad I/O mode\n");
+			return err;
+		}
+	}
+
+	dev_dbg(nor->dev,
+		"(Fast) Read:  opcode=%02Xh, protocol=%03x, mode=%u, wait=%u\n",
+		nor->read_opcode, nor->read_proto,
+		read->num_mode_clocks, read->num_wait_states);
+	dev_dbg(nor->dev,
+		"Page Program: opcode=%02Xh, protocol=%03x\n",
+		nor->program_opcode, nor->write_proto);
+	dev_dbg(nor->dev,
+		"Sector Erase: opcode=%02Xh, protocol=%03x, sector size=%u\n",
+		nor->erase_opcode, nor->reg_proto, (u32)nor->mtd.erasesize);
+
+	return 0;
+}
+
+int spi_nor_scan(struct spi_nor *nor, const char *name,
+		 const struct spi_nor_modes *modes)
+{
+	struct spi_nor_basic_flash_parameter params;
+	struct spi_nor_modes fixed_modes = *modes;
 	const struct flash_info *info = NULL;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = &nor->mtd;
@@ -1380,6 +1558,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (ret)
 		return ret;
 
+	/* Reset SPI protocol for all commands */
+	nor->reg_proto = SNOR_PROTO_1_1_1;
+	nor->read_proto = SNOR_PROTO_1_1_1;
+	nor->write_proto = SNOR_PROTO_1_1_1;
+
 	if (name)
 		info = spi_nor_match_id(name);
 	/* Try to auto-detect if chip name wasn't specified or not found */
@@ -1412,6 +1595,11 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		}
 	}
 
+	/* Parse the Serial Flash Discoverable Parameters table */
+	ret = spi_nor_init_params(nor, info, &params);
+	if (ret)
+		return ret;
+
 	mutex_init(&nor->lock);
 
 	/*
@@ -1488,51 +1676,31 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (np) {
 		/* If we were instantiated by DT, use it */
 		if (of_property_read_bool(np, "m25p,fast-read"))
-			nor->flash_read = SPI_NOR_FAST;
+			fixed_modes.rd_modes |= SNOR_MODE_1_1_1;
 		else
-			nor->flash_read = SPI_NOR_NORMAL;
+			fixed_modes.rd_modes &= ~SNOR_MODE_1_1_1;
 	} else {
 		/* If we weren't instantiated by DT, default to fast-read */
-		nor->flash_read = SPI_NOR_FAST;
+		fixed_modes.rd_modes |= SNOR_MODE_1_1_1;
 	}
 
 	/* Some devices cannot do fast-read, no matter what DT tells us */
 	if (info->flags & SPI_NOR_NO_FR)
-		nor->flash_read = SPI_NOR_NORMAL;
-
-	/* Quad/Dual-read mode takes precedence over fast/normal */
-	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
-		ret = set_quad_mode(nor, info);
-		if (ret) {
-			dev_err(dev, "quad mode not supported\n");
-			return ret;
-		}
-		nor->flash_read = SPI_NOR_QUAD;
-	} else if (mode == SPI_NOR_DUAL && info->flags & SPI_NOR_DUAL_READ) {
-		nor->flash_read = SPI_NOR_DUAL;
-	}
-
-	/* Default commands */
-	switch (nor->flash_read) {
-	case SPI_NOR_QUAD:
-		nor->read_opcode = SPINOR_OP_READ_1_1_4;
-		break;
-	case SPI_NOR_DUAL:
-		nor->read_opcode = SPINOR_OP_READ_1_1_2;
-		break;
-	case SPI_NOR_FAST:
-		nor->read_opcode = SPINOR_OP_READ_FAST;
-		break;
-	case SPI_NOR_NORMAL:
-		nor->read_opcode = SPINOR_OP_READ;
-		break;
-	default:
-		dev_err(dev, "No Read opcode defined\n");
-		return -EINVAL;
-	}
+		fixed_modes.rd_modes &= ~SNOR_MODE_1_1_1;
 
 	nor->program_opcode = SPINOR_OP_PP;
 
+	/*
+	 * Configure the SPI memory:
+	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
+	 * - set the number of dummy cycles (mode cycles + wait states).
+	 * - set the SPI protocols for register and memory accesses.
+	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
+	 */
+	ret = spi_nor_setup(nor, info, &params, &fixed_modes);
+	if (ret)
+		return ret;
+
 	if (info->addr_width)
 		nor->addr_width = info->addr_width;
 	else if (mtd->size > 0x1000000) {
@@ -1553,8 +1721,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		return -EINVAL;
 	}
 
-	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
-
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 8b02fd7864d0..730f33dce1ea 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -110,11 +110,124 @@
 /* Configuration Register bits. */
 #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
 
-enum read_mode {
-	SPI_NOR_NORMAL = 0,
-	SPI_NOR_FAST,
-	SPI_NOR_DUAL,
-	SPI_NOR_QUAD,
+
+/* Supported SPI protocols */
+enum spi_nor_protocol_class {
+	SNOR_PCLASS_1_1_N,
+	SNOR_PCLASS_1_N_N,
+	SNOR_PCLASS_N_N_N,
+
+	SNOR_PCLASS_MAX
+};
+
+enum spi_nor_protocol_width {
+	SNOR_PWIDTH_1,
+	SNOR_PWIDTH_2,
+	SNOR_PWIDTH_4,
+	SNOR_PWIDTH_8,
+};
+
+/* The encoding is chosen so the higher index the higher priority */
+#define SNOR_PINDEX(pwidth, pclass) \
+	((pwidth) * SNOR_PCLASS_MAX + (pclass))
+enum spi_nor_protocol_index {
+	SNOR_PINDEX_SLOW  = SNOR_PINDEX(SNOR_PWIDTH_1, SNOR_PCLASS_1_1_N),
+	/* Little trick to make the difference between Read and Fast Read commands. */
+	SNOR_PINDEX_1_1_1 = SNOR_PINDEX(SNOR_PWIDTH_1, SNOR_PCLASS_1_N_N),
+	SNOR_PINDEX_1_1_2 = SNOR_PINDEX(SNOR_PWIDTH_2, SNOR_PCLASS_1_1_N),
+	SNOR_PINDEX_1_2_2 = SNOR_PINDEX(SNOR_PWIDTH_2, SNOR_PCLASS_1_N_N),
+	SNOR_PINDEX_2_2_2 = SNOR_PINDEX(SNOR_PWIDTH_2, SNOR_PCLASS_N_N_N),
+	SNOR_PINDEX_1_1_4 = SNOR_PINDEX(SNOR_PWIDTH_4, SNOR_PCLASS_1_1_N),
+	SNOR_PINDEX_1_4_4 = SNOR_PINDEX(SNOR_PWIDTH_4, SNOR_PCLASS_1_N_N),
+	SNOR_PINDEX_4_4_4 = SNOR_PINDEX(SNOR_PWIDTH_4, SNOR_PCLASS_N_N_N),
+
+	SNOR_PINDEX_MAX
+};
+
+#define SNOR_MODE_SLOW		BIT(SNOR_PINDEX_SLOW)
+#define SNOR_MODE_1_1_1		BIT(SNOR_PINDEX_1_1_1)
+#define SNOR_MODE_1_1_2		BIT(SNOR_PINDEX_1_1_2)
+#define SNOR_MODE_1_2_2		BIT(SNOR_PINDEX_1_2_2)
+#define SNOR_MODE_2_2_2		BIT(SNOR_PINDEX_2_2_2)
+#define SNOR_MODE_1_1_4		BIT(SNOR_PINDEX_1_1_4)
+#define SNOR_MODE_1_4_4		BIT(SNOR_PINDEX_1_4_4)
+#define SNOR_MODE_4_4_4		BIT(SNOR_PINDEX_4_4_4)
+
+struct spi_nor_modes {
+	u32	rd_modes;	/* supported SPI modes for (Fast) Read */
+	u32	wr_modes;	/* supported SPI modes for Page Program */
+};
+
+
+struct spi_nor_read {
+	u8	num_wait_states:5;
+	u8	num_mode_clocks:3;
+	u8	opcode;
+};
+
+struct spi_nor_erase_type {
+	u8	size;	/* specifies 'N' so erase size = 2^N */
+	u8	opcode;
+};
+
+#define SNOR_ERASE_64K		0x10
+#define SNOR_ERASE_32K		0x0f
+#define SNOR_ERASE_4K		0x0c
+
+struct spi_nor;
+
+#define SNOR_MAX_ERASE_TYPES	4
+
+struct spi_nor_basic_flash_parameter {
+	/* Fast Read settings */
+	u32				rd_modes;
+	struct spi_nor_read		reads[SNOR_PINDEX_MAX];
+
+	/* Page Program settings */
+	u32				wr_modes;
+	u8				page_programs[SNOR_PINDEX_MAX];
+
+	/* Sector Erase settings */
+	struct spi_nor_erase_type	erase_types[SNOR_MAX_ERASE_TYPES];
+
+	int (*enable_quad_io)(struct spi_nor *nor);
+};
+
+
+#define SNOR_PROTO_CODE_OFF	8
+#define SNOR_PROTO_CODE_MASK	GENMASK(11, 8)
+#define SNOR_PROTO_CODE_TO_PROTO(code) \
+	(((code) << SNOR_PROTO_CODE_OFF) & SNOR_PROTO_CODE_MASK)
+#define SNOR_PROTO_CODE_FROM_PROTO(proto) \
+	((((u32)(proto)) & SNOR_PROTO_CODE_MASK) >> SNOR_PROTO_CODE_OFF)
+
+#define SNOR_PROTO_ADDR_OFF	4
+#define SNOR_PROTO_ADDR_MASK	GENMASK(7, 4)
+#define SNOR_PROTO_ADDR_TO_PROTO(addr) \
+	(((addr) << SNOR_PROTO_ADDR_OFF) & SNOR_PROTO_ADDR_MASK)
+#define SNOR_PROTO_ADDR_FROM_PROTO(proto) \
+	((((u32)(proto)) & SNOR_PROTO_ADDR_MASK) >> SNOR_PROTO_ADDR_OFF)
+
+#define SNOR_PROTO_DATA_OFF	0
+#define SNOR_PROTO_DATA_MASK	GENMASK(3, 0)
+#define SNOR_PROTO_DATA_TO_PROTO(data) \
+	(((data) << SNOR_PROTO_DATA_OFF) & SNOR_PROTO_DATA_MASK)
+#define SNOR_PROTO_DATA_FROM_PROTO(proto) \
+	((((u32)(proto)) & SNOR_PROTO_DATA_MASK) >> SNOR_PROTO_DATA_OFF)
+
+#define SNOR_PROTO(code, addr, data)	  \
+	(SNOR_PROTO_CODE_TO_PROTO(code) |   \
+	 SNOR_PROTO_ADDR_TO_PROTO(addr) | \
+	 SNOR_PROTO_DATA_TO_PROTO(data))
+
+enum spi_nor_protocol {
+	SNOR_PROTO_1_1_1 = SNOR_PROTO(1, 1, 1),	/* SPI */
+	SNOR_PROTO_1_1_2 = SNOR_PROTO(1, 1, 2),	/* Dual Output */
+	SNOR_PROTO_1_1_4 = SNOR_PROTO(1, 1, 4),	/* Quad Output */
+	SNOR_PROTO_1_2_2 = SNOR_PROTO(1, 2, 2),	/* Dual IO */
+	SNOR_PROTO_1_4_4 = SNOR_PROTO(1, 4, 4),	/* Quad IO */
+	SNOR_PROTO_2_2_2 = SNOR_PROTO(2, 2, 2),	/* Dual Command */
+	SNOR_PROTO_4_4_4 = SNOR_PROTO(4, 4, 4),	/* Quad Command */
 };
 
 #define SPI_NOR_MAX_CMD_SIZE	8
@@ -142,9 +255,11 @@ enum spi_nor_option_flags {
  * @read_opcode:	the read opcode
  * @read_dummy:		the dummy needed by the read operation
  * @program_opcode:	the program opcode
- * @flash_read:		the mode of the read
  * @sst_write_second:	used by the SST write operation
  * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
+ * @read_proto:		the SPI protocol used by read operations
+ * @write_proto:	the SPI protocol used by write operations
+ * @reg_proto		the SPI protocol used by read_reg/write_reg operations
  * @cmd_buf:		used by the write_reg
  * @prepare:		[OPTIONAL] do some preparations for the
  *			read/write/erase/lock/unlock operations
@@ -173,7 +288,9 @@ struct spi_nor {
 	u8			read_opcode;
 	u8			read_dummy;
 	u8			program_opcode;
-	enum read_mode		flash_read;
+	enum spi_nor_protocol	read_proto;
+	enum spi_nor_protocol	write_proto;
+	enum spi_nor_protocol	reg_proto;
 	bool			sst_write_second;
 	u32			flags;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
@@ -211,7 +328,7 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
  * spi_nor_scan() - scan the SPI NOR
  * @nor:	the spi_nor structure
  * @name:	the chip type name
- * @mode:	the read mode supported by the driver
+ * @modes:	the SPI modes supported by the controller driver
  *
  * The drivers can use this fuction to scan the SPI NOR.
  * In the scanning, it will try to get all the necessary information to
@@ -221,6 +338,7 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
  *
  * Return: 0 for success, others for failure.
  */
-int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode);
+int spi_nor_scan(struct spi_nor *nor, const char *name,
+		 const struct spi_nor_modes *modes);
 
 #endif
-- 
1.8.2.2
