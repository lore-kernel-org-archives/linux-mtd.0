Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eaqKQ-0002cB-RO
 for linux-mtd@lists.infradead.org; Sun, 14 Jan 2018 22:00:38 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr
Cc: richard@nod.at, bpringle@sympatico.ca, marcel.ziswiler@toradex.com,
 linux-mtd@lists.infradead.org, Stefan Agner <stefan@agner.ch>
Subject: [RFC PATCH v2] mtd: nand: vf610_nfc: make use of ->exec_op()
Date: Sun, 14 Jan 2018 23:00:12 +0100
Message-Id: <20180114220012.30039-1-stefan@agner.ch>
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

The ops are translated to a NFC command code while filling the
necessary registers. Instead of using the special status and
read id command codes (which require the status/id form special
registers) the driver now uses the main data buffer for all
commands. This simplifies the driver as no special casing is
needed.

For control data (status byte, id bytes and parameter page) the
driver needs to reverse byte order for little endian CPUs since
the controller seems to store the bytes in big endian order in
the data buffer.

The current state seems to pass MTD tests on a Colibri VF61.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Hi,

In this second version I was able to remove all special command
handling. As Boris suggested, the special READID/STATUS handling
is really not needed and all return values can be read from the
regular data buffer. This simplified code even more and allowed
to get rid of the hack in the MTD core. The driver is now able
to handle all commands in a single function. Therefor I also got
rid of the command parser, since everything is handled in a single
function anyway.

The only thing which is somewhat unfortunate is the byte ordering
which needs to be reversed for commands which read flash data (id,
status and parameter page). All those request 8-bit handling, so
I used this as an indicator to fix byte order.

I did meassured a slight performance drop (before vs. now):
- write speed is 4036 KiB/s vs 3495 KiB/s
- read speed is 13741 KiB/s vs 13490 KiB/s

--
Stefan

 drivers/mtd/nand/vf610_nfc.c | 444 +++++++++++++++++++------------------------
 1 file changed, 194 insertions(+), 250 deletions(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 80d31a58e558..fb428a94bbd4 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -59,20 +59,20 @@
 #define OOB_64				0x0040
 #define OOB_MAX				0x0100
 
-/*
- * NFC_CMD2[CODE] values. See section:
- *  - 31.4.7 Flash Command Code Description, Vybrid manual
- *  - 23.8.6 Flash Command Sequencer, MPC5125 manual
- *
- * Briefly these are bitmasks of controller cycles.
- */
-#define READ_PAGE_CMD_CODE		0x7EE0
-#define READ_ONFI_PARAM_CMD_CODE	0x4860
-#define PROGRAM_PAGE_CMD_CODE		0x7FC0
-#define ERASE_CMD_CODE			0x4EC0
-#define READ_ID_CMD_CODE		0x4804
-#define RESET_CMD_CODE			0x4040
-#define STATUS_READ_CMD_CODE		0x4068
+/* NFC_CMD2[CODE] controller cycle bit masks */
+#define COMMAND_CMD_BYTE1		BIT(14)
+#define COMMAND_CAR_BYTE1		BIT(13)
+#define COMMAND_CAR_BYTE2		BIT(12)
+#define COMMAND_RAR_BYTE1		BIT(11)
+#define COMMAND_RAR_BYTE2		BIT(10)
+#define COMMAND_RAR_BYTE3		BIT(9)
+#define COMMAND_WRITE_DATA		BIT(8)
+#define COMMAND_CMD_BYTE2		BIT(7)
+#define COMMAND_RB_HANDSHAKE		BIT(6)
+#define COMMAND_READ_DATA		BIT(5)
+#define COMMAND_CMD_BYTE3		BIT(4)
+#define COMMAND_READ_STATUS		BIT(3)
+#define COMMAND_READ_ID			BIT(2)
 
 /* NFC ECC mode define */
 #define ECC_BYPASS			0
@@ -97,10 +97,21 @@
 /* NFC_COL_ADDR Field */
 #define COL_ADDR_MASK				0x0000FFFF
 #define COL_ADDR_SHIFT				0
+#define COL_ADDR_BYTE1_SHIFT			0
+#define COL_ADDR_BYTE2_SHIFT			8
+#define COL_ADDR_BYTE1(x)			((x & 0xFF) << COL_ADDR_BYTE1_SHIFT)
+#define COL_ADDR_BYTE2(x)			((x & 0XFF) << COL_ADDR_BYTE2_SHIFT)
+
 
 /* NFC_ROW_ADDR Field */
 #define ROW_ADDR_MASK				0x00FFFFFF
 #define ROW_ADDR_SHIFT				0
+#define ROW_ADDR_BYTE1_SHIFT			0
+#define ROW_ADDR_BYTE2_SHIFT			8
+#define ROW_ADDR_BYTE3_SHIFT			16
+#define ROW_ADDR_BYTE1(x)			((x & 0xFF) << ROW_ADDR_BYTE1_SHIFT)
+#define ROW_ADDR_BYTE2(x)			((x & 0XFF) << ROW_ADDR_BYTE2_SHIFT)
+#define ROW_ADDR_BYTE3(x)			((x & 0XFF) << ROW_ADDR_BYTE3_SHIFT)
 #define ROW_ADDR_CHIP_SEL_RB_MASK		0xF0000000
 #define ROW_ADDR_CHIP_SEL_RB_SHIFT		28
 #define ROW_ADDR_CHIP_SEL_MASK			0x0F000000
@@ -142,13 +153,6 @@
 #define ECC_STATUS_MASK		0x80
 #define ECC_STATUS_ERR_COUNT	0x3F
 
-enum vf610_nfc_alt_buf {
-	ALT_BUF_DATA = 0,
-	ALT_BUF_ID = 1,
-	ALT_BUF_STAT = 2,
-	ALT_BUF_ONFI = 3,
-};
-
 enum vf610_nfc_variant {
 	NFC_VFC610 = 1,
 };
@@ -158,10 +162,7 @@ struct vf610_nfc {
 	struct device *dev;
 	void __iomem *regs;
 	struct completion cmd_done;
-	uint buf_offset;
-	int write_sz;
 	/* Status and ID are in alternate locations. */
-	enum vf610_nfc_alt_buf alt_buf;
 	enum vf610_nfc_variant variant;
 	struct clk *clk;
 	bool use_hw_ecc;
@@ -173,6 +174,11 @@ static inline struct vf610_nfc *mtd_to_nfc(struct mtd_info *mtd)
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
@@ -214,7 +220,6 @@ static inline void vf610_nfc_memcpy(void *dst, const void __iomem *src,
 	memcpy(dst, src, n);
 }
 
-/* Clear flags for upcoming command */
 static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
 {
 	u32 tmp = vf610_nfc_read(nfc, NFC_IRQ_STATUS);
@@ -243,51 +248,22 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
 	vf610_nfc_clear_status(nfc);
 }
 
-static u8 vf610_nfc_get_id(struct vf610_nfc *nfc, int col)
-{
-	u32 flash_id;
-
-	if (col < 4) {
-		flash_id = vf610_nfc_read(nfc, NFC_FLASH_STATUS1);
-		flash_id >>= (3 - col) * 8;
-	} else {
-		flash_id = vf610_nfc_read(nfc, NFC_FLASH_STATUS2);
-		flash_id >>= 24;
-	}
-
-	return flash_id & 0xff;
-}
-
-static u8 vf610_nfc_get_status(struct vf610_nfc *nfc)
+static void vf610_nfc_send_code(struct vf610_nfc *nfc, u32 cmd_code)
 {
-	return vf610_nfc_read(nfc, NFC_FLASH_STATUS2) & STATUS_BYTE1_MASK;
+	vf610_nfc_set_field(nfc, NFC_FLASH_CMD2, CMD_CODE_MASK, CMD_CODE_SHIFT,
+			    cmd_code);
 }
 
-static void vf610_nfc_send_command(struct vf610_nfc *nfc, u32 cmd_byte1,
-				   u32 cmd_code)
+static void vf610_nfc_set_cmd1(struct vf610_nfc *nfc, u32 cmd_byte1)
 {
-	u32 tmp;
-
-	vf610_nfc_clear_status(nfc);
-
-	tmp = vf610_nfc_read(nfc, NFC_FLASH_CMD2);
-	tmp &= ~(CMD_BYTE1_MASK | CMD_CODE_MASK | BUFNO_MASK);
-	tmp |= cmd_byte1 << CMD_BYTE1_SHIFT;
-	tmp |= cmd_code << CMD_CODE_SHIFT;
-	vf610_nfc_write(nfc, NFC_FLASH_CMD2, tmp);
+	vf610_nfc_set_field(nfc, NFC_FLASH_CMD2, CMD_BYTE1_MASK,
+			    CMD_BYTE1_SHIFT, cmd_byte1);
 }
 
-static void vf610_nfc_send_commands(struct vf610_nfc *nfc, u32 cmd_byte1,
-				    u32 cmd_byte2, u32 cmd_code)
+static void vf610_nfc_set_cmd2(struct vf610_nfc *nfc, u32 cmd_byte2)
 {
-	u32 tmp;
-
-	vf610_nfc_send_command(nfc, cmd_byte1, cmd_code);
-
-	tmp = vf610_nfc_read(nfc, NFC_FLASH_CMD1);
-	tmp &= ~CMD_BYTE2_MASK;
-	tmp |= cmd_byte2 << CMD_BYTE2_SHIFT;
-	vf610_nfc_write(nfc, NFC_FLASH_CMD1, tmp);
+	vf610_nfc_set_field(nfc, NFC_FLASH_CMD1, CMD_BYTE2_MASK,
+			    CMD_BYTE2_SHIFT, cmd_byte2);
 }
 
 static irqreturn_t vf610_nfc_irq(int irq, void *data)
@@ -301,19 +277,6 @@ static irqreturn_t vf610_nfc_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void vf610_nfc_addr_cycle(struct vf610_nfc *nfc, int column, int page)
-{
-	if (column != -1) {
-		if (nfc->chip.options & NAND_BUSWIDTH_16)
-			column = column / 2;
-		vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
-				    COL_ADDR_SHIFT, column);
-	}
-	if (page != -1)
-		vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
-				    ROW_ADDR_SHIFT, page);
-}
-
 static inline void vf610_nfc_ecc_mode(struct vf610_nfc *nfc, int ecc_mode)
 {
 	vf610_nfc_set_field(nfc, NFC_FLASH_CONFIG,
@@ -326,167 +289,158 @@ static inline void vf610_nfc_transfer_size(struct vf610_nfc *nfc, int size)
 	vf610_nfc_write(nfc, NFC_SECTOR_SIZE, size);
 }
 
-static void vf610_nfc_command(struct mtd_info *mtd, unsigned command,
-			      int column, int page)
+static inline const struct nand_op_instr *vf610_get_next_instr(
+	const struct nand_operation *op, int *op_id)
 {
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	int trfr_sz = nfc->chip.options & NAND_BUSWIDTH_16 ? 1 : 0;
+	if (*op_id + 1 >= op->ninstrs)
+		return NULL;
 
-	nfc->buf_offset = max(column, 0);
-	nfc->alt_buf = ALT_BUF_DATA;
+	return &op->instrs[++(*op_id)];
+}
 
-	switch (command) {
-	case NAND_CMD_SEQIN:
-		/* Use valid column/page from preread... */
-		vf610_nfc_addr_cycle(nfc, column, page);
-		nfc->buf_offset = 0;
+static int vf610_nfc_exec_op(struct nand_chip *chip,
+			     const struct nand_operation *op,
+			     bool check_only)
+{
+	const struct nand_op_instr *instr;
+	struct vf610_nfc *nfc = chip_to_nfc(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int op_id = -1, trfr_sz = 0, code = 0;
 
-		/*
-		 * SEQIN => data => PAGEPROG sequence is done by the controller
-		 * hence we do not need to issue the command here...
-		 */
-		return;
-	case NAND_CMD_PAGEPROG:
-		trfr_sz += nfc->write_sz;
-		vf610_nfc_transfer_size(nfc, trfr_sz);
-		vf610_nfc_send_commands(nfc, NAND_CMD_SEQIN,
-					command, PROGRAM_PAGE_CMD_CODE);
-		if (nfc->use_hw_ecc)
-			vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
-		else
-			vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
-		break;
-
-	case NAND_CMD_RESET:
-		vf610_nfc_transfer_size(nfc, 0);
-		vf610_nfc_send_command(nfc, command, RESET_CMD_CODE);
-		break;
-
-	case NAND_CMD_READOOB:
-		trfr_sz += mtd->oobsize;
-		column = mtd->writesize;
-		vf610_nfc_transfer_size(nfc, trfr_sz);
-		vf610_nfc_send_commands(nfc, NAND_CMD_READ0,
-					NAND_CMD_READSTART, READ_PAGE_CMD_CODE);
-		vf610_nfc_addr_cycle(nfc, column, page);
-		vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
-		break;
-
-	case NAND_CMD_READ0:
-		trfr_sz += mtd->writesize + mtd->oobsize;
-		vf610_nfc_transfer_size(nfc, trfr_sz);
-		vf610_nfc_send_commands(nfc, NAND_CMD_READ0,
-					NAND_CMD_READSTART, READ_PAGE_CMD_CODE);
-		vf610_nfc_addr_cycle(nfc, column, page);
-		vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
-		break;
-
-	case NAND_CMD_PARAM:
-		nfc->alt_buf = ALT_BUF_ONFI;
-		trfr_sz = 3 * sizeof(struct nand_onfi_params);
-		vf610_nfc_transfer_size(nfc, trfr_sz);
-		vf610_nfc_send_command(nfc, command, READ_ONFI_PARAM_CMD_CODE);
-		vf610_nfc_addr_cycle(nfc, -1, column);
-		vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
-		break;
-
-	case NAND_CMD_ERASE1:
-		vf610_nfc_transfer_size(nfc, 0);
-		vf610_nfc_send_commands(nfc, command,
-					NAND_CMD_ERASE2, ERASE_CMD_CODE);
-		vf610_nfc_addr_cycle(nfc, column, page);
-		break;
-
-	case NAND_CMD_READID:
-		nfc->alt_buf = ALT_BUF_ID;
-		nfc->buf_offset = 0;
-		vf610_nfc_transfer_size(nfc, 0);
-		vf610_nfc_send_command(nfc, command, READ_ID_CMD_CODE);
-		vf610_nfc_addr_cycle(nfc, -1, column);
-		break;
-
-	case NAND_CMD_STATUS:
-		nfc->alt_buf = ALT_BUF_STAT;
-		vf610_nfc_transfer_size(nfc, 0);
-		vf610_nfc_send_command(nfc, command, STATUS_READ_CMD_CODE);
-		break;
-	default:
-		return;
+
+	/* Some ops are optional, but they need to be in order */
+	instr = vf610_get_next_instr(op, &op_id);
+	if (!instr)
+		return -EINVAL;
+
+	if (instr && instr->type == NAND_OP_CMD_INSTR) {
+		dev_dbg(nfc->dev, "OP_CMD: code 0x%02x\n", instr->ctx.cmd.opcode);
+		vf610_nfc_set_cmd1(nfc, instr->ctx.cmd.opcode);
+		code |= COMMAND_CMD_BYTE1;
+
+		instr = vf610_get_next_instr(op, &op_id);
 	}
 
-	vf610_nfc_done(nfc);
+	if (instr && instr->type == NAND_OP_ADDR_INSTR) {
+		int addr = 0;
+		u32 col = 0, row;
 
-	nfc->use_hw_ecc = false;
-	nfc->write_sz = 0;
-}
+		if (instr->ctx.addr.naddrs > 1) {
+			col = COL_ADDR_BYTE1(instr->ctx.addr.addrs[addr++]);
+			code |= COMMAND_CAR_BYTE1;
 
-static void vf610_nfc_read_buf(struct mtd_info *mtd, u_char *buf, int len)
-{
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	uint c = nfc->buf_offset;
+			if (mtd->writesize > 512) {
+				col |= COL_ADDR_BYTE2(instr->ctx.addr.addrs[addr++]);
+				code |= COMMAND_CAR_BYTE2;
+			}
+		}
 
-	/* Alternate buffers are only supported through read_byte */
-	WARN_ON(nfc->alt_buf);
+		row = ROW_ADDR_BYTE1(instr->ctx.addr.addrs[addr++]);
+		code |= COMMAND_RAR_BYTE1;
+		if (addr < instr->ctx.addr.naddrs) {
+			row |= ROW_ADDR_BYTE2(instr->ctx.addr.addrs[addr++]);
+			code |= COMMAND_RAR_BYTE2;
+		}
+		if (addr < instr->ctx.addr.naddrs) {
+			row |= ROW_ADDR_BYTE3(instr->ctx.addr.addrs[addr++]);
+			code |= COMMAND_RAR_BYTE3;
+		}
 
-	vf610_nfc_memcpy(buf, nfc->regs + NFC_MAIN_AREA(0) + c, len);
+		dev_dbg(nfc->dev, "OP_ADDR: col %d, row %d\n", col, row);
+		vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
+			    COL_ADDR_SHIFT, col);
 
-	nfc->buf_offset += len;
-}
+		vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
+			    ROW_ADDR_SHIFT, row);
 
-static void vf610_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
-				int len)
-{
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	uint c = nfc->buf_offset;
-	uint l;
+		instr = vf610_get_next_instr(op, &op_id);
+	}
 
-	l = min_t(uint, len, mtd->writesize + mtd->oobsize - c);
-	vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + c, buf, l);
+	if (instr && instr->type == NAND_OP_DATA_OUT_INSTR) {
+		int len = instr->ctx.data.len;
+		int offset = 0;
 
-	nfc->write_sz += l;
-	nfc->buf_offset += l;
-}
+		dev_dbg(nfc->dev, "OP_DATA_OUT: len %d, offset %d\n", len, offset);
+
+		vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + offset,
+				 instr->ctx.data.buf.in + offset,
+				 len);
+		code |= COMMAND_WRITE_DATA;
+		trfr_sz += len;
+
+		instr = vf610_get_next_instr(op, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_CMD_INSTR) {
+		vf610_nfc_set_cmd2(nfc, instr->ctx.cmd.opcode);
+		code |= COMMAND_CMD_BYTE2;
+
+		instr = vf610_get_next_instr(op, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_WAITRDY_INSTR) {
+		//dev_dbg(nfc->dev, "WAITRDY [max %d ms]\n",
+		//		  instr->ctx.waitrdy.timeout_ms);
+		code |= COMMAND_RB_HANDSHAKE;
+
+		instr = vf610_get_next_instr(op, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
+		int len = instr->ctx.data.len;
+		code |= COMMAND_READ_DATA;
+		trfr_sz += len;
+	}
+
+	if (nfc->use_hw_ecc) {
+		vf610_nfc_ecc_mode(nfc, nfc->ecc_mode);
+
+		/* Always transfer complete page with OOB when using HW ECC */
+		trfr_sz = mtd->writesize + mtd->oobsize;
+	} else {
+		vf610_nfc_ecc_mode(nfc, ECC_BYPASS);
+	}
+	vf610_nfc_transfer_size(nfc, trfr_sz);
+	vf610_nfc_send_code(nfc, code);
+
+	dev_dbg(nfc->dev, "Start: code: 0x%04x, hw ecc: %d, trfr_sz %d\n",
+		code, nfc->use_hw_ecc, trfr_sz);
+	vf610_nfc_done(nfc);
+
+	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
+		int len = instr->ctx.data.len;
+		int offset = 0;
+		bool fix_byte_order = false;
 
-static uint8_t vf610_nfc_read_byte(struct mtd_info *mtd)
-{
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	u8 tmp;
-	uint c = nfc->buf_offset;
-
-	switch (nfc->alt_buf) {
-	case ALT_BUF_ID:
-		tmp = vf610_nfc_get_id(nfc, c);
-		break;
-	case ALT_BUF_STAT:
-		tmp = vf610_nfc_get_status(nfc);
-		break;
 #ifdef __LITTLE_ENDIAN
-	case ALT_BUF_ONFI:
-		/* Reverse byte since the controller uses big endianness */
-		c = nfc->buf_offset ^ 0x3;
-		/* fall-through */
+		fix_byte_order = true;
 #endif
-	default:
-		tmp = *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
-		break;
-	}
-	nfc->buf_offset++;
-	return tmp;
-}
+		dev_dbg(nfc->dev, "OP_DATA_IN: 8-bit: %d, len %d, offset %d\n",
+			instr->ctx.data.force_8bit , len, offset);
 
-static u16 vf610_nfc_read_word(struct mtd_info *mtd)
-{
-	u16 tmp;
+		/*
+		 * HACK: force_8bit indicates reading of the parameter, status
+		 * or id data. The controllers seems to store data in big endian
+		 * byte order to the buffers. Reverse on little endian machines.
+		 */
+		if (instr->ctx.data.force_8bit && fix_byte_order) {
+			u8 *buf = instr->ctx.data.buf.in;
 
-	vf610_nfc_read_buf(mtd, (u_char *)&tmp, sizeof(tmp));
-	return tmp;
-}
+			while (len--) {
+				int c = offset ^ 0x3;
 
-/* If not provided, upper layers apply a fixed delay. */
-static int vf610_nfc_dev_ready(struct mtd_info *mtd)
-{
-	/* NFC handles R/B internally; always ready.  */
-	return 1;
+				*buf = *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
+				//dev_info(nfc->dev, "[%d]: %02x\n", offset, *buf);
+				buf++; offset++;
+			}
+		} else {
+			vf610_nfc_memcpy(instr->ctx.data.buf.in + offset,
+					 nfc->regs + NFC_MAIN_AREA(0) + offset,
+					 len);
+		}
+	}
+
+	return 0;
 }
 
 /*
@@ -511,21 +465,6 @@ static void vf610_nfc_select_chip(struct mtd_info *mtd, int chip)
 	vf610_nfc_write(nfc, NFC_ROW_ADDR, tmp);
 }
 
-/* Count the number of 0's in buff up to max_bits */
-static inline int count_written_bits(uint8_t *buff, int size, int max_bits)
-{
-	uint32_t *buff32 = (uint32_t *)buff;
-	int k, written_bits = 0;
-
-	for (k = 0; k < (size / 4); k++) {
-		written_bits += hweight32(~buff32[k]);
-		if (unlikely(written_bits > max_bits))
-			break;
-	}
-
-	return written_bits;
-}
-
 static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 					 uint8_t *oob, int page)
 {
@@ -542,8 +481,7 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 		return ecc_count;
 
 	/* Read OOB without ECC unit enabled */
-	vf610_nfc_command(mtd, NAND_CMD_READOOB, 0, page);
-	vf610_nfc_read_buf(mtd, oob, mtd->oobsize);
+	nand_read_page_op(&nfc->chip, page, mtd->writesize, oob, mtd->oobsize);
 
 	/*
 	 * On an erased page, bit count (including OOB) should be zero or
@@ -557,12 +495,17 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 static int vf610_nfc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int oob_required, int page)
 {
+	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
 	int eccsize = chip->ecc.size;
 	int stat;
 
+	nfc->use_hw_ecc = true;
 	nand_read_page_op(chip, page, 0, buf, eccsize);
 	if (oob_required)
-		vf610_nfc_read_buf(mtd, chip->oob_poi, mtd->oobsize);
+		vf610_nfc_memcpy(chip->oob_poi,
+				 nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
+				 mtd->oobsize);
+	nfc->use_hw_ecc = false;
 
 	stat = vf610_nfc_correct_data(mtd, buf, chip->oob_poi, page);
 
@@ -579,16 +522,20 @@ static int vf610_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 				const uint8_t *buf, int oob_required, int page)
 {
 	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
+	int ret;
 
-	nand_prog_page_begin_op(chip, page, 0, buf, mtd->writesize);
-	if (oob_required)
-		vf610_nfc_write_buf(mtd, chip->oob_poi, mtd->oobsize);
-
-	/* Always write whole page including OOB due to HW ECC */
 	nfc->use_hw_ecc = true;
-	nfc->write_sz = mtd->writesize + mtd->oobsize;
+	ret = nand_prog_page_op(chip, page, 0, buf, mtd->writesize);
+	nfc->use_hw_ecc = false;
 
-	return nand_prog_page_end_op(chip);
+	return ret;
+}
+
+static int vf610_nfc_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+				const uint8_t *buf, int oob_required, int page)
+{
+	return nand_prog_page_op(chip, page, 0, buf,
+			mtd->writesize + oob_required ? mtd->oobsize : 0);
 }
 
 static const struct of_device_id vf610_nfc_dt_ids[] = {
@@ -606,6 +553,9 @@ static void vf610_nfc_preinit_controller(struct vf610_nfc *nfc)
 	vf610_nfc_clear(nfc, NFC_FLASH_CONFIG, CONFIG_DMA_REQ_BIT);
 	vf610_nfc_set(nfc, NFC_FLASH_CONFIG, CONFIG_FAST_FLASH_BIT);
 
+	/* Make sure flags are cleared on startup */
+	vf610_nfc_clear_status(nfc);
+
 	/* Disable virtual pages, only one elementary transfer unit */
 	vf610_nfc_set_field(nfc, NFC_FLASH_CONFIG, CONFIG_PAGE_CNT_MASK,
 			    CONFIG_PAGE_CNT_SHIFT, 1);
@@ -695,15 +645,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	chip->dev_ready = vf610_nfc_dev_ready;
-	chip->cmdfunc = vf610_nfc_command;
-	chip->read_byte = vf610_nfc_read_byte;
-	chip->read_word = vf610_nfc_read_word;
-	chip->read_buf = vf610_nfc_read_buf;
-	chip->write_buf = vf610_nfc_write_buf;
+	chip->exec_op = vf610_nfc_exec_op;
 	chip->select_chip = vf610_nfc_select_chip;
-	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
 
 	chip->options |= NAND_NO_SUBPAGE_WRITE;
 
@@ -770,6 +713,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 		chip->ecc.read_page = vf610_nfc_read_page;
 		chip->ecc.write_page = vf610_nfc_write_page;
+		chip->ecc.write_page_raw = vf610_nfc_write_page_raw;
 
 		chip->ecc.size = PAGE_2K;
 	}
-- 
2.15.1
