Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Or8Rp-0006I6-0t
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2010 11:59:18 +0000
Received: by wyb38 with SMTP id 38so111196wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Sep 2010 04:59:13 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Thu, 2 Sep 2010 13:56:00 +0200
Subject: [PATCH 2/2 l2-mtd-2.6/dunno] NAND: fix almost all checkpatch warnings
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201009021356.00275.ffainelli@freebox.fr>
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

This patch fixes almost all warnings but two, which would not improve
readability or is a false positive.

Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
---
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9d66557..2870a60 100644
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
@@ -1206,25 +1210,30 @@ static int nand_read_subpage(struct mtd_info *mtd, struct nand_chip *chip, uint3
 	} else {
 		/* send the command to read the particular ecc bytes */
 		/* take care about buswidth alignment in read_buf */
-		aligned_pos = eccpos[start_step * chip->ecc.bytes] & ~(busw - 1);
+		aligned_pos = eccpos[start_step * chip->ecc.bytes] &
+								~(busw - 1);
 		aligned_len = eccfrag_len;
 		if (eccpos[start_step * chip->ecc.bytes] & (busw - 1))
 			aligned_len++;
-		if (eccpos[(start_step + num_steps) * chip->ecc.bytes] & (busw - 1))
+		if (eccpos[(start_step + num_steps) * chip->ecc.bytes] &
+								(busw - 1))
 			aligned_len++;
 
-		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, mtd->writesize + aligned_pos, -1);
+		chip->cmdfunc(mtd, NAND_CMD_RNDOUT,
+					mtd->writesize + aligned_pos, -1);
 		chip->read_buf(mtd, &chip->oob_poi[aligned_pos], aligned_len);
 	}
 
 	for (i = 0; i < eccfrag_len; i++)
-		chip->buffers->ecccode[i] = chip->oob_poi[eccpos[i + start_step * chip->ecc.bytes]];
+		chip->buffers->ecccode[i] = chip->oob_poi[eccpos[i +
+						start_step * chip->ecc.bytes]];
 
 	p = bufpoi + data_col_addr;
 	for (i = 0; i < eccfrag_len ; i += chip->ecc.bytes, p += chip->ecc.size) {
 		int stat;
 
-		stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i], &chip->buffers->ecccalc[i]);
+		stat = chip->ecc.correct(mtd, p, &chip->buffers->ecccode[i],
+					&chip->buffers->ecccalc[i]);
 		if (stat == -1)
 			mtd->ecc_stats.failed++;
 		else
@@ -1486,7 +1495,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				ret = chip->ecc.read_page_raw(mtd, chip,
 							      bufpoi, page);
 			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
-				ret = chip->ecc.read_subpage(mtd, chip, col, bytes, bufpoi);
+				ret = chip->ecc.read_subpage(mtd, chip, col,
+								bytes, bufpoi);
 			else
 				ret = chip->ecc.read_page(mtd, chip, bufpoi,
 							  page);
@@ -1497,7 +1507,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 			if (!aligned) {
 				if (!NAND_SUBPAGE_READ(chip) && !oob)
 					chip->pagebuf = realpage;
-				memcpy(buf, chip->buffers->databuf + col, bytes);
+				memcpy(buf, chip->buffers->databuf + col,
+									bytes);
 			}
 
 			buf += bytes;
@@ -1878,7 +1889,7 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	else
 		ret = nand_do_read_ops(mtd, from, ops);
 
- out:
+out:
 	nand_release_device(mtd);
 	return ret;
 }
@@ -1907,8 +1918,9 @@ static void nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
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
@@ -2448,7 +2460,7 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 	else
 		ret = nand_do_write_ops(mtd, to, ops);
 
- out:
+out:
 	nand_release_device(mtd);
 	return ret;
 }
@@ -2634,7 +2646,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	}
 	instr->state = MTD_ERASE_DONE;
 
- erase_exit:
+erase_exit:
 
 	ret = instr->state == MTD_ERASE_DONE ? 0 : -EIO;
 
@@ -2892,7 +2904,8 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 						  struct nand_chip *chip,
-						  int busw, int *maf_id, int *dev_id,
+						  int busw,
+						  int *maf_id, int *dev_id,
 						  struct nand_flash_dev *type)
 {
 	int i, maf_idx;
@@ -3075,7 +3088,8 @@ ident_done:
 	if (chip->chipsize & 0xffffffff)
 		chip->chip_shift = ffs((unsigned)chip->chipsize) - 1;
 	else
-		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32)) + 32 - 1;
+		chip->chip_shift = ffs((unsigned)(chip->chipsize >> 32))
+								+ 32 - 1;
 
 	/* Set the bad block position */
 	if (mtd->writesize > 512 || (busw & NAND_BUSWIDTH_16))
@@ -3155,7 +3169,8 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	nand_set_defaults(chip, busw);
 
 	/* Read the flash type */
-	type = nand_get_flash_type(mtd, chip, busw, &nand_maf_id, &nand_dev_id, table);
+	type = nand_get_flash_type(mtd, chip, busw,
+					&nand_maf_id, &nand_dev_id, table);
 
 	if (IS_ERR(type)) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
@@ -3185,6 +3200,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 
 	return 0;
 }
+EXPORT_SYMBOL(nand_scan_ident);
 
 
 /**
@@ -3413,10 +3429,11 @@ int nand_scan_tail(struct mtd_info *mtd)
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
@@ -3452,6 +3469,7 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
 		ret = nand_scan_tail(mtd);
 	return ret;
 }
+EXPORT_SYMBOL(nand_scan);
 
 /**
  * nand_release - [NAND Interface] Free resources held by the NAND device
@@ -3478,12 +3496,6 @@ void nand_release(struct mtd_info *mtd)
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
@@ -3501,5 +3513,6 @@ module_init(nand_base_init);
 module_exit(nand_base_exit);
 
 MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>, Thomas Gleixner <tglx@linutronix.de>");
+MODULE_AUTHOR("Steven J. Hill <sjhill@realitydiluted.com>");
+MODULE_AUTHOR("Thomas Gleixner <tglx@linutronix.de>");
 MODULE_DESCRIPTION("Generic NAND flash driver code");
