Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OswKY-0005p7-Py
	for linux-mtd@lists.infradead.org; Tue, 07 Sep 2010 11:27:16 +0000
Received: by wyb38 with SMTP id 38so6384361wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Sep 2010 04:27:14 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Tue, 7 Sep 2010 13:23:45 +0200
Subject: [PATCH 2/2] mtd: fix almost all checkpatch warnings in nand_base.c
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201009071323.45757.ffainelli@freebox.fr>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Only 3 warnings are left, one is off by one character, but splitting the line
would reduce the readability. One is for a for loop statement, which would also
not improve readability. The last one is a false positive on a test.

Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 50c0d5f..922b890 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -45,7 +45,7 @@
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
 #include <linux/leds.h>
-#include <asm/io.h>
+#include <linux/io.h>
 
 #ifdef CONFIG_MTD_PARTITIONS
 #include <linux/mtd/partitions.h>
@@ -786,7 +786,7 @@ nand_get_device(struct nand_chip *chip, struct mtd_info *mtd, int new_state)
 	spinlock_t *lock = &chip->controller->lock;
 	wait_queue_head_t *wq = &chip->controller->wq;
 	DECLARE_WAITQUEUE(wait, current);
- retry:
+retry:
 	spin_lock(lock);
 
 	/* Hardware controller shared among independent devices */
@@ -982,6 +982,7 @@ out:
 
 	return ret;
 }
+EXPORT_SYMBOL(nand_unlock);
 
 /**
  * nand_lock - [REPLACEABLE] locks all blocks present in the device
@@ -1051,6 +1052,7 @@ out:
 
 	return ret;
 }
+EXPORT_SYMBOL(nand_lock);
 
 /**
  * nand_read_page_raw - [Intern] read raw page data without ecc
@@ -1078,8 +1080,9 @@ static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
  *
  * We need a special oob layout and handling even when OOB isn't used.
  */
-static int nand_read_page_raw_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
-			      uint8_t *buf, int page)
+static int nand_read_page_raw_syndrome(struct mtd_info *mtd,
+					struct nand_chip *chip,
+					uint8_t *buf, int page)
 {
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -1160,7 +1163,8 @@ static int nand_read_page_swecc(struct mtd_info *mtd, struct nand_chip *chip,
  * @readlen:	data length
  * @bufpoi:	buffer to store read data
  */
-static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi)
+static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
+			uint32_t data_offs, uint32_t readlen, uint8_t *bufpoi)
 {
 	int start_step, end_step, num_steps;
 	uint32_t *eccpos = chip->ecc.layout->eccpos;
@@ -1168,6 +1172,7 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint3
 	int data_col_addr, i, gaps = 0;
 	int datafrag_len, eccfrag_len, aligned_len, aligned_pos;
 	int busw = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
+	int index = 0;
 
 	/* Column address wihin the page aligned to ECC size (256bytes). */
 	start_step = data_offs / chip->ecc.size;
@@ -1206,25 +1211,29 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint3
 	} else {
 		/* send the command to read the particular ecc bytes */
 		/* take care about buswidth alignment in read_buf */
-		aligned_pos = eccpos[start_step * chip->ecc.bytes] & ~(busw - 1);
+		index = start_step * chip->ecc.bytes;
+
+		aligned_pos = eccpos[index] & ~(busw - 1);
 		aligned_len = eccfrag_len;
-		if (eccpos[start_step * chip->ecc.bytes] & (busw - 1))
+		if (eccpos[index] & (busw - 1))
 			aligned_len++;
-		if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
+		if (eccpos[index + (num_steps * chip->ecc.bytes)] & (busw - 1))
 			aligned_len++;
 
-		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize + aligned_pos, -1);
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
+					mtd->writesize + aligned_pos, -1);
 		chip->read_buf(mtd, &chip->oob_poi[aligned_pos], aligned_len);
 	}
 
 	for (i = 0; i < eccfrag_len; i++)
-		chip->buffers->ecccode[i] = chip->oob_poi[eccpos[i + start_step * chip->ecc.bytes]];
+		chip->buffers->ecccode[i] = chip->oob_poi[eccpos[i + index]];
 
 	p = bufpoi + data_col_addr;
 	for (i = 0; i < eccfrag_len ; i += chip->ecc.bytes, p += chip->ecc.size) {
 		int stat;
 
-		stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
+		stat = chip->ecc.correct(mtd, p,
+			&chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
 		if (stat < 0)
 			mtd->ecc_stats.failed++;
 		else
@@ -1486,7 +1495,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				ret = chip->ecc.read_page_raw(mtd, chip,
 							      bufpoi, page);
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
-				ret = chip->ecc.read_subpage(mtd, chip, col, bytes, bufpoi);
+				ret = chip->ecc.read_subpage(mtd, chip,
+							col, bytes, bufpoi);
 			else
 				ret = chip->ecc.read_page(mtd, chip, bufpoi,
 							  page);
@@ -1878,7 +1888,7 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	else
 		ret = nand_do_read_ops(mtd, from, ops);
 
- out:
+out:
 	nand_release_device(mtd);
 	return ret;
 }
@@ -1907,8 +1917,9 @@ static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
  *
  * We need a special oob layout and handling even when ECC isn't checked.
  */
-static void nand_write_page_raw_syndrome(struct mtd_info *mtd, struct nand_chip *chip,
-				const uint8_t *buf)
+static void nand_write_page_raw_syndrome(struct mtd_info *mtd,
+					struct nand_chip *chip,
+					const uint8_t *buf)
 {
 	int eccsize = chip->ecc.size;
 	int eccbytes = chip->ecc.bytes;
@@ -2448,7 +2459,7 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 	else
 		ret = nand_do_write_ops(mtd, to, ops);
 
- out:
+out:
 	nand_release_device(mtd);
 	return ret;
 }
@@ -2634,7 +2645,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	}
 	instr->state = MTD_ERASE_DONE;
 
- erase_exit:
+erase_exit:
 
 	ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;
 
@@ -2892,7 +2903,8 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 						  struct nand_chip *chip,
-						  int busw, int *maf_id, int *dev_id,
+						  int busw,
+						  int *maf_id, int *dev_id,
 						  struct nand_flash_dev *type)
 {
 	int i, maf_idx;
@@ -3087,8 +3099,10 @@ ident_done:
 		ffs(mtd->erasesize) - 1;
 	if (chip->chipsize & 0xffffffff)
 		chip->chip_shift = ffs((unsigned)chip->chipsize) - 1;
-	else
-		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32)) + 32 - 1;
+	else {
+		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32));
+		chip->chip_shift += 32 - 1;
+	}
 
 	/* Set the bad block position */
 	if (mtd->writesize > 512 || (busw & NAND_BUSWIDTH_16))
@@ -3169,7 +3183,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip, busw);
 
 	/* Read the flash type */
-	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id, &nand_dev_id, table);
+	type = nand_get_flash_type(mtd, chip, busw,
+				&nand_maf_id, &nand_dev_id, table);
 
 	if (IS_ERR(type)) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
@@ -3199,6 +3214,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 
 	return 0;
 }
+EXPORT_SYMBOL(nand_scan_ident);
 
 
 /**
@@ -3427,10 +3443,11 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Build bad block table */
 	return chip->scan_bbt(mtd);
 }
+EXPORT_SYMBOL(nand_scan_tail);
 
 /* is_module_text_address() isn't exported, and it's mostly a pointless
-   test if this is a module _anyway_ -- they'd have to try _really_ hard
-   to call us from in-kernel code if the core NAND support is modular. */
+ * test if this is a module _anyway_ -- they'd have to try _really_ hard
+ * to call us from in-kernel code if the core NAND support is modular. */
 #ifdef MODULE
 #define caller_is_module() (1)
 #else
@@ -3466,6 +3483,7 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
 		ret = nand_scan_tail(mtd);
 	return ret;
 }
+EXPORT_SYMBOL(nand_scan);
 
 /**
  * nand_release - [NAND Interface] Free resources held by the NAND device
@@ -3492,12 +3510,6 @@ void nand_release(struct mtd_info *mtd)
 			& NAND_BBT_DYNAMICSTRUCT)
 		kfree(chip->badblock_pattern);
 }
-
-EXPORT_SYMBOL_GPL(nand_lock);
-EXPORT_SYMBOL_GPL(nand_unlock);
-EXPORT_SYMBOL_GPL(nand_scan);
-EXPORT_SYMBOL_GPL(nand_scan_ident);
-EXPORT_SYMBOL_GPL(nand_scan_tail);
 EXPORT_SYMBOL_GPL(nand_release);
 
 static int __init nand_base_init(void)
@@ -3515,5 +3527,6 @@ module_init(nand_base_init);
 module_exit(nand_base_exit);
 
 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>, Thomas Gleixner <tglx@linutronix.de>");
+MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
+MODULE_AUTHOR("Thomas Gleixner <tglx@linutronix.de>");
 MODULE_DESCRIPTION("Generic NAND flash driver code");
