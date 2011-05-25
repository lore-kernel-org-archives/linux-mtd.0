Received: from mms3.broadcom.com ([216.31.210.19])
	by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QPMGj-00059P-Rs
	for linux-mtd@lists.infradead.org; Wed, 25 May 2011 22:09:35 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: nand: multi-line comment style fixups
Date: Wed, 25 May 2011 14:59:01 -0700
Message-ID: <1306360741-12770-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Brian Norris <norris@broadcom.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Brian Norris <norris@broadcom.com>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   50 ++++++++++++++++++++++++++---------------
 drivers/mtd/nand/nand_bbt.c  |   38 ++++++++++++++++++++-----------
 2 files changed, 56 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a46e9bb..f591c21 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -410,7 +410,8 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	else {
 		nand_get_device(chip, mtd, FL_WRITING);
 
-		/* Write to first two pages and to byte 1 and 6 if necessary.
+		/*
+		 * Write to first two pages and to byte 1 and 6 if necessary.
 		 * If we write to more than one location, the first error
 		 * encountered quits the procedure. We write two bytes per
 		 * location, so we dont have to mess with 16 bit access.
@@ -625,8 +626,10 @@ static void nand_command(struct mtd_info *mtd, unsigned int command,
 			return;
 		}
 	}
-	/* Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine. */
+	/*
+	 * Apply this short delay always to ensure that we do wait tWB in
+	 * any case on any machine.
+	 */
 	ndelay(100);
 
 	nand_wait_ready(mtd);
@@ -747,8 +750,10 @@ static void nand_command_lp(struct mtd_info *mtd, unsigned int command,
 		}
 	}
 
-	/* Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine. */
+	/*
+	 * Apply this short delay always to ensure that we do wait tWB in
+	 * any case on any machine.
+	 */
 	ndelay(100);
 
 	nand_wait_ready(mtd);
@@ -859,8 +864,10 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 
 	led_trigger_event(nand_led_trigger, LED_FULL);
 
-	/* Apply this short delay always to ensure that we do wait tWB in
-	 * any case on any machine. */
+	/*
+	 * Apply this short delay always to ensure that we do wait tWB in
+	 * any case on any machine.
+	 */
 	ndelay(100);
 
 	if ((state == FL_ERASING) && (chip->options & NAND_IS_AND))
@@ -1187,9 +1194,10 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 	for (i = 0; i < eccfrag_len ; i += chip->ecc.bytes, p += chip->ecc.size)
 		chip->ecc.calculate(mtd, p, &chip->buffers->ecccalc[i]);
 
-	/* The performance is faster if to position offsets
-	   according to ecc.pos. Let make sure here that
-	   there are no gaps in ecc positions */
+	/*
+	 * The performance is faster if we position offsets according to
+	 * ecc.pos. Let's make sure that there are no gaps in ecc positions.
+	 */
 	for (i = 0; i < eccfrag_len - 1; i++) {
 		if (eccpos[i + start_step * chip->ecc.bytes] + 1 !=
 			eccpos[i + start_step * chip->ecc.bytes + 1]) {
@@ -1552,7 +1560,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			chip->select_chip(mtd, chipnr);
 		}
 
-		/* Check, if the chip supports auto page increment
+		/*
+		 * Check, if the chip supports auto page increment
 		 * or if we have hit a block boundary.
 		 */
 		if (!NAND_CANAUTOINCR(chip) || !(page & blkcheck))
@@ -1830,7 +1839,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
 			chip->select_chip(mtd, chipnr);
 		}
 
-		/* Check, if the chip supports auto page increment
+		/*
+		 * Check, if the chip supports auto page increment
 		 * or if we have hit a block boundary.
 		 */
 		if (!NAND_CANAUTOINCR(chip) || !(page & blkcheck))
@@ -2924,7 +2934,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	*maf_id = chip->read_byte(mtd);
 	*dev_id = chip->read_byte(mtd);
 
-	/* Try again to make sure, as some systems the bus-hold or other
+	/*
+	 * Try again to make sure, as some systems the bus-hold or other
 	 * interface concerns can cause random data which looks like a
 	 * possibly credible NAND flash to appear. If the two results do
 	 * not match, ignore the device completely.
@@ -2973,7 +2984,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	chip->chipsize = (uint64_t)type->chipsize << 20;
 
 	if (!type->pagesize && chip->init_size) {
-		/* set the pagesize, oobsize, erasesize by the driver*/
+		/* set the pagesize, oobsize, erasesize by the driver */
 		busw = chip->init_size(mtd, chip, id_data);
 	} else if (!type->pagesize) {
 		int extid;
@@ -3057,8 +3068,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 	chip->options &= ~NAND_CHIPOPTIONS_MSK;
 	chip->options |= type->options & NAND_CHIPOPTIONS_MSK;
 
-	/* Check if chip is a not a samsung device. Do not clear the
-	 * options for chips which are not having an extended id.
+	/*
+	 * Check if chip is not a Samsung device. Do not clear the
+	 * options for chips which do not have an extended id.
 	 */
 	if (*maf_id != NAND_MFR_SAMSUNG && !type->pagesize)
 		chip->options &= ~NAND_SAMSUNG_LP_OPTIONS;
@@ -3481,9 +3493,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL(nand_scan_tail);
 
-/* is_module_text_address() isn't exported, and it's mostly a pointless
+/*
+ * is_module_text_address() isn't exported, and it's mostly a pointless
  * test if this is a module _anyway_ -- they'd have to try _really_ hard
- * to call us from in-kernel code if the core NAND support is modular. */
+ * to call us from in-kernel code if the core NAND support is modular.
+ */
 #ifdef MODULE
 #define caller_is_module() (1)
 #else
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 7936a6c..64a3cd5 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -258,8 +258,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
-				/* Leave it for now, if its matured we can move this
-				 * message to MTD_DEBUG_LEVEL0 */
+				/*
+				 * Leave it for now, if it's matured we can
+				 * move this message to MTD_DEBUG_LEVEL0
+				 */
 				printk(KERN_DEBUG "nand_read_bbt: Bad block at 0x%012llx\n",
 				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out ? */
@@ -529,8 +531,10 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	}
 
 	if (chip == -1) {
-		/* Note that numblocks is 2 * (real numblocks) here, see i+=2
-		 * below as it makes shifting and masking less painful */
+		/*
+		 * Note that numblocks is 2 * (real numblocks) here, see i+=2
+		 * below as it makes shifting and masking less painful
+		 */
 		numblocks = mtd->size >> (this->bbt_erase_shift - 1);
 		startblock = 0;
 		from = 0;
@@ -732,7 +736,8 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	/* Loop through the chips */
 	for (; chip < nrchips; chip++) {
 
-		/* There was already a version of the table, reuse the page
+		/*
+		 * There was already a version of the table, reuse the page
 		 * This applies for absolute placement too, as we have the
 		 * page nr. in td->pages.
 		 */
@@ -1082,9 +1087,11 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 				update = 1;
 			block += 2;
 		}
-		/* If we want reserved blocks to be recorded to flash, and some
-		   new ones have been marked, then we need to update the stored
-		   bbts.  This should only happen once. */
+		/*
+		 * If we want reserved blocks to be recorded to flash, and some
+		 * new ones have been marked, then we need to update the stored
+		 * bbts.  This should only happen once.
+		 */
 		if (update && td->reserved_block_code)
 			nand_update_bbt(mtd, (loff_t)(block - 2) << (this->bbt_erase_shift - 1));
 	}
@@ -1168,7 +1175,8 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 		return -ENOMEM;
 	}
 
-	/* If no primary table decriptor is given, scan the device
+	/*
+	 * If no primary table decriptor is given, scan the device
 	 * to build a memory based bad block table
 	 */
 	if (!td) {
@@ -1272,8 +1280,10 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 	return res;
 }
 
-/* Define some generic bad / good block scan pattern which are used
- * while scanning a device for factory marked good / bad blocks. */
+/*
+ * Define some generic bad / good block scan pattern which are used
+ * while scanning a device for factory marked good / bad blocks.
+ */
 static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
 
 static uint8_t scan_agand_pattern[] = { 0x1C, 0x71, 0xC7, 0x1C, 0x71, 0xC7 };
@@ -1285,8 +1295,7 @@ static struct nand_bbt_descr agand_flashbased = {
 	.pattern = scan_agand_pattern
 };
 
-/* Generic flash bbt decriptors
-*/
+/* Generic flash bbt decriptors */
 static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
 static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
 
@@ -1375,7 +1384,8 @@ int nand_default_bbt(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
 
-	/* Default for AG-AND. We must use a flash based
+	/*
+	 * Default for AG-AND. We must use a flash based
 	 * bad block table as the devices have factory marked
 	 * _good_ blocks. Erasing those blocks leads to loss
 	 * of the good / bad information, so we _must_ store
-- 
1.7.0.4
