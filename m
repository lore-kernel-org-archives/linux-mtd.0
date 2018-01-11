Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZmcl-0004TW-Fv
 for linux-mtd@lists.infradead.org; Thu, 11 Jan 2018 23:51:10 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr
Cc: richard@nod.at, linux-mtd@lists.infradead.org,
 Stefan Agner <stefan@agner.ch>
Subject: [RFC PATCH 1/2] mtd: nand: vf610_nfc: make use of ->exec_op()
Date: Fri, 12 Jan 2018 00:50:36 +0100
Message-Id: <20180111235037.10912-1-stefan@agner.ch>
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

Currently we handle reset and read id pattern separately. The
read id pattern uses registers for the returned data, using a
dedicated function helps to special case the data in op.

The parameter page handling is rather ad-hoc currently: The
stack calls exec_op twice, once to read the paramter page and
a second time to tranfer data. The code/controller can not
handle this steps separately, hence just transfer data already
in the first call and just memcpy from the buffer in the second
call. This needs a small change in the nand_base.c file.

The current state seems to pass MTD tests on a Colibri VF61.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
Hi Boris, Hi Miquel,

Thanks for your work on the new NAND interface. The VF610 NFC
definitly matches better the ->exec_op() interface.

This is still in early stage but seems to boot a Linux as rootfs
successfully. Before working on further simplification I wanted
to get some feedback on the general idea.

If needed, the data sheet of the controller can be optained
publicly (Vybrid Reference Manual, Chapter 10.3).

Some questions from my side:
- Parameter page: Why is exec_op called twice currently? This
  seems to be problematic for this controller. Are there plans
  to integrate the two calls in a single op sequence?
- Row/Column addresses: The controller seems to separate those
  two, hence the driver "guesses" which address bytes need to
  go where.. Maybe it would be better to separate that on ops
  level?
- Separation is often needed by command. One can make an educated
  guess what kind of command is going to be passed by filtering
  the appropriate ops. Maybe it would be good if the ops parser
  can filter by command?

--
Stefan

miquel.raynal@free-electrons.com

 drivers/mtd/nand/vf610_nfc.c | 543 +++++++++++++++++++++++++++----------------
 1 file changed, 349 insertions(+), 194 deletions(-)

diff --git a/drivers/mtd/nand/vf610_nfc.c b/drivers/mtd/nand/vf610_nfc.c
index 80d31a58e558..db69afb727ca 100644
--- a/drivers/mtd/nand/vf610_nfc.c
+++ b/drivers/mtd/nand/vf610_nfc.c
@@ -22,7 +22,6 @@
  * - HW ECC: Only 2K page with 64+ OOB.
  * - HW ECC: Only 24 and 32-bit error correction implemented.
  */
-
 #include <linux/module.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
@@ -74,6 +73,20 @@
 #define RESET_CMD_CODE			0x4040
 #define STATUS_READ_CMD_CODE		0x4068
 
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
+
 /* NFC ECC mode define */
 #define ECC_BYPASS			0
 #define ECC_45_BYTE			6
@@ -97,10 +110,21 @@
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
@@ -142,13 +166,6 @@
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
@@ -158,10 +175,7 @@ struct vf610_nfc {
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
@@ -173,6 +187,11 @@ static inline struct vf610_nfc *mtd_to_nfc(struct mtd_info *mtd)
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
@@ -263,31 +282,22 @@ static u8 vf610_nfc_get_status(struct vf610_nfc *nfc)
 	return vf610_nfc_read(nfc, NFC_FLASH_STATUS2) & STATUS_BYTE1_MASK;
 }
 
-static void vf610_nfc_send_command(struct vf610_nfc *nfc, u32 cmd_byte1,
-				   u32 cmd_code)
+static void vf610_nfc_send_code(struct vf610_nfc *nfc, u32 cmd_code)
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
+	vf610_nfc_set_field(nfc, NFC_FLASH_CMD2, CMD_CODE_MASK, CMD_CODE_SHIFT,
+			    cmd_code);
 }
 
-static void vf610_nfc_send_commands(struct vf610_nfc *nfc, u32 cmd_byte1,
-				    u32 cmd_byte2, u32 cmd_code)
+static void vf610_nfc_set_cmd1(struct vf610_nfc *nfc, u32 cmd_byte1)
 {
-	u32 tmp;
-
-	vf610_nfc_send_command(nfc, cmd_byte1, cmd_code);
+	vf610_nfc_set_field(nfc, NFC_FLASH_CMD2, CMD_BYTE1_MASK,
+			    CMD_BYTE1_SHIFT, cmd_byte1);
+}
 
-	tmp = vf610_nfc_read(nfc, NFC_FLASH_CMD1);
-	tmp &= ~CMD_BYTE2_MASK;
-	tmp |= cmd_byte2 << CMD_BYTE2_SHIFT;
-	vf610_nfc_write(nfc, NFC_FLASH_CMD1, tmp);
+static void vf610_nfc_set_cmd2(struct vf610_nfc *nfc, u32 cmd_byte2)
+{
+	vf610_nfc_set_field(nfc, NFC_FLASH_CMD1, CMD_BYTE2_MASK,
+			    CMD_BYTE2_SHIFT, cmd_byte2);
 }
 
 static irqreturn_t vf610_nfc_irq(int irq, void *data)
@@ -301,19 +311,6 @@ static irqreturn_t vf610_nfc_irq(int irq, void *data)
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
@@ -326,169 +323,325 @@ static inline void vf610_nfc_transfer_size(struct vf610_nfc *nfc, int size)
 	vf610_nfc_write(nfc, NFC_SECTOR_SIZE, size);
 }
 
-static void vf610_nfc_command(struct mtd_info *mtd, unsigned command,
-			      int column, int page)
+static inline const struct nand_op_instr *vf610_get_next_instr(
+	const struct nand_subop *subop, int *op_id)
 {
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	int trfr_sz = nfc->chip.options & NAND_BUSWIDTH_16 ? 1 : 0;
+	if (*op_id + 1 >= subop->ninstrs)
+		return NULL;
 
-	nfc->buf_offset = max(column, 0);
-	nfc->alt_buf = ALT_BUF_DATA;
+	return &subop->instrs[++(*op_id)];
+}
 
-	switch (command) {
-	case NAND_CMD_SEQIN:
-		/* Use valid column/page from preread... */
-		vf610_nfc_addr_cycle(nfc, column, page);
-		nfc->buf_offset = 0;
+static int vf610_nfc_reset(struct nand_chip *chip,
+				const struct nand_subop *subop)
+{
+	struct vf610_nfc *nfc = chip_to_nfc(chip);
+	const struct nand_op_instr *instr;
+	int op_id = -1;
 
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
+	instr = vf610_get_next_instr(subop, &op_id);
+	if (!instr || instr->type != NAND_OP_CMD_INSTR)
+		return -EINVAL;
 
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
-	}
+	/* Handle only reset */
+	if (instr->ctx.cmd.opcode != NAND_CMD_RESET)
+		return -EINVAL;
 
+	dev_dbg(nfc->dev, "OP_CMD: code 0x%02x\n", instr->ctx.cmd.opcode);
+	vf610_nfc_set_cmd1(nfc, instr->ctx.cmd.opcode);
+	vf610_nfc_transfer_size(nfc, 0);
+	vf610_nfc_send_code(nfc, RESET_CMD_CODE);
 	vf610_nfc_done(nfc);
 
-	nfc->use_hw_ecc = false;
-	nfc->write_sz = 0;
+	return 0;
 }
 
-static void vf610_nfc_read_buf(struct mtd_info *mtd, u_char *buf, int len)
+static void vf610_nfc_copyid(struct nand_chip *chip,
+			     const struct nand_subop *subop, int op_id)
 {
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	uint c = nfc->buf_offset;
+	struct vf610_nfc *nfc = chip_to_nfc(chip);
+	const struct nand_op_instr *instr = &subop->instrs[op_id];
+	unsigned int len = nand_subop_get_data_len(subop, op_id);
+	unsigned int offset = nand_subop_get_data_start_off(subop, op_id);
+	u8 *in = instr->ctx.data.buf.in + offset;
+	int i;
 
-	/* Alternate buffers are only supported through read_byte */
-	WARN_ON(nfc->alt_buf);
+	dev_dbg(nfc->dev, "copyid: len %d, offset %d\n", len, offset);
+	for (i = 0; i < len; i++) {
+		*in = vf610_nfc_get_id(nfc, i);
+		in++;
+	}
+}
+
+static int vf610_nfc_readid(struct nand_chip *chip,
+				const struct nand_subop *subop)
+{
+	struct vf610_nfc *nfc = chip_to_nfc(chip);
+	const struct nand_op_instr *instr;
+	int op_id = -1, row;
+
+	instr = vf610_get_next_instr(subop, &op_id);
+	if (!instr || instr->type != NAND_OP_CMD_INSTR)
+		return -EINVAL;
+
+	/* Handle only read id */
+	if (instr->ctx.cmd.opcode != NAND_CMD_READID)
+		return -EINVAL;
 
-	vf610_nfc_memcpy(buf, nfc->regs + NFC_MAIN_AREA(0) + c, len);
+	dev_dbg(nfc->dev, "OP_CMD: code 0x%02x\n", instr->ctx.cmd.opcode);
+	vf610_nfc_set_cmd1(nfc, instr->ctx.cmd.opcode);
+	vf610_nfc_send_code(nfc, READ_ID_CMD_CODE);
+	vf610_nfc_transfer_size(nfc, 0);
 
-	nfc->buf_offset += len;
+	instr = vf610_get_next_instr(subop, &op_id);
+	if (!instr || instr->type != NAND_OP_ADDR_INSTR)
+		return -EINVAL;
+
+	if (instr->ctx.addr.naddrs > 1)
+		return -EINVAL;
+
+	row = ROW_ADDR_BYTE1(instr->ctx.addr.addrs[0]);
+	vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
+		    ROW_ADDR_SHIFT, row);
+
+	instr = vf610_get_next_instr(subop, &op_id);
+	if (!instr && instr->type != NAND_OP_DATA_IN_INSTR)
+		return -EINVAL;
+
+	vf610_nfc_done(nfc);
+	vf610_nfc_copyid(chip, subop, op_id);
+
+	return 0;
 }
 
-static void vf610_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
-				int len)
+static int vf610_nfc_read_status(struct nand_chip *chip,
+				 const struct nand_subop *subop)
 {
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	uint c = nfc->buf_offset;
-	uint l;
+	const struct nand_op_instr *instr;
+	struct vf610_nfc *nfc = chip_to_nfc(chip);
+	int op_id = 0;
+	u8 *in;
+
+	instr = &subop->instrs[op_id];
+	if (instr->type != NAND_OP_CMD_INSTR)
+		return -EINVAL;
+
+	vf610_nfc_set_cmd1(nfc, instr->ctx.cmd.opcode);
+
+	instr = &subop->instrs[++op_id];
+	if (instr->type != NAND_OP_DATA_IN_INSTR)
+		return -EINVAL;
 
-	l = min_t(uint, len, mtd->writesize + mtd->oobsize - c);
-	vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + c, buf, l);
+	dev_dbg(nfc->dev, "vf610_nfc_read_status\n");
+	vf610_nfc_send_code(nfc, STATUS_READ_CMD_CODE);
+	vf610_nfc_done(nfc);
+
+	in = instr->ctx.data.buf.in;
+	in[0] = vf610_nfc_get_status(nfc);
 
-	nfc->write_sz += l;
-	nfc->buf_offset += l;
+	return 0;
 }
 
-static uint8_t vf610_nfc_read_byte(struct mtd_info *mtd)
+static int vf610_nfc_cmd(struct nand_chip *chip,
+				const struct nand_subop *subop)
 {
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
-#ifdef __LITTLE_ENDIAN
-	case ALT_BUF_ONFI:
-		/* Reverse byte since the controller uses big endianness */
-		c = nfc->buf_offset ^ 0x3;
-		/* fall-through */
-#endif
-	default:
-		tmp = *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
-		break;
+	const struct nand_op_instr *instr;
+	struct vf610_nfc *nfc = chip_to_nfc(chip);
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int op_id = -1, addr = 0, trfr_sz = 0;
+	u32 col = 0, row, code;
+
+	/* Some ops are optional, but they need to be in order */
+	instr = vf610_get_next_instr(subop, &op_id);
+	if (!instr || instr->type != NAND_OP_CMD_INSTR)
+		return -EINVAL;
+
+	if (instr->ctx.cmd.opcode == NAND_CMD_PARAM)
+		trfr_sz = 3 * sizeof(struct nand_onfi_params);
+
+	dev_dbg(nfc->dev, "OP_CMD: code 0x%02x\n", instr->ctx.cmd.opcode);
+	vf610_nfc_set_cmd1(nfc, instr->ctx.cmd.opcode);
+	code = COMMAND_CMD_BYTE1;
+
+	instr = vf610_get_next_instr(subop, &op_id);
+	if (!instr || instr->type != NAND_OP_ADDR_INSTR)
+		return -EINVAL;
+
+	if (instr->ctx.addr.naddrs > 1) {
+		col = COL_ADDR_BYTE1(instr->ctx.addr.addrs[addr++]);
+		code |= COMMAND_CAR_BYTE1;
+
+		if (mtd->writesize > 512) {
+			col |= COL_ADDR_BYTE2(instr->ctx.addr.addrs[addr++]);
+			code |= COMMAND_CAR_BYTE2;
+		}
+	}
+
+	row = ROW_ADDR_BYTE1(instr->ctx.addr.addrs[addr++]);
+	code |= COMMAND_RAR_BYTE1;
+	if (addr < instr->ctx.addr.naddrs) {
+		row |= ROW_ADDR_BYTE2(instr->ctx.addr.addrs[addr++]);
+		code |= COMMAND_RAR_BYTE2;
+	}
+	if (addr < instr->ctx.addr.naddrs) {
+		row |= ROW_ADDR_BYTE3(instr->ctx.addr.addrs[addr++]);
+		code |= COMMAND_RAR_BYTE3;
+	}
+
+	dev_dbg(nfc->dev, "OP_ADDR: col %d, row %d\n", col, row);
+	vf610_nfc_set_field(nfc, NFC_COL_ADDR, COL_ADDR_MASK,
+		    COL_ADDR_SHIFT, col);
+
+	vf610_nfc_set_field(nfc, NFC_ROW_ADDR, ROW_ADDR_MASK,
+		    ROW_ADDR_SHIFT, row);
+
+	instr = vf610_get_next_instr(subop, &op_id);
+	if (instr && instr->type == NAND_OP_DATA_OUT_INSTR) {
+		int len = nand_subop_get_data_len(subop, op_id);
+		int offset = nand_subop_get_data_start_off(subop, op_id);
+
+		dev_dbg(nfc->dev, "OP_DATA_OUT: len %d, offset %d\n", len, offset);
+
+		vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + offset,
+				 instr->ctx.data.buf.in + offset,
+				 len);
+		code |= COMMAND_WRITE_DATA;
+		trfr_sz += len;
+
+		instr = vf610_get_next_instr(subop, &op_id);
 	}
-	nfc->buf_offset++;
-	return tmp;
+
+	if (instr && instr->type == NAND_OP_CMD_INSTR) {
+		vf610_nfc_set_cmd2(nfc, instr->ctx.cmd.opcode);
+		code |= COMMAND_CMD_BYTE2;
+
+		instr = vf610_get_next_instr(subop, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_WAITRDY_INSTR) {
+		//dev_dbg(nfc->dev, "WAITRDY [max %d ms]\n",
+		//		  instr->ctx.waitrdy.timeout_ms);
+		code |= COMMAND_RB_HANDSHAKE;
+
+		instr = vf610_get_next_instr(subop, &op_id);
+	}
+
+	if (instr && instr->type == NAND_OP_DATA_IN_INSTR) {
+		int len = nand_subop_get_data_len(subop, op_id);
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
+		int len = nand_subop_get_data_len(subop, op_id);
+		int offset = nand_subop_get_data_start_off(subop, op_id);
+
+		dev_dbg(nfc->dev, "OP_DATA_IN: len %d, offset %d\n", len, offset);
+
+		vf610_nfc_memcpy(instr->ctx.data.buf.in + offset,
+				 nfc->regs + NFC_MAIN_AREA(0) + offset,
+				 len);
+	}
+
+	return 0;
 }
 
-static u16 vf610_nfc_read_word(struct mtd_info *mtd)
+/* This seems to be called for parameter page only currenlty */
+static int vf610_nfc_read_data(struct nand_chip *chip,
+				const struct nand_subop *subop)
 {
-	u16 tmp;
+	const struct nand_op_instr *instr = &subop->instrs[0];
+	struct vf610_nfc *nfc = chip_to_nfc(chip);
+	int len, offset;
+
+	if (instr->type != NAND_OP_DATA_IN_INSTR)
+		return -EINVAL;
+
+	len = nand_subop_get_data_len(subop, 0);
+	offset = nand_subop_get_data_start_off(subop, 0);
+
+	dev_dbg(nfc->dev, "R OP_DATA_IN: len %d, offset %d\n", len, offset);
+
+	/*
+	 * HACK: force_8bit indicates we read the parameter page. The
+	 * controllers seems to reverse byte order on little endian
+	 * machines, which is critical when reading parameter page.
+	 */
+	if (instr->ctx.data.force_8bit && IS_ENABLED(__LITTLE_ENDIAN)) {
+		u8 *buf = instr->ctx.data.buf.in;
+
+		while (len--) {
+			int c = offset ^ 0x3;
+
+			*buf = *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
+			buf++; offset++;
+		}
+	} else {
+		vf610_nfc_memcpy(instr->ctx.data.buf.in + offset,
+				 nfc->regs + NFC_MAIN_AREA(0) + offset,
+				 len);
+	}
 
-	vf610_nfc_read_buf(mtd, (u_char *)&tmp, sizeof(tmp));
-	return tmp;
+	return 0;
 }
 
-/* If not provided, upper layers apply a fixed delay. */
-static int vf610_nfc_dev_ready(struct mtd_info *mtd)
-{
-	/* NFC handles R/B internally; always ready.  */
-	return 1;
+static const struct nand_op_parser vf610_nfc_op_parser = NAND_OP_PARSER(
+	NAND_OP_PARSER_PATTERN(
+		vf610_nfc_reset,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
+	NAND_OP_PARSER_PATTERN(
+		vf610_nfc_readid,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, 1),
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 8)),
+	NAND_OP_PARSER_PATTERN(
+		vf610_nfc_read_status,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 1)),
+	NAND_OP_PARSER_PATTERN(
+		vf610_nfc_cmd,
+		NAND_OP_PARSER_PAT_CMD_ELEM(false),
+		NAND_OP_PARSER_PAT_ADDR_ELEM(false, 5),
+		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(true, PAGE_2K + OOB_MAX),
+		NAND_OP_PARSER_PAT_CMD_ELEM(true),
+		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, PAGE_2K + OOB_MAX)),
+	NAND_OP_PARSER_PATTERN(
+		vf610_nfc_read_data,
+		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, PAGE_2K + OOB_MAX)),
+	);
+
+static int vf610_nfc_exec_op(struct nand_chip *chip,
+			     const struct nand_operation *op,
+			     bool check_only)
+{
+	struct vf610_nfc *nfc = chip_to_nfc(chip);
+
+	/* TODO: Probably not needed, has been called before setting cmd */
+	vf610_nfc_clear_status(nfc);
+
+	dev_dbg(nfc->dev, "exec_op, opcode 0x%02x\n", op->instrs[0].ctx.cmd.opcode);
+
+	return nand_op_parser_exec_op(chip, &vf610_nfc_op_parser, op, check_only);
 }
 
+
 /*
  * This function supports Vybrid only (MPC5125 would have full RB and four CS)
  */
@@ -542,8 +695,7 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 		return ecc_count;
 
 	/* Read OOB without ECC unit enabled */
-	vf610_nfc_command(mtd, NAND_CMD_READOOB, 0, page);
-	vf610_nfc_read_buf(mtd, oob, mtd->oobsize);
+	nand_read_page_op(&nfc->chip, page, mtd->writesize, oob, mtd->oobsize);
 
 	/*
 	 * On an erased page, bit count (including OOB) should be zero or
@@ -557,12 +709,17 @@ static inline int vf610_nfc_correct_data(struct mtd_info *mtd, uint8_t *dat,
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
 
@@ -579,16 +736,20 @@ static int vf610_nfc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -695,15 +856,8 @@ static int vf610_nfc_probe(struct platform_device *pdev)
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
 
@@ -770,6 +924,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 		chip->ecc.read_page = vf610_nfc_read_page;
 		chip->ecc.write_page = vf610_nfc_write_page;
+		chip->ecc.write_page_raw = vf610_nfc_write_page_raw;
 
 		chip->ecc.size = PAGE_2K;
 	}
-- 
2.15.1
