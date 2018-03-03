Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1esFYL-0003RR-6U
 for linux-mtd@lists.infradead.org; Sat, 03 Mar 2018 22:22:56 +0000
From: Stefan Agner <stefan@agner.ch>
To: miquel.raynal@free-electrons.com,
	boris.brezillon@free-electrons.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringlemeir@gmail.com,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org, stefan@agner.ch
Subject: [PATCH v6 2/3] mtd: rawnand: vf610_nfc: remove old hooks
Date: Sat,  3 Mar 2018 23:22:36 +0100
Message-Id: <20180303222237.902-3-stefan@agner.ch>
In-Reply-To: <20180303222237.902-1-stefan@agner.ch>
References: <20180303222237.902-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now that the driver is using ->exec_op(), remove the old
hooks.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 269 ---------------------------------------
 1 file changed, 269 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index ae85ae9e3727..4f2e8578fb1d 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -59,21 +59,6 @@
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
-
 /* NFC_CMD2[CODE] controller cycle bit masks */
 #define COMMAND_CMD_BYTE1		BIT(14)
 #define COMMAND_CAR_BYTE1		BIT(13)
@@ -161,13 +146,6 @@
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
@@ -177,13 +155,9 @@ struct vf610_nfc {
 	struct device *dev;
 	void __iomem *regs;
 	struct completion cmd_done;
-	uint buf_offset;
-	int write_sz;
 	/* Status and ID are in alternate locations. */
-	enum vf610_nfc_alt_buf alt_buf;
 	enum vf610_nfc_variant variant;
 	struct clk *clk;
-	bool use_hw_ecc;
 	/*
 	 * Indicate that user data is accessed (full page/oob). This is
 	 * useful to indicate the driver whether to swap byte endianness.
@@ -230,20 +204,6 @@ static inline void vf610_nfc_set_field(struct vf610_nfc *nfc, u32 reg,
 			(vf610_nfc_read(nfc, reg) & (~mask)) | val << shift);
 }
 
-static inline void vf610_nfc_memcpy(void *dst, const void __iomem *src,
-				    size_t n)
-{
-	/*
-	 * Use this accessor for the internal SRAM buffers. On the ARM
-	 * Freescale Vybrid SoC it's known that the driver can treat
-	 * the SRAM buffer as if it's memory. Other platform might need
-	 * to treat the buffers differently.
-	 *
-	 * For the time being, use memcpy
-	 */
-	memcpy(dst, src, n);
-}
-
 static inline bool vf610_nfc_kernel_is_little_endian(void)
 {
 #ifdef __LITTLE_ENDIAN
@@ -353,53 +313,6 @@ static void vf610_nfc_done(struct vf610_nfc *nfc)
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
-{
-	return vf610_nfc_read(nfc, NFC_FLASH_STATUS2) & STATUS_BYTE1_MASK;
-}
-
-static void vf610_nfc_send_command(struct vf610_nfc *nfc, u32 cmd_byte1,
-				   u32 cmd_code)
-{
-	u32 tmp;
-
-	vf610_nfc_clear_status(nfc);
-
-	tmp = vf610_nfc_read(nfc, NFC_FLASH_CMD2);
-	tmp &= ~(CMD_BYTE1_MASK | CMD_CODE_MASK | BUFNO_MASK);
-	tmp |= cmd_byte1 << CMD_BYTE1_SHIFT;
-	tmp |= cmd_code << CMD_CODE_SHIFT;
-	vf610_nfc_write(nfc, NFC_FLASH_CMD2, tmp);
-}
-
-static void vf610_nfc_send_commands(struct vf610_nfc *nfc, u32 cmd_byte1,
-				    u32 cmd_byte2, u32 cmd_code)
-{
-	u32 tmp;
-
-	vf610_nfc_send_command(nfc, cmd_byte1, cmd_code);
-
-	tmp = vf610_nfc_read(nfc, NFC_FLASH_CMD1);
-	tmp &= ~CMD_BYTE2_MASK;
-	tmp |= cmd_byte2 << CMD_BYTE2_SHIFT;
-	vf610_nfc_write(nfc, NFC_FLASH_CMD1, tmp);
-}
-
 static irqreturn_t vf610_nfc_irq(int irq, void *data)
 {
 	struct mtd_info *mtd = data;
@@ -411,19 +324,6 @@ static irqreturn_t vf610_nfc_irq(int irq, void *data)
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
@@ -436,169 +336,6 @@ static inline void vf610_nfc_transfer_size(struct vf610_nfc *nfc, int size)
 	vf610_nfc_write(nfc, NFC_SECTOR_SIZE, size);
 }
 
-static void vf610_nfc_command(struct mtd_info *mtd, unsigned command,
-			      int column, int page)
-{
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	int trfr_sz = nfc->chip.options & NAND_BUSWIDTH_16 ? 1 : 0;
-
-	nfc->buf_offset = max(column, 0);
-	nfc->alt_buf = ALT_BUF_DATA;
-
-	switch (command) {
-	case NAND_CMD_SEQIN:
-		/* Use valid column/page from preread... */
-		vf610_nfc_addr_cycle(nfc, column, page);
-		nfc->buf_offset = 0;
-
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
-	}
-
-	vf610_nfc_done(nfc);
-
-	nfc->use_hw_ecc = false;
-	nfc->write_sz = 0;
-}
-
-static void vf610_nfc_read_buf(struct mtd_info *mtd, u_char *buf, int len)
-{
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	uint c = nfc->buf_offset;
-
-	/* Alternate buffers are only supported through read_byte */
-	WARN_ON(nfc->alt_buf);
-
-	vf610_nfc_memcpy(buf, nfc->regs + NFC_MAIN_AREA(0) + c, len);
-
-	nfc->buf_offset += len;
-}
-
-static void vf610_nfc_write_buf(struct mtd_info *mtd, const uint8_t *buf,
-				int len)
-{
-	struct vf610_nfc *nfc = mtd_to_nfc(mtd);
-	uint c = nfc->buf_offset;
-	uint l;
-
-	l = min_t(uint, len, mtd->writesize + mtd->oobsize - c);
-	vf610_nfc_memcpy(nfc->regs + NFC_MAIN_AREA(0) + c, buf, l);
-
-	nfc->write_sz += l;
-	nfc->buf_offset += l;
-}
-
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
-#ifdef __LITTLE_ENDIAN
-	case ALT_BUF_ONFI:
-		/* Reverse byte since the controller uses big endianness */
-		c = nfc->buf_offset ^ 0x3;
-		/* fall-through */
-#endif
-	default:
-		tmp = *((u8 *)(nfc->regs + NFC_MAIN_AREA(0) + c));
-		break;
-	}
-	nfc->buf_offset++;
-	return tmp;
-}
-
-static u16 vf610_nfc_read_word(struct mtd_info *mtd)
-{
-	u16 tmp;
-
-	vf610_nfc_read_buf(mtd, (u_char *)&tmp, sizeof(tmp));
-	return tmp;
-}
-
-/* If not provided, upper layers apply a fixed delay. */
-static int vf610_nfc_dev_ready(struct mtd_info *mtd)
-{
-	/* NFC handles R/B internally; always ready.  */
-	return 1;
-}
-
 static inline void vf610_nfc_run(struct vf610_nfc *nfc, u32 col, u32 row,
 				 u32 cmd1, u32 cmd2, u32 trfr_sz)
 {
@@ -1066,12 +803,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		goto err_disable_clk;
 	}
 
-	chip->dev_ready = vf610_nfc_dev_ready;
-	chip->cmdfunc = vf610_nfc_command;
-	chip->read_byte = vf610_nfc_read_byte;
-	chip->read_word = vf610_nfc_read_word;
-	chip->read_buf = vf610_nfc_read_buf;
-	chip->write_buf = vf610_nfc_write_buf;
 	chip->exec_op = vf610_nfc_exec_op;
 	chip->select_chip = vf610_nfc_select_chip;
 	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
-- 
2.16.2
