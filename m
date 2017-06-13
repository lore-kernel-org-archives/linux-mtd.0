Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKmA8-0006VB-I6
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 13:47:20 +0000
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
Subject: [PATCH v7 01/16] mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
Date: Tue, 13 Jun 2017 22:45:35 +0900
Message-Id: <1497361550-8115-2-git-send-email-yamada.masahiro@socionext.com>
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

The denali_cmdfunc() actually does nothing valuable for
NAND_CMD_{PAGEPROG,READ0,SEQIN}.

For NAND_CMD_{READ0,SEQIN}, it copies "page" to "denali->page", then
denali_read_page(_raw) compares them just for the sanity check.
(Inconsistently, this check is missing from denali_write_page(_raw).)

The Denali controller is equipped with high level read/write interface,
so let's skip unneeded call of cmdfunc().

If NAND_ECC_CUSTOM_PAGE_ACCESS is set, nand_write_page() will not
call ->waitfunc hook.  So, ->write_page(_raw) hooks should directly
return -EIO on failure.  The error handling of page writes will be
much simpler.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v7: None
Changes in v6:
  - Squash two commits to adjust to commit 41145649f4ac
    (mtd: nand: Wait for PAGEPROG to finish in drivers setting NAND_ECC_CUSTOM_PAGE_ACCESS)

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
  - Newly added

 drivers/mtd/nand/denali.c | 41 ++++++++++++-----------------------------
 drivers/mtd/nand/denali.h |  1 -
 2 files changed, 12 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 2b4618bb8d72..7133a33b4ad3 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -998,13 +998,16 @@ static void denali_setup_dma(struct denali_nand_info *denali, int op)
  * configuration details.
  */
 static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			const uint8_t *buf, bool raw_xfer)
+			const uint8_t *buf, int page, bool raw_xfer)
 {
 	struct denali_nand_info *denali = mtd_to_denali(mtd);
 	dma_addr_t addr = denali->buf.dma_buf;
 	size_t size = mtd->writesize + mtd->oobsize;
 	uint32_t irq_status;
 	uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
+	int ret = 0;
+
+	denali->page = page;
 
 	/*
 	 * if it is a raw xfer, we want to disable ecc and send the spare area.
@@ -1036,13 +1039,13 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (irq_status == 0) {
 		dev_err(denali->dev, "timeout on write_page (type = %d)\n",
 			raw_xfer);
-		denali->status = NAND_STATUS_FAIL;
+		ret = -EIO;
 	}
 
 	denali_enable_dma(denali, false);
 	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_TO_DEVICE);
 
-	return 0;
+	return ret;
 }
 
 /* NAND core entry points */
@@ -1059,7 +1062,7 @@ static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	 * for regular page writes, we let HW handle all the ECC
 	 * data written to the device.
 	 */
-	return write_page(mtd, chip, buf, false);
+	return write_page(mtd, chip, buf, page, false);
 }
 
 /*
@@ -1075,7 +1078,7 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	 * for raw page writes, we want to disable ECC and simply write
 	 * whatever data is in the buffer.
 	 */
-	return write_page(mtd, chip, buf, true);
+	return write_page(mtd, chip, buf, page, true);
 }
 
 static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
@@ -1105,12 +1108,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	unsigned long uncor_ecc_flags = 0;
 	int stat = 0;
 
-	if (page != denali->page) {
-		dev_err(denali->dev,
-			"IN %s: page %d is not equal to denali->page %d",
-			__func__, page, denali->page);
-		BUG();
-	}
+	denali->page = page;
 
 	setup_ecc_for_xfer(denali, true, false);
 
@@ -1154,12 +1152,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	size_t size = mtd->writesize + mtd->oobsize;
 	uint32_t irq_mask = INTR__DMA_CMD_COMP;
 
-	if (page != denali->page) {
-		dev_err(denali->dev,
-			"IN %s: page %d is not equal to denali->page %d",
-			__func__, page, denali->page);
-		BUG();
-	}
+	denali->page = page;
 
 	setup_ecc_for_xfer(denali, false, true);
 	denali_enable_dma(denali, true);
@@ -1204,12 +1197,7 @@ static void denali_select_chip(struct mtd_info *mtd, int chip)
 
 static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
 {
-	struct denali_nand_info *denali = mtd_to_denali(mtd);
-	int status = denali->status;
-
-	denali->status = 0;
-
-	return status;
+	return 0;
 }
 
 static int denali_erase(struct mtd_info *mtd, int page)
@@ -1238,8 +1226,6 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 	int i;
 
 	switch (cmd) {
-	case NAND_CMD_PAGEPROG:
-		break;
 	case NAND_CMD_STATUS:
 		read_status(denali);
 		break;
@@ -1259,10 +1245,6 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 			write_byte_to_buf(denali, id);
 		}
 		break;
-	case NAND_CMD_READ0:
-	case NAND_CMD_SEQIN:
-		denali->page = page;
-		break;
 	case NAND_CMD_RESET:
 		reset_bank(denali);
 		break;
@@ -1605,6 +1587,7 @@ int denali_init(struct denali_nand_info *denali)
 
 	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
 
+	chip->ecc.options |= NAND_ECC_CUSTOM_PAGE_ACCESS;
 	chip->ecc.read_page = denali_read_page;
 	chip->ecc.read_page_raw = denali_read_page_raw;
 	chip->ecc.write_page = denali_write_page;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index a06ed741b550..352d8328b94a 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -323,7 +323,6 @@ struct nand_buf {
 struct denali_nand_info {
 	struct nand_chip nand;
 	int flash_bank; /* currently selected chip */
-	int status;
 	int platform;
 	struct nand_buf buf;
 	struct device *dev;
-- 
2.7.4
