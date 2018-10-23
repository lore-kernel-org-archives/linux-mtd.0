Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gF1lR-0005Yf-Ex
 for linux-mtd@lists.infradead.org; Tue, 23 Oct 2018 18:51:45 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 06/15] mtd: rawnand: Add nand_[de]select_target() helpers
Date: Tue, 23 Oct 2018 20:50:02 +0200
Message-Id: <20181023185011.3356-7-boris.brezillon@bootlin.com>
In-Reply-To: <20181023185011.3356-1-boris.brezillon@bootlin.com>
References: <20181023185011.3356-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a wrapper to prevent drivers and core code from directly calling
the ->select_chip hook which we are about to deprecate.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  23 +++--
 drivers/mtd/nand/raw/jz4740_nand.c         |   4 +-
 drivers/mtd/nand/raw/nand_base.c           | 114 ++++++++++++++-------
 drivers/mtd/nand/raw/r852.c                |   4 +-
 include/linux/mtd/rawnand.h                |   4 +
 5 files changed, 98 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 94c2b7525c85..302ddd3d4a5f 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -1549,7 +1549,7 @@ static int gpmi_block_markbad(struct nand_chip *chip, loff_t ofs)
 	int column, page, chipnr;
 
 	chipnr = (int)(ofs >> chip->chip_shift);
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 
 	column = !GPMI_IS_MX23(this) ? mtd->writesize : 0;
 
@@ -1562,7 +1562,7 @@ static int gpmi_block_markbad(struct nand_chip *chip, loff_t ofs)
 
 	ret = nand_prog_page_op(chip, page, column, block_mark, 1);
 
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 
 	return ret;
 }
@@ -1610,7 +1610,7 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 	search_area_size_in_strides = 1 << rom_geo->search_area_stride_exponent;
 
 	saved_chip_number = this->current_chip;
-	chip->select_chip(chip, 0);
+	nand_select_target(chip, 0);
 
 	/*
 	 * Loop through the first search area, looking for the NCB fingerprint.
@@ -1638,7 +1638,10 @@ static int mx23_check_transcription_stamp(struct gpmi_nand_data *this)
 
 	}
 
-	chip->select_chip(chip, saved_chip_number);
+	if (saved_chip_number >= 0)
+		nand_select_target(chip, saved_chip_number);
+	else
+		nand_deselect_target(chip);
 
 	if (found_an_ncb_fingerprint)
 		dev_dbg(dev, "\tFound a fingerprint\n");
@@ -1681,7 +1684,7 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 
 	/* Select chip 0. */
 	saved_chip_number = this->current_chip;
-	chip->select_chip(chip, 0);
+	nand_select_target(chip, 0);
 
 	/* Loop over blocks in the first search area, erasing them. */
 	dev_dbg(dev, "Erasing the search area...\n");
@@ -1713,7 +1716,11 @@ static int mx23_write_transcription_stamp(struct gpmi_nand_data *this)
 	}
 
 	/* Deselect chip 0. */
-	chip->select_chip(chip, saved_chip_number);
+	if (saved_chip_number >= 0)
+		nand_select_target(chip, saved_chip_number);
+	else
+		nand_deselect_target(chip);
+
 	return 0;
 }
 
@@ -1762,10 +1769,10 @@ static int mx23_boot_init(struct gpmi_nand_data  *this)
 		byte = block <<  chip->phys_erase_shift;
 
 		/* Send the command to read the conventional block mark. */
-		chip->select_chip(chip, chipnr);
+		nand_select_target(chip, chipnr);
 		nand_read_page_op(chip, page, mtd->writesize, NULL, 0);
 		block_mark = chip->legacy.read_byte(chip);
-		chip->select_chip(chip, -1);
+		nand_deselect_target(chip);
 
 		/*
 		 * Check if the block is marked bad. If so, we need to mark it
diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/jz4740_nand.c
index fb59cfca11a7..d271004f16b0 100644
--- a/drivers/mtd/nand/raw/jz4740_nand.c
+++ b/drivers/mtd/nand/raw/jz4740_nand.c
@@ -335,14 +335,14 @@ static int jz_nand_detect_bank(struct platform_device *pdev,
 			goto notfound_id;
 
 		/* Retrieve the IDs from the first chip. */
-		chip->select_chip(chip, 0);
+		nand_select_target(chip, 0);
 		nand_reset_op(chip);
 		nand_readid_op(chip, 0, id, sizeof(id));
 		*nand_maf_id = id[0];
 		*nand_dev_id = id[1];
 	} else {
 		/* Detect additional chip. */
-		chip->select_chip(chip, chipnr);
+		nand_select_target(chip, chipnr);
 		nand_reset_op(chip);
 		nand_readid_op(chip, 0, id, sizeof(id));
 		if (*nand_maf_id != id[0] || *nand_dev_id != id[1]) {
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f0b35b5d9674..c691f0ab88e6 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -229,6 +229,41 @@ static int check_offs_len(struct mtd_info *mtd,
 	return ret;
 }
 
+/**
+ * nand_select_target() - Select a NAND target (A.K.A. die)
+ * @chip: NAND chip object
+ * @cs: the CS line to select. Note that this CS id is always from the chip
+ *	PoV, not the controller one
+ *
+ * Select a NAND target so that further operations executed on @chip go to the
+ * selected NAND target.
+ */
+void nand_select_target(struct nand_chip *chip, unsigned int cs)
+{
+	/*
+	 * cs should always lie between 0 and chip->numchips, when that's not
+	 * the case it's a bug and the caller should be fixed.
+	 */
+	if (WARN_ON(cs > chip->numchips))
+		return;
+
+	chip->select_chip(chip, cs);
+}
+EXPORT_SYMBOL_GPL(nand_select_target);
+
+/**
+ * nand_deselect_target() - Deselect the currently selected target
+ * @chip: NAND chip object
+ *
+ * Deselect the currently selected NAND target. The result of operations
+ * executed on @chip after the target has been deselected is undefined.
+ */
+void nand_deselect_target(struct nand_chip *chip)
+{
+	chip->select_chip(chip, -1);
+}
+EXPORT_SYMBOL_GPL(nand_deselect_target);
+
 /**
  * nand_release_device - [GENERIC] release chip
  * @chip: NAND chip object
@@ -443,14 +478,14 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 	 */
 	nand_reset(chip, chipnr);
 
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 
 	/* Shift to get page */
 	page = (int)(to >> chip->page_shift);
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
-		chip->select_chip(chip, -1);
+		nand_deselect_target(chip);
 		return -EROFS;
 	}
 
@@ -465,7 +500,7 @@ static int nand_do_write_oob(struct nand_chip *chip, loff_t to,
 	else
 		status = chip->ecc.write_oob(chip, page & chip->pagemask);
 
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 
 	if (status)
 		return status;
@@ -792,10 +827,10 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 
 	/* Change the mode on the chip side (if supported by the NAND chip) */
 	if (nand_supports_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE)) {
-		chip->select_chip(chip, chipnr);
+		nand_select_target(chip, chipnr);
 		ret = nand_set_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
 					tmode_param);
-		chip->select_chip(chip, -1);
+		nand_deselect_target(chip);
 		if (ret)
 			return ret;
 	}
@@ -810,10 +845,10 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 		return 0;
 
 	memset(tmode_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 	ret = nand_get_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE,
 				tmode_param);
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 	if (ret)
 		goto err_reset_chip;
 
@@ -831,9 +866,9 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 	 * timing mode.
 	 */
 	nand_reset_data_interface(chip, chipnr);
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 	nand_reset_op(chip);
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 
 	return ret;
 }
@@ -2321,11 +2356,12 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 
 	/*
 	 * The CS line has to be released before we can apply the new NAND
-	 * interface settings, hence this weird ->select_chip() dance.
+	 * interface settings, hence this weird nand_select_target()
+	 * nand_deselect_target() dance.
 	 */
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 	ret = nand_reset_op(chip);
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 	if (ret)
 		return ret;
 
@@ -3109,7 +3145,7 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 	bool ecc_fail = false;
 
 	chipnr = (int)(from >> chip->chip_shift);
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 
 	realpage = (int)(from >> chip->page_shift);
 	page = realpage & chip->pagemask;
@@ -3240,11 +3276,11 @@ static int nand_do_read_ops(struct nand_chip *chip, loff_t from,
 		/* Check, if we cross a chip boundary */
 		if (!page) {
 			chipnr++;
-			chip->select_chip(chip, -1);
-			chip->select_chip(chip, chipnr);
+			nand_deselect_target(chip);
+			nand_select_target(chip, chipnr);
 		}
 	}
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 
 	ops->retlen = ops->len - (size_t) readlen;
 	if (oob)
@@ -3441,7 +3477,7 @@ static int nand_do_read_oob(struct nand_chip *chip, loff_t from,
 	len = mtd_oobavail(mtd, ops);
 
 	chipnr = (int)(from >> chip->chip_shift);
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 
 	/* Shift to get page */
 	realpage = (int)(from >> chip->page_shift);
@@ -3474,11 +3510,11 @@ static int nand_do_read_oob(struct nand_chip *chip, loff_t from,
 		/* Check, if we cross a chip boundary */
 		if (!page) {
 			chipnr++;
-			chip->select_chip(chip, -1);
-			chip->select_chip(chip, chipnr);
+			nand_deselect_target(chip);
+			nand_select_target(chip, chipnr);
 		}
 	}
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 
 	ops->oobretlen = ops->ooblen - readlen;
 
@@ -3922,7 +3958,7 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 	column = to & (mtd->writesize - 1);
 
 	chipnr = (int)(to >> chip->chip_shift);
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
@@ -3998,8 +4034,8 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 		/* Check, if we cross a chip boundary */
 		if (!page) {
 			chipnr++;
-			chip->select_chip(chip, -1);
-			chip->select_chip(chip, chipnr);
+			nand_deselect_target(chip);
+			nand_select_target(chip, chipnr);
 		}
 	}
 
@@ -4008,7 +4044,7 @@ static int nand_do_write_ops(struct nand_chip *chip, loff_t to,
 		ops->oobretlen = ops->ooblen;
 
 err_out:
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 	return ret;
 }
 
@@ -4034,7 +4070,7 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Grab the device */
 	panic_nand_get_device(chip, FL_WRITING);
 
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 
 	/* Wait for the device to get ready */
 	panic_nand_wait(chip, 400);
@@ -4148,7 +4184,7 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 	pages_per_block = 1 << (chip->phys_erase_shift - chip->page_shift);
 
 	/* Select the NAND device */
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 
 	/* Check, if it is write protected */
 	if (nand_check_wp(mtd)) {
@@ -4202,8 +4238,8 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		/* Check, if we cross a chip boundary */
 		if (len && !(page & chip->pagemask)) {
 			chipnr++;
-			chip->select_chip(chip, -1);
-			chip->select_chip(chip, chipnr);
+			nand_deselect_target(chip);
+			nand_select_target(chip, chipnr);
 		}
 	}
 
@@ -4211,7 +4247,7 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 erase_exit:
 
 	/* Deselect and wake up anyone waiting on the device */
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 	nand_release_device(chip);
 
 	/* Return more or less happy */
@@ -4249,11 +4285,11 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 
 	/* Select the NAND device */
 	nand_get_device(chip, FL_READING);
-	chip->select_chip(chip, chipnr);
+	nand_select_target(chip, chipnr);
 
 	ret = nand_block_checkbad(mtd, offs, 0);
 
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 	nand_release_device(chip);
 
 	return ret;
@@ -4622,7 +4658,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
 		return ret;
 
 	/* Select the device */
-	chip->select_chip(chip, 0);
+	nand_select_target(chip, 0);
 
 	/* Send the command for reading device ID */
 	ret = nand_readid_op(chip, 0, id_data, 2);
@@ -4974,14 +5010,14 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	if (ret) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
 			pr_warn("No NAND device found\n");
-		chip->select_chip(chip, -1);
+		nand_deselect_target(chip);
 		return ret;
 	}
 
 	nand_maf_id = chip->id.data[0];
 	nand_dev_id = chip->id.data[1];
 
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 
 	/* Check for a chip array */
 	for (i = 1; i < maxchips; i++) {
@@ -4990,15 +5026,15 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 		/* See comment in nand_get_flash_type for reset */
 		nand_reset(chip, i);
 
-		chip->select_chip(chip, i);
+		nand_select_target(chip, i);
 		/* Send the command for reading device ID */
 		nand_readid_op(chip, 0, id, sizeof(id));
 		/* Read manufacturer and device IDs */
 		if (nand_maf_id != id[0] || nand_dev_id != id[1]) {
-			chip->select_chip(chip, -1);
+			nand_deselect_target(chip);
 			break;
 		}
-		chip->select_chip(chip, -1);
+		nand_deselect_target(chip);
 	}
 	if (i > 1)
 		pr_info("%d chips detected\n", i);
@@ -5424,9 +5460,9 @@ static int nand_scan_tail(struct nand_chip *chip)
 	 * to explictly select the relevant die when interacting with the NAND
 	 * chip.
 	 */
-	chip->select_chip(chip, 0);
+	nand_select_target(chip, 0);
 	ret = nand_manufacturer_init(chip);
-	chip->select_chip(chip, -1);
+	nand_deselect_target(chip);
 	if (ret)
 		goto err_free_buf;
 
diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 39be65b35ac2..cbcd17667994 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -1045,9 +1045,9 @@ static int r852_resume(struct device *device)
 	/* Otherwise, initialize the card */
 	if (dev->card_registered) {
 		r852_engine_enable(dev);
-		dev->chip->select_chip(dev->chip, 0);
+		nand_select_target(dev->chip, 0);
 		nand_reset_op(dev->chip);
-		dev->chip->select_chip(dev->chip, -1);
+		nand_deselect_target(dev->chip);
 	}
 
 	/* Program card detection IRQ */
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index bcdc3819ad17..98e377198694 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1333,4 +1333,8 @@ void nand_release(struct nand_chip *chip);
  */
 int nand_soft_waitrdy(struct nand_chip *chip, unsigned long timeout_ms);
 
+/* Select/deselect a NAND target. */
+void nand_select_target(struct nand_chip *chip, unsigned int cs);
+void nand_deselect_target(struct nand_chip *chip);
+
 #endif /* __LINUX_MTD_RAWNAND_H */
-- 
2.17.1
