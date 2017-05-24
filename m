Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQHj-00009g-Fu
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:01:15 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 06/15] mtd: nand: raw: make BBT code more generic
Date: Wed, 24 May 2017 15:07:02 +0800
Message-ID: <1495609631-18880-7-git-send-email-peterpandong@micron.com>
In-Reply-To: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

BBT support is currently tightly tied to raw NAND, though this is the kind
of code we could share across all NAND based devices, no matter what
physical interface is to communicate with the NAND chip.

Make BBT code interface agnostic by replacing all occurrence of
struct nand_chip by struct nand_device, and move functions that are
specific to raw NANDs to drivers/mtd/nand/rawnand/nand_base.c.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/raw/docg4.c     |   7 +-
 drivers/mtd/nand/raw/nand_base.c |  92 +++++-
 drivers/mtd/nand/raw/nand_bbt.c  | 683 +++++++++++++++++++--------------------
 include/linux/mtd/nand.h         |  23 ++
 include/linux/mtd/rawnand.h      |   6 -
 5 files changed, 443 insertions(+), 368 deletions(-)

diff --git a/drivers/mtd/nand/raw/docg4.c b/drivers/mtd/nand/raw/docg4.c
index c4a4089..013cb99 100644
--- a/drivers/mtd/nand/raw/docg4.c
+++ b/drivers/mtd/nand/raw/docg4.c
@@ -1059,7 +1059,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 	 * operation after device power-up.  The above read ensures it never is.
 	 * Ugly, I know.
 	 */
-	if (nand->bbt == NULL)  /* no memory-based bbt */
+	if (!nand_bbt_is_initialized(mtd_to_nand(mtd)))
 		goto exit;
 
 	if (mtd->ecc_stats.failed > eccfailed_stats) {
@@ -1086,8 +1086,9 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 		unsigned long bits = ~buf[i];
 		for_each_set_bit(bitnum, &bits, 8) {
 			int badblock = block + 7 - bitnum;
-			nand->bbt[badblock / 4] |=
-				0x03 << ((badblock % 4) * 2);
+
+			nand_bbt_update_entry(mtd_to_nand(mtd), badblock,
+					      NAND_BBT_BLOCK_FACTORY_BAD);
 			mtd->ecc_stats.badblocks++;
 			dev_notice(doc->dev, "factory-marked bad block: %d\n",
 				   badblock);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 8f8df15..8581c89 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -512,6 +512,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd_to_nandchip(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
 	int res, ret = 0;
 
 	if (!(chip->bbt_options & NAND_BBT_NO_OOB_BBM)) {
@@ -531,8 +532,8 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 	}
 
 	/* Mark block bad in BBT */
-	if (chip->bbt) {
-		res = nand_markbad_bbt(mtd, ofs);
+	if (nand_bbt_is_initialized(nand)) {
+		res = nand_markbad_bbt(nand, ofs);
 		if (!ret)
 			ret = res;
 	}
@@ -572,12 +573,12 @@ static int nand_check_wp(struct mtd_info *mtd)
  */
 static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
-	struct nand_chip *chip = mtd_to_nandchip(mtd);
+	struct nand_device *nand = mtd_to_nand(mtd);
 
-	if (!chip->bbt)
+	if (!nand_bbt_is_initialized(nand))
 		return 0;
 	/* Return info from the table */
-	return nand_isreserved_bbt(mtd, ofs);
+	return nand_isreserved_bbt(nand, ofs);
 }
 
 /**
@@ -591,13 +592,14 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
  */
 static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int allowbbt)
 {
+	struct nand_device *nand = mtd_to_nand(mtd);
 	struct nand_chip *chip = mtd_to_nandchip(mtd);
 
-	if (!chip->bbt)
+	if (!nand_bbt_is_initialized(nand))
 		return chip->block_bad(mtd, ofs);
 
 	/* Return info from the table */
-	return nand_isbad_bbt(mtd, ofs, allowbbt);
+	return nand_isbad_bbt(nand, ofs, allowbbt);
 }
 
 /**
@@ -3457,6 +3459,75 @@ static void nand_shutdown(struct mtd_info *mtd)
 	nand_get_device(mtd, FL_PM_SUSPENDED);
 }
 
+/*
+ * Define some generic bad / good block scan pattern which are used
+ * while scanning a device for factory marked good / bad blocks.
+ */
+static u8 scan_ff_pattern[] = { 0xff, 0xff };
+
+#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
+
+/**
+ * nand_create_badblock_pattern - [INTERN] Creates a BBT descriptor structure
+ * @this: NAND chip to create descriptor for
+ *
+ * This function allocates and initializes a nand_bbt_descr for BBM detection
+ * based on the properties of @this. The new descriptor is stored in
+ * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
+ * passed to this function.
+ */
+static int nand_create_badblock_pattern(struct nand_chip *chip)
+{
+	struct nand_device *this = &chip->base.base;
+	struct nand_bbt_descr *bd;
+
+	if (this->bbt.bbp) {
+		pr_warn("Bad block pattern already allocated; not replacing\n");
+		return -EINVAL;
+	}
+
+	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
+	if (!bd)
+		return -ENOMEM;
+
+	bd->options = this->bbt.options & BADBLOCK_SCAN_MASK;
+	bd->offs = chip->badblockpos;
+	bd->len = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
+	bd->pattern = scan_ff_pattern;
+	bd->options |= NAND_BBT_DYNAMICSTRUCT;
+	this->bbt.bbp = bd;
+
+	return 0;
+}
+
+/**
+ * nand_default_bbt - Select a default bad block table for the device
+ * @mtd: MTD device structure
+ *
+ * This function selects the default bad block table support for the device and
+ * calls the nand_scan_bbt function.
+ */
+static int nand_default_bbt(struct mtd_info *mtd)
+{
+	struct nand_device *this = mtd_to_nand(mtd);
+	struct nand_chip *chip = mtd_to_nandchip(mtd);
+	int ret;
+
+	/* Initialize BBT config from nand_chip info */
+	this->bbt.options = chip->bbt_options;
+	this->bbt.td = chip->bbt_td;
+	this->bbt.md = chip->bbt_md;
+	this->bbt.bbp = chip->badblock_pattern;
+
+	if (!this->bbt.bbp) {
+		ret = nand_create_badblock_pattern(chip);
+		if (ret)
+			return ret;
+	}
+
+	return nand_scan_bbt(this);
+}
+
 /* Set default functions */
 static void nand_set_defaults(struct nand_chip *chip)
 {
@@ -4950,14 +5021,17 @@ int nand_scan(struct mtd_info *mtd, int maxchips)
  */
 void nand_cleanup(struct nand_chip *chip)
 {
+	struct nand_device *nand = &chip->base.base;
+
 	if (chip->ecc.mode == NAND_ECC_SOFT &&
 	    chip->ecc.algo == NAND_ECC_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
 
 	nand_release_data_interface(chip);
 
-	/* Free bad block table memory */
-	kfree(chip->bbt);
+	if (nand_bbt_is_initialized(nand))
+		nand_release_bbt(nand);
+
 	if (!(chip->options & NAND_OWN_BUFFERS) && chip->buffers) {
 		kfree(chip->buffers->databuf);
 		kfree(chip->buffers->ecccode);
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 396b248..26f5c3f 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -61,35 +61,28 @@
 #include <linux/types.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/bbm.h>
-#include <linux/mtd/rawnand.h>
+#include <linux/mtd/nand.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/vmalloc.h>
 #include <linux/export.h>
 #include <linux/string.h>
 
-#define BBT_BLOCK_GOOD		0x00
-#define BBT_BLOCK_WORN		0x01
-#define BBT_BLOCK_RESERVED	0x02
-#define BBT_BLOCK_FACTORY_BAD	0x03
-
 #define BBT_ENTRY_MASK		0x03
 #define BBT_ENTRY_SHIFT		2
 
-static int nand_update_bbt(struct mtd_info *mtd, loff_t offs);
-
-static inline uint8_t bbt_get_entry(struct nand_chip *chip, int block)
+static inline u8 bbt_get_entry(struct nand_device *chip, int block)
 {
-	uint8_t entry = chip->bbt[block >> BBT_ENTRY_SHIFT];
+	u8 entry = chip->bbt.bbt[block >> BBT_ENTRY_SHIFT];
 	entry >>= (block & BBT_ENTRY_MASK) * 2;
 	return entry & BBT_ENTRY_MASK;
 }
 
-static inline void bbt_mark_entry(struct nand_chip *chip, int block,
-		uint8_t mark)
+static inline void bbt_mark_entry(struct nand_device *chip, int block,
+				  u8 mark)
 {
 	uint8_t msk = (mark & BBT_ENTRY_MASK) << ((block & BBT_ENTRY_MASK) * 2);
-	chip->bbt[block >> BBT_ENTRY_SHIFT] |= msk;
+	chip->bbt.bbt[block >> BBT_ENTRY_SHIFT] |= msk;
 }
 
 static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
@@ -100,6 +93,23 @@ static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
 }
 
 /**
+ * nand_bbt_update_entry - Update an entry in the in-memory bad block table
+ * @this: NAND device
+ * @eraseblock: eraseblock entry to update
+ * @status: new status for this eraseblock
+ *
+ * Update the eraseblock status in the in-memory BBT.
+ * This function should not be used unless your controller wants to manually
+ * initialize the BBT.
+ */
+void nand_bbt_update_entry(struct nand_device *this, int eraseblock,
+			   enum nand_bbt_block_status status)
+{
+	bbt_mark_entry(this, eraseblock, status);
+}
+EXPORT_SYMBOL_GPL(nand_bbt_update_entry);
+
+/**
  * check_pattern - [GENERIC] check if a pattern is in the buffer
  * @buf: the buffer to search
  * @len: the length of buffer to search
@@ -159,7 +169,7 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
 
 /**
  * read_bbt - [GENERIC] Read the bad block table starting from page
- * @mtd: MTD device structure
+ * @this: NAND device
  * @buf: temporary buffer
  * @page: the starting page
  * @num: the number of bbt descriptors to read
@@ -168,11 +178,11 @@ static u32 add_marker_len(struct nand_bbt_descr *td)
  *
  * Read the bad block table starting from page.
  */
-static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
-		struct nand_bbt_descr *td, int offs)
+static int read_bbt(struct nand_device *this, uint8_t *buf, int page, int num,
+		    struct nand_bbt_descr *td, int offs)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int res, ret = 0, i, j, act = 0;
-	struct nand_chip *this = mtd_to_nandchip(mtd);
 	size_t retlen, len, totlen;
 	loff_t from;
 	int bits = td->options & NAND_BBT_NRBITS_MSK;
@@ -182,10 +192,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 
 	totlen = (num * bits) >> 3;
 	marker_len = add_marker_len(td);
-	from = ((loff_t)page) << this->page_shift;
+	from = nand_page_to_offs(this, page);
 
 	while (totlen) {
-		len = min(totlen, (size_t)(1 << this->bbt_erase_shift));
+		len = min(totlen, nand_eraseblock_size(this));
 		if (marker_len) {
 			/*
 			 * In case the BBT marker is not in the OOB area it
@@ -199,11 +209,11 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		if (res < 0) {
 			if (mtd_is_eccerr(res)) {
 				pr_info("nand_bbt: ECC error in BBT at 0x%012llx\n",
-					from & ~mtd->writesize);
+					from & ~nand_page_size(this));
 				return res;
 			} else if (mtd_is_bitflip(res)) {
 				pr_info("nand_bbt: corrected error in BBT at 0x%012llx\n",
-					from & ~mtd->writesize);
+					from & ~nand_page_size(this));
 				ret = res;
 			} else {
 				pr_info("nand_bbt: error reading BBT\n");
@@ -220,10 +230,10 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 					continue;
 				if (reserved_block_code && (tmp == reserved_block_code)) {
 					pr_info("nand_read_bbt: reserved block at 0x%012llx\n",
-						 (loff_t)(offs + act) <<
-						 this->bbt_erase_shift);
+						nand_eraseblock_to_offs(this,
+								offs + act));
 					bbt_mark_entry(this, offs + act,
-							BBT_BLOCK_RESERVED);
+						NAND_BBT_BLOCK_RESERVED);
 					mtd->ecc_stats.bbtblocks++;
 					continue;
 				}
@@ -232,15 +242,15 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 				 * move this message to pr_debug.
 				 */
 				pr_info("nand_read_bbt: bad block at 0x%012llx\n",
-					 (loff_t)(offs + act) <<
-					 this->bbt_erase_shift);
+					nand_eraseblock_to_offs(this,
+								offs + act));
 				/* Factory marked bad or worn out? */
 				if (tmp == 0)
 					bbt_mark_entry(this, offs + act,
-							BBT_BLOCK_FACTORY_BAD);
+						NAND_BBT_BLOCK_FACTORY_BAD);
 				else
 					bbt_mark_entry(this, offs + act,
-							BBT_BLOCK_WORN);
+						       NAND_BBT_BLOCK_WORN);
 				mtd->ecc_stats.badblocks++;
 			}
 		}
@@ -252,7 +262,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 
 /**
  * read_abs_bbt - [GENERIC] Read the bad block table starting at a given page
- * @mtd: MTD device structure
+ * @this: NAND device
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @chip: read the table for a specific chip, -1 read all chips; applies only if
@@ -261,25 +271,27 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
  * Read the bad block table for all chips starting at a given page. We assume
  * that the bbt bits are in consecutive order.
  */
-static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td, int chip)
+static int read_abs_bbt(struct nand_device *this, uint8_t *buf,
+			struct nand_bbt_descr *td, int chip)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
+	int ndies = nand_ndies(this);
 	int res = 0, i;
 
 	if (td->options & NAND_BBT_PERCHIP) {
-		int offs = 0;
-		for (i = 0; i < this->numchips; i++) {
+		int offs = 0, nbbd = nand_eraseblocks_per_die(this);
+
+		for (i = 0; i < ndies; i++) {
 			if (chip == -1 || chip == i)
-				res = read_bbt(mtd, buf, td->pages[i],
-					this->chipsize >> this->bbt_erase_shift,
-					td, offs);
+				res = read_bbt(this, buf, td->pages[i], nbbd,
+					       td, offs);
 			if (res)
 				return res;
-			offs += this->chipsize >> this->bbt_erase_shift;
+
+			offs += nbbd;
 		}
 	} else {
-		res = read_bbt(mtd, buf, td->pages[0],
-				mtd->size >> this->bbt_erase_shift, td, 0);
+		res = read_bbt(this, buf, td->pages[0],
+			       nand_neraseblocks(this), td, 0);
 		if (res)
 			return res;
 	}
@@ -287,9 +299,10 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 }
 
 /* BBT marker is in the first page, no OOB */
-static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
-			 struct nand_bbt_descr *td)
+static int scan_read_data(struct nand_device *this, uint8_t *buf, loff_t offs,
+			  struct nand_bbt_descr *td)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	size_t retlen;
 	size_t len;
 
@@ -302,7 +315,7 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 
 /**
  * scan_read_oob - [GENERIC] Scan data+OOB region to buffer
- * @mtd: MTD device structure
+ * @this: NAND device
  * @buf: temporary buffer
  * @offs: offset at which to scan
  * @len: length of data region to read
@@ -311,19 +324,20 @@ static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
  * page,OOB,page,OOB,... in buf. Completes transfer and returns the "strongest"
  * ECC condition (error or bitflip). May quit on the first (non-ECC) error.
  */
-static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+static int scan_read_oob(struct nand_device *this, uint8_t *buf, loff_t offs,
 			 size_t len)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	struct mtd_oob_ops ops;
 	int res, ret = 0;
 
 	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = 0;
-	ops.ooblen = mtd->oobsize;
+	ops.ooblen = nand_per_page_oobsize(this);
 
 	while (len > 0) {
 		ops.datbuf = buf;
-		ops.len = min(len, (size_t)mtd->writesize);
+		ops.len = min(len, nand_page_size(this));
 		ops.oobbuf = buf + ops.len;
 
 		res = mtd_read_oob(mtd, offs, &ops);
@@ -334,31 +348,32 @@ static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 				ret = res;
 		}
 
-		buf += mtd->oobsize + mtd->writesize;
-		len -= mtd->writesize;
-		offs += mtd->writesize;
+		buf += nand_per_page_oobsize(this) + nand_page_size(this);
+		len -= nand_page_size(this);
+		offs += nand_page_size(this);
 	}
 	return ret;
 }
 
-static int scan_read(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
-			 size_t len, struct nand_bbt_descr *td)
+static int scan_read(struct nand_device *this, uint8_t *buf, loff_t offs,
+		     size_t len, struct nand_bbt_descr *td)
 {
 	if (td->options & NAND_BBT_NO_OOB)
-		return scan_read_data(mtd, buf, offs, td);
+		return scan_read_data(this, buf, offs, td);
 	else
-		return scan_read_oob(mtd, buf, offs, len);
+		return scan_read_oob(this, buf, offs, len);
 }
 
 /* Scan write data with oob to flash */
-static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
+static int scan_write_bbt(struct nand_device *this, loff_t offs, size_t len,
 			  uint8_t *buf, uint8_t *oob)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	struct mtd_oob_ops ops;
 
 	ops.mode = MTD_OPS_PLACE_OOB;
 	ops.ooboffs = 0;
-	ops.ooblen = mtd->oobsize;
+	ops.ooblen = nand_per_page_oobsize(this);
 	ops.datbuf = buf;
 	ops.oobbuf = oob;
 	ops.len = len;
@@ -366,18 +381,19 @@ static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
 	return mtd_write_oob(mtd, offs, &ops);
 }
 
-static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
+static u32 bbt_get_ver_offs(struct nand_device *this,
+			    struct nand_bbt_descr *td)
 {
 	u32 ver_offs = td->veroffs;
 
 	if (!(td->options & NAND_BBT_NO_OOB))
-		ver_offs += mtd->writesize;
+		ver_offs += nand_page_size(this);
 	return ver_offs;
 }
 
 /**
  * read_abs_bbts - [GENERIC] Read the bad block table(s) for all chips starting at a given page
- * @mtd: MTD device structure
+ * @this: NAND device
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @md:	descriptor for the bad block table mirror
@@ -385,38 +401,37 @@ static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
  * Read the bad block table(s) for all chips starting at a given page. We
  * assume that the bbt bits are in consecutive order.
  */
-static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
+static void read_abs_bbts(struct nand_device *this, uint8_t *buf,
 			  struct nand_bbt_descr *td, struct nand_bbt_descr *md)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
-
 	/* Read the primary version, if available */
 	if (td->options & NAND_BBT_VERSION) {
-		scan_read(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
-			      mtd->writesize, td);
-		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
+		scan_read(this, buf, nand_page_to_offs(this, td->pages[0]),
+			  nand_page_size(this), td);
+		td->version[0] = buf[bbt_get_ver_offs(this, td)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
 			 td->pages[0], td->version[0]);
 	}
 
 	/* Read the mirror version, if available */
 	if (md && (md->options & NAND_BBT_VERSION)) {
-		scan_read(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
-			      mtd->writesize, md);
-		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
+		scan_read(this, buf, nand_page_to_offs(this, td->pages[0]),
+			  nand_page_size(this), md);
+		md->version[0] = buf[bbt_get_ver_offs(this, md)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
 			 md->pages[0], md->version[0]);
 	}
 }
 
 /* Scan a given block partially */
-static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
+static int scan_block_fast(struct nand_device *this, struct nand_bbt_descr *bd,
 			   loff_t offs, uint8_t *buf, int numpages)
 {
+	struct mtd_info *mtd = nand_to_mtd(this);
 	struct mtd_oob_ops ops;
 	int j, ret;
 
-	ops.ooblen = mtd->oobsize;
+	ops.ooblen = nand_per_page_oobsize(this);
 	ops.oobbuf = buf;
 	ops.ooboffs = 0;
 	ops.datbuf = NULL;
@@ -435,14 +450,14 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 		if (check_short_pattern(buf, bd))
 			return 1;
 
-		offs += mtd->writesize;
+		offs += nand_page_size(this);
 	}
 	return 0;
 }
 
 /**
  * create_bbt - [GENERIC] Create a bad block table by scanning the device
- * @mtd: MTD device structure
+ * @this: NAND device
  * @buf: temporary buffer
  * @bd: descriptor for the good/bad block search pattern
  * @chip: create the table for a specific chip, -1 read all chips; applies only
@@ -451,10 +466,10 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
  * Create a bad block table by scanning the device for the given good/bad block
  * identify pattern.
  */
-static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
-	struct nand_bbt_descr *bd, int chip)
+static int create_bbt(struct nand_device *this, uint8_t *buf,
+		      struct nand_bbt_descr *bd, int chip)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	int i, numblocks, numpages;
 	int startblock;
 	loff_t from;
@@ -467,48 +482,49 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		numpages = 1;
 
 	if (chip == -1) {
-		numblocks = mtd->size >> this->bbt_erase_shift;
+		numblocks = nand_neraseblocks(this);
 		startblock = 0;
 		from = 0;
 	} else {
-		if (chip >= this->numchips) {
+		if (chip >= nand_ndies(this)) {
 			pr_warn("create_bbt(): chipnr (%d) > available chips (%d)\n",
-			       chip + 1, this->numchips);
+			       chip + 1, nand_ndies(this));
 			return -EINVAL;
 		}
-		numblocks = this->chipsize >> this->bbt_erase_shift;
+		numblocks = nand_eraseblocks_per_die(this);
 		startblock = chip * numblocks;
 		numblocks += startblock;
-		from = (loff_t)startblock << this->bbt_erase_shift;
+		from = nand_eraseblock_to_offs(this, startblock);
 	}
 
-	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
-		from += mtd->erasesize - (mtd->writesize * numpages);
+	if (this->bbt.options & NAND_BBT_SCANLASTPAGE)
+		from += nand_eraseblock_size(this) -
+			(nand_page_size(this) * numpages);
 
 	for (i = startblock; i < numblocks; i++) {
 		int ret;
 
 		BUG_ON(bd->options & NAND_BBT_NO_OOB);
 
-		ret = scan_block_fast(mtd, bd, from, buf, numpages);
+		ret = scan_block_fast(this, bd, from, buf, numpages);
 		if (ret < 0)
 			return ret;
 
 		if (ret) {
-			bbt_mark_entry(this, i, BBT_BLOCK_FACTORY_BAD);
+			bbt_mark_entry(this, i, NAND_BBT_BLOCK_FACTORY_BAD);
 			pr_warn("Bad eraseblock %d at 0x%012llx\n",
 				i, (unsigned long long)from);
 			mtd->ecc_stats.badblocks++;
 		}
 
-		from += (1 << this->bbt_erase_shift);
+		from += nand_eraseblock_size(this);
 	}
 	return 0;
 }
 
 /**
  * search_bbt - [GENERIC] scan the device for a specific bad block table
- * @mtd: MTD device structure
+ * @this: NAND device
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  *
@@ -521,18 +537,17 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
  *
  * The bbt ident pattern resides in the oob area of the first page in a block.
  */
-static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *td)
+static int search_bbt(struct nand_device *this, uint8_t *buf,
+		      struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
 	int i, chips;
 	int startblock, block, dir;
-	int scanlen = mtd->writesize + mtd->oobsize;
+	int scanlen = nand_page_size(this) + nand_per_page_oobsize(this);
 	int bbtblocks;
-	int blocktopage = this->bbt_erase_shift - this->page_shift;
 
 	/* Search direction top -> down? */
 	if (td->options & NAND_BBT_LASTBLOCK) {
-		startblock = (mtd->size >> this->bbt_erase_shift) - 1;
+		startblock = nand_neraseblocks(this) - 1;
 		dir = -1;
 	} else {
 		startblock = 0;
@@ -541,12 +556,12 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chips = this->numchips;
-		bbtblocks = this->chipsize >> this->bbt_erase_shift;
+		chips = nand_ndies(this);
+		bbtblocks = nand_eraseblocks_per_die(this);
 		startblock &= bbtblocks - 1;
 	} else {
 		chips = 1;
-		bbtblocks = mtd->size >> this->bbt_erase_shift;
+		bbtblocks = nand_neraseblocks(this);
 	}
 
 	for (i = 0; i < chips; i++) {
@@ -557,20 +572,22 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		for (block = 0; block < td->maxblocks; block++) {
 
 			int actblock = startblock + dir * block;
-			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
+			loff_t offs = nand_eraseblock_to_offs(this, actblock);
 
 			/* Read first page */
-			scan_read(mtd, buf, offs, mtd->writesize, td);
-			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
-				td->pages[i] = actblock << blocktopage;
+			scan_read(this, buf, offs, nand_page_size(this), td);
+			if (!check_pattern(buf, scanlen,
+					   nand_page_size(this), td)) {
+				td->pages[i] = nand_eraseblock_to_page(this,
+								  actblock);
 				if (td->options & NAND_BBT_VERSION) {
-					offs = bbt_get_ver_offs(mtd, td);
+					offs = bbt_get_ver_offs(this, td);
 					td->version[i] = buf[offs];
 				}
 				break;
 			}
 		}
-		startblock += this->chipsize >> this->bbt_erase_shift;
+		startblock += nand_eraseblocks_per_die(this);
 	}
 	/* Check, if we found a bbt for each requested chip */
 	for (i = 0; i < chips; i++) {
@@ -585,23 +602,23 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 
 /**
  * search_read_bbts - [GENERIC] scan the device for bad block table(s)
- * @mtd: MTD device structure
+ * @this: NAND device
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @md: descriptor for the bad block table mirror
  *
  * Search and read the bad block table(s).
  */
-static void search_read_bbts(struct mtd_info *mtd, uint8_t *buf,
+static void search_read_bbts(struct nand_device *this, uint8_t *buf,
 			     struct nand_bbt_descr *td,
 			     struct nand_bbt_descr *md)
 {
 	/* Search the primary table */
-	search_bbt(mtd, buf, td);
+	search_bbt(this, buf, td);
 
 	/* Search the mirror table */
 	if (md)
-		search_bbt(mtd, buf, md);
+		search_bbt(this, buf, md);
 }
 
 /**
@@ -617,7 +634,7 @@ static void search_read_bbts(struct mtd_info *mtd, uint8_t *buf,
  * pointing to a valid block we re-use it, otherwise we search for the next
  * valid one.
  */
-static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
+static int get_bbt_block(struct nand_device *this, struct nand_bbt_descr *td,
 			 struct nand_bbt_descr *md, int chip)
 {
 	int startblock, dir, page, numblocks, i;
@@ -628,12 +645,11 @@ static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
 	 * td->pages.
 	 */
 	if (td->pages[chip] != -1)
-		return td->pages[chip] >>
-				(this->bbt_erase_shift - this->page_shift);
+		return nand_page_to_eraseblock(this, td->pages[chip]);
 
-	numblocks = (int)(this->chipsize >> this->bbt_erase_shift);
+	numblocks = nand_eraseblocks_per_die(this);
 	if (!(td->options & NAND_BBT_PERCHIP))
-		numblocks *= this->numchips;
+		numblocks *= nand_ndies(this);
 
 	/*
 	 * Automatic placement of the bad block table. Search direction
@@ -652,12 +668,12 @@ static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
 
 		/* Check, if the block is bad */
 		switch (bbt_get_entry(this, block)) {
-		case BBT_BLOCK_WORN:
-		case BBT_BLOCK_FACTORY_BAD:
+		case NAND_BBT_BLOCK_WORN:
+		case NAND_BBT_BLOCK_FACTORY_BAD:
 			continue;
 		}
 
-		page = block << (this->bbt_erase_shift - this->page_shift);
+		page = nand_eraseblock_to_page(this, block);
 
 		/* Check, if the block is used by the mirror table */
 		if (!md || md->pages[chip] != page)
@@ -679,18 +695,15 @@ static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
  * block as bad using a bad block marker and invalidating the associated
  * td->pages[] entry.
  */
-static void mark_bbt_block_bad(struct nand_chip *this,
+static void mark_bbt_block_bad(struct nand_device *this,
 			       struct nand_bbt_descr *td,
 			       int chip, int block)
 {
-	struct mtd_info *mtd = nandchip_to_mtd(this);
-	loff_t to;
 	int res;
 
-	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
+	bbt_mark_entry(this, block, NAND_BBT_BLOCK_WORN);
 
-	to = (loff_t)block << this->bbt_erase_shift;
-	res = this->block_markbad(mtd, to);
+	res = nand_markbad(this, block);
 	if (res)
 		pr_warn("nand_bbt: error %d while marking block %d bad\n",
 			res, block);
@@ -700,7 +713,7 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 
 /**
  * write_bbt - [GENERIC] (Re)write the bad block table
- * @mtd: MTD device structure
+ * @this: NAND device
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
  * @md: descriptor for the bad block table mirror
@@ -708,11 +721,11 @@ static void mark_bbt_block_bad(struct nand_chip *this,
  *
  * (Re)write the bad block table.
  */
-static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
+static int write_bbt(struct nand_device *this, uint8_t *buf,
 		     struct nand_bbt_descr *td, struct nand_bbt_descr *md,
 		     int chipsel)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
+	struct mtd_info *mtd = nand_to_mtd(this);
 	struct erase_info einfo;
 	int i, res, chip = 0;
 	int bits, page, offs, numblocks, sft, sftmsk;
@@ -723,7 +736,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	loff_t to;
 	struct mtd_oob_ops ops;
 
-	ops.ooblen = mtd->oobsize;
+	ops.ooblen = nand_per_page_oobsize(this);
 	ops.ooboffs = 0;
 	ops.datbuf = NULL;
 	ops.mode = MTD_OPS_PLACE_OOB;
@@ -732,16 +745,16 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		rcode = 0xff;
 	/* Write bad block table per chip rather than per device? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		numblocks = (int)(this->chipsize >> this->bbt_erase_shift);
+		numblocks = nand_eraseblocks_per_die(this);
 		/* Full device write or specific chip? */
 		if (chipsel == -1) {
-			nrchips = this->numchips;
+			nrchips = nand_ndies(this);
 		} else {
 			nrchips = chipsel + 1;
 			chip = chipsel;
 		}
 	} else {
-		numblocks = (int)(mtd->size >> this->bbt_erase_shift);
+		numblocks = nand_neraseblocks(this);
 		nrchips = 1;
 	}
 
@@ -760,7 +773,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		 * get_bbt_block() returns a block number, shift the value to
 		 * get a page number.
 		 */
-		page = block << (this->bbt_erase_shift - this->page_shift);
+		page = nand_eraseblock_to_page(this, block);
 
 		/* Set up shift count and masks for the flash table */
 		bits = td->options & NAND_BBT_NRBITS_MSK;
@@ -781,13 +794,14 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		default: return -EINVAL;
 		}
 
-		to = ((loff_t)page) << this->page_shift;
+		to = nand_page_to_offs(this, page);
 
 		/* Must we save the block contents? */
 		if (td->options & NAND_BBT_SAVECONTENT) {
 			/* Make it block aligned */
-			to &= ~(((loff_t)1 << this->bbt_erase_shift) - 1);
-			len = 1 << this->bbt_erase_shift;
+			to = nand_eraseblock_to_offs(this,
+					nand_page_to_eraseblock(this, page));
+			len = nand_eraseblock_size(this);
 			res = mtd_read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
@@ -797,18 +811,21 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 				pr_warn("nand_bbt: ECC error while reading block for writing bad block table\n");
 			}
 			/* Read oob data */
-			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
+			ops.ooblen = nand_len_to_pages(this, len) *
+				     nand_per_page_oobsize(this);
 			ops.oobbuf = &buf[len];
-			res = mtd_read_oob(mtd, to + mtd->writesize, &ops);
+			res = mtd_read_oob(mtd, to + nand_page_size(this),
+					   &ops);
 			if (res < 0 || ops.oobretlen != ops.ooblen)
 				goto outerr;
 
 			/* Calc the byte offset in the buffer */
-			pageoffs = page - (int)(to >> this->page_shift);
-			offs = pageoffs << this->page_shift;
+			pageoffs = page - nand_offs_to_page(this, to);
+			offs = nand_page_to_offs(this, pageoffs);
 			/* Preset the bbt area with 0xff */
 			memset(&buf[offs], 0xff, (size_t)(numblocks >> sft));
-			ooboffs = len + (pageoffs * mtd->oobsize);
+			ooboffs = len +
+				  (pageoffs * nand_per_page_oobsize(this));
 
 		} else if (td->options & NAND_BBT_NO_OOB) {
 			ooboffs = 0;
@@ -820,7 +837,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			len = (size_t)(numblocks >> sft);
 			len += offs;
 			/* Make it page aligned! */
-			len = ALIGN(len, mtd->writesize);
+			len = ALIGN(len, nand_page_size(this));
 			/* Preset the buffer with 0xff */
 			memset(buf, 0xff, len);
 			/* Pattern is located at the begin of first page */
@@ -829,10 +846,11 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			/* Calc length */
 			len = (size_t)(numblocks >> sft);
 			/* Make it page aligned! */
-			len = ALIGN(len, mtd->writesize);
+			len = ALIGN(len, nand_page_size(this));
 			/* Preset the buffer with 0xff */
 			memset(buf, 0xff, len +
-			       (len >> this->page_shift)* mtd->oobsize);
+					  (nand_len_to_pages(this, len) *
+					   nand_per_page_oobsize(this)));
 			offs = 0;
 			ooboffs = len;
 			/* Pattern is located in oob area of first page */
@@ -854,8 +872,8 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		memset(&einfo, 0, sizeof(einfo));
 		einfo.mtd = mtd;
 		einfo.addr = to;
-		einfo.len = 1 << this->bbt_erase_shift;
-		res = nand_erase_nand(mtd, &einfo, 1);
+		einfo.len = nand_eraseblock_size(this);
+		res = nand_erase(this, &einfo, 1);
 		if (res < 0) {
 			pr_warn("nand_bbt: error while erasing BBT block %d\n",
 				res);
@@ -863,9 +881,9 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			continue;
 		}
 
-		res = scan_write_bbt(mtd, to, len, buf,
-				td->options & NAND_BBT_NO_OOB ? NULL :
-				&buf[len]);
+		res = scan_write_bbt(this, to, len, buf,
+				     td->options & NAND_BBT_NO_OOB ? NULL :
+				     &buf[len]);
 		if (res < 0) {
 			pr_warn("nand_bbt: error while writing BBT block %d\n",
 				res);
@@ -888,22 +906,31 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 /**
  * nand_memory_bbt - [GENERIC] create a memory based bad block table
- * @mtd: MTD device structure
+ * @this: NAND device
  * @bd: descriptor for the good/bad block search pattern
  *
  * The function creates a memory based bbt by scanning the device for
  * manufacturer / software marked good / bad blocks.
  */
-static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static inline int nand_memory_bbt(struct nand_device *this,
+				  struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
+	void *buffer;
+	int ret;
+
+	buffer = kmalloc(nand_page_size(this), GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
 
-	return create_bbt(mtd, this->buffers->databuf, bd, -1);
+	ret = create_bbt(this, buffer, bd, -1);
+	kfree(buffer);
+
+	return ret;
 }
 
 /**
  * check_create - [GENERIC] create and write bbt(s) if necessary
- * @mtd: MTD device structure
+ * @this: NAND device
  * @buf: temporary buffer
  * @bd: descriptor for the good/bad block search pattern
  *
@@ -912,17 +939,17 @@ static inline int nand_memory_bbt(struct mtd_info *mtd, struct nand_bbt_descr *b
  * for the chip/device. Update is necessary if one of the tables is missing or
  * the version nr. of one table is less than the other.
  */
-static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr *bd)
+static int check_create(struct nand_device *this, uint8_t *buf,
+			struct nand_bbt_descr *bd)
 {
 	int i, chips, writeops, create, chipsel, res, res2;
-	struct nand_chip *this = mtd_to_nandchip(mtd);
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
+	struct nand_bbt_descr *td = this->bbt.td;
+	struct nand_bbt_descr *md = this->bbt.md;
 	struct nand_bbt_descr *rd, *rd2;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP)
-		chips = this->numchips;
+		chips = nand_ndies(this);
 	else
 		chips = 1;
 
@@ -971,8 +998,8 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 				continue;
 
 			/* Create the table in memory by scanning the chip(s) */
-			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
-				create_bbt(mtd, buf, bd, chipsel);
+			if (!(this->bbt.options & NAND_BBT_CREATE_EMPTY))
+				create_bbt(this, buf, bd, chipsel);
 
 			td->version[i] = 1;
 			if (md)
@@ -981,7 +1008,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 
 		/* Read back first? */
 		if (rd) {
-			res = read_abs_bbt(mtd, buf, rd, chipsel);
+			res = read_abs_bbt(this, buf, rd, chipsel);
 			if (mtd_is_eccerr(res)) {
 				/* Mark table as invalid */
 				rd->pages[i] = -1;
@@ -992,7 +1019,7 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 		}
 		/* If they weren't versioned, read both */
 		if (rd2) {
-			res2 = read_abs_bbt(mtd, buf, rd2, chipsel);
+			res2 = read_abs_bbt(this, buf, rd2, chipsel);
 			if (mtd_is_eccerr(res2)) {
 				/* Mark table as invalid */
 				rd2->pages[i] = -1;
@@ -1014,14 +1041,14 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 
 		/* Write the bad block table to the device? */
 		if ((writeops & 0x01) && (td->options & NAND_BBT_WRITE)) {
-			res = write_bbt(mtd, buf, td, md, chipsel);
+			res = write_bbt(this, buf, td, md, chipsel);
 			if (res < 0)
 				return res;
 		}
 
 		/* Write the mirror bad block table to the device? */
 		if ((writeops & 0x02) && md && (md->options & NAND_BBT_WRITE)) {
-			res = write_bbt(mtd, buf, md, td, chipsel);
+			res = write_bbt(this, buf, md, td, chipsel);
 			if (res < 0)
 				return res;
 		}
@@ -1031,25 +1058,26 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 
 /**
  * mark_bbt_regions - [GENERIC] mark the bad block table regions
- * @mtd: MTD device structure
+ * @this: NAND device
  * @td: bad block table descriptor
  *
  * The bad block table regions are marked as "bad" to prevent accidental
  * erasures / writes. The regions are identified by the mark 0x02.
  */
-static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
+static void mark_bbt_region(struct nand_device *this,
+			    struct nand_bbt_descr *td)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
 	int i, j, chips, block, nrblocks, update;
 	uint8_t oldval;
+	loff_t offs;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chips = this->numchips;
-		nrblocks = (int)(this->chipsize >> this->bbt_erase_shift);
+		chips = nand_ndies(this);
+		nrblocks = nand_eraseblocks_per_die(this);
 	} else {
 		chips = 1;
-		nrblocks = (int)(mtd->size >> this->bbt_erase_shift);
+		nrblocks = nand_neraseblocks(this);
 	}
 
 	for (i = 0; i < chips; i++) {
@@ -1057,13 +1085,14 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		    !(td->options & NAND_BBT_WRITE)) {
 			if (td->pages[i] == -1)
 				continue;
-			block = td->pages[i] >> (this->bbt_erase_shift - this->page_shift);
+			block = nand_page_to_eraseblock(this, td->pages[i]);
 			oldval = bbt_get_entry(this, block);
-			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
-			if ((oldval != BBT_BLOCK_RESERVED) &&
-					td->reserved_block_code)
-				nand_update_bbt(mtd, (loff_t)block <<
-						this->bbt_erase_shift);
+			bbt_mark_entry(this, block, NAND_BBT_BLOCK_RESERVED);
+			if ((oldval != NAND_BBT_BLOCK_RESERVED) &&
+			    td->reserved_block_code) {
+				offs = nand_eraseblock_to_offs(this, block);
+				nand_update_bbt(this, offs);
+			}
 			continue;
 		}
 		update = 0;
@@ -1073,8 +1102,8 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 			block = i * nrblocks;
 		for (j = 0; j < td->maxblocks; j++) {
 			oldval = bbt_get_entry(this, block);
-			bbt_mark_entry(this, block, BBT_BLOCK_RESERVED);
-			if (oldval != BBT_BLOCK_RESERVED)
+			bbt_mark_entry(this, block, NAND_BBT_BLOCK_RESERVED);
+			if (oldval != NAND_BBT_BLOCK_RESERVED)
 				update = 1;
 			block++;
 		}
@@ -1083,23 +1112,24 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 		 * new ones have been marked, then we need to update the stored
 		 * bbts.  This should only happen once.
 		 */
-		if (update && td->reserved_block_code)
-			nand_update_bbt(mtd, (loff_t)(block - 1) <<
-					this->bbt_erase_shift);
+		if (update && td->reserved_block_code) {
+			offs = nand_eraseblock_to_offs(this, block - 1);
+			nand_update_bbt(this, offs);
+		}
 	}
 }
 
 /**
  * verify_bbt_descr - verify the bad block description
- * @mtd: MTD device structure
+ * @this: NAND device
  * @bd: the table to verify
  *
  * This functions performs a few sanity checks on the bad block description
  * table.
  */
-static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+static void verify_bbt_descr(struct nand_device *this,
+			     struct nand_bbt_descr *bd)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
 	u32 pattern_len;
 	u32 bits;
 	u32 table_size;
@@ -1110,16 +1140,16 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	pattern_len = bd->len;
 	bits = bd->options & NAND_BBT_NRBITS_MSK;
 
-	BUG_ON((this->bbt_options & NAND_BBT_NO_OOB) &&
-			!(this->bbt_options & NAND_BBT_USE_FLASH));
+	BUG_ON((this->bbt.options & NAND_BBT_NO_OOB) &&
+	       !(this->bbt.options & NAND_BBT_USE_FLASH));
 	BUG_ON(!bits);
 
 	if (bd->options & NAND_BBT_VERSION)
 		pattern_len++;
 
 	if (bd->options & NAND_BBT_NO_OOB) {
-		BUG_ON(!(this->bbt_options & NAND_BBT_USE_FLASH));
-		BUG_ON(!(this->bbt_options & NAND_BBT_NO_OOB));
+		BUG_ON(!(this->bbt.options & NAND_BBT_USE_FLASH));
+		BUG_ON(!(this->bbt.options & NAND_BBT_NO_OOB));
 		BUG_ON(bd->offs);
 		if (bd->options & NAND_BBT_VERSION)
 			BUG_ON(bd->veroffs != bd->len);
@@ -1127,19 +1157,63 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	}
 
 	if (bd->options & NAND_BBT_PERCHIP)
-		table_size = this->chipsize >> this->bbt_erase_shift;
+		table_size = nand_eraseblocks_per_die(this);
 	else
-		table_size = mtd->size >> this->bbt_erase_shift;
+		table_size = nand_neraseblocks(this);
 	table_size >>= 3;
 	table_size *= bits;
 	if (bd->options & NAND_BBT_NO_OOB)
 		table_size += pattern_len;
-	BUG_ON(table_size > (1 << this->bbt_erase_shift));
+	BUG_ON(table_size > nand_eraseblock_size(this));
 }
 
+/* Generic flash bbt descriptors */
+static u8 bbt_pattern[] = {'B', 'b', 't', '0' };
+static u8 mirror_pattern[] = {'1', 't', 'b', 'B' };
+
+static struct nand_bbt_descr bbt_main_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	.offs =	8,
+	.len = 4,
+	.veroffs = 12,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = bbt_pattern
+};
+
+static struct nand_bbt_descr bbt_mirror_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
+	.offs =	8,
+	.len = 4,
+	.veroffs = 12,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = mirror_pattern
+};
+
+static struct nand_bbt_descr bbt_main_no_oob_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
+		| NAND_BBT_NO_OOB,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = bbt_pattern
+};
+
+static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
+		| NAND_BBT_NO_OOB,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
+	.pattern = mirror_pattern
+};
+
 /**
  * nand_scan_bbt - [NAND Interface] scan, find, read and maybe create bad block table(s)
- * @mtd: MTD device structure
+ * @this: NAND device
  * @bd: descriptor for the good/bad block search pattern
  *
  * The function checks, if a bad block table(s) is/are already available. If
@@ -1149,21 +1223,40 @@ static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
  * The bad block table memory is allocated here. It must be freed by calling
  * the nand_free_bbt function.
  */
-static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+int nand_scan_bbt(struct nand_device *this)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
 	int len, res;
 	uint8_t *buf;
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
+	struct nand_bbt_descr *td, *md, *bd;
+
+	/* Is a flash based bad block table requested? */
+	if (this->bbt.options & NAND_BBT_USE_FLASH) {
+		/* Use the default pattern descriptors */
+		if (!this->bbt.td) {
+			if (this->bbt.options & NAND_BBT_NO_OOB) {
+				this->bbt.td = &bbt_main_no_oob_descr;
+				this->bbt.md = &bbt_mirror_no_oob_descr;
+			} else {
+				this->bbt.td = &bbt_main_descr;
+				this->bbt.md = &bbt_mirror_descr;
+			}
+		}
+	} else {
+		this->bbt.td = NULL;
+		this->bbt.md = NULL;
+	}
+
+	td = this->bbt.td;
+	md = this->bbt.md;
+	bd = this->bbt.bbp;
 
-	len = (mtd->size >> (this->bbt_erase_shift + 2)) ? : 1;
 	/*
 	 * Allocate memory (2bit per block) and clear the memory bad block
 	 * table.
 	 */
-	this->bbt = kzalloc(len, GFP_KERNEL);
-	if (!this->bbt)
+	len = DIV_ROUND_UP(nand_neraseblocks(this) * 2, 8);
+	this->bbt.bbt = kzalloc(len, GFP_KERNEL);
+	if (!this->bbt.bbt)
 		return -ENOMEM;
 
 	/*
@@ -1171,18 +1264,19 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 	 * memory based bad block table.
 	 */
 	if (!td) {
-		if ((res = nand_memory_bbt(mtd, bd))) {
+		res = nand_memory_bbt(this, bd);
+		if (res) {
 			pr_err("nand_bbt: can't scan flash and build the RAM-based BBT\n");
 			goto err;
 		}
+
 		return 0;
 	}
-	verify_bbt_descr(mtd, td);
-	verify_bbt_descr(mtd, md);
+	verify_bbt_descr(this, td);
+	verify_bbt_descr(this, md);
 
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
-	len = (1 << this->bbt_erase_shift);
-	len += (len >> this->page_shift) * mtd->oobsize;
+	len = nand_eraseblock_size(this) + nand_per_eraseblock_oobsize(this);
 	buf = vmalloc(len);
 	if (!buf) {
 		res = -ENOMEM;
@@ -1191,59 +1285,68 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 
 	/* Is the bbt at a given page? */
 	if (td->options & NAND_BBT_ABSPAGE) {
-		read_abs_bbts(mtd, buf, td, md);
+		read_abs_bbts(this, buf, td, md);
 	} else {
 		/* Search the bad block table using a pattern in oob */
-		search_read_bbts(mtd, buf, td, md);
+		search_read_bbts(this, buf, td, md);
 	}
 
-	res = check_create(mtd, buf, bd);
+	res = check_create(this, buf, bd);
 	if (res)
 		goto err;
 
 	/* Prevent the bbt regions from erasing / writing */
-	mark_bbt_region(mtd, td);
+	mark_bbt_region(this, td);
 	if (md)
-		mark_bbt_region(mtd, md);
+		mark_bbt_region(this, md);
 
 	vfree(buf);
 	return 0;
 
 err:
-	kfree(this->bbt);
-	this->bbt = NULL;
+	kfree(this->bbt.bbt);
+	this->bbt.bbt = NULL;
 	return res;
 }
 
 /**
+ * nand_release_bbt - release bad block table(s)
+ * @this: NAND device
+ *
+ * The function releases the bad block table(s).
+ */
+void nand_release_bbt(struct nand_device *this)
+{
+	kfree(this->bbt.bbt);
+}
+
+/**
  * nand_update_bbt - update bad block table(s)
- * @mtd: MTD device structure
+ * @this: NAND device
  * @offs: the offset of the newly marked block
  *
  * The function updates the bad block table(s).
  */
-static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
+int nand_update_bbt(struct nand_device *this, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
 	int len, res = 0;
 	int chip, chipsel;
 	uint8_t *buf;
-	struct nand_bbt_descr *td = this->bbt_td;
-	struct nand_bbt_descr *md = this->bbt_md;
+	struct nand_bbt_descr *td = this->bbt.td;
+	struct nand_bbt_descr *md = this->bbt.md;
 
-	if (!this->bbt || !td)
+	if (!this->bbt.bbt || !td)
 		return -EINVAL;
 
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
-	len = (1 << this->bbt_erase_shift);
-	len += (len >> this->page_shift) * mtd->oobsize;
+	len = nand_eraseblock_size(this) + nand_per_eraseblock_oobsize(this);
 	buf = kmalloc(len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
 	/* Do we have a bbt per chip? */
 	if (td->options & NAND_BBT_PERCHIP) {
-		chip = (int)(offs >> this->chip_shift);
+		chip = nand_offs_to_die(this, offs);
 		chipsel = chip;
 	} else {
 		chip = 0;
@@ -1256,13 +1359,13 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 
 	/* Write the bad block table to the device? */
 	if (td->options & NAND_BBT_WRITE) {
-		res = write_bbt(mtd, buf, td, md, chipsel);
+		res = write_bbt(this, buf, td, md, chipsel);
 		if (res < 0)
 			goto out;
 	}
 	/* Write the mirror bad block table to the device? */
 	if (md && (md->options & NAND_BBT_WRITE)) {
-		res = write_bbt(mtd, buf, md, td, chipsel);
+		res = write_bbt(this, buf, md, td, chipsel);
 	}
 
  out:
@@ -1270,160 +1373,41 @@ static int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
 	return res;
 }
 
-/*
- * Define some generic bad / good block scan pattern which are used
- * while scanning a device for factory marked good / bad blocks.
- */
-static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
-
-/* Generic flash bbt descriptors */
-static uint8_t bbt_pattern[] = {'B', 'b', 't', '0' };
-static uint8_t mirror_pattern[] = {'1', 't', 'b', 'B' };
-
-static struct nand_bbt_descr bbt_main_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
-	.offs =	8,
-	.len = 4,
-	.veroffs = 12,
-	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
-	.pattern = bbt_pattern
-};
-
-static struct nand_bbt_descr bbt_mirror_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP,
-	.offs =	8,
-	.len = 4,
-	.veroffs = 12,
-	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
-	.pattern = mirror_pattern
-};
-
-static struct nand_bbt_descr bbt_main_no_oob_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
-		| NAND_BBT_NO_OOB,
-	.len = 4,
-	.veroffs = 4,
-	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
-	.pattern = bbt_pattern
-};
-
-static struct nand_bbt_descr bbt_mirror_no_oob_descr = {
-	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
-		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
-		| NAND_BBT_NO_OOB,
-	.len = 4,
-	.veroffs = 4,
-	.maxblocks = NAND_BBT_SCAN_MAXBLOCKS,
-	.pattern = mirror_pattern
-};
-
-#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
-/**
- * nand_create_badblock_pattern - [INTERN] Creates a BBT descriptor structure
- * @this: NAND chip to create descriptor for
- *
- * This function allocates and initializes a nand_bbt_descr for BBM detection
- * based on the properties of @this. The new descriptor is stored in
- * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
- * passed to this function.
- */
-static int nand_create_badblock_pattern(struct nand_chip *this)
-{
-	struct nand_bbt_descr *bd;
-	if (this->badblock_pattern) {
-		pr_warn("Bad block pattern already allocated; not replacing\n");
-		return -EINVAL;
-	}
-	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
-	if (!bd)
-		return -ENOMEM;
-	bd->options = this->bbt_options & BADBLOCK_SCAN_MASK;
-	bd->offs = this->badblockpos;
-	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
-	bd->pattern = scan_ff_pattern;
-	bd->options |= NAND_BBT_DYNAMICSTRUCT;
-	this->badblock_pattern = bd;
-	return 0;
-}
-
-/**
- * nand_default_bbt - [NAND Interface] Select a default bad block table for the device
- * @mtd: MTD device structure
- *
- * This function selects the default bad block table support for the device and
- * calls the nand_scan_bbt function.
- */
-int nand_default_bbt(struct mtd_info *mtd)
-{
-	struct nand_chip *this = mtd_to_nandchip(mtd);
-	int ret;
-
-	/* Is a flash based bad block table requested? */
-	if (this->bbt_options & NAND_BBT_USE_FLASH) {
-		/* Use the default pattern descriptors */
-		if (!this->bbt_td) {
-			if (this->bbt_options & NAND_BBT_NO_OOB) {
-				this->bbt_td = &bbt_main_no_oob_descr;
-				this->bbt_md = &bbt_mirror_no_oob_descr;
-			} else {
-				this->bbt_td = &bbt_main_descr;
-				this->bbt_md = &bbt_mirror_descr;
-			}
-		}
-	} else {
-		this->bbt_td = NULL;
-		this->bbt_md = NULL;
-	}
-
-	if (!this->badblock_pattern) {
-		ret = nand_create_badblock_pattern(this);
-		if (ret)
-			return ret;
-	}
-
-	return nand_scan_bbt(mtd, this->badblock_pattern);
-}
-
 /**
  * nand_isreserved_bbt - [NAND Interface] Check if a block is reserved
- * @mtd: MTD device structure
+ * @this: NAND device
  * @offs: offset in the device
  */
-int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs)
+int nand_isreserved_bbt(struct nand_device *this, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
 	int block;
 
-	block = (int)(offs >> this->bbt_erase_shift);
-	return bbt_get_entry(this, block) == BBT_BLOCK_RESERVED;
+	block = nand_offs_to_eraseblock(this, offs);
+	return bbt_get_entry(this, block) == NAND_BBT_BLOCK_RESERVED;
 }
 
 /**
  * nand_isbad_bbt - [NAND Interface] Check if a block is bad
- * @mtd: MTD device structure
+ * @this: NAND device
  * @offs: offset in the device
  * @allowbbt: allow access to bad block table region
  */
-int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
+int nand_isbad_bbt(struct nand_device *this, loff_t offs, int allowbbt)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
 	int block, res;
 
-	block = (int)(offs >> this->bbt_erase_shift);
+	block = nand_offs_to_eraseblock(this, offs);
 	res = bbt_get_entry(this, block);
 
 	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
 		 (unsigned int)offs, block, res);
 
 	switch (res) {
-	case BBT_BLOCK_GOOD:
+	case NAND_BBT_BLOCK_GOOD:
 		return 0;
-	case BBT_BLOCK_WORN:
+	case NAND_BBT_BLOCK_WORN:
 		return 1;
-	case BBT_BLOCK_RESERVED:
+	case NAND_BBT_BLOCK_RESERVED:
 		return allowbbt ? 0 : 1;
 	}
 	return 1;
@@ -1431,22 +1415,21 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 
 /**
  * nand_markbad_bbt - [NAND Interface] Mark a block bad in the BBT
- * @mtd: MTD device structure
+ * @this: NAND device
  * @offs: offset of the bad block
  */
-int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs)
+int nand_markbad_bbt(struct nand_device *this, loff_t offs)
 {
-	struct nand_chip *this = mtd_to_nandchip(mtd);
 	int block, ret = 0;
 
-	block = (int)(offs >> this->bbt_erase_shift);
+	block = nand_offs_to_eraseblock(this, offs);
 
 	/* Mark bad block in memory */
-	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
+	bbt_mark_entry(this, block, NAND_BBT_BLOCK_WORN);
 
 	/* Update flash-based bad block table */
-	if (this->bbt_options & NAND_BBT_USE_FLASH)
-		ret = nand_update_bbt(mtd, offs);
+	if (this->bbt.options & NAND_BBT_USE_FLASH)
+		ret = nand_update_bbt(this, offs);
 
 	return ret;
 }
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 446f941..78931ff 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -566,4 +566,27 @@ static inline struct device_node *nand_get_of_node(struct nand_device *nand)
 {
 	return mtd_get_of_node(&nand->mtd);
 }
+
+/* BBT related functions */
+enum nand_bbt_block_status {
+	NAND_BBT_BLOCK_GOOD,
+	NAND_BBT_BLOCK_WORN,
+	NAND_BBT_BLOCK_RESERVED,
+	NAND_BBT_BLOCK_FACTORY_BAD,
+};
+
+int nand_scan_bbt(struct nand_device *this);
+void nand_release_bbt(struct nand_device *this);
+int nand_update_bbt(struct nand_device *this, loff_t offs);
+int nand_isreserved_bbt(struct nand_device *this, loff_t offs);
+int nand_isbad_bbt(struct nand_device *this, loff_t offs, int allowbbt);
+int nand_markbad_bbt(struct nand_device *this, loff_t offs);
+
+void nand_bbt_update_entry(struct nand_device *this, int eraseblock,
+			   enum nand_bbt_block_status status);
+static inline bool nand_bbt_is_initialized(struct nand_device *this)
+{
+	return !!this->bbt.bbt;
+}
+
 #endif /* __LINUX_MTD_NAND_H */
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 750fac2..04b0954 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -831,7 +831,6 @@ struct rawnand_device {
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
  * @setup_data_interface: [OPTIONAL] setup the data interface and timing
- * @bbt:		[INTERN] bad block table pointer
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
  *			lookup.
  * @bbt_md:		[REPLACEABLE] bad block table mirror descriptor
@@ -924,7 +923,6 @@ struct nand_chip {
 	unsigned long buf_align;
 	struct nand_hw_control hwcontrol;
 
-	uint8_t *bbt;
 	struct nand_bbt_descr *bbt_td;
 	struct nand_bbt_descr *bbt_md;
 
@@ -1114,10 +1112,6 @@ struct nand_manufacturer {
 extern const struct nand_manufacturer_ops amd_nand_manuf_ops;
 extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;
 
-int nand_default_bbt(struct mtd_info *mtd);
-int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
-int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
-int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
 int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		    int allowbbt);
 int nand_do_read(struct mtd_info *mtd, loff_t from, size_t len,
-- 
1.9.1
