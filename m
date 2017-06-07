Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIZXD-0004VI-Sm
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 11:54:04 +0000
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
Subject: [PATCH v5 12/23] mtd: nand: denali: fix NAND_CMD_PARAM handling
Date: Wed,  7 Jun 2017 20:52:21 +0900
Message-Id: <1496836352-8016-13-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NAND_CMD_PARAM is not working at all due to multiple bugs.

[1] The command 0x90 issued instead of 0xec

The command code 0x90 is hard-code as
   index_addr(denali, addr | 0, 0x90)
So, Read ID (0x90) command is sent to the device instead of Read
Parameter Page (0xec).

[2] only first 8 bytes are read

Even if [1] is fixed, the current implementation is problematic.
The only first 8 bytes are read by MAP11 command, and put into the
temporal buffer:

    for (i = 0; i < 8; i++) {
            index_addr_read_data(denali, addr | 2, &id);
            write_byte_to_buf(denali, id);
    }

Obviously, this is not sufficient for NAND_CMD_PARAM; the ONFi
parameters are 256-byte long.  This is still insufficient.
As you see in nand_flash_detect_onfi() reads out (256 * 3) bytes
at maximum (Redundant Parameter Pages).  However, changing the loop
to for (i = 0; i < 768; i++) is a crazy idea.  At the point of the
chip->cmdfunc() call, we cannot know how many times chip->read_byte()
will be called.  So, pre-reading enough number of bytes in the
chip->cmdfunc() is a design mistake.

[3] no wait for R/B#

The current code handles NAND_CMD_READID and NAND_CMD_PARAM in the
same way, but this is also wrong.  The difference between them is
that Read ID command does not toggle R/B# whereas the Read Parameter
Page command requires R/B#.  Without the wait for R/B# interrupt,
wrong data are retrieved.

In order to fix those problems, data read cycle of the MAP11 command
has been moved to chip->read_byte().  Data are read out as needed.
Another good thing is early temporal buffer is not needed any more.
The ugly devm_kzalloc()/devm_kfree() dance has been killed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 95 +++++++++++++++--------------------------------
 drivers/mtd/nand/denali.h |  2 -
 2 files changed, 30 insertions(+), 67 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 94beab57c145..c3382954cf27 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -85,28 +85,6 @@ static void index_addr(struct denali_nand_info *denali,
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
 /* Reset the flash controller */
 static uint16_t denali_nand_reset(struct denali_nand_info *denali)
 {
@@ -286,6 +264,15 @@ static void setup_ecc_for_xfer(struct denali_nand_info *denali, bool ecc_en,
 	iowrite32(transfer_spare_flag, denali->flash_reg + TRANSFER_SPARE_REG);
 }
 
+static uint8_t denali_read_byte(struct mtd_info *mtd)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+
+	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);
+
+	return ioread32(denali->flash_mem + 0x10);
+}
+
 /*
  * sends a pipeline command operation to the controller. See the Denali NAND
  * controller's user guide for more information (section 4.2.3.6).
@@ -828,17 +815,6 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -873,43 +849,40 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 			   int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t addr, id;
-	int i;
+	uint32_t addr, irq_status;
+	int wait_ready = 0;
 
 	switch (cmd) {
-	case NAND_CMD_STATUS:
-		reset_buf(denali);
-		addr = MODE_11 | BANK(denali->flash_bank);
-		index_addr(denali, addr | 0, cmd);
-		index_addr_read_data(denali, addr | 2, &id);
-		write_byte_to_buf(denali, id);
+	case NAND_CMD_PARAM:
+		wait_ready = 1;
 		break;
+	case NAND_CMD_STATUS:
 	case NAND_CMD_READID:
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
 		break;
 	case NAND_CMD_RESET:
 		reset_bank(denali);
 		break;
 	case NAND_CMD_READOOB:
 		/* TODO: Read OOB data */
-		break;
+		return;
 	default:
 		pr_err(": unsupported command received 0x%x\n", cmd);
-		break;
+		return;
 	}
+
+	denali_reset_irq(denali);
+
+	addr = MODE_11 | BANK(denali->flash_bank);
+	index_addr(denali, addr | 0, cmd);
+	if (col != -1)
+		index_addr(denali, addr | 1, col);
+
+	if (!wait_ready)
+		return;
+
+	irq_status = denali_wait_for_irq(denali, INTR__INT_ACT);
+	if (!(irq_status & INTR__INT_ACT))
+		dev_err(denali->dev, "failed to issue command 0x%x\n", cmd);
 }
 
 #define DIV_ROUND_DOWN_ULL(ll, d) \
@@ -1228,12 +1201,6 @@ int denali_init(struct denali_nand_info *denali)
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
@@ -1273,8 +1240,6 @@ int denali_init(struct denali_nand_info *denali)
 	if (ret)
 		goto disable_irq;
 
-	/* allocate the right size buffer now */
-	devm_kfree(denali->dev, denali->buf.buf);
 	denali->buf.buf = devm_kzalloc(denali->dev,
 			     mtd->writesize + mtd->oobsize,
 			     GFP_KERNEL);
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
