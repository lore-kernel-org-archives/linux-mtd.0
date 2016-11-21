Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8pRI-0004KJ-LX
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2016 14:19:23 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH v4 7/8] mtd: spi-nor: parse Serial Flash Discoverable
 Parameters (SFDP) tables
Date: Mon, 21 Nov 2016 15:15:46 +0100
Message-ID: <86002dc2e759a5970f6ad72974fe65cc62bc00ed.1479736401.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1479736401.git.cyrille.pitchen@atmel.com>
References: <cover.1479736401.git.cyrille.pitchen@atmel.com>
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

This patch adds support the the JESD216B standard and parse the SFDP
tables to dynamically initialize the spi_nor_basic_flash_parameter
structure.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 468 +++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spi-nor.h   |   6 +
 2 files changed, 473 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9438b4a937e9..e5f97bc0a370 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/math64.h>
 #include <linux/sizes.h>
+#include <linux/slab.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
@@ -79,6 +80,7 @@ struct flash_info {
 					 * Use dedicated 4byte address op codes
 					 * to support memory size above 128Mib.
 					 */
+#define SPI_NOR_SKIP_SFDP	BIT(11) /* Skip read of SFDP tables */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -1341,6 +1343,99 @@ static int spansion_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
+static int spansion_new_quad_enable(struct spi_nor *nor)
+{
+	u8 sr_cr[2];
+	int ret;
+
+	/* Check current Quad Enable bit value. */
+	ret = read_cr(nor);
+	if (ret < 0) {
+		dev_err(nor->dev,
+			"error while reading configuration register\n");
+		return -EINVAL;
+	}
+	sr_cr[1] = ret;
+	if (sr_cr[1] & CR_QUAD_EN_SPAN)
+		return 0;
+
+	dev_info(nor->dev, "setting Spansion Quad Enable (non-volatile) bit\n");
+
+	/* Keep the current value of the Status Register. */
+	ret = read_sr(nor);
+	if (ret < 0) {
+		dev_err(nor->dev,
+			"error while reading status register\n");
+		return -EINVAL;
+	}
+	sr_cr[0] = ret;
+	sr_cr[1] |= CR_QUAD_EN_SPAN;
+
+	write_enable(nor);
+
+	ret = nor->write_reg(nor, SPINOR_OP_WRSR, sr_cr, 2);
+	if (ret < 0) {
+		dev_err(nor->dev,
+			"error while writing configuration register\n");
+		return -EINVAL;
+	}
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret < 0) {
+		dev_err(nor->dev, "error while waiting for WRSR completion\n");
+		return ret;
+	}
+
+	/* read back and check it */
+	ret = read_cr(nor);
+	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
+		dev_err(nor->dev, "Spansion Quad bit not set\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int sr2_bit7_quad_enable(struct spi_nor *nor)
+{
+	u8 sr2;
+	int ret;
+
+	/* Check current Quad Enable bit value. */
+	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
+	if (ret)
+		return ret;
+	if (sr2 & SR2_QUAD_EN_BIT7)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	sr2 |= SR2_QUAD_EN_BIT7;
+
+	write_enable(nor);
+
+	ret = nor->write_reg(nor, SPINOR_OP_WRSR2, &sr2, 1);
+	if (ret < 0) {
+		dev_err(nor->dev,
+			"error while writing status register 2\n");
+		return -EINVAL;
+	}
+
+	ret = spi_nor_wait_till_ready(nor);
+	if (ret < 0) {
+		dev_err(nor->dev, "error while waiting for WRSR2 completion\n");
+		return ret;
+	}
+
+	/* Read back and check it. */
+	ret = nor->read_reg(nor, SPINOR_OP_RDSR2, &sr2, 1);
+	if (ret || !(sr2 & SR2_QUAD_EN_BIT7)) {
+		dev_err(nor->dev, "SR2 Quad bit not set\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int spi_nor_check(struct spi_nor *nor)
 {
 	if (!nor->dev || !nor->read || !nor->write ||
@@ -1369,11 +1464,381 @@ static inline void spi_nor_set_erase_settings(struct spi_nor_erase_type *erase,
 	erase->opcode = opcode;
 }
 
+static int spi_nor_read_sfdp(struct spi_nor *nor, u32 addr,
+			     size_t len, void *buf)
+{
+	u8 addr_width, read_opcode, read_dummy;
+	int ret;
+
+	read_opcode = nor->read_opcode;
+	addr_width = nor->addr_width;
+	read_dummy = nor->read_dummy;
+
+	nor->read_opcode = SPINOR_OP_RDSFDP;
+	nor->addr_width = 3;
+	nor->read_dummy = 8;
+
+	ret = nor->read(nor, addr, len, (u8 *)buf);
+
+	nor->read_opcode = read_opcode;
+	nor->addr_width = addr_width;
+	nor->read_dummy = read_dummy;
+
+	return (ret < 0) ? ret : 0;
+}
+
+struct sfdp_parameter_header {
+	u8		id_lsb;
+	u8		minor;
+	u8		major;
+	u8		length; /* in double words */
+	u8		parameter_table_pointer[3]; /* byte address */
+	u8		id_msb;
+};
+
+#define SFDP_PARAM_HEADER_ID(p)	((u16)(((p)->id_msb << 8) | (p)->id_lsb))
+#define SFDP_PARAM_HEADER_PTP(p) \
+	((u32)(((p)->parameter_table_pointer[2] << 16) | \
+	       ((p)->parameter_table_pointer[1] <<  8) | \
+	       ((p)->parameter_table_pointer[0] <<  0)))
+
+
+#define SFDP_BFPT_ID		0xff00u	/* Basic Flash Parameter Table */
+
+#define SFDP_SIGNATURE		0x50444653u
+#define SFDP_JESD216_MAJOR	1
+#define SFDP_JESD216_MINOR	0
+#define SFDP_JESD216A_MINOR	5
+#define SFDP_JESD216B_MINOR	6
+
+struct sfdp_header {
+	u32		signature; /* Ox50444653 <=> "SFDP" */
+	u8		minor;
+	u8		major;
+	u8		nph; /* 0-base number of parameter headers */
+	u8		unused;
+
+	/* Basic Flash Parameter Table. */
+	struct sfdp_parameter_header	bfpt_header;
+};
+
+/* Basic Flash Parameter Table */
+
+/* 1st DWORD. */
+#define BFPT_WORD0_FAST_READ_1_1_2	BIT(16)
+#define BFPT_WORD0_ADDRESS_BYTES_MASK	GENMASK(18, 17)
+#define BFPT_WORD0_ADDRESS_BYTES_3_ONLY	(0u << 17)
+#define BFPT_WORD0_ADDRESS_BYTES_3_OR_4	(1u << 17)
+#define BFPT_WORD0_ADDRESS_BYTES_4_ONLY	(2u << 17)
+#define BFPT_WORD0_DTR			BIT(19)
+#define BFPT_WORD0_FAST_READ_1_2_2	BIT(20)
+#define BFPT_WORD0_FAST_READ_1_4_4	BIT(21)
+#define BFPT_WORD0_FAST_READ_1_1_4	BIT(22)
+
+/* 15th DWORD. */
+
+/*
+ * (from JESD216B)
+ * Quad Enable Requirements (QER):
+ * - 000b: Device does not have a QE bit. Device detects 1-1-4 and 1-4-4
+ *         reads based on instruction. DQ3/HOLD# functions are hold during
+ *         instruction pahse.
+ * - 001b: QE is bit 1 of status register 2. It is set via Write Status with
+ *         two data bytes where bit 1 of the second byte is one.
+ *         [...]
+ *         Writing only one byte to the status register has the side-effect of
+ *         clearing status register 2, including the QE bit. The 100b code is
+ *         used if writing one byte to the status register does not modify
+ *         status register 2.
+ * - 010b: QE is bit 6 of status register 1. It is set via Write Status with
+ *         one data byte where bit 6 is one.
+ *         [...]
+ * - 011b: QE is bit 7 of status register 2. It is set via Write status
+ *         register 2 instruction 3Eh with one data byte where bit 7 is one.
+ *         [...]
+ *         The status register 2 is read using instruction 3Fh.
+ * - 100b: QE is bit 1 of status register 2. It is set via Write Status with
+ *         two data bytes where bit 1 of the second byte is one.
+ *         [...]
+ *         In contrast to the 001b code, writing one byte to the status
+ *         register does not modify status register 2.
+ * - 101b: QE is bit 1 of status register 2. Status register 1 is read using
+ *         Read Status instruction 05h. Status register2 is read using
+ *         instruction 35h. QE is set via Writ Status instruction 01h with
+ *         two data bytes where bit 1 of the second byte is one.
+ *         [...]
+ */
+#define BFPT_WORD14_QER_MASK		GENMASK(22, 20)
+#define BFPT_WORD14_QER_NONE		(0 << 20) /* Micron */
+#define BFPT_WORD14_QER_SR2_BIT1_BUGGY	(1 << 20)
+#define BFPT_WORD14_QER_SR1_BIT6	(2 << 20) /* Macronix */
+#define BFPT_WORD14_QER_SR2_BIT7	(3 << 20)
+#define BFPT_WORD14_QER_SR2_BIT1_NO_RD	(4 << 20)
+#define BFPT_WORD14_QER_SR2_BIT1	(5 << 20) /* Spansion */
+
+/* JESD216B defines a Basic Flash Parameter Table of 16 words. */
+#define SFDP_BFPT_MAX_WORDS	16
+
+struct sfdp_bfpt {
+	u32	word[SFDP_BFPT_MAX_WORDS];
+};
+
+/* Fast Read settings. */
+#define BFPT_FAST_READ_WAIT_STATES(half)	((((u16)(half)) >> 0) & 0x1f)
+#define BFPT_FAST_READ_MODE_CLOCKS(half)	((((u16)(half)) >> 5) & 0x07)
+#define BFPT_FAST_READ_OP_CODE(half)		((((u16)(half)) >> 8) & 0xff)
+
+struct sfdp_read {
+	/* The protocol index of SPI x-y-z. */
+	enum spi_nor_protocol_index	pindex;
+
+	/*
+	 * The bit <wbit> in DWORD<windex> tells us whether the
+	 * Fast Read x-y-z command is supported.
+	 */
+	int				windex;
+	int				wbit;
+
+	/*
+	 * The half-word at offset <hshift> in DWORD<hindex> encodes the
+	 * op code, the number of mode clocks and the number of wait states
+	 * to be used by Fast Read x-y-z commands.
+	 */
+	int				hindex;
+	int				hshift;
+};
+
+static const struct sfdp_read sfdp_reads[] = {
+	/* Supported: DWORD0 bit 16,  Settings: DWORD3 bit[15:0] */
+	{SNOR_PINDEX_1_1_2, 0, 16, 3,  0},
+
+	/* Supported: DWORD0 bit 20,  Settings: DWORD3 bit[31:16] */
+	{SNOR_PINDEX_1_2_2, 0, 20, 3, 16},
+
+	/* Supported: DWORD4 bit  0,  Settings: DWORD5 bit[31:16] */
+	{SNOR_PINDEX_2_2_2, 4,  0, 5, 16},
+
+	/* Supported: DWORD0 bit 22,  Settings: DWORD2 bit[31:16] */
+	{SNOR_PINDEX_1_1_4, 0, 22, 2, 16},
+
+	/* Supported: DWORD0 bit 21,  Settings: DWORD2 bit[15:0] */
+	{SNOR_PINDEX_1_4_4, 0, 21, 2, 0},
+
+	/* Supported: DWORD4 bit  4,  Settings: DWORD6 bit[31:16] */
+	{SNOR_PINDEX_4_4_4, 4, 4, 6, 16},
+};
+
+
+/* Sector Erase settings. */
+#define BFPT_ERASE_SIZE(half)		((((u16)(half)) >> 0) & 0xff)
+#define BFPT_ERASE_OP_CODE(half)	((((u16)(half)) >> 8) & 0xff)
+
+struct sfdp_erase {
+	/*
+	 * The half-word at offset <hshift> in DWORD<hindex> encodes the
+	 * op code and erase sector size to be used by Sector Erase commands.
+	 */
+	int		hindex;
+	int		hshift;
+};
+
+static const struct sfdp_erase sfdp_erases[SNOR_MAX_ERASE_TYPES] = {
+	/* Erase Type 1 in DWORD7 bits[15:0] */
+	{7, 0},
+
+	/* Erase Type 2 in DWORD7 bits[31:16] */
+	{7, 16},
+
+	/* Erase Type 3 in DWORD8 bits[15:0] */
+	{8, 0},
+
+	/* Erase Type 4: in DWORD8 bits[31:16] */
+	{8, 16},
+};
+
+
+static int spi_nor_parse_bfpt(struct spi_nor *nor,
+			      const struct sfdp_parameter_header *bfpt_header,
+			      struct spi_nor_basic_flash_parameter *params)
+{
+	struct sfdp_bfpt bfpt;
+	size_t len;
+	int i, err;
+	u32 addr;
+	u16 half;
+
+	/* JESD216 Basic Flash Parameter Table length is at least 9 words. */
+	if (bfpt_header->length < 9)
+		return -EINVAL;
+
+	/* Read the Basic Flash Parameter Table. */
+	len = min_t(size_t, sizeof(bfpt),
+		    bfpt_header->length * sizeof(uint32_t));
+	addr = SFDP_PARAM_HEADER_PTP(bfpt_header);
+	memset(&bfpt, 0, sizeof(bfpt));
+	err = spi_nor_read_sfdp(nor,  addr, len, &bfpt);
+	if (err)
+		return err;
+
+	for (i = 0; i < SFDP_BFPT_MAX_WORDS; ++i)
+		bfpt.word[i] = le32_to_cpu(bfpt.word[i]);
+
+	memset(params, 0, sizeof(*params));
+
+	/* Fast Read settings. */
+	params->rd_modes = (SNOR_MODE_SLOW | SNOR_MODE_1_1_1);
+	spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_SLOW],
+				  0, 0, SPINOR_OP_READ);
+	spi_nor_set_read_settings(&params->reads[SNOR_PINDEX_1_1_1],
+				  0, 8, SPINOR_OP_READ_FAST);
+
+	for (i = 0; i < ARRAY_SIZE(sfdp_reads); ++i) {
+		const struct sfdp_read *rd_info = &sfdp_reads[i];
+		struct spi_nor_read *read = &params->reads[rd_info->pindex];
+
+		if (!(bfpt.word[rd_info->windex] & BIT(rd_info->wbit)))
+			continue;
+
+		params->rd_modes |= BIT(rd_info->pindex);
+		half = bfpt.word[rd_info->hindex] >> rd_info->hshift;
+		read->num_mode_clocks = BFPT_FAST_READ_MODE_CLOCKS(half);
+		read->num_wait_states = BFPT_FAST_READ_WAIT_STATES(half);
+		read->opcode = BFPT_FAST_READ_OP_CODE(half);
+	}
+
+	/* Page Program settings. */
+	params->wr_modes = SNOR_MODE_1_1_1;
+	params->page_programs[SNOR_PINDEX_1_1_1] = SPINOR_OP_PP;
+
+	/* Sector Erase settings. */
+	for (i = 0; i < SNOR_MAX_ERASE_TYPES; ++i) {
+		const struct sfdp_erase *er_info = &sfdp_erases[i];
+		struct spi_nor_erase_type *erase = &params->erase_types[i];
+
+		half = bfpt.word[er_info->hindex] >> er_info->hshift;
+		erase->size = BFPT_ERASE_SIZE(half);
+		erase->opcode = BFPT_ERASE_OP_CODE(half);
+	}
+
+	/* Stop here if not JESD216 rev A or later. */
+	if (bfpt_header->length < 15)
+		return 0;
+
+	/* Enable Quad I/O. */
+	switch (bfpt.word[14] & BFPT_WORD14_QER_MASK) {
+	default:
+	case BFPT_WORD14_QER_NONE:
+		break;
+
+	case BFPT_WORD14_QER_SR2_BIT1_BUGGY:
+	case BFPT_WORD14_QER_SR2_BIT1_NO_RD:
+		params->enable_quad_io = spansion_quad_enable;
+		break;
+
+	case BFPT_WORD14_QER_SR1_BIT6:
+		params->enable_quad_io = macronix_quad_enable;
+		break;
+
+	case BFPT_WORD14_QER_SR2_BIT7:
+		params->enable_quad_io = sr2_bit7_quad_enable;
+		break;
+
+	case BFPT_WORD14_QER_SR2_BIT1:
+		params->enable_quad_io = spansion_new_quad_enable;
+		break;
+	}
+
+	return 0;
+}
+
+static int spi_nor_parse_sfdp(struct spi_nor *nor,
+			      struct spi_nor_basic_flash_parameter *params)
+{
+	const struct sfdp_parameter_header *param_header, *bfpt_header;
+	struct sfdp_parameter_header *param_headers = NULL;
+	struct sfdp_header header;
+	size_t psize;
+	int i, err;
+
+	/* Get the SFDP header. */
+	err = spi_nor_read_sfdp(nor, 0, sizeof(header), &header);
+	if (err)
+		return err;
+
+	/* Check the SFDP header version. */
+	if (le32_to_cpu(header.signature) != SFDP_SIGNATURE ||
+	    header.major != SFDP_JESD216_MAJOR ||
+	    header.minor < SFDP_JESD216_MINOR)
+		return -EINVAL;
+
+	/*
+	 * Verify that the first and only mandatory parameter header is a
+	 * Basic Flash Parameter Table header as specified in JESD216.
+	 */
+	bfpt_header = &header.bfpt_header;
+	if (SFDP_PARAM_HEADER_ID(bfpt_header) != SFDP_BFPT_ID ||
+	    bfpt_header->major != SFDP_JESD216_MAJOR)
+		return -EINVAL;
+
+	/* Allocate memory for parameter headers. */
+	if (header.nph) {
+		psize = header.nph * sizeof(*param_headers);
+
+		param_headers = kmalloc(psize, GFP_KERNEL);
+		if (!param_headers) {
+			dev_err(nor->dev,
+				"failed to allocate memory for SFDP parameter headers\n");
+			return -ENOMEM;
+		}
+
+		err = spi_nor_read_sfdp(nor, sizeof(header),
+					psize, param_headers);
+		if (err) {
+			dev_err(nor->dev,
+				"failed to read SFDP parameter headers\n");
+			goto exit;
+		}
+	}
+
+	/*
+	 * Check other parameter headers to get the latest revision of
+	 * the basic flash parameter table.
+	 */
+	for (i = 0; i < header.nph; ++i) {
+		param_header = &param_headers[i];
+
+		if (SFDP_PARAM_HEADER_ID(param_header) == SFDP_BFPT_ID &&
+		    param_header->major == SFDP_JESD216_MAJOR &&
+		    (param_header->minor > bfpt_header->minor ||
+		     (param_header->minor == bfpt_header->minor &&
+		      param_header->length > bfpt_header->length)))
+			bfpt_header = param_header;
+	}
+	err = spi_nor_parse_bfpt(nor, bfpt_header, params);
+	if (err)
+		goto exit;
+
+exit:
+	kfree(param_headers);
+	return (err) ? err : bfpt_header->minor;
+}
+
 static int spi_nor_init_params(struct spi_nor *nor,
 			       const struct flash_info *info,
 			       struct spi_nor_basic_flash_parameter *params)
 {
-	// TODO: parse SFDP table
+	int jesd216_minor = -EINVAL;
+
+	/* First trying to parse SFDP tables. */
+	if (!(info->flags & SPI_NOR_SKIP_SFDP)) {
+		jesd216_minor = spi_nor_parse_sfdp(nor, params);
+
+		if (jesd216_minor >= SFDP_JESD216A_MINOR)
+			return 0;
+
+		if (jesd216_minor >= SFDP_JESD216_MINOR)
+			goto set_enable_quad_io;
+	}
 
 	/* If SFDP tables are not available, use legacy settings. */
 	memset(params, 0, sizeof(*params));
@@ -1412,6 +1877,7 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		spi_nor_set_erase_settings(&params->erase_types[1],
 					   SNOR_ERASE_4K, SPINOR_OP_BE_4K_PMC);
 
+set_enable_quad_io:
 	/* Select the procedure to set the Quad Enable bit. */
 	if (params->rd_modes & (SNOR_MODE_1_1_4 |
 				SNOR_MODE_1_4_4 |
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 88ac446b1230..8fd9619dabff 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -41,6 +41,8 @@
 #define SPINOR_OP_WREN		0x06	/* Write enable */
 #define SPINOR_OP_RDSR		0x05	/* Read status register */
 #define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
+#define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
+#define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
 #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */
 #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
 #define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual Output SPI) */
@@ -56,6 +58,7 @@
 #define SPINOR_OP_CHIP_ERASE	0xc7	/* Erase whole flash chip */
 #define SPINOR_OP_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define SPINOR_OP_RDID		0x9f	/* Read JEDEC ID */
+#define SPINOR_OP_RDSFDP	0x5a	/* Read SFDP */
 #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
 
@@ -110,6 +113,9 @@
 /* Configuration Register bits. */
 #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
 
+/* Status Register 2 bits. */
+#define SR2_QUAD_EN_BIT7	BIT(7)
+
 
 /* Supported SPI protocols */
 enum spi_nor_protocol_class {
-- 
2.7.4
