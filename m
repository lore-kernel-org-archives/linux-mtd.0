Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDlb-0004Ov-KU
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:07:36 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 02/11] mtd: nand: convert printk() to pr_*()
Date: Tue, 19 Jul 2011 10:06:07 -0700
Message-ID: <1311095176-5407-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
References: <1311095176-5407-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of directly calling printk, it's simpler to use the built-in
pr_* functions. This shortens code and allows easy customization through
the definition of a pr_fmt() macro (not used currently). Ideally, we
could implement much of this with dev_* functions, but the MTD subsystem
does not necessarily register all its master `mtd_info.dev` device, so
we cannot use dev_* consistently. See:
http://lists.infradead.org/pipermail/linux-mtd/2011-July/036950.html

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   44 +++++++++++++++++++++---------------------
 drivers/mtd/nand/nand_bbt.c  |   34 ++++++++++++++++----------------
 2 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 25c0ab7..c80f73a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2179,7 +2179,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 
 	/* Reject writes, which are not page aligned */
 	if (NOTALIGNED(to) || NOTALIGNED(ops->len)) {
-		printk(KERN_NOTICE "%s: Attempt to write not "
+		pr_notice("%s: Attempt to write not "
 				"page aligned data\n", __func__);
 		return -EINVAL;
 	}
@@ -2567,7 +2567,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		/* Heck if we have a bad block, we do not erase bad blocks! */
 		if (nand_block_checkbad(mtd, ((loff_t) page) <<
 					chip->page_shift, 0, allowbbt)) {
-			printk(KERN_WARNING "%s: attempt to erase a bad block "
+			pr_warn("%s: attempt to erase a bad block "
 					"at page 0x%08x\n", __func__, page);
 			instr->state = MTD_ERASE_FAILED;
 			goto erase_exit;
@@ -2741,7 +2741,7 @@ static void nand_resume(struct mtd_info *mtd)
 	if (chip->state == FL_PM_SUSPENDED)
 		nand_release_device(mtd);
 	else
-		printk(KERN_ERR "%s called for a chip which is not "
+		pr_err("%s called for a chip which is not "
 		       "in suspended state\n", __func__);
 }
 
@@ -2833,13 +2833,13 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->read_byte(mtd) != 'F' || chip->read_byte(mtd) != 'I')
 		return 0;
 
-	printk(KERN_INFO "ONFI flash detected\n");
+	pr_info("ONFI flash detected\n");
 	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
 	for (i = 0; i < 3; i++) {
 		chip->read_buf(mtd, (uint8_t *)p, sizeof(*p));
 		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 254) ==
 				le16_to_cpu(p->crc)) {
-			printk(KERN_INFO "ONFI param page %d valid\n", i);
+			pr_info("ONFI param page %d valid\n", i);
 			break;
 		}
 	}
@@ -2863,7 +2863,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->onfi_version = 0;
 
 	if (!chip->onfi_version) {
-		printk(KERN_INFO "%s: unsupported ONFI version: %d\n",
+		pr_info("%s: unsupported ONFI version: %d\n",
 								__func__, val);
 		return 0;
 	}
@@ -2929,7 +2929,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 		id_data[i] = chip->read_byte(mtd);
 
 	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
-		printk(KERN_INFO "%s: second ID read did not match "
+		pr_info("%s: second ID read did not match "
 		       "%02x,%02x against %02x,%02x\n", __func__,
 		       *maf_id, *dev_id, id_data[0], id_data[1]);
 		return ERR_PTR(-ENODEV);
@@ -3074,10 +3074,10 @@ ident_done:
 	 * chip correct!
 	 */
 	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
-		printk(KERN_INFO "NAND device: Manufacturer ID:"
+		pr_info("NAND device: Manufacturer ID:"
 		       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
 		       *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
-		printk(KERN_WARNING "NAND bus width %d instead %d bit\n",
+		pr_warn("NAND bus width %d instead %d bit\n",
 		       (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
 		       busw ? 16 : 8);
 		return ERR_PTR(-EINVAL);
@@ -3135,7 +3135,7 @@ ident_done:
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
-	printk(KERN_INFO "NAND device: Manufacturer ID:"
+	pr_info("NAND device: Manufacturer ID:"
 		" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
 		nand_manuf_ids[maf_idx].name,
 		chip->onfi_version ? chip->onfi_params.model : type->name);
@@ -3172,7 +3172,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 
 	if (IS_ERR(type)) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
-			printk(KERN_WARNING "No NAND device found.\n");
+			pr_warn("No NAND device found.\n");
 		chip->select_chip(mtd, -1);
 		return PTR_ERR(type);
 	}
@@ -3190,7 +3190,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 			break;
 	}
 	if (i > 1)
-		printk(KERN_INFO "%d NAND chips detected\n", i);
+		pr_info("%d NAND chips detected\n", i);
 
 	/* Store the number of chips and calc total size for mtd */
 	chip->numchips = i;
@@ -3240,7 +3240,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.layout = &nand_oob_128;
 			break;
 		default:
-			printk(KERN_WARNING "No oob scheme defined for "
+			pr_warn("No oob scheme defined for "
 			       "oobsize %d\n", mtd->oobsize);
 			BUG();
 		}
@@ -3259,7 +3259,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		/* Similar to NAND_ECC_HW, but a separate read_page handle */
 		if (!chip->ecc.calculate || !chip->ecc.correct ||
 		     !chip->ecc.hwctl) {
-			printk(KERN_WARNING "No ECC functions supplied; "
+			pr_warn("No ECC functions supplied; "
 			       "Hardware ECC not possible\n");
 			BUG();
 		}
@@ -3288,7 +3288,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		     chip->ecc.read_page == nand_read_page_hwecc ||
 		     !chip->ecc.write_page ||
 		     chip->ecc.write_page == nand_write_page_hwecc)) {
-			printk(KERN_WARNING "No ECC functions supplied; "
+			pr_warn("No ECC functions supplied; "
 			       "Hardware ECC not possible\n");
 			BUG();
 		}
@@ -3308,7 +3308,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 		if (mtd->writesize >= chip->ecc.size)
 			break;
-		printk(KERN_WARNING "%d byte HW ECC not possible on "
+		pr_warn("%d byte HW ECC not possible on "
 		       "%d byte page size, fallback to SW ECC\n",
 		       chip->ecc.size, mtd->writesize);
 		chip->ecc.mode = NAND_ECC_SOFT;
@@ -3330,7 +3330,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	case NAND_ECC_SOFT_BCH:
 		if (!mtd_nand_has_bch()) {
-			printk(KERN_WARNING "CONFIG_MTD_ECC_BCH not enabled\n");
+			pr_warn("CONFIG_MTD_ECC_BCH not enabled\n");
 			BUG();
 		}
 		chip->ecc.calculate = nand_bch_calculate_ecc;
@@ -3357,13 +3357,13 @@ int nand_scan_tail(struct mtd_info *mtd)
 					       chip->ecc.bytes,
 					       &chip->ecc.layout);
 		if (!chip->ecc.priv) {
-			printk(KERN_WARNING "BCH ECC initialization failed!\n");
+			pr_warn("BCH ECC initialization failed!\n");
 			BUG();
 		}
 		break;
 
 	case NAND_ECC_NONE:
-		printk(KERN_WARNING "NAND_ECC_NONE selected by board driver. "
+		pr_warn("NAND_ECC_NONE selected by board driver. "
 		       "This is not recommended !!\n");
 		chip->ecc.read_page = nand_read_page_raw;
 		chip->ecc.write_page = nand_write_page_raw;
@@ -3376,7 +3376,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		break;
 
 	default:
-		printk(KERN_WARNING "Invalid NAND_ECC_MODE %d\n",
+		pr_warn("Invalid NAND_ECC_MODE %d\n",
 		       chip->ecc.mode);
 		BUG();
 	}
@@ -3398,7 +3398,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	 */
 	chip->ecc.steps = mtd->writesize / chip->ecc.size;
 	if (chip->ecc.steps * chip->ecc.size != mtd->writesize) {
-		printk(KERN_WARNING "Invalid ECC parameters\n");
+		pr_warn("Invalid ECC parameters\n");
 		BUG();
 	}
 	chip->ecc.total = chip->ecc.steps * chip->ecc.bytes;
@@ -3489,7 +3489,7 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
 
 	/* Many callers got this wrong, so check for it for a while... */
 	if (!mtd->owner && caller_is_module()) {
-		printk(KERN_CRIT "%s called with NULL mtd->owner!\n",
+		pr_crit("%s called with NULL mtd->owner!\n",
 				__func__);
 		BUG();
 	}
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 0d2eaa7..76f496d 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -205,10 +205,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		res = mtd->read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
 			if (retlen != len) {
-				printk(KERN_INFO "nand_bbt: Error reading bad block table\n");
+				pr_info("nand_bbt: Error reading bad block table\n");
 				return res;
 			}
-			printk(KERN_WARNING "nand_bbt: ECC error while reading bad block table\n");
+			pr_warn("nand_bbt: ECC error while reading bad block table\n");
 		}
 
 		/* Analyse data */
@@ -219,7 +219,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					printk(KERN_INFO "nand_read_bbt: Reserved block at 0x%012llx\n",
+					pr_info("nand_read_bbt: Reserved block at 0x%012llx\n",
 					       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
 					mtd->ecc_stats.bbtblocks++;
@@ -229,7 +229,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				 * Leave it for now, if it's matured we can
 				 * move this message to pr_debug.
 				 */
-				printk(KERN_INFO "nand_read_bbt: Bad block at 0x%012llx\n",
+				pr_info("nand_read_bbt: Bad block at 0x%012llx\n",
 				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
@@ -389,7 +389,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
-		printk(KERN_INFO "Bad block table at page %d, version 0x%02X\n",
+		pr_info("Bad block table at page %d, version 0x%02X\n",
 		       td->pages[0], td->version[0]);
 	}
 
@@ -398,7 +398,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
-		printk(KERN_INFO "Bad block table at page %d, version 0x%02X\n",
+		pr_info("Bad block table at page %d, version 0x%02X\n",
 		       md->pages[0], md->version[0]);
 	}
 	return 1;
@@ -473,7 +473,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	loff_t from;
 	size_t readlen;
 
-	printk(KERN_INFO "Scanning device for bad blocks\n");
+	pr_info("Scanning device for bad blocks\n");
 
 	if (bd->options & NAND_BBT_SCANALLPAGES)
 		len = 1 << (this->bbt_erase_shift - this->page_shift);
@@ -502,7 +502,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		from = 0;
 	} else {
 		if (chip >= this->numchips) {
-			printk(KERN_WARNING "create_bbt(): chipnr (%d) > available chips (%d)\n",
+			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
 			       chip + 1, this->numchips);
 			return -EINVAL;
 		}
@@ -531,7 +531,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		if (ret) {
 			this->bbt[i >> 3] |= 0x03 << (i & 0x6);
-			printk(KERN_WARNING "Bad eraseblock %d at 0x%012llx\n",
+			pr_warn("Bad eraseblock %d at 0x%012llx\n",
 			       i >> 1, (unsigned long long)from);
 			mtd->ecc_stats.badblocks++;
 		}
@@ -614,9 +614,9 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 	/* Check, if we found a bbt for each requested chip */
 	for (i = 0; i < chips; i++) {
 		if (td->pages[i] == -1)
-			printk(KERN_WARNING "Bad block table not found for chip %d\n", i);
+			pr_warn("Bad block table not found for chip %d\n", i);
 		else
-			printk(KERN_INFO "Bad block table found at page %d, version 0x%02X\n", td->pages[i],
+			pr_info("Bad block table found at page %d, version 0x%02X\n", td->pages[i],
 			       td->version[i]);
 	}
 	return 0;
@@ -730,7 +730,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			if (!md || md->pages[chip] != page)
 				goto write;
 		}
-		printk(KERN_ERR "No space left to write bad block table\n");
+		pr_err("No space left to write bad block table\n");
 		return -ENOSPC;
 	write:
 
@@ -765,12 +765,12 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			res = mtd->read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
-					printk(KERN_INFO "nand_bbt: Error "
+					pr_info("nand_bbt: Error "
 					       "reading block for writing "
 					       "the bad block table\n");
 					return res;
 				}
-				printk(KERN_WARNING "nand_bbt: ECC error "
+				pr_warn("nand_bbt: ECC error "
 				       "while reading block for writing "
 				       "bad block table\n");
 			}
@@ -847,7 +847,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		if (res < 0)
 			goto outerr;
 
-		printk(KERN_INFO "Bad block table written to 0x%012llx, version "
+		pr_info("Bad block table written to 0x%012llx, version "
 		       "0x%02X\n", (unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
@@ -1137,7 +1137,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	 */
 	if (!td) {
 		if ((res = nand_memory_bbt(mtd, bd))) {
-			printk(KERN_ERR "nand_bbt: Can't scan flash and build the RAM-based BBT\n");
+			pr_err("nand_bbt: Can't scan flash and build the RAM-based BBT\n");
 			kfree(this->bbt);
 			this->bbt = NULL;
 		}
@@ -1305,7 +1305,7 @@ static int nand_create_default_bbt_descr(struct nand_chip *this)
 {
 	struct nand_bbt_descr *bd;
 	if (this->badblock_pattern) {
-		printk(KERN_WARNING "BBT descr already allocated; not replacing.\n");
+		pr_warn("BBT descr already allocated; not replacing.\n");
 		return -EINVAL;
 	}
 	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
-- 
1.7.0.4
