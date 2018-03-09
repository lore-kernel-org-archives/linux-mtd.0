Received: from mail.kmu-office.ch ([178.209.48.109])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1euJMM-000606-VG
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2018 14:51:05 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com,
	boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org, stefan@agner.ch
Subject: [PATCH v7 1/3] mtd: rawnand: vf610_nfc: make use of ->exec_op()
Date: Fri,  9 Mar 2018 15:50:36 +0100
Message-Id: <20180309145038.29024-2-stefan@agner.ch>
In-Reply-To: <20180309145038.29024-1-stefan@agner.ch>
References: <20180309145038.29024-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reworks the driver to make use of ->exec_op() callback. The
command sequencer of the VF610 NFC aligns well with the new ops
interface.

The operations are translated to a NFC command code while filling
the necessary registers. Instead of using the special status and
read ID command codes (which require to read status/ID from
special registers instead of the regular data area) the driver
now now uses the main data buffer for all commands. This
simplifies the driver as no special casing is needed.

For control data (status byte, id bytes and parameter page) the
driver needs to reverse byte order for little endian CPUs since
the controller seems to store the bytes in big endian order in
the data buffer.

The current state seems to pass MTD tests on a Colibri VF61.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 415 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 403 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 5d7a1f8f580f..ae85ae9e3727 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -74,6 +74,22 @@
 #define RESET_CMD_CODE			0x4040
 #define STATUS_READ_CMD_CODE		0x4068
 
+/* NFC_CMD2[CODE] controller cycle bit masks */
+#define COMMAND_CMD_BYTE1		BIT(14)
+#define COMMAND_CAR_BYTE1		BIT(13)
+#define COMMAND_CAR_BYTE2		BIT(12)
+#define COMMAND_RAR_BYTE1		BIT(11)
+#define COMMAND_RAR_BYTE2		BIT(10)
+#define COMMAND_RAR_BYTE3		BIT(9)
+#define COMMAND_NADDR_BYTES(x)		GENMASK(13, 13 - (x) + 1)
+#define COMMAND_WRITE_DATA		BIT(8)
+#define COMMAND_CMD_BYTE2		BIT(7)
+#define COMMAND_RB_HANDSHAKE		BIT(6)
+#define COMMAND_READ_DATA		BIT(5)
+#define COMMAND_CMD_BYTE3		BIT(4)
+#define COMMAND_READ_STATUS		BIT(3)
+#define COMMAND_READ_ID			BIT(2)
+
 /* NFC ECC mode define */
 #define ECC_BYPASS			0
 #define ECC_45_BYTE			6
@@ -97,10 +113,13 @@
 /* NFC_COL_ADDR Field */
 #define COL_ADDR_MASK				0x0000FFFF
 #define COL_ADDR_SHIFT				0
+#define COL_ADDR(pos, val)			(((val) & 0xFF) << (8 * (pos)))
 
 /* NFC_ROW_ADDR Field */
 #define ROW_ADDR_MASK				0x00FFFFFF
 #define ROW_ADDR_SHIFT				0
+#define ROW_ADDR(pos, val)			(((val) & 0xFF) << (8 * (pos)))
+
 #define ROW_ADDR_CHIP_SEL_RB_MASK		0xF0000000
 #define ROW_ADDR_CHIP_SEL_RB_SHIFT		28
 #define ROW_ADDR_CHIP_SEL_MASK			0x0F000000
@@ -165,6 +184,12 @@ struct vf610_nfc {
 	enum vf610_nfc_variant variant;
 	struct clk *clk;
 	bool use_hw_ecc;
+	/*
+	 * Indicate that user data is accessed (full page/oob). This is
+	 * useful to indicate the driver whether to swap byte endianness.
+	 * See comments in vf610_nfc_rd_from_sram/vf610_nfc_wr_to_sram.
+	 */
+	bool data_access;
 	u32 ecc_mode;
 };
 
@@ -173,6 +198,11 @@ static inline struct vf610_nfc *mtd_to_nfc(struct mtd_info *mtd)
 	return container_of(mtd_to_nand(mtd), struct vf610_nfc, chip);
 }
 
+static inline struct vf610_nfc *chip_to_nfc(struct nand_chip *chip)
+{
+	return container_of(chip, struct vf610_nfc, chip);
+}
+
 static inline u32 vf610_nfc_read(struct vf610_nfc *nfc, uint reg)
 {
 	return readl(nfc->regs + reg);
@@ -214,6 +244,86 @@ static inline void vf610_nfc_memcpy(void *dst, const void __iomem *src,
 	memcpy(dst, src, n);
 }
 
+static inline bool vf610_nfc_kernel_is_little_endian(void)
+{
+#ifdef __LITTLE_ENDIAN
+	return true;
+#else
+	return false;
+#endif
+}
+
+/**
+ * Read accessor for internal SRAM buffer
+ * @dst: destination address in regular memory
+ * @src: source address in SRAM buffer
+ * @len: bytes to copy
+ * @fix_endian: Fix endianness if required
+ *
+ * Use this accessor for the internal SRAM buffers. On the ARM
+ * Freescale Vybrid SoC it's known that the driver can treat
+ * the SRAM buffer as if it's memory. Other platform might need
+ * to treat the buffers differently.
+ *
+ * The controller stores bytes from the NAND chip internally in big
+ * endianness. On little endian platforms such as Vybrid this leads
+ * to reversed byte order.
+ * For performance reason (and earlier probably due to unawareness)
+ * the driver avoids correcting endianness where it has control over
+ * write and read side (e.g. page wise data access).
+ */
+static inline void vf610_nfc_rd_from_sram(void *dst, const void __iomem *src,
+					  size_t len, bool fix_endian)
+{
+	if (vf610_nfc_kernel_is_little_endian() && fix_endian) {
+		unsigned int i;
+
+		for (i = 0; i < len; i += 4) {
+			u32 val = be32_to_cpu(__raw_readl(src + i));
+
+			memcpy(dst + i, &val, min(sizeof(val), len - i));
+		}
+	} else {
+		memcpy_fromio(dst, src, len);
+	}
+}
+
+/**
+ * Write accessor for internal SRAM buffer
+ * @dst: destination address in SRAM buffer
+ * @src: source address in regular memory
+ * @len: bytes to copy
+ * @fix_endian: Fix endianness if required
+ *
+ * Use this accessor for the internal SRAM buffers. On the ARM
+ * Freescale Vybrid SoC it's known that the driver can treat
+ * the SRAM buffer as if it's memory. Other platform might need
+ * to treat the buffers differently.
+ *
+ * The controller stores bytes from the NAND chip internally in big
+ * endianness. On little endian platforms such as Vybrid this leads
+ * to reversed byte order.
+ * For performance reason (and earlier probably due to unawareness)
+ * the driver avoids correcting endianness where it has control over
+ * write and read side (e.g. page wise data access).
+ */
+static inline void vf610_nfc_wr_to_sram(void __iomem *dst, const void *src,
+					size_t len, bool fix_endian)
+{
+	if (vf610_nfc_kernel_is_little_endian() && fix_endian) {
+		unsigned int i;
+
+		for (i = 0; i < len; i += 4) {
+			u32 val;
+
+			memcpy(&val, src + i, min(sizeof(val), len - i));
+			__raw_writel(cpu_to_be32(val), dst + i);
+		}
+	} else {
+		memcpy_toio(dst, src, len);
+	}
+}
+
 /* Clear flags for upcoming command */
 static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
 {
@@ -489,6 +599,164 @@ static int vf610_nfc_dev_ready(struct mtd_info *mtd)
 	return 1;
 }
 
+static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
+				 u32 cmd1, u32 cmd2, u32 trfr_sz)
+{
+	vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
+			    COL_ADDR_SHIFT, col);
+
+	vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
+			    ROW_ADDR_SHIFT, row);
+
+	vf610_nfc_write(nfc, NFC_SECTOR_SIZE, trfr_sz);
+	vf610_nfc_write(nfc, NFC_FLASH_CMD1, cmd1);
+	vf610_nfc_write(nfc, NFC_FLASH_CMD2, cmd2);
+
+	dev_dbg(nfc->dev,
+		"col 0x%04x, row 0x%08x, cmd1 0x%08x, cmd2 0x%08x, len %d\n",
+		col, row, cmd1, cmd2, trfr_sz);
+
+	vf610_nfc_done(nfc);
+}
+
+static inline const struct nand_op_instr *
+vf610_get_next_instr(const struct nand_subop *subop, int *op_id)
+{
+	if (*op_id + 1 >= subop->ninstrs)
+		return NULL;
+
+	(*op_id)++;
+
+	return &subop->instrs[*op_id];
+}
+
+static int vf610_nfc_cmd(struct nand_chip *chip,
+			 const struct nand_subop *subop)
+{
+	const struct nand_op_instr *instr;
+	struct vf610_nfc *nfc = chip_to_nfc(chip);
+	int op_id = -1, trfr_sz = 0, offset;
+	u32 col = 0, row = 0, cmd1 = 0, cmd2 = 0, code = 0;
+	bool force8bit = false;
+
+	/*
+	 * Some ops are optional, but the hardware requires the operations
+	 * to be in this exact order.
+	 * The op parser enforces the order and makes sure that there isn't
+	 * a read and write element in a single operation.
+	 */
+	instr = vf610_get_next_instr(subop, &op_id);
+	if (!instr)
+		return -EINVAL;
+
+	if (instr && instr->type == NAND_OP_CMD_INSTR) {
+		cmd2 |= instr->ctx.cmd.opcode << CMD_BYTE1_SHIFT;
+		code |= COMMAND_CMD_BYTE1;
+
+		instr = vf610_get_next_instr(subop, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_ADDR_INSTR) {
+		int naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
+		int i = nand_subop_get_addr_start_off(subop, op_id);
+
+		for (; i < naddrs; i++) {
+			u8 val = instr->ctx.addr.addrs[i];
+
+			if (i < 2)
+				col |= COL_ADDR(i, val);
+			else
+				row |= ROW_ADDR(i - 2, val);
+		}
+		code |= COMMAND_NADDR_BYTES(naddrs);
+
+		instr = vf610_get_next_instr(subop, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_DATA_OUT_INSTR) {
+		trfr_sz = nand_subop_get_data_len(subop, op_id);
+		offset = nand_subop_get_data_start_off(subop, op_id);
+		force8bit = instr->ctx.data.force_8bit;
+
+		/*
+		 * Don't fix endianness on page access for historical reasons.
+		 * See comment in vf610_nfc_wr_to_sram
+		 */
+		vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + offset,
+				     instr->ctx.data.buf.out + offset,
+				     trfr_sz, !nfc->data_access);
+		code |= COMMAND_WRITE_DATA;
+
+		instr = vf610_get_next_instr(subop, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_CMD_INSTR) {
+		cmd1 |= instr->ctx.cmd.opcode << CMD_BYTE2_SHIFT;
+		code |= COMMAND_CMD_BYTE2;
+
+		instr = vf610_get_next_instr(subop, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_WAITRDY_INSTR) {
+		code |= COMMAND_RB_HANDSHAKE;
+
+		instr = vf610_get_next_instr(subop, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
+		trfr_sz = nand_subop_get_data_len(subop, op_id);
+		offset = nand_subop_get_data_start_off(subop, op_id);
+		force8bit = instr->ctx.data.force_8bit;
+
+		code |= COMMAND_READ_DATA;
+	}
+
+	if (force8bit && (chip->options & NAND_BUSWIDTH_16))
+		vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
+
+	cmd2 |= code << CMD_CODE_SHIFT;
+
+	vf610_nfc_run(nfc, col, row, cmd1, cmd2, trfr_sz);
+
+	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
+		/*
+		 * Don't fix endianness on page access for historical reasons.
+		 * See comment in vf610_nfc_rd_from_sram
+		 */
+		vf610_nfc_rd_from_sram(instr->ctx.data.buf.in + offset,
+				       nfc->regs + NFC_MAIN_AREA(0) + offset,
+				       trfr_sz, !nfc->data_access);
+	}
+
+	if (force8bit && (chip->options & NAND_BUSWIDTH_16))
+		vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_16BIT);
+
+	return 0;
+}
+
+static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
+	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
+		NAND_OP_PARSER_PAT_CMD_ELEM(true),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
+		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
+		NAND_OP_PARSER_PAT_CMD_ELEM(true),
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true)),
+	NAND_OP_PARSER_PATTERN(vf610_nfc_cmd,
+		NAND_OP_PARSER_PAT_CMD_ELEM(true),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
+		NAND_OP_PARSER_PAT_CMD_ELEM(true),
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
+	);
+
+static int vf610_nfc_exec_op(struct nand_chip *chip,
+			     const struct nand_operation *op,
+			     bool check_only)
+{
+	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op,
+				      check_only);
+}
+
 /*
  * This function supports Vybrid only (MPC5125 would have full RB and four CS)
  */
@@ -526,9 +794,9 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	if (!(ecc_status & ECC_STATUS_MASK))
 		return ecc_count;
 
-	/* Read OOB without ECC unit enabled */
-	vf610_nfc_command(mtd, NAND_CMD_READOOB, 0, page);
-	vf610_nfc_read_buf(mtd, oob, mtd->oobsize);
+	nfc->data_access = true;
+	nand_read_oob_op(&nfc->chip, page, 0, oob, mtd->oobsize);
+	nfc->data_access = false;
 
 	/*
 	 * On an erased page, bit count (including OOB) should be zero or
@@ -539,15 +807,51 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 					   flips_threshold);
 }
 
+static void vf610_nfc_fill_row(struct nand_chip *chip, int page, u32 *code,
+			       u32 *row)
+{
+	*row = ROW_ADDR(0, page & 0xff) | ROW_ADDR(1, page >> 8);
+	*code |= COMMAND_RAR_BYTE1 | COMMAND_RAR_BYTE2;
+
+	if (chip->options & NAND_ROW_ADDR_3) {
+		*row |= ROW_ADDR(2, page >> 16);
+		*code |= COMMAND_RAR_BYTE3;
+	}
+}
+
 static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int oob_required, int page)
 {
-	int eccsize = chip->ecc.size;
+	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
+	int trfr_sz = mtd->writesize + mtd->oobsize;
+	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
 	int stat;
 
-	nand_read_page_op(chip, page, 0, buf, eccsize);
+	cmd2 |= NAND_CMD_READ0 << CMD_BYTE1_SHIFT;
+	code |= COMMAND_CMD_BYTE1 | COMMAND_CAR_BYTE1 | COMMAND_CAR_BYTE2;
+
+	vf610_nfc_fill_row(chip, page, &code, &row);
+
+	cmd1 |= NAND_CMD_READSTART << CMD_BYTE2_SHIFT;
+	code |= COMMAND_CMD_BYTE2 | COMMAND_RB_HANDSHAKE | COMMAND_READ_DATA;
+
+	cmd2 |= code << CMD_CODE_SHIFT;
+
+	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
+	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
+	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
+
+	/*
+	 * Don't fix endianness on page access for historical reasons.
+	 * See comment in vf610_nfc_rd_from_sram
+	 */
+	vf610_nfc_rd_from_sram(buf, nfc->regs + NFC_MAIN_AREA(0),
+			       mtd->writesize, false);
 	if (oob_required)
-		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+		vf610_nfc_rd_from_sram(chip->oob_poi,
+				       nfc->regs + NFC_MAIN_AREA(0) +
+						   mtd->writesize,
+				       mtd->oobsize, false);
 
 	stat = vf610_nfc_correct_data(mtd, buf, chip->oob_poi, page);
 
@@ -564,14 +868,95 @@ static int vf610_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf, int oob_required, int page)
 {
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
+	int trfr_sz = mtd->writesize + mtd->oobsize;
+	u32 row = 0, cmd1 = 0, cmd2 = 0, code = 0;
+	int ret = 0;
 
-	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
-	if (oob_required)
-		vf610_nfc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
+	cmd2 |= NAND_CMD_SEQIN << CMD_BYTE1_SHIFT;
+	code |= COMMAND_CMD_BYTE1 | COMMAND_CAR_BYTE1 | COMMAND_CAR_BYTE2;
+
+	vf610_nfc_fill_row(chip, page, &code, &row);
+
+	cmd1 |= NAND_CMD_PAGEPROG << CMD_BYTE2_SHIFT;
+	code |= COMMAND_CMD_BYTE2 | COMMAND_WRITE_DATA;
+
+	/*
+	 * Don't fix endianness on page access for historical reasons.
+	 * See comment in vf610_nfc_wr_to_sram
+	 */
+	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
+			     mtd->writesize, false);
+
+	code |= COMMAND_RB_HANDSHAKE;
+	cmd2 |= code << CMD_CODE_SHIFT;
+
+	vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
+	vf610_nfc_run(nfc, 0, row, cmd1, cmd2, trfr_sz);
+	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
+
+	return ret;
+}
+
+static int vf610_nfc_read_page_raw(struct mtd_info *mtd,
+				   struct nand_chip *chip, u8 *buf,
+				   int oob_required, int page)
+{
+	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
+	int ret;
+
+	nfc->data_access = true;
+	ret = nand_read_page_raw(mtd, chip, buf, oob_required, page);
+	nfc->data_access = false;
+
+	return ret;
+}
+
+static int vf610_nfc_write_page_raw(struct mtd_info *mtd,
+				    struct nand_chip *chip, const u8 *buf,
+				    int oob_required, int page)
+{
+	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
+	int ret;
+
+	nfc->data_access = true;
+	ret = nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
+	if (!ret && oob_required)
+		ret = nand_write_data_op(chip, chip->oob_poi, mtd->oobsize,
+					 false);
+	nfc->data_access = false;
+
+	if (ret)
+		return ret;
+
+	return nand_prog_page_end_op(chip);
+}
+
+static int vf610_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
+			      int page)
+{
+	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
+	int ret;
+
+	nfc->data_access = true;
+	ret = nand_read_oob_std(mtd, chip, page);
+	nfc->data_access = false;
+
+	return ret;
+}
+
+static int vf610_nfc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
+			       int page)
+{
+	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
+	int ret;
+
+	nfc->data_access = true;
+	ret = nand_prog_page_begin_op(chip, page, mtd->writesize,
+				      chip->oob_poi, mtd->oobsize);
+	nfc->data_access = false;
 
-	/* Always write whole page including OOB due to HW ECC */
-	nfc->use_hw_ecc = true;
-	nfc->write_sz = mtd->writesize + mtd->oobsize;
+	if (ret)
+		return ret;
 
 	return nand_prog_page_end_op(chip);
 }
@@ -590,6 +975,7 @@ static void vf610_nfc_preinit_controller(struct vf610_nfc *nfc)
 	vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_BOOT_MODE_BIT);
 	vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_DMA_REQ_BIT);
 	vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_FAST_FLASH_BIT);
+	vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
 
 	/* Disable virtual pages, only one elementary transfer unit */
 	vf610_nfc_set_field(nfc, NFC_FLASH_CONFIG, CONFIG_PAGE_CNT_MASK,
@@ -686,6 +1072,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	chip->read_word = vf610_nfc_read_word;
 	chip->read_buf = vf610_nfc_read_buf;
 	chip->write_buf = vf610_nfc_write_buf;
+	chip->exec_op = vf610_nfc_exec_op;
 	chip->select_chip = vf610_nfc_select_chip;
 	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
 	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
@@ -755,6 +1142,10 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 		chip->ecc.read_page = vf610_nfc_read_page;
 		chip->ecc.write_page = vf610_nfc_write_page;
+		chip->ecc.read_page_raw = vf610_nfc_read_page_raw;
+		chip->ecc.write_page_raw = vf610_nfc_write_page_raw;
+		chip->ecc.read_oob = vf610_nfc_read_oob;
+		chip->ecc.write_oob = vf610_nfc_write_oob;
 
 		chip->ecc.size = PAGE_2K;
 	}
-- 
2.16.2
