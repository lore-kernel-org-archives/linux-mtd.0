Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QCRg6-0004aP-Iy
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 07:18:23 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [RFC] mtd: nand: separate chip options / bbt_options
Date: Wed, 20 Apr 2011 00:13:09 -0700
Message-ID: <1303283589-14415-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1301903526.2760.38.camel@localhost>
References: <1301903526.2760.38.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This RFC begins to handle the conflicts we've been having with using
conflicting flags from nand.h and bbm.h in the same nand_chip.options
field. We should try to separate these two spaces a little more
clearly, and so I have added a bbt_options field to nand_chip.

Important notes about nand_chip fields:
* bbt_options field should contain ONLY flags from bbm.h. They should
  be able to pass safely to a nand_bbt_descr data structure.
* options field should contian ONLY flags from nand.h. Ideally, they
  should not be involved in any BBT related options.

Other things to consider (not yet implemented):
* Is it safe to move NAND_CREATE_EMPTY_BBT to bbm.h and require it to be
  put in bbt_options? It seems not to be used by any in-kernel drivers
  so it's only likely to mess with independent drivers...

* Consider the following three flags:
  (1) NAND_USE_FLASH_BBT (nand.h)
  (2) NAND_USE_FLASH_BBT_NO_OOB (nand.h)
  (3) NAND_BBT_NO_OOB (bbm.h)

  These flags are all related, yet they are in different headers. Also,
  flag (2) is simply the combination of (1) and (3) and seemingly can be
  eliminated. Is it safe to move (1) and (3) to bbm.h and remove (2)
  altogether? (with appropriate code adjustments of course)

* The main problem I see with moving more flags to bbm.h is the implicit
  requirement for drivers to put these options in the bbt_options field,
  not the options field, in order to have nand_base handle them
  properly.

Regarding Artem's suggestion of bit-fields:
If we turn all the flags into bit-fields in nand_chip, we still need to
add these fields to the bbt_descr, right? That seems like too much
duplication of information and would just be messier.

Please send comments! I plan to implement some more of the changes
listed above if there are no real objections or modifications.

Sincerely,
Brian
---
 drivers/mtd/nand/nand_base.c |   15 ++++++++-------
 drivers/mtd/nand/nand_bbt.c  |    6 ++----
 include/linux/mtd/nand.h     |    4 ++++
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c54a4cb..9fc7f60 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -347,7 +347,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 	struct nand_chip *chip = mtd->priv;
 	u16 bad;
 
-	if (chip->options & NAND_BBT_SCANLASTPAGE)
+	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
 	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
@@ -399,7 +399,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	uint8_t buf[2] = { 0, 0 };
 	int block, ret, i = 0;
 
-	if (chip->options & NAND_BBT_SCANLASTPAGE)
+	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
 	/* Get block number */
@@ -426,14 +426,15 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 
 			ret = nand_do_write_oob(mtd, ofs, &chip->ops);
 
-			if (!ret && (chip->options & NAND_BBT_SCANBYTE1AND6)) {
+			if (!ret && (chip->bbt_options &
+						NAND_BBT_SCANBYTE1AND6)) {
 				chip->ops.ooboffs = NAND_SMALL_BADBLOCK_POS
 					& ~0x01;
 				ret = nand_do_write_oob(mtd, ofs, &chip->ops);
 			}
 			i++;
 			ofs += mtd->writesize;
-		} while (!ret && (chip->options & NAND_BBT_SCAN2NDPAGE) &&
+		} while (!ret && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE) &&
 				i < 2);
 
 		nand_release_device(mtd);
@@ -3128,7 +3129,7 @@ ident_done:
 	if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 			(*maf_id == NAND_MFR_SAMSUNG ||
 			 *maf_id == NAND_MFR_HYNIX))
-		chip->options |= NAND_BBT_SCANLASTPAGE;
+		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
 	else if ((!(chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
 				(*maf_id == NAND_MFR_SAMSUNG ||
 				 *maf_id == NAND_MFR_HYNIX ||
@@ -3136,7 +3137,7 @@ ident_done:
 				 *maf_id == NAND_MFR_AMD)) ||
 			(mtd->writesize == 2048 &&
 			 *maf_id == NAND_MFR_MICRON))
-		chip->options |= NAND_BBT_SCAN2NDPAGE;
+		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
 	/*
 	 * Numonyx/ST 2K pages, x8 bus use BOTH byte 1 and 6
@@ -3144,7 +3145,7 @@ ident_done:
 	if (!(busw & NAND_BUSWIDTH_16) &&
 			*maf_id == NAND_MFR_STMICRO &&
 			mtd->writesize == 2048) {
-		chip->options |= NAND_BBT_SCANBYTE1AND6;
+		chip->bbt_options |= NAND_BBT_SCANBYTE1AND6;
 		chip->badblockpos = 0;
 	}
 
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index ccbeaa1..136ae8d 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -546,7 +546,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		from = (loff_t)startblock << (this->bbt_erase_shift - 1);
 	}
 
-	if (this->options & NAND_BBT_SCANLASTPAGE)
+	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
 		from += mtd->erasesize - (mtd->writesize * len);
 
 	for (i = startblock; i < numblocks;) {
@@ -1330,8 +1330,6 @@ static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
 	.pattern = mirror_pattern
 };
 
-#define BBT_SCAN_OPTIONS (NAND_BBT_SCANLASTPAGE | NAND_BBT_SCAN2NDPAGE | \
-		NAND_BBT_SCANBYTE1AND6)
 /**
  * nand_create_default_bbt_descr - [Internal] Creates a BBT descriptor structure
  * @this:	NAND chip to create descriptor for
@@ -1354,7 +1352,7 @@ static int nand_create_default_bbt_descr(struct nand_chip *this)
 		printk(KERN_ERR "nand_create_default_bbt_descr: Out of memory\n");
 		return -ENOMEM;
 	}
-	bd->options = this->options & BBT_SCAN_OPTIONS;
+	bd->options = this->bbt_options;
 	bd->offs = this->badblockpos;
 	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
 	bd->pattern = scan_ff_pattern;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index c2b9ac4..42f70e2 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -449,6 +449,9 @@ struct nand_buffers {
  * @options:		[BOARDSPECIFIC] various chip options. They can partly
  *			be set to inform nand_scan about special functionality.
  *			See the defines for further explanation.
+ * @bbt_options:	[INTERN] bad block specific options. All options used
+ *			here must come from bbm.h. By default, these options
+ *			will be copied to the appropriate nand_bbt_descr's.
  * @badblockpos:	[INTERN] position of the bad block marker in the oob
  *			area.
  * @badblockbits:	[INTERN] number of bits to left-shift the bad block
@@ -509,6 +512,7 @@ struct nand_chip {
 
 	int chip_delay;
 	unsigned int options;
+	unsigned int bbt_options;
 
 	int page_shift;
 	int phys_erase_shift;
-- 
1.7.0.4
