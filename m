Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUr2d-0006ZY-16
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 10:38:02 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: [PATCH v5 2/3] mtd: spi-nor: Add a post BFPT parsing fixup hook
Date: Thu,  6 Dec 2018 11:37:35 +0100
Message-Id: <20181206103736.5957-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181206103736.5957-1-boris.brezillon@bootlin.com>
References: <20181206103736.5957-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Experience has proven that SFDP tables are sometimes wrong, and parsing
of these broken tables can lead to erroneous flash config.

This leaves us 2 options:

1/ set the SPI_NOR_SKIP_SFDP flag and completely ignore SFDP parsing
2/ fix things at runtime

While #1 should always work, it might imply extra work if most of the
SFDP is correct. #2 has the benefit of keeping the generic SFDP parsing
logic almost untouched while allowing SPI NOR manufacturer drivers to
fix the broken bits.

Add a spi_nor_fixups struct where we'll put all our fixup hooks, each
of them being called at a different point in the scan process.

We start a hook called just after the BFPT parsing to allow fixing up
info extracted from the BFPT section. More hooks will be added if other
sections need to be fixed.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Changes in v5:
- None

Changes in v4:
- New patch
---
 drivers/mtd/spi-nor/spi-nor.c | 387 ++++++++++++++++++----------------
 1 file changed, 209 insertions(+), 178 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index bea122e0d731..7bc9887d9c0a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -42,6 +42,196 @@
 #define SPI_NOR_MAX_ID_LEN	6
 #define SPI_NOR_MAX_ADDR_WIDTH	4
 
+struct spi_nor_read_command {
+	u8			num_mode_clocks;
+	u8			num_wait_states;
+	u8			opcode;
+	enum spi_nor_protocol	proto;
+};
+
+struct spi_nor_pp_command {
+	u8			opcode;
+	enum spi_nor_protocol	proto;
+};
+
+enum spi_nor_read_command_index {
+	SNOR_CMD_READ,
+	SNOR_CMD_READ_FAST,
+	SNOR_CMD_READ_1_1_1_DTR,
+
+	/* Dual SPI */
+	SNOR_CMD_READ_1_1_2,
+	SNOR_CMD_READ_1_2_2,
+	SNOR_CMD_READ_2_2_2,
+	SNOR_CMD_READ_1_2_2_DTR,
+
+	/* Quad SPI */
+	SNOR_CMD_READ_1_1_4,
+	SNOR_CMD_READ_1_4_4,
+	SNOR_CMD_READ_4_4_4,
+	SNOR_CMD_READ_1_4_4_DTR,
+
+	/* Octo SPI */
+	SNOR_CMD_READ_1_1_8,
+	SNOR_CMD_READ_1_8_8,
+	SNOR_CMD_READ_8_8_8,
+	SNOR_CMD_READ_1_8_8_DTR,
+
+	SNOR_CMD_READ_MAX
+};
+
+enum spi_nor_pp_command_index {
+	SNOR_CMD_PP,
+
+	/* Quad SPI */
+	SNOR_CMD_PP_1_1_4,
+	SNOR_CMD_PP_1_4_4,
+	SNOR_CMD_PP_4_4_4,
+
+	/* Octo SPI */
+	SNOR_CMD_PP_1_1_8,
+	SNOR_CMD_PP_1_8_8,
+	SNOR_CMD_PP_8_8_8,
+
+	SNOR_CMD_PP_MAX
+};
+
+struct spi_nor_flash_parameter {
+	u64				size;
+	u32				page_size;
+
+	struct spi_nor_hwcaps		hwcaps;
+	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
+	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
+
+	int (*quad_enable)(struct spi_nor *nor);
+};
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
+#define SFDP_PARAM_HEADER_ID(p)	(((p)->id_msb << 8) | (p)->id_lsb)
+#define SFDP_PARAM_HEADER_PTP(p) \
+	(((p)->parameter_table_pointer[2] << 16) | \
+	 ((p)->parameter_table_pointer[1] <<  8) | \
+	 ((p)->parameter_table_pointer[0] <<  0))
+
+#define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
+#define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
+
+#define SFDP_SIGNATURE		0x50444653U
+#define SFDP_JESD216_MAJOR	1
+#define SFDP_JESD216_MINOR	0
+#define SFDP_JESD216A_MINOR	5
+#define SFDP_JESD216B_MINOR	6
+
+struct sfdp_header {
+	u32		signature; /* Ox50444653U <=> "SFDP" */
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
+ * JESD216 rev B defines a Basic Flash Parameter Table of 16 DWORDs.
+ * They are indexed from 1 but C arrays are indexed from 0.
+ */
+#define BFPT_DWORD(i)		((i) - 1)
+#define BFPT_DWORD_MAX		16
+
+/* The first version of JESB216 defined only 9 DWORDs. */
+#define BFPT_DWORD_MAX_JESD216			9
+
+/* 1st DWORD. */
+#define BFPT_DWORD1_FAST_READ_1_1_2		BIT(16)
+#define BFPT_DWORD1_ADDRESS_BYTES_MASK		GENMASK(18, 17)
+#define BFPT_DWORD1_ADDRESS_BYTES_3_ONLY	(0x0UL << 17)
+#define BFPT_DWORD1_ADDRESS_BYTES_3_OR_4	(0x1UL << 17)
+#define BFPT_DWORD1_ADDRESS_BYTES_4_ONLY	(0x2UL << 17)
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
+ * (from JESD216 rev B)
+ * Quad Enable Requirements (QER):
+ * - 000b: Device does not have a QE bit. Device detects 1-1-4 and 1-4-4
+ *         reads based on instruction. DQ3/HOLD# functions are hold during
+ *         instruction phase.
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
+#define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
+#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
+#define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
+#define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
+
+struct sfdp_bfpt {
+	u32	dwords[BFPT_DWORD_MAX];
+};
+
+/**
+ * struct spi_nor_fixups - SPI NOR fixup hooks
+ * @post_bfpt: called after the BFPT table has been parsed
+ *
+ * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
+ * table is broken or not available.
+ */
+struct spi_nor_fixups {
+	int (*post_bfpt)(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt,
+			 struct spi_nor_flash_parameter *params);
+};
+
 struct flash_info {
 	char		*name;
 
@@ -91,6 +281,9 @@ struct flash_info {
 #define SPI_NOR_SKIP_SFDP	BIT(13)	/* Skip parsing of SFDP tables */
 #define USE_CLSR		BIT(14)	/* use CLSR command */
 
+	/* Part specific fixup hooks. */
+	const struct spi_nor_fixups *fixups;
+
 	int	(*quad_enable)(struct spi_nor *nor);
 };
 
@@ -2076,71 +2269,6 @@ static int s3an_nor_scan(const struct flash_info *info, struct spi_nor *nor)
 	return 0;
 }
 
-struct spi_nor_read_command {
-	u8			num_mode_clocks;
-	u8			num_wait_states;
-	u8			opcode;
-	enum spi_nor_protocol	proto;
-};
-
-struct spi_nor_pp_command {
-	u8			opcode;
-	enum spi_nor_protocol	proto;
-};
-
-enum spi_nor_read_command_index {
-	SNOR_CMD_READ,
-	SNOR_CMD_READ_FAST,
-	SNOR_CMD_READ_1_1_1_DTR,
-
-	/* Dual SPI */
-	SNOR_CMD_READ_1_1_2,
-	SNOR_CMD_READ_1_2_2,
-	SNOR_CMD_READ_2_2_2,
-	SNOR_CMD_READ_1_2_2_DTR,
-
-	/* Quad SPI */
-	SNOR_CMD_READ_1_1_4,
-	SNOR_CMD_READ_1_4_4,
-	SNOR_CMD_READ_4_4_4,
-	SNOR_CMD_READ_1_4_4_DTR,
-
-	/* Octo SPI */
-	SNOR_CMD_READ_1_1_8,
-	SNOR_CMD_READ_1_8_8,
-	SNOR_CMD_READ_8_8_8,
-	SNOR_CMD_READ_1_8_8_DTR,
-
-	SNOR_CMD_READ_MAX
-};
-
-enum spi_nor_pp_command_index {
-	SNOR_CMD_PP,
-
-	/* Quad SPI */
-	SNOR_CMD_PP_1_1_4,
-	SNOR_CMD_PP_1_4_4,
-	SNOR_CMD_PP_4_4_4,
-
-	/* Octo SPI */
-	SNOR_CMD_PP_1_1_8,
-	SNOR_CMD_PP_1_8_8,
-	SNOR_CMD_PP_8_8_8,
-
-	SNOR_CMD_PP_MAX
-};
-
-struct spi_nor_flash_parameter {
-	u64				size;
-	u32				page_size;
-
-	struct spi_nor_hwcaps		hwcaps;
-	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
-	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
-
-	int (*quad_enable)(struct spi_nor *nor);
-};
-
 static void
 spi_nor_set_read_settings(struct spi_nor_read_command *read,
 			  u8 num_mode_clocks,
@@ -2263,117 +2391,6 @@ static int spi_nor_read_sfdp_dma_unsafe(struct spi_nor *nor, u32 addr,
 	return ret;
 }
 
-struct sfdp_parameter_header {
-	u8		id_lsb;
-	u8		minor;
-	u8		major;
-	u8		length; /* in double words */
-	u8		parameter_table_pointer[3]; /* byte address */
-	u8		id_msb;
-};
-
-#define SFDP_PARAM_HEADER_ID(p)	(((p)->id_msb << 8) | (p)->id_lsb)
-#define SFDP_PARAM_HEADER_PTP(p) \
-	(((p)->parameter_table_pointer[2] << 16) | \
-	 ((p)->parameter_table_pointer[1] <<  8) | \
-	 ((p)->parameter_table_pointer[0] <<  0))
-
-#define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
-#define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
-
-#define SFDP_SIGNATURE		0x50444653U
-#define SFDP_JESD216_MAJOR	1
-#define SFDP_JESD216_MINOR	0
-#define SFDP_JESD216A_MINOR	5
-#define SFDP_JESD216B_MINOR	6
-
-struct sfdp_header {
-	u32		signature; /* Ox50444653U <=> "SFDP" */
-	u8		minor;
-	u8		major;
-	u8		nph; /* 0-base number of parameter headers */
-	u8		unused;
-
-	/* Basic Flash Parameter Table. */
-	struct sfdp_parameter_header	bfpt_header;
-};
-
-/* Basic Flash Parameter Table */
-
-/*
- * JESD216 rev B defines a Basic Flash Parameter Table of 16 DWORDs.
- * They are indexed from 1 but C arrays are indexed from 0.
- */
-#define BFPT_DWORD(i)		((i) - 1)
-#define BFPT_DWORD_MAX		16
-
-/* The first version of JESB216 defined only 9 DWORDs. */
-#define BFPT_DWORD_MAX_JESD216			9
-
-/* 1st DWORD. */
-#define BFPT_DWORD1_FAST_READ_1_1_2		BIT(16)
-#define BFPT_DWORD1_ADDRESS_BYTES_MASK		GENMASK(18, 17)
-#define BFPT_DWORD1_ADDRESS_BYTES_3_ONLY	(0x0UL << 17)
-#define BFPT_DWORD1_ADDRESS_BYTES_3_OR_4	(0x1UL << 17)
-#define BFPT_DWORD1_ADDRESS_BYTES_4_ONLY	(0x2UL << 17)
-#define BFPT_DWORD1_DTR				BIT(19)
-#define BFPT_DWORD1_FAST_READ_1_2_2		BIT(20)
-#define BFPT_DWORD1_FAST_READ_1_4_4		BIT(21)
-#define BFPT_DWORD1_FAST_READ_1_1_4		BIT(22)
-
-/* 5th DWORD. */
-#define BFPT_DWORD5_FAST_READ_2_2_2		BIT(0)
-#define BFPT_DWORD5_FAST_READ_4_4_4		BIT(4)
-
-/* 11th DWORD. */
-#define BFPT_DWORD11_PAGE_SIZE_SHIFT		4
-#define BFPT_DWORD11_PAGE_SIZE_MASK		GENMASK(7, 4)
-
-/* 15th DWORD. */
-
-/*
- * (from JESD216 rev B)
- * Quad Enable Requirements (QER):
- * - 000b: Device does not have a QE bit. Device detects 1-1-4 and 1-4-4
- *         reads based on instruction. DQ3/HOLD# functions are hold during
- *         instruction phase.
- * - 001b: QE is bit 1 of status register 2. It is set via Write Status with
- *         two data bytes where bit 1 of the second byte is one.
- *         [...]
- *         Writing only one byte to the status register has the side-effect of
- *         clearing status register 2, including the QE bit. The 100b code is
- *         used if writing one byte to the status register does not modify
- *         status register 2.
- * - 010b: QE is bit 6 of status register 1. It is set via Write Status with
- *         one data byte where bit 6 is one.
- *         [...]
- * - 011b: QE is bit 7 of status register 2. It is set via Write status
- *         register 2 instruction 3Eh with one data byte where bit 7 is one.
- *         [...]
- *         The status register 2 is read using instruction 3Fh.
- * - 100b: QE is bit 1 of status register 2. It is set via Write Status with
- *         two data bytes where bit 1 of the second byte is one.
- *         [...]
- *         In contrast to the 001b code, writing one byte to the status
- *         register does not modify status register 2.
- * - 101b: QE is bit 1 of status register 2. Status register 1 is read using
- *         Read Status instruction 05h. Status register2 is read using
- *         instruction 35h. QE is set via Writ Status instruction 01h with
- *         two data bytes where bit 1 of the second byte is one.
- *         [...]
- */
-#define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
-#define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
-#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
-#define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
-#define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
-#define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
-#define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
-
-struct sfdp_bfpt {
-	u32	dwords[BFPT_DWORD_MAX];
-};
-
 /* Fast Read settings. */
 
 static inline void
@@ -2595,6 +2612,19 @@ static void spi_nor_init_uniform_erase_map(struct spi_nor_erase_map *map,
 	map->uniform_erase_type = erase_mask;
 }
 
+static int
+spi_nor_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt,
+			 struct spi_nor_flash_parameter *params)
+{
+	if (nor->info->fixups && nor->info->fixups->post_bfpt)
+		return nor->info->fixups->post_bfpt(nor, bfpt_header, bfpt,
+						    params);
+
+	return 0;
+}
+
 /**
  * spi_nor_parse_bfpt() - read and parse the Basic Flash Parameter Table.
  * @nor:		pointer to a 'struct spi_nor'
@@ -2747,7 +2777,8 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 
 	/* Stop here if not JESD216 rev A or later. */
 	if (bfpt_header->length < BFPT_DWORD_MAX)
-		return 0;
+		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt,
+						params);
 
 	/* Page size: this field specifies 'N' so the page size = 2^N bytes. */
 	params->page_size = bfpt.dwords[BFPT_DWORD(11)];
@@ -2782,7 +2813,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		return -EINVAL;
 	}
 
-	return 0;
+	return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt, params);
 }
 
 #define SMPT_CMD_ADDRESS_LEN_MASK		GENMASK(23, 22)
-- 
2.17.1
