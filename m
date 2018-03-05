Received: from mail-eopbgr30061.outbound.protection.outlook.com ([40.107.3.61]
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esnyp-0000N7-GN
 for linux-mtd@lists.infradead.org; Mon, 05 Mar 2018 11:08:34 +0000
From: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, han.xu@nxp.com, festevam@gmail.com,
 marek.vasut@gmail.com, frieder.schrempf@exceet.de,
 prabhakar.kushwaha@nxp.com, suresh.gupta@nxp.com,
 Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH v6 1/2] mtd: fsl-quadspi: add support to create dynamic LUT
 entry
Date: Mon,  5 Mar 2018 16:36:58 +0530
Message-Id: <1520248019-2828-2-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1520248019-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1520248019-2828-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Add support to create dynamic LUT entry.

Current approach of creating LUT entries for various cmds like read, write,
erase, readid, readsr, we, wd etc is that when QSPI controller gets
initialized at that time static LUT entries for these cmds get created.

Patch add support to create the LUT at run time based on the operation
being performed.

Added API fsl_qspi_prepare_lut(), this API would going to be called from
fsl_qspi_read_reg, fsl_qspi_write_reg, fsl_qspi_write, fsl_qspi_read and
fsl_qspi_erase APIs.
Added new struct fsl_qspi_mem_op having fields required to fill in LUT
register for requested command.
Required values for every CMD like opcode, addrlen, dummy_cycles, data_size
and pad bytes being filled in respective calling function and then API
fsl_qspi_prepare_lut fill LUT register for requested command.
Required values are fetched from instance of 'struct spi_nor'.

AHB Read, memory mapped, can be triggered using driver interface as well
from 'devmem' interface.
For AHB read, LUT seq programmed in QUADSPI_BFGENCR register used for
Read operation. For Read initiated from 'devmem' working properly,
required to have dedicated LUT seq for AHB read.

Signed-off-by: Suresh Gupta <suresh.gupta@nxp.com>
Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
Changes for v6:
- Incorporated Boris review comments.
- Added dedicated LUT for AHB read cmd, required for devmem Read.
Changes for v5:
- Fix LUT preparation for SPINOR_OP_READ and SPINOR_OP_READ_4B cmds.
Changes for v4:
- Correct version numbering.
Changes for v3:
- Add STOP instruction for prepared LUT and remove memset of 4 LUT reg.
Changes for v2:
- Swap patch sequences in the series to solve git bissect issue.

 drivers/mtd/spi-nor/fsl-quadspi.c | 479 +++++++++++++++++++++++++-------------
 1 file changed, 321 insertions(+), 158 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 89306cf..d2e8421 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -142,10 +142,14 @@
  *  | INSTR1 | PAD1 | OPRND1 | INSTR0 | PAD0 | OPRND0 |
  *  ---------------------------------------------------
  */
-#define OPRND0_SHIFT		0
-#define PAD0_SHIFT		8
-#define INSTR0_SHIFT		10
-#define OPRND1_SHIFT		16
+#define PAD_SHIFT		8
+#define INSTR_SHIFT		10
+#define OPRND_SHIFT		16
+
+/* Macros for constructing the LUT register. */
+#define LUT_DEF(idx, ins, pad, opr)			  \
+	((((ins) << INSTR_SHIFT) | ((pad) << PAD_SHIFT) | \
+	(opr)) << (((idx) % 2) * OPRND_SHIFT))
 
 /* Instruction set for the LUT register. */
 #define LUT_STOP		0
@@ -181,30 +185,19 @@
 #define ADDR24BIT		0x18
 #define ADDR32BIT		0x20
 
-/* Macros for constructing the LUT register. */
-#define LUT0(ins, pad, opr)						\
-		(((opr) << OPRND0_SHIFT) | ((LUT_##pad) << PAD0_SHIFT) | \
-		((LUT_##ins) << INSTR0_SHIFT))
-
-#define LUT1(ins, pad, opr)	(LUT0(ins, pad, opr) << OPRND1_SHIFT)
-
 /* other macros for LUT register. */
 #define QUADSPI_LUT(x)          (QUADSPI_LUT_BASE + (x) * 4)
 #define QUADSPI_LUT_NUM		64
 
-/* SEQID -- we can have 16 seqids at most. */
-#define SEQID_READ		0
-#define SEQID_WREN		1
-#define SEQID_WRDI		2
-#define SEQID_RDSR		3
-#define SEQID_SE		4
-#define SEQID_CHIP_ERASE	5
-#define SEQID_PP		6
-#define SEQID_RDID		7
-#define SEQID_WRSR		8
-#define SEQID_RDCR		9
-#define SEQID_EN4B		10
-#define SEQID_BRWR		11
+/*
+ * SEQID -- we can have 16 seqids at most.
+ * LUT0 programmed by bootloader
+ * LUT1 programmed for IP register access cmds
+ * LUT2 programmed for AHB read, required for READ from devmem interface
+ */
+#define SEQID_LUT0_BOOTLOADER	0
+#define SEQID_LUT1_IPCMND	1
+#define SEQID_LUT2_AHBREAD	2
 
 #define QUADSPI_MIN_IOMAP SZ_4M
 
@@ -268,6 +261,68 @@ struct fsl_qspi_devtype_data {
 };
 
 #define FSL_QSPI_MAX_CHIP	4
+
+/* enum qspi_mem_data_dir - describes the direction of a QSPI memory data
+ *			    transfer from QSPI controller prespective.
+ * QSPI_MEM_NO_DATA	- no data transfer initiated
+ * QSPI_MEM_DATA_IN	- data coming from the SPI memory
+ * QSPI_MEM_DATA_OUT	- data sent to the SPI memory
+ */
+enum qspi_mem_data_dir {
+	QSPI_MEM_NO_DATA,
+	QSPI_MEM_DATA_IN,
+	QSPI_MEM_DATA_OUT,
+};
+
+/* enum qspi_cmd__mode - describes the mode of the running command
+ * QSPI_CMD_MODE_IP	- data transfer using IP register access
+ * QSPI_CMD_MODE_AHB	- data transfer via AMBA AHB bus directly
+ */
+enum qspi_cmd_mode {
+	QSPI_CMD_MODE_IP,
+	QSPI_CMD_MODE_AHB,
+};
+
+/* struct fsl_qspi_mem_op - describes the QSPI memory operation
+ * cmd.opcode: operation opcode
+ * cmd.pad: number of IO lines used to transmit the command
+ * addr.addrlen: QSPI working in 3/4-byte mode. Can be zero if the operation
+ *		 does not need to send an address
+ * addr.pad: number of IO lines used to transmit the address cycles
+ * dummy.nbytes: number of dummy cycles to send after an opcode or address.
+ *		 Can be zero if the operation does not require dummy cycles
+ * dummy.pad: number of IO lanes used to transmit the dummy bytes
+ * data.dir: direction of the transfer
+ * data.nytes: number of address bytes to send. Can be zero for fsl_qspi_write,
+ *	       actual transfer size provided when CMD is triggered.
+ * data.pad: number of IO lanes used to transmit the data bytes
+ * mode: mode of the running command, default is IP mode
+ */
+struct fsl_qspi_mem_op {
+	struct {
+		u8 opcode;
+		u8 pad;
+	} cmd;
+
+	struct {
+		u8 addrlen;
+		u8 pad;
+	} addr;
+
+	struct {
+		u8 nbytes;
+		u8 pad;
+	} dummy;
+
+	struct {
+		enum qspi_mem_data_dir dir;
+		unsigned int nbytes;
+		u8 pad;
+	} data;
+
+	enum qspi_cmd_mode mode;
+};
+
 struct fsl_qspi {
 	struct spi_nor nor[FSL_QSPI_MAX_CHIP];
 	void __iomem *iobase;
@@ -287,6 +342,7 @@ struct fsl_qspi {
 	bool big_endian;
 	struct mutex lock;
 	struct pm_qos_request pm_qos_req;
+	struct fsl_qspi_mem_op *op_data;
 };
 
 static inline int needs_swap_endian(struct fsl_qspi *q)
@@ -368,136 +424,92 @@ static irqreturn_t fsl_qspi_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void fsl_qspi_init_lut(struct fsl_qspi *q)
+static inline s8 pad_count(s8 pad_val)
+{
+	s8 count = -1;
+
+	if (!pad_val)
+		return 0;
+
+	while (pad_val) {
+		pad_val >>= 1;
+		count++;
+	}
+	return count;
+}
+
+/*
+ * Prepare LUT values for requested CMD using struct fsl_qspi_mem_op
+ * LUT prepared in format:
+ *  ---------------------------------------------------
+ *  | INSTR1 | PAD1 | OPRND1 | INSTR0 | PAD0 | OPRND0 |
+ *  ---------------------------------------------------
+ * values from struct fsl_qspi_mem_op are saved for different
+ * operands like CMD, ADDR, DUMMY and DATA in above format based
+ * on provided input value.
+ * For case of AHB (XIP) operation, use different LUT seqid,
+ * as read from QSPI controller can be triggered using this driver
+ * and also using "devmem" utility.
+ * For read trigger using "devmem" controller use LUT seqid saved in
+ * QUADSPI_BFGENCR register.
+ */
+static void fsl_qspi_prepare_lut(struct spi_nor *nor,
+				 struct fsl_qspi_mem_op *op)
 {
+	struct fsl_qspi *q = nor->priv;
 	void __iomem *base = q->iobase;
-	int rxfifo = q->devtype_data->rxfifo;
 	u32 lut_base;
-	int i;
+	u32 lutval[4] = {};
+	int lutidx = 0, i;
+
+	lutval[lutidx / 2] |= LUT_DEF(lutidx,
+				      LUT_CMD,
+				      pad_count(op->cmd.pad),
+				      op->cmd.opcode);
+	lutidx++;
+
+	if (op->addr.addrlen) {
+		lutval[lutidx / 2] |= LUT_DEF(lutidx,
+					      LUT_ADDR,
+					      pad_count(op->addr.pad),
+					      op->addr.addrlen);
+		lutidx++;
+	}
 
-	struct spi_nor *nor = &q->nor[0];
-	u8 addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
-	u8 read_op = nor->read_opcode;
-	u8 read_dm = nor->read_dummy;
+	if (op->dummy.nbytes) {
+		lutval[lutidx / 2] |= LUT_DEF(lutidx,
+					      LUT_DUMMY,
+					      pad_count(op->dummy.pad),
+					      op->dummy.nbytes);
+		lutidx++;
+	}
 
-	fsl_qspi_unlock_lut(q);
+	if (op->data.dir) {
+		lutval[lutidx / 2] |= LUT_DEF(lutidx,
+					      op->data.dir == QSPI_MEM_DATA_IN ?
+					      LUT_FSL_READ : LUT_FSL_WRITE,
+					      pad_count(op->data.pad),
+					      op->data.nbytes);
+		lutidx++;
+	}
 
-	/* Clear all the LUT table */
-	for (i = 0; i < QUADSPI_LUT_NUM; i++)
-		qspi_writel(q, 0, base + QUADSPI_LUT_BASE + i * 4);
-
-	/* Read */
-	lut_base = SEQID_READ * 4;
-
-	qspi_writel(q, LUT0(CMD, PAD1, read_op) | LUT1(ADDR, PAD1, addrlen),
-			base + QUADSPI_LUT(lut_base));
-	qspi_writel(q, LUT0(DUMMY, PAD1, read_dm) |
-		    LUT1(FSL_READ, PAD4, rxfifo),
-			base + QUADSPI_LUT(lut_base + 1));
-
-	/* Write enable */
-	lut_base = SEQID_WREN * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WREN),
-			base + QUADSPI_LUT(lut_base));
-
-	/* Page Program */
-	lut_base = SEQID_PP * 4;
-
-	qspi_writel(q, LUT0(CMD, PAD1, nor->program_opcode) |
-		    LUT1(ADDR, PAD1, addrlen),
-			base + QUADSPI_LUT(lut_base));
-	qspi_writel(q, LUT0(FSL_WRITE, PAD1, 0),
-			base + QUADSPI_LUT(lut_base + 1));
-
-	/* Read Status */
-	lut_base = SEQID_RDSR * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDSR) |
-			LUT1(FSL_READ, PAD1, 0x1),
-			base + QUADSPI_LUT(lut_base));
-
-	/* Erase a sector */
-	lut_base = SEQID_SE * 4;
-
-	qspi_writel(q, LUT0(CMD, PAD1, nor->erase_opcode) |
-		    LUT1(ADDR, PAD1, addrlen),
-			base + QUADSPI_LUT(lut_base));
-
-	/* Erase the whole chip */
-	lut_base = SEQID_CHIP_ERASE * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_CHIP_ERASE),
-			base + QUADSPI_LUT(lut_base));
-
-	/* READ ID */
-	lut_base = SEQID_RDID * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDID) |
-			LUT1(FSL_READ, PAD1, 0x8),
-			base + QUADSPI_LUT(lut_base));
-
-	/* Write Register */
-	lut_base = SEQID_WRSR * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRSR) |
-			LUT1(FSL_WRITE, PAD1, 0x2),
-			base + QUADSPI_LUT(lut_base));
-
-	/* Read Configuration Register */
-	lut_base = SEQID_RDCR * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_RDCR) |
-			LUT1(FSL_READ, PAD1, 0x1),
-			base + QUADSPI_LUT(lut_base));
-
-	/* Write disable */
-	lut_base = SEQID_WRDI * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_WRDI),
-			base + QUADSPI_LUT(lut_base));
-
-	/* Enter 4 Byte Mode (Micron) */
-	lut_base = SEQID_EN4B * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_EN4B),
-			base + QUADSPI_LUT(lut_base));
-
-	/* Enter 4 Byte Mode (Spansion) */
-	lut_base = SEQID_BRWR * 4;
-	qspi_writel(q, LUT0(CMD, PAD1, SPINOR_OP_BRWR),
-			base + QUADSPI_LUT(lut_base));
+	lutval[lutidx / 2] |= LUT_DEF(lutidx, LUT_STOP, 0, 0);
+	lutidx++;
 
-	fsl_qspi_lock_lut(q);
-}
+	dev_dbg(q->dev, "cmd:%x lut:[%x, %x, %x, %x]\n", op->cmd.opcode,
+			lutval[0], lutval[1], lutval[2], lutval[3]);
 
-/* Get the SEQID for the command */
-static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
-{
-	switch (cmd) {
-	case SPINOR_OP_READ_1_1_4:
-		return SEQID_READ;
-	case SPINOR_OP_WREN:
-		return SEQID_WREN;
-	case SPINOR_OP_WRDI:
-		return SEQID_WRDI;
-	case SPINOR_OP_RDSR:
-		return SEQID_RDSR;
-	case SPINOR_OP_SE:
-		return SEQID_SE;
-	case SPINOR_OP_CHIP_ERASE:
-		return SEQID_CHIP_ERASE;
-	case SPINOR_OP_PP:
-		return SEQID_PP;
-	case SPINOR_OP_RDID:
-		return SEQID_RDID;
-	case SPINOR_OP_WRSR:
-		return SEQID_WRSR;
-	case SPINOR_OP_RDCR:
-		return SEQID_RDCR;
-	case SPINOR_OP_EN4B:
-		return SEQID_EN4B;
-	case SPINOR_OP_BRWR:
-		return SEQID_BRWR;
-	default:
-		if (cmd == q->nor[0].erase_opcode)
-			return SEQID_SE;
-		dev_err(q->dev, "Unsupported cmd 0x%.2x\n", cmd);
-		break;
-	}
-	return -EINVAL;
+	/* Dynamic LUT */
+	if (op->mode == QSPI_CMD_MODE_IP)
+		lut_base = SEQID_LUT1_IPCMND * 4;
+	else
+		lut_base = SEQID_LUT2_AHBREAD * 4;
+
+	/* Write values in LUT register. */
+	fsl_qspi_unlock_lut(q);
+	for (i = 0; i < ARRAY_SIZE(lutval); i++)
+		qspi_writel(q, lutval[i], base + QUADSPI_LUT(lut_base + i));
+	fsl_qspi_lock_lut(q);
 }
 
 static int
@@ -532,7 +544,7 @@ static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
 	} while (1);
 
 	/* trigger the LUT now */
-	seqid = fsl_qspi_get_seqid(q, cmd);
+	seqid = SEQID_LUT1_IPCMND;
 	qspi_writel(q, (seqid << QUADSPI_IPCR_SEQID_SHIFT) | len,
 			base + QUADSPI_IPCR);
 
@@ -648,6 +660,19 @@ static void fsl_qspi_set_map_addr(struct fsl_qspi *q)
 	qspi_writel(q, nor_size * 4 + q->memmap_phy, base + QUADSPI_SFB2AD);
 }
 
+/* Clear only decision making fields of struct fsl_qspi_mem_op.
+ * Not used memset to clear whole structure as clearing of fields required
+ * to be done for every CMD and it would be performance hit.
+ */
+static inline void fsl_clr_qspi_mem_data(struct fsl_qspi_mem_op *op)
+{
+	op->cmd.opcode = 0;
+	op->addr.addrlen = 0;
+	op->dummy.nbytes = 0;
+	op->data.dir = QSPI_MEM_NO_DATA;
+	op->mode = QSPI_CMD_MODE_IP;
+}
+
 /*
  * There are two different ways to read out the data from the flash:
  *  the "IP Command Read" and the "AHB Command Read".
@@ -684,12 +709,41 @@ static void fsl_qspi_init_ahb_read(struct fsl_qspi *q)
 	qspi_writel(q, 0, base + QUADSPI_BUF1IND);
 	qspi_writel(q, 0, base + QUADSPI_BUF2IND);
 
-	/* Set the default lut sequence for AHB Read. */
-	seqid = fsl_qspi_get_seqid(q, q->nor[0].read_opcode);
+	/* Set dynamic LUT entry as lut sequence for AHB Read . */
+	seqid = SEQID_LUT2_AHBREAD;
+
+	/* Save SEQID_LUT2_AHBREAD in QUADSPI_BFGENCR, required for AHB Read */
 	qspi_writel(q, seqid << QUADSPI_BFGENCR_SEQID_SHIFT,
 		q->iobase + QUADSPI_BFGENCR);
 }
 
+/* Prepare LUT for AHB read - required for read from devmem interface */
+static void fsl_qspi_prep_ahb_read(struct fsl_qspi *q)
+{
+	struct fsl_qspi_mem_op *op = q->op_data;
+	struct spi_nor *nor = q->nor;
+	enum spi_nor_protocol protocol = 0;
+
+	fsl_clr_qspi_mem_data(op);
+	protocol = nor->read_proto;
+	op->cmd.opcode = nor->read_opcode;
+	op->cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
+
+	op->addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
+	op->addr.pad = spi_nor_get_protocol_addr_nbits(protocol);
+
+	op->dummy.nbytes = nor->read_dummy;
+	op->dummy.pad = spi_nor_get_protocol_data_nbits(protocol);
+
+	op->data.dir = QSPI_MEM_DATA_IN;
+	op->data.pad = spi_nor_get_protocol_data_nbits(protocol);
+	op->data.nbytes = q->devtype_data->rxfifo;
+
+	op->mode = QSPI_CMD_MODE_AHB;
+
+	fsl_qspi_prepare_lut(nor, op);
+}
+
 /* This function was used to prepare and enable QSPI clock */
 static int fsl_qspi_clk_prep_enable(struct fsl_qspi *q)
 {
@@ -728,7 +782,6 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 	void __iomem *base = q->iobase;
 	u32 reg;
 	int ret;
-
 	/* disable and unprepare clock to avoid glitch pass to controller */
 	fsl_qspi_clk_disable_unprep(q);
 
@@ -746,9 +799,6 @@ static int fsl_qspi_nor_setup(struct fsl_qspi *q)
 		base + QUADSPI_MCR);
 	udelay(1);
 
-	/* Init the LUT table. */
-	fsl_qspi_init_lut(q);
-
 	/* Disable the module */
 	qspi_writel(q, QUADSPI_MCR_MDIS_MASK | QUADSPI_MCR_RESERVED_MASK,
 			base + QUADSPI_MCR);
@@ -791,12 +841,12 @@ static int fsl_qspi_nor_setup_last(struct fsl_qspi *q)
 	if (ret)
 		return ret;
 
-	/* Init the LUT table again. */
-	fsl_qspi_init_lut(q);
-
 	/* Init for AHB read */
 	fsl_qspi_init_ahb_read(q);
 
+	/* Prepare LUT for AHB read - required for read from devmem interface */
+	fsl_qspi_prep_ahb_read(q);
+
 	return 0;
 }
 
@@ -819,7 +869,25 @@ static int fsl_qspi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 {
 	int ret;
 	struct fsl_qspi *q = nor->priv;
+	struct fsl_qspi_mem_op *op = q->op_data;
+	enum spi_nor_protocol protocol = 0;
+
+	fsl_clr_qspi_mem_data(op);
+	protocol = nor->reg_proto;
+
+	/*
+	 * Fill required entry of struct fsl_qspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 */
+	op->cmd.opcode = opcode;
+	op->cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
+
+	op->data.dir = QSPI_MEM_DATA_IN;
+	op->data.pad = spi_nor_get_protocol_data_nbits(protocol);
+	op->data.nbytes = q->devtype_data->rxfifo;
 
+	/* Addrlen and Dummy info not required for READ_REG cmds */
+	fsl_qspi_prepare_lut(nor, op);
 	ret = fsl_qspi_runcmd(q, opcode, 0, len);
 	if (ret)
 		return ret;
@@ -832,8 +900,22 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 {
 	struct fsl_qspi *q = nor->priv;
 	int ret;
+	struct fsl_qspi_mem_op *op = q->op_data;
+	enum spi_nor_protocol protocol = 0;
+
+	fsl_clr_qspi_mem_data(op);
+	protocol = nor->reg_proto;
+
+	/*
+	 * Fill required entry of struct fsl_qspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 */
+	op->cmd.opcode = opcode;
+	op->cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
 
 	if (!buf) {
+		/* Addrlen, Dummy and Data info not required for WRITE_REG */
+		fsl_qspi_prepare_lut(nor, op);
 		ret = fsl_qspi_runcmd(q, opcode, 0, 1);
 		if (ret)
 			return ret;
@@ -842,6 +924,12 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len)
 			fsl_qspi_invalid(q);
 
 	} else if (len > 0) {
+		/* Addrlen and Dummy not requ with BUF as non-null */
+		op->data.dir = QSPI_MEM_DATA_OUT;
+		op->data.pad = spi_nor_get_protocol_data_nbits(protocol);
+		op->data.nbytes = q->devtype_data->txfifo;
+
+		fsl_qspi_prepare_lut(nor, op);
 		ret = fsl_qspi_nor_write(q, nor, opcode, 0,
 					(u32 *)buf, len);
 		if (ret > 0)
@@ -858,8 +946,33 @@ static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
 			      size_t len, const u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
-	ssize_t ret = fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
-					 (u32 *)buf, len);
+	ssize_t ret;
+	struct fsl_qspi_mem_op *op = q->op_data;
+	enum spi_nor_protocol protocol = 0;
+
+	fsl_clr_qspi_mem_data(op);
+	protocol = nor->write_proto;
+
+	/*
+	 * Fill required entry of struct fsl_qspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 */
+	op->cmd.opcode = nor->program_opcode;
+	op->cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
+
+	op->addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
+	op->addr.pad = spi_nor_get_protocol_addr_nbits(protocol);
+
+	op->data.dir = QSPI_MEM_DATA_OUT;
+	op->data.pad = spi_nor_get_protocol_data_nbits(protocol);
+
+	/* TX data size provided when QSPI cmd trigger. */
+	op->data.nbytes = 0;
+
+	/* Dummy info not required for WRITE cmd */
+	fsl_qspi_prepare_lut(nor, op);
+	ret = fsl_qspi_nor_write(q, nor, nor->program_opcode, to,
+				 (u32 *)buf, len);
 
 	/* invalid the data in the AHB buffer. */
 	fsl_qspi_invalid(q);
@@ -871,6 +984,32 @@ static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
 {
 	struct fsl_qspi *q = nor->priv;
 	u8 cmd = nor->read_opcode;
+	struct fsl_qspi_mem_op *op = q->op_data;
+	enum spi_nor_protocol protocol = 0;
+
+	fsl_clr_qspi_mem_data(op);
+	protocol = nor->read_proto;
+
+	/*
+	 * Fill required entry of struct fsl_qspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 */
+	op->cmd.opcode = cmd;
+	op->cmd.pad = spi_nor_get_protocol_inst_nbits(protocol);
+
+	op->addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
+	op->addr.pad = spi_nor_get_protocol_addr_nbits(protocol);
+
+	op->dummy.nbytes = nor->read_dummy;
+	op->dummy.pad = spi_nor_get_protocol_data_nbits(protocol);
+
+	op->data.dir = QSPI_MEM_DATA_IN;
+	op->data.pad = spi_nor_get_protocol_data_nbits(protocol);
+	op->data.nbytes = q->devtype_data->rxfifo;
+
+	op->mode = QSPI_CMD_MODE_AHB;
+
+	fsl_qspi_prepare_lut(nor, op);
 
 	/* if necessary,ioremap buffer before AHB read, */
 	if (!q->ahb_addr) {
@@ -916,6 +1055,22 @@ static int fsl_qspi_erase(struct spi_nor *nor, loff_t offs)
 {
 	struct fsl_qspi *q = nor->priv;
 	int ret;
+	struct fsl_qspi_mem_op *op = q->op_data;
+
+	fsl_clr_qspi_mem_data(op);
+
+	/*
+	 * Fill required entry of struct fsl_qspi_mem_op to prepare
+	 * LUT for requested cmd.
+	 */
+	op->cmd.opcode = nor->erase_opcode;
+	op->cmd.pad = LUT_PAD1;
+
+	op->addr.addrlen = (nor->addr_width == 3) ? ADDR24BIT : ADDR32BIT;
+	op->addr.pad = LUT_PAD1;
+
+	/* Dummy and Data info not required for Erase cmd */
+	fsl_qspi_prepare_lut(nor, op);
 
 	dev_dbg(nor->dev, "%dKiB at 0x%08x:0x%08x\n",
 		nor->mtd.erasesize / 1024, q->chip_base_addr, (u32)offs);
@@ -967,12 +1122,18 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct spi_nor *nor;
 	struct mtd_info *mtd;
+	struct fsl_qspi_mem_op *mem_op_data;
 	int ret, i = 0;
 
 	q = devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
 	if (!q)
 		return -ENOMEM;
 
+	mem_op_data = kmalloc(sizeof(struct fsl_qspi_mem_op), GFP_KERNEL);
+	if (!mem_op_data)
+		return -ENOMEM;
+	q->op_data = mem_op_data;
+
 	q->nor_num = of_get_child_count(dev->of_node);
 	if (!q->nor_num || q->nor_num > FSL_QSPI_MAX_CHIP)
 		return -ENODEV;
@@ -1120,6 +1281,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 irq_failed:
 	fsl_qspi_clk_disable_unprep(q);
 clk_failed:
+	kfree(q->op_data);
 	dev_err(dev, "Freescale QuadSPI probe failed\n");
 	return ret;
 }
@@ -1145,6 +1307,7 @@ static int fsl_qspi_remove(struct platform_device *pdev)
 	if (q->ahb_addr)
 		iounmap(q->ahb_addr);
 
+	kfree(q->op_data);
 	return 0;
 }
 
-- 
1.9.1
