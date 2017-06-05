Received: from conuserg-10.nifty.com ([210.131.2.77])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI1MA-0003mw-8T
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 23:24:20 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 20/23] mtd: nand: denali: fix raw and oob accessors for
 syndrome page layout
Date: Tue,  6 Jun 2017 08:21:59 +0900
Message-Id: <1496704922-12261-21-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali IP adopts the syndrome page layout; payload and ECC are
interleaved, with BBM area always placed at the beginning of OOB.

The figure below shows the page organization for ecc->steps == 2:

  |----------------|    |-----------|
  |                |    |           |
  |                |    |           |
  |    Payload0    |    |           |
  |                |    |           |
  |                |    |           |
  |                |    |           |
  |----------------|    |  in-band  |
  |      ECC0      |    |   area    |
  |----------------|    |           |
  |                |    |           |
  |                |    |           |
  |    Payload1    |    |           |
  |                |    |           |
  |                |    |           |
  |----------------|    |-----------|
  |      BBM       |    |           |
  |----------------|    |           |
  |Payload1 (cont.)|    |           |
  |----------------|    |out-of-band|
  |      ECC1      |    |    area   |
  |----------------|    |           |
  |    OOB free    |    |           |
  |----------------|    |-----------|

The current raw / oob accessors do not take that into consideration,
so in-band and out-of-band data are transferred as stored in the
device.  In the case above,

  in-band:      Payload0 + ECC0 + Payload1(partial)
  out-of-band:  BBM + Payload1(cont.) + ECC1 + OOB-free

This is wrong.  As the comment block of struct nand_ecc_ctrl says,
driver callbacks must hide the specific layout used by the hardware
and always return contiguous in-band and out-of-band data.

The current implementation is completely screwed-up, so read/write
callbacks must be re-worked.

Also, it is reasonable to support PIO transfer in case DMA may not
work for some reasons.  Actually, the Data DMA may not be equipped
depending on the configuration of the RTL.  This can be checked by
reading the bit 4 of the FEATURES register.  Even if the controller
has the DMA support, dma_set_mask() and dma_map_single() could fail.
In either case, the driver can fall back to the PIO transfer.  Slower
access would be better than giving up.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 613 ++++++++++++++++++++++++++++++----------------
 drivers/mtd/nand/denali.h |   3 +-
 2 files changed, 397 insertions(+), 219 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index d156d95..42e0620 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -246,6 +246,53 @@ static void denali_write_byte(struct mtd_info *mtd, uint8_t byte)
 	index_addr(denali, MODE_11 | BANK(denali->flash_bank) | 2, byte);
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
 static void denali_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int ctrl)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
@@ -275,44 +322,6 @@ static int denali_dev_ready(struct mtd_info *mtd)
 	return !!(denali_check_irq(denali) & INTR__INT_ACT);
 }
 
-/*
- * sends a pipeline command operation to the controller. See the Denali NAND
- * controller's user guide for more information (section 4.2.3.6).
- */
-static int denali_send_pipeline_cmd(struct denali_nand_info *denali, int page,
-				    bool ecc_en, bool transfer_spare,
-				    int access_type, int write)
-{
-	int status = PASS;
-	uint32_t addr, cmd;
-
-	setup_ecc_for_xfer(denali, ecc_en, transfer_spare);
-
-	denali_reset_irq(denali);
-
-	addr = BANK(denali->flash_bank) | page;
-
-	if (write && access_type != SPARE_ACCESS) {
-		cmd = MODE_01 | addr;
-		iowrite32(cmd, denali->flash_mem);
-	} else if (write && access_type == SPARE_ACCESS) {
-		/* read spare area */
-		cmd = MODE_10 | addr;
-		index_addr(denali, cmd, access_type);
-
-		cmd = MODE_01 | addr;
-		iowrite32(cmd, denali->flash_mem);
-	} else {
-		/* setup page read request for access type */
-		cmd = MODE_10 | addr;
-		index_addr(denali, cmd, access_type);
-
-		cmd = MODE_01 | addr;
-		iowrite32(cmd, denali->flash_mem);
-	}
-	return status;
-}
-
 /* helper function that simply writes a buffer to the flash */
 static int write_data_to_flash_mem(struct denali_nand_info *denali,
 				   const uint8_t *buf, int len)
@@ -355,66 +364,6 @@ static int read_data_from_flash_mem(struct denali_nand_info *denali,
 	return i * 4; /* intent is to return the number of bytes read */
 }
 
-/* writes OOB data to the device */
-static int write_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
-{
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t irq_status;
-	uint32_t irq_mask = INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL;
-	int status = 0;
-
-	if (denali_send_pipeline_cmd(denali, page, false, false, SPARE_ACCESS,
-							1) == PASS) {
-		write_data_to_flash_mem(denali, buf, mtd->oobsize);
-
-		/* wait for operation to complete */
-		irq_status = denali_wait_for_irq(denali, irq_mask);
-
-		if (!(irq_status & INTR__PROGRAM_COMP)) {
-			dev_err(denali->dev, "OOB write failed\n");
-			status = -EIO;
-		}
-	} else {
-		dev_err(denali->dev, "unable to send pipeline command\n");
-		status = -EIO;
-	}
-	return status;
-}
-
-/* reads OOB data from the device */
-static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
-{
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	uint32_t irq_mask = INTR__LOAD_COMP;
-	uint32_t irq_status, addr, cmd;
-
-	if (denali_send_pipeline_cmd(denali, page, false, true, SPARE_ACCESS,
-							0) == PASS) {
-		read_data_from_flash_mem(denali, buf, mtd->oobsize);
-
-		/*
-		 * wait for command to be accepted
-		 * can always use status0 bit as the
-		 * mask is identical for each bank.
-		 */
-		irq_status = denali_wait_for_irq(denali, irq_mask);
-
-		if (!(irq_status & INTR__LOAD_COMP))
-			dev_err(denali->dev, "page on OOB timeout %d\n", page);
-
-		/*
-		 * We set the device back to MAIN_ACCESS here as I observed
-		 * instability with the controller if you do a block erase
-		 * and the last transaction was a SPARE_ACCESS. Block erase
-		 * is reliable (according to the MTD test infrastructure)
-		 * if you are in MAIN_ACCESS.
-		 */
-		addr = BANK(denali->flash_bank) | page;
-		cmd = MODE_10 | addr;
-		index_addr(denali, cmd, MAIN_ACCESS);
-	}
-}
-
 static int denali_check_erased_page(struct mtd_info *mtd,
 				    struct nand_chip *chip, uint8_t *buf,
 				    unsigned long uncor_ecc_flags,
@@ -630,144 +579,302 @@ static void denali_setup_dma(struct denali_nand_info *denali,
 		denali_setup_dma32(denali, dma_addr, page, write);
 }
 
-/*
- * writes a page. user specifies type, and this function handles the
- * configuration details.
- */
-static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			const uint8_t *buf, int page, bool raw_xfer)
+static int denali_pio_read(struct denali_nand_info *denali, void *buf,
+			   size_t size, int page, int raw)
 {
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dma_addr_t addr = denali->dma_addr;
-	size_t size = mtd->writesize + mtd->oobsize;
-	uint32_t irq_status;
-	uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
-	int ret = 0;
+	uint32_t addr = BANK(denali->flash_bank) | page;
+	uint32_t irq_status, ecc_err_mask;
 
-	/*
-	 * if it is a raw xfer, we want to disable ecc and send the spare area.
-	 * !raw_xfer - enable ecc
-	 * raw_xfer - transfer spare
-	 */
-	setup_ecc_for_xfer(denali, !raw_xfer, raw_xfer);
+	/* setup page read request for access type */
+	index_addr(denali, MODE_10 | addr,
+		   raw ? MAIN_SPARE_ACCESS : MAIN_ACCESS);
 
-	/* copy buffer into DMA buffer */
-	memcpy(denali->buf, buf, mtd->writesize);
+	iowrite32(MODE_01 | addr, denali->flash_mem);
 
-	if (raw_xfer) {
-		/* transfer the data to the spare area */
-		memcpy(denali->buf + mtd->writesize,
-			chip->oob_poi,
-			mtd->oobsize);
-	}
+	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
+		ecc_err_mask = INTR__ECC_UNCOR_ERR;
+	else
+		ecc_err_mask = INTR__ECC_ERR;
 
-	dma_sync_single_for_device(denali->dev, addr, size, DMA_TO_DEVICE);
+	denali_reset_irq(denali);
+
+	read_data_from_flash_mem(denali, buf, size);
+
+	irq_status = denali_wait_for_irq(denali, INTR__PAGE_XFER_INC);
+	if (!(irq_status & INTR__PAGE_XFER_INC))
+		return -EIO;
+
+	return irq_status & ecc_err_mask ? -EBADMSG : 0;
+}
+
+static int denali_pio_write(struct denali_nand_info *denali,
+			    const void *buf, size_t size, int page, int raw)
+{
+	uint32_t addr = BANK(denali->flash_bank) | page;
+	uint32_t irq_status;
+
+	/* setup page read request for access type */
+	index_addr(denali, MODE_10 | addr,
+		   raw ? MAIN_SPARE_ACCESS : MAIN_ACCESS);
+
+	iowrite32(MODE_01 | addr, denali->flash_mem);
 
 	denali_reset_irq(denali);
+
+	write_data_to_flash_mem(denali, buf, size);
+
+	irq_status = denali_wait_for_irq(denali,
+				INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL);
+	if (!(irq_status & INTR__PROGRAM_COMP))
+		return -EIO;
+
+	return 0;
+}
+
+static int denali_pio_xfer(struct denali_nand_info *denali, void *buf,
+			   size_t size, int page, int raw, int write)
+{
+	if (write)
+		return denali_pio_write(denali, buf, size, page, raw);
+	else
+		return denali_pio_read(denali, buf, size, page, raw);
+}
+
+static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
+			   size_t size, int page, int raw, int write)
+{
+	dma_addr_t dma_addr = denali->dma_addr;
+	uint32_t irq_mask, irq_status, ecc_err_mask;
+	enum dma_data_direction dir = write ? DMA_TO_DEVICE : DMA_FROM_DEVICE;
+	int ret = 0;
+
+	dma_sync_single_for_device(denali->dev, dma_addr, size, dir);
+
+	if (write) {
+		irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
+		ecc_err_mask = 0;
+	} else if (denali->caps & DENALI_CAP_HW_ECC_FIXUP) {
+		irq_mask = INTR__DMA_CMD_COMP;
+		ecc_err_mask = INTR__ECC_UNCOR_ERR;
+	} else {
+		irq_mask = INTR__DMA_CMD_COMP;
+		ecc_err_mask = INTR__ECC_ERR;
+	}
+
 	denali_enable_dma(denali, true);
 
-	denali_setup_dma(denali, addr, page, 1);
+	denali_reset_irq(denali);
+	denali_setup_dma(denali, dma_addr, page, write);
 
 	/* wait for operation to complete */
 	irq_status = denali_wait_for_irq(denali, irq_mask);
-	if (!(irq_status & INTR__DMA_CMD_COMP)) {
-		dev_err(denali->dev, "timeout on write_page (type = %d)\n",
-			raw_xfer);
+	if (!(irq_status & INTR__DMA_CMD_COMP))
 		ret = -EIO;
-	}
+	else if (irq_status & ecc_err_mask)
+		ret = -EBADMSG;
 
 	denali_enable_dma(denali, false);
-	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_TO_DEVICE);
+	dma_sync_single_for_cpu(denali->dev, dma_addr, size, dir);
 
 	return ret;
 }
 
-/* NAND core entry points */
-
-/*
- * this is the callback that the NAND core calls to write a page. Since
- * writing a page with ECC or without is similar, all the work is done
- * by write_page above.
- */
-static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-				const uint8_t *buf, int oob_required, int page)
+static int denali_data_xfer(struct denali_nand_info *denali, void *buf,
+			    size_t size, int page, int raw, int write)
 {
-	/*
-	 * for regular page writes, we let HW handle all the ECC
-	 * data written to the device.
-	 */
-	return write_page(mtd, chip, buf, page, false);
+	setup_ecc_for_xfer(denali, !raw, raw);
+
+	if (denali->dma_avail)
+		return denali_dma_xfer(denali, buf, size, page, raw, write);
+	else
+		return denali_pio_xfer(denali, buf, size, page, raw, write);
 }
 
-/*
- * This is the callback that the NAND core calls to write a page without ECC.
- * raw access is similar to ECC page writes, so all the work is done in the
- * write_page() function above.
- */
-static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				 const uint8_t *buf, int oob_required,
-				 int page)
+static void denali_oob_xfer(struct mtd_info *mtd, struct nand_chip *chip,
+			    int page, int write)
 {
-	/*
-	 * for raw page writes, we want to disable ECC and simply write
-	 * whatever data is in the buffer.
-	 */
-	return write_page(mtd, chip, buf, page, true);
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	unsigned int start_cmd = write ? NAND_CMD_SEQIN : NAND_CMD_READ0;
+	unsigned int rnd_cmd = write ? NAND_CMD_RNDIN : NAND_CMD_RNDOUT;
+	int writesize = mtd->writesize;
+	int oobsize = mtd->oobsize;
+	uint8_t *bufpoi = chip->oob_poi;
+	int ecc_steps = chip->ecc.steps;
+	int ecc_size = chip->ecc.size;
+	int ecc_bytes = chip->ecc.bytes;
+	int oob_skip = denali->bbtskipbytes;
+	size_t size = writesize + oobsize;
+	int i, pos, len;
+
+	/* BBM at the beginning of the OOB area */
+	chip->cmdfunc(mtd, start_cmd, writesize, page);
+	if (write)
+		chip->write_buf(mtd, bufpoi, oob_skip);
+	else
+		chip->read_buf(mtd, bufpoi, oob_skip);
+	bufpoi += oob_skip;
+
+	/* OOB ECC */
+	for (i = 0; i < ecc_steps; i++) {
+		pos = ecc_size + i * (ecc_size + ecc_bytes);
+		len = ecc_bytes;
+
+		if (pos >= writesize)
+			pos += oob_skip;
+		else if (pos + len > writesize)
+			len = writesize - pos;
+
+		chip->cmdfunc(mtd, rnd_cmd, pos, -1);
+		if (write)
+			chip->write_buf(mtd, bufpoi, len);
+		else
+			chip->read_buf(mtd, bufpoi, len);
+		bufpoi += len;
+		if (len < ecc_bytes) {
+			len = ecc_bytes - len;
+			chip->cmdfunc(mtd, rnd_cmd, writesize + oob_skip, -1);
+			if (write)
+				chip->write_buf(mtd, bufpoi, len);
+			else
+				chip->read_buf(mtd, bufpoi, len);
+			bufpoi += len;
+		}
+	}
+
+	/* OOB free */
+	len = oobsize - (bufpoi - chip->oob_poi);
+	chip->cmdfunc(mtd, rnd_cmd, size - len, -1);
+	if (write)
+		chip->write_buf(mtd, bufpoi, len);
+	else
+		chip->read_buf(mtd, bufpoi, len);
 }
 
-static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
-			    int page)
+static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+				uint8_t *buf, int oob_required, int page)
 {
-	return write_oob_data(mtd, chip->oob_poi, page);
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	int writesize = mtd->writesize;
+	int oobsize = mtd->oobsize;
+	int ecc_steps = chip->ecc.steps;
+	int ecc_size = chip->ecc.size;
+	int ecc_bytes = chip->ecc.bytes;
+	void *dma_buf = denali->buf;
+	int oob_skip = denali->bbtskipbytes;
+	size_t size = writesize + oobsize;
+	int ret, i, pos, len;
+
+	ret = denali_data_xfer(denali, dma_buf, size, page, 1, 0);
+	if (ret)
+		return ret;
+
+	/* Arrange the buffer for syndrome payload/ecc layout */
+	if (buf) {
+		for (i = 0; i < ecc_steps; i++) {
+			pos = i * (ecc_size + ecc_bytes);
+			len = ecc_size;
+
+			if (pos >= writesize)
+				pos += oob_skip;
+			else if (pos + len > writesize)
+				len = writesize - pos;
+
+			memcpy(buf, dma_buf + pos, len);
+			buf += len;
+			if (len < ecc_size) {
+				len = ecc_size - len;
+				memcpy(buf, dma_buf + writesize + oob_skip,
+				       len);
+				buf += len;
+			}
+		}
+	}
+
+	if (oob_required) {
+		uint8_t *oob = chip->oob_poi;
+
+		/* BBM at the beginning of the OOB area */
+		memcpy(oob, dma_buf + writesize, oob_skip);
+		oob += oob_skip;
+
+		/* OOB ECC */
+		for (i = 0; i < ecc_steps; i++) {
+			pos = ecc_size + i * (ecc_size + ecc_bytes);
+			len = ecc_bytes;
+
+			if (pos >= writesize)
+				pos += oob_skip;
+			else if (pos + len > writesize)
+				len = writesize - pos;
+
+			memcpy(oob, dma_buf + pos, len);
+			oob += len;
+			if (len < ecc_bytes) {
+				len = ecc_bytes - len;
+				memcpy(oob, dma_buf + writesize + oob_skip,
+				       len);
+				oob += len;
+			}
+		}
+
+		/* OOB free */
+		len = oobsize - (oob - chip->oob_poi);
+		memcpy(oob, dma_buf + size - len, len);
+	}
+
+	return 0;
 }
 
 static int denali_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 			   int page)
 {
-	read_oob_data(mtd, chip->oob_poi, page);
+	denali_oob_xfer(mtd, chip, page, 0);
 
 	return 0;
 }
 
-static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-			    uint8_t *buf, int oob_required, int page)
+static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
+			    int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dma_addr_t addr = denali->dma_addr;
-	size_t size = mtd->writesize + mtd->oobsize;
-	uint32_t irq_status;
-	uint32_t irq_mask = denali->caps & DENALI_CAP_HW_ECC_FIXUP ?
-				INTR__DMA_CMD_COMP | INTR__ECC_UNCOR_ERR :
-				INTR__ECC_TRANSACTION_DONE | INTR__ECC_ERR;
-	unsigned long uncor_ecc_flags = 0;
-	int stat = 0;
+	int status;
 
-	setup_ecc_for_xfer(denali, true, false);
+	denali_reset_irq(denali);
 
-	denali_enable_dma(denali, true);
-	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
+	denali_oob_xfer(mtd, chip, page, 1);
 
-	denali_reset_irq(denali);
-	denali_setup_dma(denali, addr, page, 0);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	status = chip->waitfunc(mtd, chip);
 
-	/* wait for operation to complete */
-	irq_status = denali_wait_for_irq(denali, irq_mask);
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
+}
 
-	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
+static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
+			    uint8_t *buf, int oob_required, int page)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
+	unsigned long uncor_ecc_flags = 0;
+	int stat = 0;
+	int ret;
+
+	ret = denali_data_xfer(denali, denali->buf, mtd->writesize, page, 0, 0);
+	if (ret && ret != -EBADMSG)
+		return ret;
 
 	memcpy(buf, denali->buf, mtd->writesize);
 
 	if (denali->caps & DENALI_CAP_HW_ECC_FIXUP)
 		stat = denali_hw_ecc_fixup(mtd, denali, &uncor_ecc_flags);
-	else if (irq_status & INTR__ECC_ERR)
+	else if (ret == -EBADMSG)
 		stat = denali_sw_ecc_fixup(mtd, denali, &uncor_ecc_flags, buf);
-	denali_enable_dma(denali, false);
 
 	if (stat < 0)
 		return stat;
 
 	if (uncor_ecc_flags) {
-		read_oob_data(mtd, chip->oob_poi, page);
+		ret = denali_read_oob(mtd, chip, page);
+		if (ret)
+			return ret;
 
 		stat = denali_check_erased_page(mtd, chip, buf,
 						uncor_ecc_flags, stat);
@@ -776,36 +883,93 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return stat;
 }
 
-static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int oob_required, int page)
+static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+				 const uint8_t *buf, int oob_required, int page)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	dma_addr_t addr = denali->dma_addr;
-	size_t size = mtd->writesize + mtd->oobsize;
-	uint32_t irq_mask = INTR__DMA_CMD_COMP;
-	uint32_t irq_status;
-
-	setup_ecc_for_xfer(denali, false, true);
-	denali_enable_dma(denali, true);
+	int writesize = mtd->writesize;
+	int oobsize = mtd->oobsize;
+	int ecc_steps = chip->ecc.steps;
+	int ecc_size = chip->ecc.size;
+	int ecc_bytes = chip->ecc.bytes;
+	void *dma_buf = denali->buf;
+	int oob_skip = denali->bbtskipbytes;
+	size_t size = writesize + oobsize;
+	int i, pos, len;
 
-	dma_sync_single_for_device(denali->dev, addr, size, DMA_FROM_DEVICE);
+	/*
+	 * Fill the buffer with 0xff first except the full page transfer.
+	 * This simplifies the logic.
+	 */
+	if (!buf || !oob_required)
+		memset(dma_buf, 0xff, size);
+
+	/* Arrange the buffer for syndrome payload/ecc layout */
+	if (buf) {
+		for (i = 0; i < ecc_steps; i++) {
+			pos = i * (ecc_size + ecc_bytes);
+			len = ecc_size;
+
+			if (pos >= writesize)
+				pos += oob_skip;
+			else if (pos + len > writesize)
+				len = writesize - pos;
+
+			memcpy(dma_buf + pos, buf, len);
+			buf += len;
+			if (len < ecc_size) {
+				len = ecc_size - len;
+				memcpy(dma_buf + writesize + oob_skip, buf,
+				       len);
+				buf += len;
+			}
+		}
+	}
 
-	denali_reset_irq(denali);
-	denali_setup_dma(denali, addr, page, 0);
+	if (oob_required) {
+		const uint8_t *oob = chip->oob_poi;
+
+		/* BBM at the beginning of the OOB area */
+		memcpy(dma_buf + writesize, oob, oob_skip);
+		oob += oob_skip;
+
+		/* OOB ECC */
+		for (i = 0; i < ecc_steps; i++) {
+			pos = ecc_size + i * (ecc_size + ecc_bytes);
+			len = ecc_bytes;
+
+			if (pos >= writesize)
+				pos += oob_skip;
+			else if (pos + len > writesize)
+				len = writesize - pos;
+
+			memcpy(dma_buf + pos, oob, len);
+			oob += len;
+			if (len < ecc_bytes) {
+				len = ecc_bytes - len;
+				memcpy(dma_buf + writesize + oob_skip, oob,
+				       len);
+				oob += len;
+			}
+		}
 
-	/* wait for operation to complete */
-	irq_status = denali_wait_for_irq(denali, irq_mask);
-	if (irq_status & INTR__DMA_CMD_COMP)
-		return -ETIMEDOUT;
+		/* OOB free */
+		len = oobsize - (oob - chip->oob_poi);
+		memcpy(dma_buf + size - len, oob, len);
+	}
 
-	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_FROM_DEVICE);
+	return denali_data_xfer(denali, dma_buf, size, page, 1, 1);
+}
 
-	denali_enable_dma(denali, false);
+static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+			     const uint8_t *buf, int oob_required, int page)
+{
+	struct denali_nand_info *denali = mtd_to_denali(mtd);
 
-	memcpy(buf, denali->buf, mtd->writesize);
-	memcpy(chip->oob_poi, denali->buf + mtd->writesize, mtd->oobsize);
+	memcpy(denali->buf, buf, mtd->writesize);
 
-	return 0;
+	return denali_data_xfer(denali, denali->buf, mtd->writesize, page,
+				0, 1);
 }
 
 static void denali_select_chip(struct mtd_info *mtd, int chip)
@@ -1245,21 +1409,29 @@ int denali_init(struct denali_nand_info *denali)
 		goto disable_irq;
 	}
 
-	ret = dma_set_mask(denali->dev,
-			   DMA_BIT_MASK(denali->caps & DENALI_CAP_DMA_64BIT ?
-					64 : 32));
-	if (ret) {
-		dev_err(denali->dev, "No usable DMA configuration\n");
-		goto disable_irq;
+	if (ioread32(denali->flash_reg + FEATURES) & FEATURES__DMA)
+		denali->dma_avail = 1;
+
+	if (denali->dma_avail) {
+		int dma_bit = denali->caps & DENALI_CAP_DMA_64BIT ? 64 : 32;
+
+		ret = dma_set_mask(denali->dev, DMA_BIT_MASK(dma_bit));
+		if (ret) {
+			dev_info(denali->dev,
+				 "Failed to set DMA mask. Disabling DMA.\n");
+			denali->dma_avail = 0;
+		}
 	}
 
-	denali->dma_addr = dma_map_single(denali->dev, denali->buf,
-			     mtd->writesize + mtd->oobsize,
-			     DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(denali->dev, denali->dma_addr)) {
-		dev_err(denali->dev, "Failed to map DMA buffer\n");
-		ret = -EIO;
-		goto disable_irq;
+	if (denali->dma_avail) {
+		denali->dma_addr = dma_map_single(denali->dev, denali->buf,
+						  mtd->writesize + mtd->oobsize,
+						  DMA_BIDIRECTIONAL);
+		if (dma_mapping_error(denali->dev, denali->dma_addr)) {
+			dev_info(denali->dev,
+				 "Failed to map DMA buffer. Disabling DMA.\n");
+			denali->dma_avail = 0;
+		};
 	}
 
 	/*
@@ -1306,6 +1478,13 @@ int denali_init(struct denali_nand_info *denali)
 
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
index 49dc4ba..f953cb4 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -298,8 +298,6 @@
 #define     CHNL_ACTIVE__CHANNEL2			BIT(2)
 #define     CHNL_ACTIVE__CHANNEL3			BIT(3)
 
-#define PASS 0                  /*success flag*/
-
 #define MODE_00    0x00000000
 #define MODE_01    0x04000000
 #define MODE_10    0x08000000
@@ -322,6 +320,7 @@ struct denali_nand_info {
 
 	void *buf;
 	dma_addr_t dma_addr;
+	int dma_avail;
 	int devnum;	/* represent how many nands connected */
 	int bbtskipbytes;
 	int max_banks;
-- 
2.7.4
