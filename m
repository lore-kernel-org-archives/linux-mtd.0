Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a2l6x-0000re-8v
 for linux-mtd@lists.infradead.org; Sat, 28 Nov 2015 19:24:45 +0000
From: Simon Arlott <simon@fire.lp0.eu>
Subject: [PATCH] mtd: brcmnand: Workaround false ECC uncorrectable errors
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Jonas Gorski <jogo@openwrt.org>
Message-ID: <5659FF4A.7080203@simon.arlott.org.uk>
Date: Sat, 28 Nov 2015 19:23:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Workaround false ECC uncorrectable errors by checking if the data
has been erased and the OOB data indicates that the data has been
erased. The v4.0 controller on the BCM63168 incorrectly handles
these as uncorrectable errors.

I don't know which version of the controller handles this scenario
correctly. I'm only able to test this in Hamming mode, so the BCH
version needs to be checked.

This code is quite complicated because the fact that either the data
buffer or the OOB data may not have been read from the controller, and
both of them are required to determine if the error is incorrect.

Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 107 ++++++++++++++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index 5f26b8a..0857af7 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1387,6 +1387,102 @@ static int brcmnand_dma_trans(struct brcmnand_host *host, u64 addr, u32 *buf,
 }
 
 /*
+ * Workaround false ECC uncorrectable errors by checking if the data
+ * has been erased and the OOB data indicates that the data has been
+ * erased. The controller incorrectly handles these as uncorrectable
+ * errors.
+ */
+static void brcmnand_read_ecc_unc_err(struct mtd_info *mtd,
+				struct nand_chip *chip,
+				int idx, unsigned int trans,
+				u32 *buf, u8 *oob_begin, u8 *oob_end,
+				u64 *err_addr)
+{
+	struct brcmnand_host *host = chip->priv;
+	struct brcmnand_controller *ctrl = host->ctrl;
+	u32 *buf_tmp = NULL;
+	u8 *oob_tmp = NULL;
+	bool buf_erased = false;
+	bool oob_erased = false;
+	int j;
+
+	/* Assume this is fixed in v5.0+ */
+	if (ctrl->nand_version >= 0x0500)
+		return;
+
+	/* Read OOB data if not already read */
+	if (!oob_begin) {
+		oob_tmp = kmalloc(ctrl->max_oob, GFP_KERNEL);
+		if (!oob_tmp)
+			goto out_free;
+
+		oob_begin = oob_tmp;
+		oob_end = oob_tmp;
+
+		oob_end += read_oob_from_regs(ctrl, idx, oob_tmp,
+				mtd->oobsize / trans,
+				host->hwcfg.sector_size_1k);
+	}
+
+	if (is_hamming_ecc(&host->hwcfg)) {
+		u8 *oob_offset = oob_begin + 6;
+
+		if (oob_offset + 3 < oob_end)
+			/* Erased if ECC bytes are all 0xFF, or the data bytes
+			 * are all 0xFF which should have Hamming codes of 0x00
+			 */
+			oob_erased = memchr_inv(oob_offset, 0xFF, 3) == NULL ||
+				memchr_inv(oob_offset, 0x00, 3) == NULL;
+	} else { /* BCH */
+		u8 *oob_offset = oob_end - ctrl->max_oob;
+
+		if (oob_offset >= oob_begin)
+			/* Erased if ECC bytes are all 0xFF */
+			oob_erased = memchr_inv(oob_offset, 0xFF,
+						oob_end - oob_offset) == NULL;
+	}
+
+	if (!oob_erased)
+		goto out_free;
+
+	/* Read data buffer if not already read */
+	if (!buf) {
+		buf_tmp = kmalloc_array(FC_WORDS, sizeof(*buf_tmp), GFP_KERNEL);
+		if (!buf_tmp)
+			goto out_free;
+
+		buf = buf_tmp;
+
+		brcmnand_soc_data_bus_prepare(ctrl->soc);
+
+		for (j = 0; j < FC_WORDS; j++, buf++)
+			*buf = brcmnand_read_fc(ctrl, j);
+
+		brcmnand_soc_data_bus_unprepare(ctrl->soc);
+	}
+
+	/* Go to start of buffer */
+	buf -= FC_WORDS;
+
+	/* Erased if all data bytes are 0xFF */
+	buf_erased = memchr_inv(buf, 0xFF, FC_WORDS) == NULL;
+
+	if (!buf_erased)
+		goto out_free;
+
+	/* Clear error addresses */
+	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_ADDR, 0);
+	brcmnand_write_reg(ctrl, BRCMNAND_CORR_ADDR, 0);
+	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_EXT_ADDR, 0);
+	brcmnand_write_reg(ctrl, BRCMNAND_CORR_EXT_ADDR, 0);
+	*err_addr = 0;
+
+out_free:
+	kfree(buf_tmp);
+	kfree(oob_tmp);
+}
+
+/*
  * Assumes proper CS is already set
  */
 static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
@@ -1396,6 +1492,7 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 	struct brcmnand_host *host = chip->priv;
 	struct brcmnand_controller *ctrl = host->ctrl;
 	int i, j, ret = 0;
+	u8 *prev_oob = NULL;
 
 	/* Clear error addresses */
 	brcmnand_write_reg(ctrl, BRCMNAND_UNCORR_ADDR, 0);
@@ -1424,10 +1521,12 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 			brcmnand_soc_data_bus_unprepare(ctrl->soc);
 		}
 
-		if (oob)
+		if (oob) {
+			prev_oob = oob;
 			oob += read_oob_from_regs(ctrl, i, oob,
 					mtd->oobsize / trans,
 					host->hwcfg.sector_size_1k);
+		}
 
 		if (!ret) {
 			*err_addr = brcmnand_read_reg(ctrl,
@@ -1435,6 +1534,12 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 				((u64)(brcmnand_read_reg(ctrl,
 						BRCMNAND_UNCORR_EXT_ADDR)
 					& 0xffff) << 32);
+
+			if (*err_addr)
+				brcmnand_read_ecc_unc_err(mtd, chip,
+					i, trans, buf, prev_oob, oob,
+					err_addr);
+
 			if (*err_addr)
 				ret = -EBADMSG;
 		}
-- 
2.1.4

-- 
Simon Arlott
