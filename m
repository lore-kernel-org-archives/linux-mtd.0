Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqOXJ-0001jD-LB
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 17:25:12 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH RFC 4/8] mtd: spi-nor: fix support of Dual (x-y-2) and Quad
 (x-y-4) SPI protocols
Date: Wed, 13 Apr 2016 19:23:36 +0200
Message-ID: <abc2b9a65c6934226ee958a87664c91877224aff.1460567256.git.cyrille.pitchen@atmel.com>
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

The quad (or dual) mode of a spi-nor memory may be enabled at boot time by
non-volatile bits in some setting register. Also such a mode may have
already been enabled at early stage by some boot loader.

Hence, we should not guess the spi-nor memory is always configured for the
regular SPI 1-1-1 protocol.

When other SPI modes such as SPI 2-2-2 or SPI 4-4-4 are already enabled,
some manufacturers (Micron, Macronix, ...) require to use a new dedicated
op code AFh to read the JEDEC ID.

Moreover, the procedures to enter/leave the 4-4-4 or 2-2-2 modes or to
enable the Quad Enable bits also depend on the memory's manufacturer.
Here again, some manufucturers have updated/fixed their procedure, hence
some procedures might not always be the same for a given manufacturer.

Also, depending on the SPI protocols for (Fast) Read, Page Program or
Sector Erase operations, the op codes might not be the same between
manufacturers and in some cases between memory parts all sharing the
same JEDEC ID (Micron n25q256*).

So to deal with all those issues, this patch extends the spi-nor framework
so basic flash parameters can be provided for each entry in the
spi_nor_ids[] table.

Finally, the spi_nor_scan() prototype has been changed: the enum read_mode
has been replaced by a struct spi_nor_modes so each SPI controller driver
can precisely declare the lists of SPI modes it supports for (Fast) Read
and Page Program operations. Equivalent lists are also available at the
memory side so the best match is selected.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/devices/m25p80.c      |  18 +--
 drivers/mtd/spi-nor/fsl-quadspi.c |   9 +-
 drivers/mtd/spi-nor/mtk-quadspi.c |  17 ++-
 drivers/mtd/spi-nor/nxp-spifi.c   |  22 ++--
 drivers/mtd/spi-nor/spi-nor.c     | 253 +++++++++++++++++++++++++++++---------
 include/linux/mtd/spi-nor.h       | 138 +++++++++++++++++++--
 6 files changed, 365 insertions(+), 92 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9d6854467651..12112f7ae1a4 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -105,10 +105,10 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 
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
@@ -184,7 +184,11 @@ static int m25p_probe(struct spi_device *spi)
 	struct flash_platform_data	*data;
 	struct m25p *flash;
 	struct spi_nor *nor;
-	enum read_mode mode = SPI_NOR_NORMAL;
+	struct spi_nor_modes modes = {
+		.id_modes = SNOR_MODE_1_1_1,
+		.rd_modes = SNOR_MODE_SLOW,
+		.wr_modes = SNOR_MODE_1_1_1,
+	};
 	char *flash_name;
 	int ret;
 
@@ -210,9 +214,9 @@ static int m25p_probe(struct spi_device *spi)
 	flash->spi = spi;
 
 	if (spi->mode & SPI_RX_QUAD)
-		mode = SPI_NOR_QUAD;
+		modes.rd_modes |= SNOR_MODE_1_1_4;
 	else if (spi->mode & SPI_RX_DUAL)
-		mode = SPI_NOR_DUAL;
+		modes.rd_modes |= SNOR_MODE_1_1_2;
 
 	if (data && data->name)
 		nor->mtd.name = data->name;
@@ -229,7 +233,7 @@ static int m25p_probe(struct spi_device *spi)
 	else
 		flash_name = spi->modalias;
 
-	ret = spi_nor_scan(nor, flash_name, mode);
+	ret = spi_nor_scan(nor, flash_name, &modes);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 9ab2b51d54b8..2eaf60711013 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -979,6 +979,13 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
 	int ret, i = 0;
+	struct spi_nor_modes modes = {
+		.id_modes = SNOR_MODE_1_1_1,
+		.rd_modes = (SNOR_MODE_SLOW |
+			     SNOR_MODE_1_1_1 |
+			     SNOR_MODE_1_1_4),
+		.wr_modes = SNOR_MODE_1_1_1,
+	};
 
 	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
 	if (!q)
@@ -1080,7 +1087,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 		/* set the chip address for READID */
 		fsl_qspi_set_base_addr(q, nor);
 
-		ret = spi_nor_scan(nor, NULL, SPI_NOR_QUAD);
+		ret = spi_nor_scan(nor, NULL, &modes);
 		if (ret)
 			goto mutex_failed;
 
diff --git a/drivers/mtd/spi-nor/mtk-quadspi.c b/drivers/mtd/spi-nor/mtk-quadspi.c
index 8bed1a4cb79c..928031520d73 100644
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
@@ -376,6 +376,13 @@ static int mtk_nor_init(struct mt8173_nor *mt8173_nor,
 {
 	int ret;
 	struct spi_nor *nor;
+	struct spi_nor_modes modes = {
+		.id_modes = SNOR_MODE_1_1_1,
+		.rd_modes = (SNOR_MODE_SLOW |
+			     SNOR_MODE_1_1_1 |
+			     SNOR_MODE_1_1_2),
+		.wr_modes = SNOR_MODE_1_1_1,
+	};
 
 	/* initialize controller to accept commands */
 	writel(MTK_NOR_ENABLE_SF_CMD, mt8173_nor->base + MTK_NOR_WRPROT_REG);
@@ -392,7 +399,7 @@ static int mtk_nor_init(struct mt8173_nor *mt8173_nor,
 	nor->write_reg = mt8173_nor_write_reg;
 	nor->mtd.name = "mtk_nor";
 	/* initialized with NULL */
-	ret = spi_nor_scan(nor, NULL, SPI_NOR_DUAL);
+	ret = spi_nor_scan(nor, NULL, &modes);
 	if (ret)
 		return ret;
 
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index ae428cb0e04b..c0254c37f198 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -237,13 +237,12 @@ static int nxp_spifi_erase(struct spi_nor *nor, loff_t offs)
 
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
@@ -271,7 +270,11 @@ static void nxp_spifi_dummy_id_read(struct spi_nor *nor)
 static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 				 struct device_node *np)
 {
-	enum read_mode flash_read;
+	struct spi_nor_modes modes = {
+		.id_modes = SNOR_MODE_1_1_1,
+		.rd_modes = (SNOR_MODE_SLOW | SNOR_MODE_1_1_1),
+		.wr_modes = SNOR_MODE_1_1_1,
+	};
 	u32 ctrl, property;
 	u16 mode = 0;
 	int ret;
@@ -305,13 +308,12 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 
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
@@ -348,7 +350,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 	 */
 	nxp_spifi_dummy_id_read(&spifi->nor);
 
-	ret = spi_nor_scan(&spifi->nor, NULL, flash_read);
+	ret = spi_nor_scan(&spifi->nor, NULL, &modes);
 	if (ret) {
 		dev_err(spifi->dev, "device scan failed\n");
 		return ret;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 54115aface9f..3573cc708b16 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -79,6 +79,8 @@ struct flash_info {
 					 * Use dedicated 4byte address op codes
 					 * to support memory size above 128Mib.
 					 */
+
+	const struct spi_nor_basic_flash_parameter *params;
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -143,24 +145,6 @@ static int read_cr(struct spi_nor *nor)
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
@@ -1073,13 +1057,19 @@ static const struct flash_info spi_nor_ids[] = {
 	{ },
 };
 
-static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
+static const struct flash_info *
+spi_nor_read_id(struct spi_nor *nor,
+		const struct spi_nor_basic_flash_parameter *params,
+		u32 id_modes)
 {
 	int			tmp;
 	u8			id[SPI_NOR_MAX_ID_LEN];
 	const struct flash_info	*info;
 
-	tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, SPI_NOR_MAX_ID_LEN);
+	if (params && params->read_id)
+		tmp = params->read_id(nor, id, sizeof(id), id_modes);
+	else
+		tmp = nor->read_reg(nor, SPINOR_OP_RDID, id, sizeof(id));
 	if (tmp < 0) {
 		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", tmp);
 		return ERR_PTR(tmp);
@@ -1329,8 +1319,159 @@ static int spi_nor_check(struct spi_nor *nor)
 	return 0;
 }
 
-int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
+static int spi_nor_midx2proto(int midx, enum spi_nor_protocol *proto)
 {
+	switch (midx) {
+	case SNOR_MIDX_SLOW:
+	case SNOR_MIDX_1_1_1:
+		*proto = SNOR_PROTO_1_1_1;
+		break;
+
+	case SNOR_MIDX_1_1_2:
+		*proto = SNOR_PROTO_1_1_2;
+		break;
+
+	case SNOR_MIDX_1_2_2:
+		*proto = SNOR_PROTO_1_2_2;
+		break;
+
+	case SNOR_MIDX_2_2_2:
+		*proto = SNOR_PROTO_2_2_2;
+		break;
+
+	case SNOR_MIDX_1_1_4:
+		*proto = SNOR_PROTO_1_1_4;
+		break;
+
+	case SNOR_MIDX_1_4_4:
+		*proto = SNOR_PROTO_1_4_4;
+		break;
+
+	case SNOR_MIDX_4_4_4:
+		*proto = SNOR_PROTO_4_4_4;
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
+{
+	bool enable_quad_io, enable_4_4_4, enable_2_2_2;
+	u32 rd_modes, wr_modes, cmd_modes, mask;
+	const struct spi_nor_erase_type *erase_type;
+	const struct spi_nor_read *read;
+	int rd_midx, wr_midx, err = 0;
+
+	/* 2-2-2 or 4-4-4 modes must be supported by BOTH read and write */
+	mask = (SNOR_MODE_2_2_2 | SNOR_MODE_4_4_4);
+	cmd_modes = (modes->rd_modes & modes->wr_modes) & mask;
+	rd_modes = (modes->rd_modes & ~mask) | cmd_modes;
+	wr_modes = (modes->wr_modes & ~mask) | cmd_modes;
+
+	/* Setup read operation. */
+	rd_midx = fls(params->rd_modes & rd_modes) - 1;
+	if (spi_nor_midx2proto(rd_midx, &nor->read_proto)) {
+		dev_err(nor->dev, "invalid (fast) read\n");
+		return -EINVAL;
+	}
+	read = &params->reads[rd_midx];
+	nor->read_opcode = read->opcode;
+	nor->read_dummy = read->num_mode_clocks + read->num_wait_states;
+
+	/* Set page program op code and protocol. */
+	wr_midx = fls(params->wr_modes & wr_modes) - 1;
+	if (spi_nor_midx2proto(wr_midx, &nor->write_proto)) {
+		dev_err(nor->dev, "invalid page program\n");
+		return -EINVAL;
+	}
+	nor->program_opcode = params->page_programs[wr_midx];
+
+	/* Set sector erase op code and size. */
+	erase_type = &params->erase_types[0];
+#ifdef CONFIG_MTD_SPI_NOR_USE_4K_SECTORS
+	for (i = 1; i < SNOR_MAX_ERASE_TYPES; ++i)
+		if (params->erase_types[i].size == 0x0c)
+			erase_type = &params->erase_types[i];
+#endif
+	nor->erase_opcode = erase_type->opcode;
+	nor->mtd.erasesize = (1 << erase_type->size);
+
+
+	enable_quad_io = (SNOR_PROTO_DATA_FROM_PROTO(nor->read_proto) == 4 ||
+			  SNOR_PROTO_DATA_FROM_PROTO(nor->write_proto) == 4);
+	enable_4_4_4 = (nor->read_proto == SNOR_PROTO_4_4_4);
+	enable_2_2_2 = (nor->read_proto == SNOR_PROTO_2_2_2);
+
+	/* Enable Quad I/O if needed. */
+	if ((enable_quad_io || enable_4_4_4) &&
+	    params->enable_quad_io &&
+	    nor->reg_proto != SNOR_PROTO_4_4_4) {
+		err = params->enable_quad_io(nor, true);
+		if (err) {
+			dev_err(nor->dev,
+				"failed to enable the Quad I/O mode\n");
+			return err;
+		}
+	}
+
+	/* Enter/Leave 2-2-2 or 4-4-4 if needed. */
+	if (enable_2_2_2 && params->enable_2_2_2 &&
+	    nor->reg_proto != SNOR_PROTO_2_2_2)
+		err = params->enable_2_2_2(nor, true);
+	else if (enable_4_4_4 && params->enable_4_4_4 &&
+		 nor->reg_proto != SNOR_PROTO_4_4_4)
+		err = params->enable_4_4_4(nor, true);
+	else if (!enable_2_2_2 && params->enable_2_2_2 &&
+		 nor->reg_proto == SNOR_PROTO_2_2_2)
+		err = params->enable_2_2_2(nor, false);
+	else if (!enable_4_4_4 && params->enable_4_4_4 &&
+		 nor->reg_proto == SNOR_PROTO_4_4_4)
+		err = params->enable_4_4_4(nor, false);
+	if (err)
+		return err;
+
+	/*
+	 * Fix erase protocol if needed, read and write protocols should
+	 * already be valid.
+	 */
+	switch (nor->reg_proto) {
+	case SNOR_PROTO_4_4_4:
+		nor->erase_proto = SNOR_PROTO_4_4_4;
+		break;
+
+	case SNOR_PROTO_2_2_2:
+		nor->erase_proto = SNOR_PROTO_2_2_2;
+		break;
+
+	default:
+		nor->erase_proto = SNOR_PROTO_1_1_1;
+		break;
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
+		"Sector Erase: opcode=%02Xh, protocol=%03x, sector size=%zu\n",
+		nor->erase_opcode, nor->erase_proto, nor->mtd.erasesize);
+
+	return 0;
+}
+
+int spi_nor_scan(struct spi_nor *nor, const char *name,
+		 struct spi_nor_modes *modes)
+{
+	const struct spi_nor_basic_flash_parameter *params = NULL;
 	const struct flash_info *info = NULL;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = &nor->mtd;
@@ -1342,11 +1483,17 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (ret)
 		return ret;
 
+	/* Reset SPI protocol for all commands */
+	nor->erase_proto = SNOR_PROTO_1_1_1;
+	nor->read_proto = SNOR_PROTO_1_1_1;
+	nor->write_proto = SNOR_PROTO_1_1_1;
+	nor->reg_proto = SNOR_PROTO_1_1_1;
+
 	if (name)
 		info = spi_nor_match_id(name);
 	/* Try to auto-detect if chip name wasn't specified or not found */
 	if (!info)
-		info = spi_nor_read_id(nor);
+		info = spi_nor_read_id(nor, NULL, 0);
 	if (IS_ERR_OR_NULL(info))
 		return -ENOENT;
 
@@ -1357,7 +1504,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (name && info->id_len) {
 		const struct flash_info *jinfo;
 
-		jinfo = spi_nor_read_id(nor);
+		jinfo = spi_nor_read_id(nor, info->params, modes->id_modes);
 		if (IS_ERR(jinfo)) {
 			return PTR_ERR(jinfo);
 		} else if (jinfo->id_len != info->id_len ||
@@ -1374,6 +1521,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 			info = jinfo;
 		}
 	}
+	params = info->params;
 
 	mutex_init(&nor->lock);
 
@@ -1451,51 +1599,42 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	if (np) {
 		/* If we were instantiated by DT, use it */
 		if (of_property_read_bool(np, "m25p,fast-read"))
-			nor->flash_read = SPI_NOR_FAST;
+			modes->rd_modes |= SNOR_MODE_1_1_1;
 		else
-			nor->flash_read = SPI_NOR_NORMAL;
+			modes->rd_modes &= ~SNOR_MODE_1_1_1;
 	} else {
 		/* If we weren't instantiated by DT, default to fast-read */
-		nor->flash_read = SPI_NOR_FAST;
+		modes->rd_modes |= SNOR_MODE_1_1_1;
 	}
 
 	/* Some devices cannot do fast-read, no matter what DT tells us */
 	if (info->flags & SPI_NOR_NO_FR)
-		nor->flash_read = SPI_NOR_NORMAL;
+		modes->rd_modes &= ~SNOR_MODE_1_1_1;
 
-	/* Quad/Dual-read mode takes precedence over fast/normal */
-	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
-		ret = set_quad_mode(nor, info);
-		if (ret) {
-			dev_err(dev, "quad mode not supported\n");
+	nor->program_opcode = SPINOR_OP_PP;
+
+	/*
+	 * Configure the SPI memory:
+	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
+	 * - set the number of dummy cycles (mode cycles + wait states).
+	 * - set the SPI protocols for register and memory accesses.
+	 * - set the Quad Enable bit if needed (required by SPI x-y-4 protos).
+	 * - enter/leave the 4-4-4 or 2-2-2 modes if needed.
+	 */
+	if (params) {
+		ret = spi_nor_setup(nor, info, params, modes);
+		if (ret)
 			return ret;
+	} else {
+		if (modes->rd_modes & SNOR_MODE_1_1_1) {
+			nor->read_opcode = SPINOR_OP_READ_FAST;
+			nor->read_dummy = 8;
+		} else {
+			nor->read_opcode = SPINOR_OP_READ;
+			nor->read_dummy = 0;
 		}
-		nor->flash_read = SPI_NOR_QUAD;
-	} else if (mode == SPI_NOR_DUAL && info->flags & SPI_NOR_DUAL_READ) {
-		nor->flash_read = SPI_NOR_DUAL;
 	}
 
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
-
-	nor->program_opcode = SPINOR_OP_PP;
-
 	if (info->addr_width)
 		nor->addr_width = info->addr_width;
 	else if (mtd->size > 0x1000000) {
@@ -1516,8 +1655,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		return -EINVAL;
 	}
 
-	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
-
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index a91e95756a48..770ea84370d0 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -84,8 +84,9 @@
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 
 /* Used for Micron flashes only. */
-#define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-#define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
+#define SPINOR_OP_MIO_RDID	0xaf	/* Multiple I/O Read JEDEC ID */
+#define SPINOR_OP_RD_EVCR	0x65    /* Read EVCR register */
+#define SPINOR_OP_WD_EVCR	0x61    /* Write EVCR register */
 
 /* Status Register bits. */
 #define SR_WIP			BIT(0)	/* Write in progress */
@@ -108,11 +109,119 @@
 /* Configuration Register bits. */
 #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
 
-enum read_mode {
-	SPI_NOR_NORMAL = 0,
-	SPI_NOR_FAST,
-	SPI_NOR_DUAL,
-	SPI_NOR_QUAD,
+
+/* Supported modes */
+enum spi_nor_mode_index {
+	/* Sorted by ascending priority order */
+	SNOR_MIDX_SLOW = 0,
+	SNOR_MIDX_1_1_1,
+	SNOR_MIDX_1_1_2,
+	SNOR_MIDX_1_2_2,
+	SNOR_MIDX_2_2_2,
+	SNOR_MIDX_1_1_4,
+	SNOR_MIDX_1_4_4,
+	SNOR_MIDX_4_4_4,
+
+	SNOR_MIDX_MAX
+};
+
+#define SNOR_MODE_SLOW		BIT(SNOR_MIDX_SLOW)
+#define SNOR_MODE_1_1_1		BIT(SNOR_MIDX_1_1_1)
+#define SNOR_MODE_1_1_2		BIT(SNOR_MIDX_1_1_2)
+#define SNOR_MODE_1_2_2		BIT(SNOR_MIDX_1_2_2)
+#define SNOR_MODE_2_2_2		BIT(SNOR_MIDX_2_2_2)
+#define SNOR_MODE_1_1_4		BIT(SNOR_MIDX_1_1_4)
+#define SNOR_MODE_1_4_4		BIT(SNOR_MIDX_1_4_4)
+#define SNOR_MODE_4_4_4		BIT(SNOR_MIDX_4_4_4)
+
+struct spi_nor_modes {
+	u32	id_modes;	/* supported SPI modes for Read JEDEC ID */
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
+#define SNOR_OP_READ(_num_mode_clocks, _num_wait_states, _opcode) \
+	{							  \
+		.num_wait_states = _num_wait_states,		  \
+		.num_mode_clocks = _num_mode_clocks,		  \
+		.opcode = _opcode,				  \
+	}
+
+struct spi_nor_erase_type {
+	u8	size;	/* specifies 'N' so erase size = 2^N */
+	u8	opcode;
+};
+
+#define SNOR_OP_ERASE(_size, _opcode) { .size = _size, .opcode = _opcode }
+#define SNOR_OP_ERASE_64K(_opcode) SNOR_OP_ERASE(0x10, _opcode)
+#define SNOR_OP_ERASE_32K(_opcode) SNOR_OP_ERASE(0x0f, _opcode)
+#define SNOR_OP_ERASE_4K(_opcode)  SNOR_OP_ERASE(0x0c, _opcode)
+
+struct spi_nor;
+
+#define SNOR_MAX_ERASE_TYPES	4
+
+struct spi_nor_basic_flash_parameter {
+	/* Fast Read settings */
+	u32				rd_modes;
+	struct spi_nor_read		reads[SNOR_MIDX_MAX];
+
+	/* Page Program settings */
+	u32				wr_modes;
+	u8				page_programs[SNOR_MIDX_MAX];
+
+	/* Sector Erase settings */
+	struct spi_nor_erase_type	erase_types[SNOR_MAX_ERASE_TYPES];
+
+	int (*read_id)(struct spi_nor *nor, u8 *id, size_t id_len,
+		       u32 id_modes);
+	int (*enable_quad_io)(struct spi_nor *nor, bool enable);
+	int (*enable_4_4_4)(struct spi_nor *nor, bool enable);
+	int (*enable_2_2_2)(struct spi_nor *nor, bool enable);
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
@@ -140,9 +249,12 @@ enum spi_nor_option_flags {
  * @read_opcode:	the read opcode
  * @read_dummy:		the dummy needed by the read operation
  * @program_opcode:	the program opcode
- * @flash_read:		the mode of the read
  * @sst_write_second:	used by the SST write operation
  * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
+ * @erase_proto:	the SPI protocol used by erase operations
+ * @read_proto:		the SPI protocol used by read operations
+ * @write_proto:	the SPI protocol used by write operations
+ * @reg_proto		the SPI protocol used by read_reg/write_reg operations
  * @cmd_buf:		used by the write_reg
  * @prepare:		[OPTIONAL] do some preparations for the
  *			read/write/erase/lock/unlock operations
@@ -171,7 +283,10 @@ struct spi_nor {
 	u8			read_opcode;
 	u8			read_dummy;
 	u8			program_opcode;
-	enum read_mode		flash_read;
+	enum spi_nor_protocol	erase_proto;
+	enum spi_nor_protocol	read_proto;
+	enum spi_nor_protocol	write_proto;
+	enum spi_nor_protocol	reg_proto;
 	bool			sst_write_second;
 	u32			flags;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
@@ -209,7 +324,7 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
  * spi_nor_scan() - scan the SPI NOR
  * @nor:	the spi_nor structure
  * @name:	the chip type name
- * @mode:	the read mode supported by the driver
+ * @modes:	the SPI modes supported by the controller driver
  *
  * The drivers can use this fuction to scan the SPI NOR.
  * In the scanning, it will try to get all the necessary information to
@@ -219,6 +334,7 @@ static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
  *
  * Return: 0 for success, others for failure.
  */
-int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode);
+int spi_nor_scan(struct spi_nor *nor, const char *name,
+		 struct spi_nor_modes *modes);
 
 #endif
-- 
1.8.2.2
