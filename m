Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjDlg-0004Ov-Tc
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 17:07:39 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 03/11] mtd: nand: style fixups in pr_* messages
Date: Tue, 19 Jul 2011 10:06:08 -0700
Message-ID: <1311095176-5407-4-git-send-email-computersforpeace@gmail.com>
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

This is a cleanup of some punctuation, indentation, and capitalization
on the lines affected affected by the last patch.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   49 +++++++++++++++++++----------------------
 drivers/mtd/nand/nand_bbt.c  |   41 ++++++++++++++++------------------
 2 files changed, 42 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c80f73a..9430768 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2179,8 +2179,8 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 
 	/* Reject writes, which are not page aligned */
 	if (NOTALIGNED(to) || NOTALIGNED(ops->len)) {
-		pr_notice("%s: Attempt to write not "
-				"page aligned data\n", __func__);
+		pr_notice("%s: attempt to write non page aligned data\n",
+			   __func__);
 		return -EINVAL;
 	}
 
@@ -2567,8 +2567,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		/* Heck if we have a bad block, we do not erase bad blocks! */
 		if (nand_block_checkbad(mtd, ((loff_t) page) <<
 					chip->page_shift, 0, allowbbt)) {
-			pr_warn("%s: attempt to erase a bad block "
-					"at page 0x%08x\n", __func__, page);
+			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
+				    __func__, page);
 			instr->state = MTD_ERASE_FAILED;
 			goto erase_exit;
 		}
@@ -2741,8 +2741,8 @@ static void nand_resume(struct mtd_info *mtd)
 	if (chip->state == FL_PM_SUSPENDED)
 		nand_release_device(mtd);
 	else
-		pr_err("%s called for a chip which is not "
-		       "in suspended state\n", __func__);
+		pr_err("%s called for a chip which is not in suspended state\n",
+			__func__);
 }
 
 /* Set default functions */
@@ -2863,8 +2863,7 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->onfi_version = 0;
 
 	if (!chip->onfi_version) {
-		pr_info("%s: unsupported ONFI version: %d\n",
-								__func__, val);
+		pr_info("%s: unsupported ONFI version: %d\n", __func__, val);
 		return 0;
 	}
 
@@ -2930,8 +2929,8 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 
 	if (id_data[0] != *maf_id || id_data[1] != *dev_id) {
 		pr_info("%s: second ID read did not match "
-		       "%02x,%02x against %02x,%02x\n", __func__,
-		       *maf_id, *dev_id, id_data[0], id_data[1]);
+			"%02x,%02x against %02x,%02x\n", __func__,
+			*maf_id, *dev_id, id_data[0], id_data[1]);
 		return ERR_PTR(-ENODEV);
 	}
 
@@ -3075,11 +3074,11 @@ ident_done:
 	 */
 	if (busw != (chip->options & NAND_BUSWIDTH_16)) {
 		pr_info("NAND device: Manufacturer ID:"
-		       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
-		       *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
+			" 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
+			*dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
 		pr_warn("NAND bus width %d instead %d bit\n",
-		       (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
-		       busw ? 16 : 8);
+			   (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
+			   busw ? 16 : 8);
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -3172,7 +3171,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 
 	if (IS_ERR(type)) {
 		if (!(chip->options & NAND_SCAN_SILENT_NODEV))
-			pr_warn("No NAND device found.\n");
+			pr_warn("No NAND device found\n");
 		chip->select_chip(mtd, -1);
 		return PTR_ERR(type);
 	}
@@ -3240,8 +3239,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 			chip->ecc.layout = &nand_oob_128;
 			break;
 		default:
-			pr_warn("No oob scheme defined for "
-			       "oobsize %d\n", mtd->oobsize);
+			pr_warn("No oob scheme defined for oobsize %d\n",
+				   mtd->oobsize);
 			BUG();
 		}
 	}
@@ -3260,7 +3259,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		if (!chip->ecc.calculate || !chip->ecc.correct ||
 		     !chip->ecc.hwctl) {
 			pr_warn("No ECC functions supplied; "
-			       "Hardware ECC not possible\n");
+				   "hardware ECC not possible\n");
 			BUG();
 		}
 		if (!chip->ecc.read_page)
@@ -3289,7 +3288,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		     !chip->ecc.write_page ||
 		     chip->ecc.write_page == nand_write_page_hwecc)) {
 			pr_warn("No ECC functions supplied; "
-			       "Hardware ECC not possible\n");
+				   "hardware ECC not possible\n");
 			BUG();
 		}
 		/* Use standard syndrome read/write page function? */
@@ -3309,8 +3308,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 		if (mtd->writesize >= chip->ecc.size)
 			break;
 		pr_warn("%d byte HW ECC not possible on "
-		       "%d byte page size, fallback to SW ECC\n",
-		       chip->ecc.size, mtd->writesize);
+			   "%d byte page size, fallback to SW ECC\n",
+			   chip->ecc.size, mtd->writesize);
 		chip->ecc.mode = NAND_ECC_SOFT;
 
 	case NAND_ECC_SOFT:
@@ -3364,7 +3363,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 
 	case NAND_ECC_NONE:
 		pr_warn("NAND_ECC_NONE selected by board driver. "
-		       "This is not recommended !!\n");
+			   "This is not recommended!\n");
 		chip->ecc.read_page = nand_read_page_raw;
 		chip->ecc.write_page = nand_write_page_raw;
 		chip->ecc.read_oob = nand_read_oob_std;
@@ -3376,8 +3375,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		break;
 
 	default:
-		pr_warn("Invalid NAND_ECC_MODE %d\n",
-		       chip->ecc.mode);
+		pr_warn("Invalid NAND_ECC_MODE %d\n", chip->ecc.mode);
 		BUG();
 	}
 
@@ -3489,8 +3487,7 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
 
 	/* Many callers got this wrong, so check for it for a while... */
 	if (!mtd->owner && caller_is_module()) {
-		pr_crit("%s called with NULL mtd->owner!\n",
-				__func__);
+		pr_crit("%s called with NULL mtd->owner!\n", __func__);
 		BUG();
 	}
 
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 76f496d..dba3323 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -205,7 +205,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		res = mtd->read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
 			if (retlen != len) {
-				pr_info("nand_bbt: Error reading bad block table\n");
+				pr_info("nand_bbt: error reading bad block table\n");
 				return res;
 			}
 			pr_warn("nand_bbt: ECC error while reading bad block table\n");
@@ -219,8 +219,8 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				if (tmp == msk)
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
-					pr_info("nand_read_bbt: Reserved block at 0x%012llx\n",
-					       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
+						 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 					this->bbt[offs + (act >> 3)] |= 0x2 << (act & 0x06);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
@@ -229,8 +229,8 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				 * Leave it for now, if it's matured we can
 				 * move this message to pr_debug.
 				 */
-				pr_info("nand_read_bbt: Bad block at 0x%012llx\n",
-				       (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
+				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
+					 (loff_t)((offs << 2) + (act >> 1)) << this->bbt_erase_shift);
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
 					this->bbt[offs + (act >> 3)] |= 0x3 << (act & 0x06);
@@ -390,7 +390,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 			      mtd->writesize, td);
 		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
-		       td->pages[0], td->version[0]);
+			 td->pages[0], td->version[0]);
 	}
 
 	/* Read the mirror version, if available */
@@ -399,7 +399,7 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 			      mtd->writesize, td);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
-		       md->pages[0], md->version[0]);
+			 md->pages[0], md->version[0]);
 	}
 	return 1;
 }
@@ -532,7 +532,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		if (ret) {
 			this->bbt[i >> 3] |= 0x03 << (i & 0x6);
 			pr_warn("Bad eraseblock %d at 0x%012llx\n",
-			       i >> 1, (unsigned long long)from);
+				i >> 1, (unsigned long long)from);
 			mtd->ecc_stats.badblocks++;
 		}
 
@@ -616,8 +616,8 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		if (td->pages[i] == -1)
 			pr_warn("Bad block table not found for chip %d\n", i);
 		else
-			pr_info("Bad block table found at page %d, version 0x%02X\n", td->pages[i],
-			       td->version[i]);
+			pr_info("Bad block table found at page %d, version "
+				 "0x%02X\n", td->pages[i], td->version[i]);
 	}
 	return 0;
 }
@@ -765,14 +765,12 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			res = mtd->read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
-					pr_info("nand_bbt: Error "
-					       "reading block for writing "
-					       "the bad block table\n");
+					pr_info("nand_bbt: error reading block "
+						"for writing the bad block table\n");
 					return res;
 				}
-				pr_warn("nand_bbt: ECC error "
-				       "while reading block for writing "
-				       "bad block table\n");
+				pr_warn("nand_bbt: ECC error while reading "
+					"block for writing bad block table\n");
 			}
 			/* Read oob data */
 			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
@@ -847,8 +845,8 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		if (res < 0)
 			goto outerr;
 
-		pr_info("Bad block table written to 0x%012llx, version "
-		       "0x%02X\n", (unsigned long long)to, td->version[chip]);
+		pr_info("Bad block table written to 0x%012llx, version 0x%02X\n",
+			 (unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
 		td->pages[chip] = page;
@@ -856,8 +854,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	return 0;
 
  outerr:
-	printk(KERN_WARNING
-	       "nand_bbt: Error while writing bad block table %d\n", res);
+	pr_warn("nand_bbt: error while writing bad block table %d\n", res);
 	return res;
 }
 
@@ -1137,7 +1134,7 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	 */
 	if (!td) {
 		if ((res = nand_memory_bbt(mtd, bd))) {
-			pr_err("nand_bbt: Can't scan flash and build the RAM-based BBT\n");
+			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
 			kfree(this->bbt);
 			this->bbt = NULL;
 		}
@@ -1305,7 +1302,7 @@ static int nand_create_default_bbt_descr(struct nand_chip *this)
 {
 	struct nand_bbt_descr *bd;
 	if (this->badblock_pattern) {
-		pr_warn("BBT descr already allocated; not replacing.\n");
+		pr_warn("BBT descr already allocated; not replacing\n");
 		return -EINVAL;
 	}
 	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
-- 
1.7.0.4
