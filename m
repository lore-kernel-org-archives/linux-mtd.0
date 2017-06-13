Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKmA8-0006VG-Hy
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 13:47:24 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v7 05/16] mtd: nand: denali: switch over to cmd_ctrl instead
 of cmdfunc
Date: Tue, 13 Jun 2017 22:45:39 +0900
Message-Id: <1497361550-8115-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1497361550-8115-1-git-send-email-yamada.masahiro@socionext.com>
References: <1497361550-8115-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The NAND_CMD_SET_FEATURES support is missing from denali_cmdfunc().
We also see /* TODO: Read OOB data */ comment.

It would be possible to add more commands along with the current
implementation, but having ->cmd_ctrl() seems a better approach from
the discussion with Boris [1].

Rely on the default ->cmdfunc() from the framework and implement the
driver's own ->cmd_ctrl().

This transition also fixes NAND_CMD_STATUS and NAND_CMD_PARAM handling.
NAND_CMD_STATUS was just faked by the register read, so the only valid
bit was the WP bit.  NAND_CMD_PARAM was completely broken; not only the
command sent on the bus was NAND_CMD_STATUS instead of NAND_CMD_PARAM,
but also the driver was only reading 8 bytes, while the parameter page
contains several hundreds of bytes.

Also add ->write_byte(), which is needed for write direction commands,
->read/write_buf(16), which will be used some commits later.
->read_word() is not used for now, but the core may call it in the
future.

Now, this driver can drop nand_onfi_get_set_features_notsupp().

[1] https://lkml.org/lkml/2017/3/15/97

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v7:
  - Squash 3 commits
  - Implement ->read/write_buf(16), ->read_word hooks in this commit

Changes in v6:
  - Remove nand_onfi_get_set_features_notsupp()

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 232 ++++++++++++++++++++++++----------------------
 drivers/mtd/nand/denali.h |   2 -
 2 files changed, 123 insertions(+), 111 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 2acdc5f42a00..8091ba0916cc 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -85,43 +85,6 @@ static void index_addr(struct denali_nand_info *denali,
 	iowrite32(data, denali->flash_mem + 0x10);
 }
 
-/* Perform an indexed read of the device */
-static void index_addr_read_data(struct denali_nand_info *denali,
-				 uint32_t address, uint32_t *pdata)
-{
-	iowrite32(address, denali->flash_mem);
-	*pdata = ioread32(denali->flash_mem + 0x10);
-}
-
-/*
- * We need to buffer some data for some of the NAND core routines.
- * The operations manage buffering that data.
- */
-static void reset_buf(struct denali_nand_info *denali)
-{
-	denali->buf.head = denali->buf.tail = 0;
-}
-
-static void write_byte_to_buf(struct denali_nand_info *denali, uint8_t byte)
-{
-	denali->buf.buf[denali->buf.tail++] = byte;
-}
-
-/* reads the status of the device */
-static void read_status(struct denali_nand_info *denali)
-{
-	uint32_t cmd;
-
-	/* initialize the data buffer to store status */
-	reset_buf(denali);
-
-	cmd = ioread32(denali->flash_reg + WRITE_PROTECT);
-	if (cmd)
-		write_byte_to_buf(denali, NAND_STATUS_WP);
-	else
-		write_byte_to_buf(denali, 0);
-}
-
 /* Reset the flash controller */
 static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
@@ -268,20 +231,16 @@ static uint32_t denali_wait_for_irq(struct denali_nand_info *denali,
 	return denali->irq_status;
 }
 
-/* resets a specific device connected to the core */
-static void reset_bank(struct denali_nand_info *denali)
+static uint32_t denali_check_irq(struct denali_nand_info *denali)
 {
+	unsigned long flags;
 	uint32_t irq_status;
 
-	denali_reset_irq(denali);
-
-	iowrite32(1 << denali->flash_bank, denali->flash_reg + DEVICE_RESET);
-
-	irq_status = denali_wait_for_irq(denali,
-					 INTR__RST_COMP | INTR__TIME_OUT);
+	spin_lock_irqsave(&denali->irq_lock, flags);
+	irq_status = denali->irq_status;
+	spin_unlock_irqrestore(&denali->irq_lock, flags);
 
-	if (!(irq_status & INTR__RST_COMP))
-		dev_err(denali->dev, "reset bank failed.\n");
+	return irq_status;
 }
 
 /*
@@ -302,6 +261,105 @@ static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en,
 	iowrite32(transfer_spare_flag, denali->flash_reg + TRANSFER_SPARE_REG);
 }
 
+static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	int i;
+
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+
+	for (i = 0; i < len; i++)
+		buf[i] = ioread32(denali->flash_mem + 0x10);
+}
+
+static void denali_write_buf(struct mtd_info *mtd, const uint8_t *buf, int len)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	int i;
+
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+
+	for (i = 0; i < len; i++)
+		iowrite32(buf[i], denali->flash_mem + 0x10);
+}
+
+static void denali_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	uint16_t *buf16 = (uint16_t *)buf;
+	int i;
+
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+
+	for (i = 0; i < len / 2; i++)
+		buf16[i] = ioread32(denali->flash_mem + 0x10);
+}
+
+static void denali_write_buf16(struct mtd_info *mtd, const uint8_t *buf,
+			       int len)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	const uint16_t *buf16 = (const uint16_t *)buf;
+	int i;
+
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+
+	for (i = 0; i < len / 2; i++)
+		iowrite32(buf16[i], denali->flash_mem + 0x10);
+}
+
+static uint8_t denali_read_byte(struct mtd_info *mtd)
+{
+	uint8_t byte;
+
+	denali_read_buf(mtd, &byte, 1);
+
+	return byte;
+}
+
+static void denali_write_byte(struct mtd_info *mtd, uint8_t byte)
+{
+	denali_write_buf(mtd, &byte, 1);
+}
+
+static uint16_t denali_read_word(struct mtd_info *mtd)
+{
+	uint16_t word;
+
+	denali_read_buf16(mtd, (uint8_t *)&word, 2);
+
+	return word;
+}
+
+static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	uint32_t type;
+
+	if (ctrl & NAND_CLE)
+		type = 0;
+	else if (ctrl & NAND_ALE)
+		type = 1;
+	else
+		return;
+
+	/*
+	 * Some commands are followed by chip->dev_ready or chip->waitfunc.
+	 * irq_status must be cleared here to catch the R/B# interrupt later.
+	 */
+	if (ctrl & NAND_CTRL_CHANGE)
+		denali_reset_irq(denali);
+
+	index_addr(denali, MODE_11 | BANK(denali->flash_bank) | type, dat);
+}
+
+static int denali_dev_ready(struct mtd_info *mtd)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+
+	return !!(denali_check_irq(denali) & INTR__INT_ACT);
+}
+
 /*
  * sends a pipeline command operation to the controller. See the Denali NAND
  * controller's user guide for more information (section 4.2.3.6).
@@ -844,17 +902,6 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
-static uint8_t denali_read_byte(struct mtd_info *mtd)
-{
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint8_t result = 0xff;
-
-	if (denali->buf.head < denali->buf.tail)
-		result = denali->buf.buf[denali->buf.head++];
-
-	return result;
-}
-
 static void denali_select_chip(struct mtd_info *mtd, int chip)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
@@ -864,7 +911,13 @@ static void denali_select_chip(struct mtd_info *mtd, int chip)
 
 static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 {
-	return 0;
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	uint32_t irq_status;
+
+	/* R/B# pin transitioned from low to high? */
+	irq_status = denali_wait_for_irq(denali, INTR__INT_ACT);
+
+	return irq_status & INTR__INT_ACT ? 0 : NAND_STATUS_FAIL;
 }
 
 static int denali_erase(struct mtd_info *mtd, int page)
@@ -885,45 +938,6 @@ static int denali_erase(struct mtd_info *mtd, int page)
 	return irq_status & INTR__ERASE_COMP ? 0 : NAND_STATUS_FAIL;
 }
 
-static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
-			   int page)
-{
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t addr, id;
-	int i;
-
-	switch (cmd) {
-	case NAND_CMD_STATUS:
-		read_status(denali);
-		break;
-	case NAND_CMD_READID:
-	case NAND_CMD_PARAM:
-		reset_buf(denali);
-		/*
-		 * sometimes ManufactureId read from register is not right
-		 * e.g. some of Micron MT29F32G08QAA MLC NAND chips
-		 * So here we send READID cmd to NAND insteand
-		 */
-		addr = MODE_11 | BANK(denali->flash_bank);
-		index_addr(denali, addr | 0, 0x90);
-		index_addr(denali, addr | 1, col);
-		for (i = 0; i < 8; i++) {
-			index_addr_read_data(denali, addr | 2, &id);
-			write_byte_to_buf(denali, id);
-		}
-		break;
-	case NAND_CMD_RESET:
-		reset_bank(denali);
-		break;
-	case NAND_CMD_READOOB:
-		/* TODO: Read OOB data */
-		break;
-	default:
-		pr_err(": unsupported command received 0x%x\n", cmd);
-		break;
-	}
-}
-
 #define DIV_ROUND_DOWN_ULL(ll, d) \
 	({ unsigned long long _tmp = (ll); do_div(_tmp, d); _tmp; })
 
@@ -1239,12 +1253,6 @@ int denali_init(struct denali_nand_info *denali)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 
-	/* allocate a temporary buffer for nand_scan_ident() */
-	denali->buf.buf = devm_kzalloc(denali->dev, PAGE_SIZE,
-					GFP_DMA | GFP_KERNEL);
-	if (!denali->buf.buf)
-		return -ENOMEM;
-
 	mtd->dev.parent = denali->dev;
 	denali_hw_init(denali);
 	denali_drv_init(denali);
@@ -1268,11 +1276,12 @@ int denali_init(struct denali_nand_info *denali)
 
 	/* register the driver with the NAND core subsystem */
 	chip->select_chip = denali_select_chip;
-	chip->cmdfunc = denali_cmdfunc;
 	chip->read_byte = denali_read_byte;
+	chip->write_byte = denali_write_byte;
+	chip->read_word = denali_read_word;
+	chip->cmd_ctrl = denali_cmd_ctrl;
+	chip->dev_ready = denali_dev_ready;
 	chip->waitfunc = denali_waitfunc;
-	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;
-	chip->onfi_get_features = nand_onfi_get_set_features_notsupp;
 
 	/* clk rate info is needed for setup_data_interface */
 	if (denali->clk_x_rate)
@@ -1287,8 +1296,6 @@ int denali_init(struct denali_nand_info *denali)
 	if (ret)
 		goto disable_irq;
 
-	/* allocate the right size buffer now */
-	devm_kfree(denali->dev, denali->buf.buf);
 	denali->buf.buf = devm_kzalloc(denali->dev,
 			     mtd->writesize + mtd->oobsize,
 			     GFP_KERNEL);
@@ -1358,6 +1365,13 @@ int denali_init(struct denali_nand_info *denali)
 
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
 
+	if (chip->options & NAND_BUSWIDTH_16) {
+		chip->read_buf = denali_read_buf16;
+		chip->write_buf = denali_write_buf16;
+	} else {
+		chip->read_buf = denali_read_buf;
+		chip->write_buf = denali_write_buf;
+	}
 	chip->ecc.options |= NAND_ECC_CUSTOM_PAGE_ACCESS;
 	chip->ecc.read_page = denali_read_page;
 	chip->ecc.read_page_raw = denali_read_page_raw;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index a0ac0f84f8b5..a84d8784ee98 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -306,8 +306,6 @@
 #define MODE_11    0x0C000000
 
 struct nand_buf {
-	int head;
-	int tail;
 	uint8_t *buf;
 	dma_addr_t dma_buf;
 };
-- 
2.7.4
