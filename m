Received: from 10.mo177.mail-out.ovh.net ([46.105.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqpn1-0007ZA-2s
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 23:35:59 +0000
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 53C0A43627
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 00:35:16 +0100 (CET)
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: marek.vasut@gmail.com, linux-mtd@lists.infradead.org, jartur@cadence.com,
 kdasu.kdev@gmail.com, mar.krzeminski@gmail.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [RFC PATCH v5 5/6] mtd: spi-nor: parse Serial Flash Discoverable
 Parameters (SFDP) tables
Date: Thu, 23 Mar 2017 00:33:55 +0100
Message-Id: <5d0f4afc75849523d7a2e4548b8a68f5b66b0baf.1490220411.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1490220411.git.cyrille.pitchen@atmel.com>
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1490220411.git.cyrille.pitchen@atmel.com>
References: <cover.1490220411.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support to the JESD216B standard and parses the SFDP
tables to dynamically initialize the 'struct spi_nor_flash_parameter'.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 558 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |   6 +
 2 files changed, 564 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 2e54792d506d..ce8722055a9c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -17,6 +17,7 @@
 #include <linux/mutex.h>
 #include <linux/math64.h>
 #include <linux/sizes.h>
+#include <linux/slab.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/of_platform.h>
@@ -86,6 +87,7 @@ struct flash_info {
 					 * to support memory size above 128Mib.
 					 */
 #define NO_CHIP_ERASE		BIT(12) /* Chip does not support chip erase */
+#define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -1593,6 +1595,99 @@ static int spansion_quad_enable(struct spi_nor *nor)
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
@@ -1759,6 +1854,465 @@ spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
 	map->uniform_region.size = flash_size;
 }
 
+
+/*
+ * SFDP parsing.
+ */
+
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
+/*
+ * JESD216B defines a Basic Flash Parameter Table of 16 DWORDs.
+ * They are indexed from 1 but C arrays are indexed from 0.
+ */
+enum sfdp_bfpt_dword {
+	BFPT_DWORD1 = 0,
+	BFPT_DWORD2,
+	BFPT_DWORD3,
+	BFPT_DWORD4,
+	BFPT_DWORD5,
+	BFPT_DWORD6,
+	BFPT_DWORD7,
+	BFPT_DWORD8,
+	BFPT_DWORD9,
+	BFPT_DWORD10,
+	BFPT_DWORD11,
+	BFPT_DWORD12,
+	BFPT_DWORD13,
+	BFPT_DWORD14,
+	BFPT_DWORD15,
+	BFPT_DWORD16,
+
+	BFPT_DWORD_MAX
+};
+
+/* The first revision of JESB216 defined only 9 DWORDs. */
+#define BFPT_DWORD_MAX_JESD216			9
+
+/* 1st DWORD. */
+#define BFPT_DWORD1_FAST_READ_1_1_2		BIT(16)
+#define BFPT_DWORD1_ADDRESS_BYTES_MASK		GENMASK(18, 17)
+#define BFPT_DWORD1_ADDRESS_BYTES_3_ONLY	(0u << 17)
+#define BFPT_DWORD1_ADDRESS_BYTES_3_OR_4	(1u << 17)
+#define BFPT_DWORD1_ADDRESS_BYTES_4_ONLY	(2u << 17)
+#define BFPT_DWORD1_DTR				BIT(19)
+#define BFPT_DWORD1_FAST_READ_1_2_2		BIT(20)
+#define BFPT_DWORD1_FAST_READ_1_4_4		BIT(21)
+#define BFPT_DWORD1_FAST_READ_1_1_4		BIT(22)
+
+/* 5th DWORD. */
+#define BFPT_DWORD5_FAST_READ_2_2_2		BIT(0)
+#define BFPT_DWORD5_FAST_READ_4_4_4		BIT(4)
+
+/* 11th DWORD. */
+#define BFPT_DWORD11_PAGE_SIZE_SHIFT		4
+#define BFPT_DWORD11_PAGE_SIZE_MASK		GENMASK(7, 4)
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
+#define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
+#define BFPT_DWORD15_QER_NONE			(0u << 20) /* Micron */
+#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(1u << 20)
+#define BFPT_DWORD15_QER_SR1_BIT6		(2u << 20) /* Macronix */
+#define BFPT_DWORD15_QER_SR2_BIT7		(3u << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(4u << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1		(5u << 20) /* Spansion */
+
+
+struct sfdp_bfpt {
+	u32	dwords[BFPT_DWORD_MAX];
+};
+
+/* Fast Read settings. */
+
+static inline void
+spi_nor_set_read_settings_from_bfpt(struct spi_nor_read_command *read,
+				    u16 half,
+				    enum spi_nor_protocol proto)
+{
+	read->num_mode_clocks = (half >> 5) & 0x07u;
+	read->num_wait_states = (half >> 0) & 0x1Fu;
+	read->opcode = (half >> 8) & 0xFFu;
+	read->proto = proto;
+}
+
+struct sfdp_bfpt_read {
+	/* The Fast Read x-y-z hardware capability in params->hwcaps.mask. */
+	u32				hwcaps;
+
+	/*
+	 * The <supported_bit> bit in <supported_dword> BFPT DWORD tells us
+	 * whether the Fast Read x-y-z command is supported.
+	 */
+	enum sfdp_bfpt_dword		supported_dword;
+	u32				supported_bit;
+
+	/*
+	 * The half-word at offset <setting_shift> in <setting_dword> BFPT DWORD
+	 * encodes the op code, the number of mode clocks and the number of wait
+	 * states to be used by Fast Read x-y-z command.
+	 */
+	enum sfdp_bfpt_dword		settings_dword;
+	int				settings_shift;
+
+	/* The SPI protocol for this Fast Read x-y-z command. */
+	enum spi_nor_protocol		proto;
+};
+
+static const struct sfdp_bfpt_read sfdp_bfpt_reads[] = {
+	/* Fast Read 1-1-2 */
+	{
+		SNOR_HWCAPS_READ_1_1_2,
+		BFPT_DWORD1, BIT(16),	/* Supported bit */
+		BFPT_DWORD4, 0,		/* Settings */
+		SNOR_PROTO_1_1_2,
+	},
+
+	/* Fast Read 1-2-2 */
+	{
+		SNOR_HWCAPS_READ_1_2_2,
+		BFPT_DWORD1, BIT(20),	/* Supported bit */
+		BFPT_DWORD4, 16,	/* Settings */
+		SNOR_PROTO_1_2_2,
+	},
+
+	/* Fast Read 2-2-2 */
+	{
+		SNOR_HWCAPS_READ_2_2_2,
+		BFPT_DWORD5,  BIT(0),	/* Supported bit */
+		BFPT_DWORD6, 16,	/* Settings */
+		SNOR_PROTO_2_2_2,
+	},
+
+	/* Fast Read 1-1-4 */
+	{
+		SNOR_HWCAPS_READ_1_1_4,
+		BFPT_DWORD1, BIT(22),	/* Supported bit */
+		BFPT_DWORD3, 16,	/* Settings */
+		SNOR_PROTO_1_1_4,
+	},
+
+	/* Fast Read 1-4-4 */
+	{
+		SNOR_HWCAPS_READ_1_4_4,
+		BFPT_DWORD1, BIT(21),	/* Supported bit */
+		BFPT_DWORD3, 0,		/* Settings */
+		SNOR_PROTO_1_4_4,
+	},
+
+	/* Fast Read 4-4-4 */
+	{
+		SNOR_HWCAPS_READ_4_4_4,
+		BFPT_DWORD5, BIT(4),	/* Supported bit */
+		BFPT_DWORD7, 16,	/* Settings */
+		SNOR_PROTO_4_4_4,
+	},
+};
+
+
+/* Sector Erase settings. */
+
+static inline void
+spi_nor_set_erase_command_from_bfpt(struct spi_nor_erase_command *cmd,
+				    u16 half)
+{
+	u32 size = (half >> 0) & 0xff;
+	u8 opcode = (half >> 8) & 0xff;
+
+	/* size == 0 means this Erase Type is not supported. */
+	if (size)
+		size = (1u << size);
+	spi_nor_set_erase_command(cmd, size, opcode);
+}
+
+struct sfdp_bfpt_erase {
+	/*
+	 * The half-word at offset <shift> in DWORD <dword> encodes the
+	 * op code and erase sector size to be used by Sector Erase commands.
+	 */
+	enum sfdp_bfpt_dword	dword;
+	int			shift;
+};
+
+static const struct sfdp_bfpt_erase sfdp_bfpt_erases[SNOR_CMD_ERASE_MAX] = {
+	/* Erase Type 1 in DWORD8 bits[15:0] */
+	{BFPT_DWORD8, 0},
+
+	/* Erase Type 2 in DWORD8 bits[31:16] */
+	{BFPT_DWORD8, 16},
+
+	/* Erase Type 3 in DWORD9 bits[15:0] */
+	{BFPT_DWORD9, 0},
+
+	/* Erase Type 4: in DWORD9 bits[31:16] */
+	{BFPT_DWORD9, 16},
+};
+
+
+static int spi_nor_hwcaps2cmd(u32 hwcaps);
+
+static int spi_nor_parse_bfpt(struct spi_nor *nor,
+			      const struct sfdp_parameter_header *bfpt_header,
+			      struct spi_nor_flash_parameter *params)
+{
+	struct spi_nor_erase_map *map = &nor->erase_map;
+	struct sfdp_bfpt bfpt;
+	size_t len;
+	int i, cmd, err;
+	u32 addr, erase_mask;
+	u16 half;
+
+	/* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
+	if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
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
+	/* Fix endianness of the BFPT DWORDs. */
+	for (i = 0; i < BFPT_DWORD_MAX; i++)
+		bfpt.dwords[i] = le32_to_cpu(bfpt.dwords[i]);
+
+	/* Flash Memory Density (in bits). */
+	params->size = bfpt.dwords[BFPT_DWORD2];
+	if (params->size & BIT(31)) {
+		params->size &= ~BIT(31);
+		params->size = 1ULL << params->size;
+	}
+	params->size >>= 3; /* Convert to bytes. */
+
+	/* Fast Read settings. */
+	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_reads); i++) {
+		const struct sfdp_bfpt_read *rd = &sfdp_bfpt_reads[i];
+		struct spi_nor_read_command *read;
+
+		if (!(bfpt.dwords[rd->supported_dword] & rd->supported_bit))
+			continue;
+
+		params->hwcaps.mask |= rd->hwcaps;
+		cmd = spi_nor_hwcaps2cmd(rd->hwcaps);
+		read = &params->reads[cmd];
+		half = bfpt.dwords[rd->settings_dword] >> rd->settings_shift;
+		spi_nor_set_read_settings_from_bfpt(read, half, rd->proto);
+	}
+
+	/* Sector Erase settings. */
+	erase_mask = 0;
+	for (i = 0; i < SNOR_CMD_ERASE_MAX; i++) {
+		const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
+
+		half = bfpt.dwords[er->dword] >> er->shift;
+		spi_nor_set_erase_command_from_bfpt(&map->commands[i], half);
+
+		if (map->commands[i].size)
+			erase_mask |= BIT(i);
+	}
+	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
+
+	/* Stop here if not JESD216 rev A or later. */
+	if (bfpt_header->length < BFPT_DWORD_MAX)
+		return 0;
+
+	/* Page size: this field specifies 'N' so the page size = 2^N bytes. */
+	params->page_size = bfpt.dwords[BFPT_DWORD11];
+	params->page_size &= BFPT_DWORD11_PAGE_SIZE_MASK;
+	params->page_size >>= BFPT_DWORD11_PAGE_SIZE_SHIFT;
+	params->page_size = (1u << params->page_size);
+
+	/* Enable Quad I/O. */
+	switch (bfpt.dwords[BFPT_DWORD15] & BFPT_DWORD15_QER_MASK) {
+	default:
+	case BFPT_DWORD15_QER_NONE:
+		break;
+
+	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
+	case BFPT_DWORD15_QER_SR2_BIT1_NO_RD:
+		params->quad_enable = spansion_quad_enable;
+		break;
+
+	case BFPT_DWORD15_QER_SR1_BIT6:
+		params->quad_enable = macronix_quad_enable;
+		break;
+
+	case BFPT_DWORD15_QER_SR2_BIT7:
+		params->quad_enable = sr2_bit7_quad_enable;
+		break;
+
+	case BFPT_DWORD15_QER_SR2_BIT1:
+		params->quad_enable = spansion_new_quad_enable;
+		break;
+	}
+
+	return 0;
+}
+
+static int spi_nor_parse_sfdp(struct spi_nor *nor,
+			      struct spi_nor_flash_parameter *params)
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
+	for (i = 0; i < header.nph; i++) {
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
+	return err;
+}
+
 static int spi_nor_init_params(struct spi_nor *nor,
 			       const struct flash_info *info,
 			       struct spi_nor_flash_parameter *params)
@@ -1834,6 +2388,10 @@ static int spi_nor_init_params(struct spi_nor *nor,
 		}
 	}
 
+	/* Override the parameters with data read from SFDP tables. */
+	if (!(info->flags & SPI_NOR_SKIP_SFDP))
+		spi_nor_parse_sfdp(nor, params);
+
 	return 0;
 }
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index c12cafe99bee..a0d21a973d60 100644
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
 
@@ -128,6 +131,9 @@
 /* Configuration Register bits. */
 #define CR_QUAD_EN_SPAN		BIT(1)	/* Spansion Quad I/O */
 
+/* Status Register 2 bits. */
+#define SR2_QUAD_EN_BIT7	BIT(7)
+
 
 /* Supported SPI protocols */
 #define SNOR_PROTO_WIDTH_MASK	GENMASK(7, 0)
-- 
2.9.3
