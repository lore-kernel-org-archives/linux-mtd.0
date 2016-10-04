Received: from exsmtp01.microchip.com ([198.175.253.37]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brSiO-0000Gw-D4
 for linux-mtd@lists.infradead.org; Tue, 04 Oct 2016 16:37:15 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH 7/9] mtd: spi-nor: parse SFDP 4-byte Address Instruction Table
Date: Tue, 4 Oct 2016 18:37:09 +0200
Message-ID: <72325c04339d456b1702404e7c70ade4693a5cfc.1475597385.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1475597385.git.cyrille.pitchen@atmel.com>
References: <cover.1475597385.git.cyrille.pitchen@atmel.com>
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

This patch adds supports for SFDP (JESD216B) 4-byte Address Instruction
Table. This table is optional but when available, we parse it to get the
4-byte address op codes supported by the memory.
Using these op codes is stateless as opposed to entering the 4-byte
address mode or setting the Base Address Register (BAR).

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 140 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index e91b3c39b68e..879b98ef1d80 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1481,6 +1481,7 @@ struct sfdp_parameter_header {
 
 
 #define SFDP_BFPT_ID		0xff00u	/* Basic Flash Parameter Table */
+#define SFDP_4BAIT_ID		0xff84u	/* 4-byte Address Instruction Table */
 
 #define SFDP_SIGNATURE		0x50444653u
 #define SFDP_JESD216_MAJOR	1
@@ -1728,6 +1729,124 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	return 0;
 }
 
+struct sfdp_4bait {
+	enum spi_nor_protocol_index	pindex;
+	int				wbit;
+};
+
+static int spi_nor_parse_4bait(struct spi_nor *nor,
+			       const struct sfdp_parameter_header *param_header,
+			       struct spi_nor_basic_flash_parameter *params)
+{
+	static const struct sfdp_4bait reads[] = {
+		{SNOR_PINDEX_SLOW,  0},	/* 0x13 */
+		{SNOR_PINDEX_1_1_1, 1}, /* 0x0c */
+		{SNOR_PINDEX_1_1_2, 2}, /* 0x3c */
+		{SNOR_PINDEX_1_2_2, 3},	/* 0xbc */
+		{SNOR_PINDEX_1_1_4, 4},	/* 0x6c */
+		{SNOR_PINDEX_1_4_4, 5},	/* 0xec */
+	};
+	static const struct sfdp_4bait programs[] = {
+		{SNOR_PINDEX_1_1_1, 6}, /* 0x12 */
+		{SNOR_PINDEX_1_1_4, 7}, /* 0x34 */
+		{SNOR_PINDEX_1_4_4, 8}, /* 0x3e */
+	};
+	static const struct sfdp_4bait erases[SNOR_MAX_ERASE_TYPES] = {
+		{SNOR_PINDEX_1_1_1,  9},
+		{SNOR_PINDEX_1_1_1, 10},
+		{SNOR_PINDEX_1_1_1, 11},
+		{SNOR_PINDEX_1_1_1, 12},
+	};
+	u32 word[2], addr, rd_modes, wr_modes, erase_modes;
+	int i, err;
+
+	if (param_header->major != SFDP_JESD216_MAJOR ||
+	    param_header->length < 2)
+		return -EINVAL;
+
+	/* Read the 4-byte Address Instruction Table. */
+	addr = SFDP_PARAM_HEADER_PTP(param_header);
+	err = spi_nor_read_sfdp(nor, addr, sizeof(word), word);
+	if (err)
+		return err;
+
+	for (i = 0; i < 2; ++i)
+		word[i] = le32_to_cpu(word[i]);
+
+	/*
+	 * Compute the subset of (Fast) Read commands for which the 4-byte
+	 * version is supported.
+	 */
+	rd_modes = 0;
+	for (i = 0; i < ARRAY_SIZE(reads); ++i) {
+		const struct sfdp_4bait *read = &reads[i];
+
+		if ((params->rd_modes & BIT(read->pindex)) &&
+		    (word[0] & BIT(read->wbit)))
+			rd_modes |= BIT(read->pindex);
+	}
+
+	/*
+	 * Compute the subset of Page Program commands for which the 4-byte
+	 * version is supported.
+	 */
+	wr_modes = 0;
+	for (i = 0; i < ARRAY_SIZE(programs); ++i) {
+		const struct sfdp_4bait *program = &programs[i];
+
+		if ((params->wr_modes & BIT(program->pindex)) &&
+		    (word[0] & BIT(program->wbit)))
+			wr_modes |= BIT(program->pindex);
+	}
+
+	/*
+	 * Compute the subet of Sector Erase commands for which the 4-byte
+	 * version is supported.
+	 */
+	erase_modes = 0;
+	for (i = 0; i < SNOR_MAX_ERASE_TYPES; ++i) {
+		const struct sfdp_4bait *erase = &erases[i];
+
+		if ((params->erase_types[i].size > 0) &&
+		    (word[0] & BIT(erase->wbit)))
+			erase_modes |= BIT(i);
+	}
+
+	/*
+	 * We need at least one 4-byte op code per read, program and erase
+	 * operation; the .read(), .write() and .erase() hooks share the
+	 * nor->addr_width value.
+	 */
+	if (!rd_modes || !wr_modes || !erase_modes)
+		return 0;
+
+	/*
+	 * Discard all operations from the 4-byte instruction set which are
+	 * not supported by this memory.
+	 */
+	params->rd_modes = rd_modes;
+	params->wr_modes = wr_modes;
+	for (i = 0; i < SNOR_MAX_ERASE_TYPES; ++i)
+		if (!(erase_modes & BIT(i)))
+			params->erase_types[i].size = 0;
+
+	/* Use the 4-byte address instruction set. */
+	params->reads[SNOR_PINDEX_SLOW].opcode  = SPINOR_OP_READ_4B;
+	params->reads[SNOR_PINDEX_1_1_1].opcode = SPINOR_OP_READ_FAST_4B;
+	params->reads[SNOR_PINDEX_1_1_2].opcode = SPINOR_OP_READ_1_1_2_4B;
+	params->reads[SNOR_PINDEX_1_2_2].opcode = SPINOR_OP_READ_1_2_2_4B;
+	params->reads[SNOR_PINDEX_1_1_4].opcode = SPINOR_OP_READ_1_1_4_4B;
+	params->reads[SNOR_PINDEX_1_4_4].opcode = SPINOR_OP_READ_1_4_4_4B;
+	params->page_programs[SNOR_PINDEX_1_1_1] = SPINOR_OP_PP_4B;
+	params->page_programs[SNOR_PINDEX_1_1_4] = SPINOR_OP_PP_1_1_4_4B;
+	params->page_programs[SNOR_PINDEX_1_4_4] = SPINOR_OP_PP_1_4_4_4B;
+	for (i = 0; i < SNOR_MAX_ERASE_TYPES; ++i)
+		params->erase_types[i].opcode = (word[1] >> (i * 8)) & 0xff;
+
+	nor->addr_width = 4;
+	return 0;
+}
+
 static int spi_nor_parse_sfdp(struct spi_nor *nor,
 			      struct spi_nor_basic_flash_parameter *params)
 {
@@ -1795,6 +1914,23 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	if (err)
 		goto exit;
 
+	/* Parse other parameter headers. */
+	for (i = 0; i < header.nph; ++i) {
+		param_header = &param_headers[i];
+
+		switch (SFDP_PARAM_HEADER_ID(param_header)) {
+		case SFDP_4BAIT_ID:
+			err = spi_nor_parse_4bait(nor, param_header, params);
+			break;
+
+		default:
+			break;
+		}
+
+		if (err)
+			goto exit;
+	}
+
 exit:
 	kfree(param_headers);
 	return (err) ? err : bfpt_header->minor;
@@ -2149,7 +2285,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (info->addr_width)
+	if (nor->addr_width)
+		; /* already configured by spi_nor_setup(). */
+	else if (info->addr_width)
 		nor->addr_width = info->addr_width;
 	else if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
-- 
2.7.4
