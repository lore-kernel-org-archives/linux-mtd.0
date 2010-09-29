Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P10he-0000iP-Mm
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 17:44:28 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] mtd/nand: add support for BBT without OOB
Date: Wed, 29 Sep 2010 19:43:52 +0200
Message-Id: <1285782234-32509-4-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
Cc: tglx@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The first (sixt) byte in the OOB area contains vendor's bad block
information. During identification of the NAND chip this information is
collected by scanning the complete chip.
The option NAND_USE_FLASH_BBT is used to store this information in a sector so
we don't have to scan the complete flash. Unfortunately the code stores
a marker, in order to recognize the BBT, in the OOB area. This will fail
if the OOB area is completely used for ECC.
This patch introduces the option NAND_USE_FLASH_BBT_NO_OOB which has to be
used with NAND_USE_FLASH_BBT. It will then store BBT on flash without
touching the OOB area. The BBT format on flash remains same except the
first page starts with the recognition pattern followed by the no longer
optional version byte.
This change was tested in nandsim and on real HW with this issue.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/nand_bbt.c |  193 ++++++++++++++++++++++++++++++++++++++++---
 include/linux/mtd/bbm.h     |    2 +
 include/linux/mtd/nand.h    |    7 +-
 3 files changed, 189 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 587297e..11e4204 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -59,6 +59,16 @@
 #include <linux/delay.h>
 #include <linux/vmalloc.h>
 
+static int check_pattern_no_oob(uint8_t *buf, struct nand_bbt_descr *td)
+{
+	int ret;
+
+	ret = memcmp(buf, td->pattern, td->len);
+	if (!ret)
+		return ret;
+	return -1;
+}
+
 /**
  * check_pattern - [GENERIC] check if a pattern is in the buffer
  * @buf:	the buffer to search
@@ -77,6 +87,9 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
 	int i, end = 0;
 	uint8_t *p = buf;
 
+	if (td->options & NAND_BBT_NO_OOB)
+		return check_pattern_no_oob(buf, td);
+
 	end = paglen + td->offs;
 	if (td->options & NAND_BBT_SCANEMPTY) {
 		for (i = 0; i < end; i++) {
@@ -156,6 +169,25 @@ static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
 }
 
 /**
+ * add_marker_len - compute the length of the marker in data area
+ * @td:		BBT descriptor used for computation
+ *
+ * The length will be 0 if the markeris located in OOB area.
+ */
+static u32 add_marker_len(struct nand_bbt_descr *td)
+{
+	u32 len;
+
+	if (!(td->options & NAND_BBT_NO_OOB))
+		return 0;
+
+	len = td->len;
+	if (td->options & NAND_BBT_VERSION)
+		len++;
+	return len;
+}
+
+/**
  * read_bbt - [GENERIC] Read the bad block table starting from page
  * @mtd:	MTD device structure
  * @buf:	temporary buffer
@@ -176,13 +208,26 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 	loff_t from;
 	int bits = td->options & NAND_BBT_NRBITS_MSK;
 	uint8_t msk = (uint8_t) ((1 << bits) - 1);
+	u32 marker_len;
 	int reserved_block_code = td->reserved_block_code;
 
 	totlen = (num * bits) >> 3;
+	marker_len = add_marker_len(td);
 	from = ((loff_t) page) << this->page_shift;
 
 	while (totlen) {
+
 		len = min(totlen, (size_t) (1 << this->bbt_erase_shift));
+
+		if (marker_len) {
+			/*
+			 * In case the BBT marker is not in the OOB area it
+			 * will be just in the first page
+			 */
+			len -= marker_len;
+			from += marker_len;
+			marker_len = 0;
+		}
 		res = mtd->read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
 			if (retlen != len) {
@@ -261,9 +306,25 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 }
 
 /*
+ * BBT marker is in the first page, no OOB
+ */
+static int scan_read_raw_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+			 struct nand_bbt_descr *td)
+{
+	size_t retlen;
+	size_t len;
+
+	len = td->len;
+	if (td->options & NAND_BBT_VERSION)
+		len++;
+
+	return mtd->read(mtd, offs, len, &retlen, buf);
+}
+
+/*
  * Scan read raw data from flash
  */
-static int scan_read_raw(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 			 size_t len)
 {
 	struct mtd_oob_ops ops;
@@ -296,6 +357,15 @@ static int scan_read_raw(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	return 0;
 }
 
+static int scan_read_raw(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+			 size_t len, struct nand_bbt_descr *td)
+{
+	if (td->options & NAND_BBT_NO_OOB)
+		return scan_read_raw_data(mtd, buf, offs, td);
+	else
+		return scan_read_raw_oob(mtd, buf, offs, len);
+}
+
 /*
  * Scan write data with oob to flash
  */
@@ -314,6 +384,15 @@ static int scan_write_bbt(struct mtd_info *mtd, loff_t offs, size_t len,
 	return mtd->write_oob(mtd, offs, &ops);
 }
 
+static u32 bbt_get_ver_offs(struct mtd_info *mtd, struct nand_bbt_descr *td)
+{
+	u32 ver_offs = td->veroffs;
+
+	if (!(td->options & NAND_BBT_NO_OOB))
+		ver_offs += mtd->writesize;
+	return ver_offs;
+}
+
 /**
  * read_abs_bbts - [GENERIC] Read the bad block table(s) for all chips starting at a given page
  * @mtd:	MTD device structure
@@ -333,8 +412,8 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 	/* Read the primary version, if available */
 	if (td->options & NAND_BBT_VERSION) {
 		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
-			      mtd->writesize);
-		td->version[0] = buf[mtd->writesize + td->veroffs];
+			      mtd->writesize, td);
+		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
 		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
 		       td->pages[0], td->version[0]);
 	}
@@ -342,8 +421,8 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 	/* Read the mirror version, if available */
 	if (md && (md->options & NAND_BBT_VERSION)) {
 		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
-			      mtd->writesize);
-		md->version[0] = buf[mtd->writesize + md->veroffs];
+			      mtd->writesize, td);
+		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
 		printk(KERN_DEBUG "Bad block table at page %d, version 0x%02X\n",
 		       md->pages[0], md->version[0]);
 	}
@@ -359,7 +438,7 @@ static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 {
 	int ret, j;
 
-	ret = scan_read_raw(mtd, buf, offs, readlen);
+	ret = scan_read_raw_oob(mtd, buf, offs, readlen);
 	if (ret)
 		return ret;
 
@@ -466,6 +545,8 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	for (i = startblock; i < numblocks;) {
 		int ret;
 
+		BUG_ON(bd->options & NAND_BBT_NO_OOB);
+
 		if (bd->options & NAND_BBT_SCANALLPAGES)
 			ret = scan_block_full(mtd, bd, from, buf, readlen,
 					      scanlen, len);
@@ -547,11 +628,12 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
 
 			/* Read first page */
-			scan_read_raw(mtd, buf, offs, mtd->writesize);
+			scan_read_raw(mtd, buf, offs, mtd->writesize, td);
 			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
 				td->pages[i] = actblock << blocktopage;
 				if (td->options & NAND_BBT_VERSION) {
-					td->version[i] = buf[mtd->writesize + td->veroffs];
+					u32 ver_offs = bbt_get_ver_offs(mtd, td);
+					td->version[i] = buf[ver_offs];
 				}
 				break;
 			}
@@ -735,6 +817,23 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			memset(&buf[offs], 0xff, (size_t) (numblocks >> sft));
 			ooboffs = len + (pageoffs * mtd->oobsize);
 
+		} else if (td->options & NAND_BBT_NO_OOB) {
+
+			ooboffs = 0;
+			offs = td->len;
+			/* the version byte */
+			if (td->options & NAND_BBT_VERSION)
+				offs++;
+			/* Calc length */
+			len = (size_t) (numblocks >> sft);
+			len += offs;
+			/* Make it page aligned ! */
+			len = ALIGN(len, mtd->writesize);
+			/* Preset the buffer with 0xff */
+			memset(buf, 0xff, len);
+			/* Pattern is located at the begin of first page */
+			memcpy(buf, td->pattern, td->len);
+
 		} else {
 			/* Calc length */
 			len = (size_t) (numblocks >> sft);
@@ -773,7 +872,9 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		if (res < 0)
 			goto outerr;
 
-		res = scan_write_bbt(mtd, to, len, buf, &buf[len]);
+		res = scan_write_bbt(mtd, to, len, buf,
+				td->options & NAND_BBT_NO_OOB ? NULL :
+				&buf[len]);
 		if (res < 0)
 			goto outerr;
 
@@ -984,6 +1085,49 @@ static void mark_bbt_region(struct mtd_info *mtd, struct nand_bbt_descr *td)
 }
 
 /**
+ * verify_bbt_descr - verify the bad block description
+ * @bd:			the table to verify
+ *
+ * This functions performs a few sanity check on the bad block description
+ * table.
+ */
+static void verify_bbt_descr(struct mtd_info *mtd, struct nand_bbt_descr *bd)
+{
+	struct nand_chip *this = mtd->priv;
+	u32 pattern_len = bd->len;
+	u32 bits = bd->options & NAND_BBT_NRBITS_MSK;
+	u32 table_size;
+
+	if (!bd)
+		return;
+	BUG_ON((this->options & NAND_USE_FLASH_BBT_NO_OOB) &&
+			!(this->options & NAND_USE_FLASH_BBT));
+	BUG_ON(!bits);
+
+	if (bd->options & NAND_BBT_VERSION)
+		pattern_len++;
+
+	if (bd->options & NAND_BBT_NO_OOB) {
+		BUG_ON(!(this->options & NAND_USE_FLASH_BBT));
+		BUG_ON(!(this->options & NAND_USE_FLASH_BBT_NO_OOB));
+		BUG_ON(bd->offs);
+		if (bd->options & NAND_BBT_VERSION)
+			BUG_ON(bd->veroffs != bd->len);
+		BUG_ON(bd->options & NAND_BBT_SAVECONTENT);
+	}
+
+	if (bd->options & NAND_BBT_PERCHIP)
+		table_size = this->chipsize >> this->bbt_erase_shift;
+	else
+		table_size = mtd->size >> this->bbt_erase_shift;
+	table_size >>= 3;
+	table_size *= bits;
+	if (bd->options & NAND_BBT_NO_OOB)
+		table_size += pattern_len;
+	BUG_ON(table_size > (1 << this->bbt_erase_shift));
+}
+
+/**
  * nand_scan_bbt - [NAND Interface] scan, find, read and maybe create bad block table(s)
  * @mtd:	MTD device structure
  * @bd:		descriptor for the good/bad block search pattern
@@ -1024,6 +1168,8 @@ int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
 		}
 		return res;
 	}
+	verify_bbt_descr(mtd, td);
+	verify_bbt_descr(mtd, md);
 
 	/* Allocate a temporary buffer for one eraseblock incl. oob */
 	len = (1 << this->bbt_erase_shift);
@@ -1167,6 +1313,26 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 	.pattern = mirror_pattern
 };
 
+static struct nand_bbt_descr bbt_main_no_bbt_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
+		| NAND_BBT_NO_OOB,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = 4,
+	.pattern = bbt_pattern
+};
+
+static struct nand_bbt_descr bbt_mirror_no_bbt_descr = {
+	.options = NAND_BBT_LASTBLOCK | NAND_BBT_CREATE | NAND_BBT_WRITE
+		| NAND_BBT_2BIT | NAND_BBT_VERSION | NAND_BBT_PERCHIP
+		| NAND_BBT_NO_OOB,
+	.len = 4,
+	.veroffs = 4,
+	.maxblocks = 4,
+	.pattern = mirror_pattern
+};
+
 #define BBT_SCAN_OPTIONS (NAND_BBT_SCANLASTPAGE | NAND_BBT_SCAN2NDPAGE | \
 		NAND_BBT_SCANBYTE1AND6)
 /**
@@ -1237,8 +1403,13 @@ int nand_default_bbt(struct mtd_info *mtd)
 	if (this->options & NAND_USE_FLASH_BBT) {
 		/* Use the default pattern descriptors */
 		if (!this->bbt_td) {
-			this->bbt_td = &bbt_main_descr;
-			this->bbt_md = &bbt_mirror_descr;
+			if (this->options & NAND_USE_FLASH_BBT_NO_OOB) {
+				this->bbt_td = &bbt_main_no_bbt_descr;
+				this->bbt_md = &bbt_mirror_no_bbt_descr;
+			} else {
+				this->bbt_td = &bbt_main_descr;
+				this->bbt_md = &bbt_mirror_descr;
+			}
 		}
 		if (!this->badblock_pattern) {
 			this->badblock_pattern = (mtd->writesize > 512) ? &largepage_flashbased : &smallpage_flashbased;
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 7fa20be..ba15b52 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -102,6 +102,8 @@ struct nand_bbt_descr {
 #define NAND_BBT_SCANBYTE1AND6 0x00100000
 /* The nand_bbt_descr was created dynamicaly and must be freed */
 #define NAND_BBT_DYNAMICSTRUCT 0x00200000
+/* The bad block table does not OOB for marker */
+#define NAND_BBT_NO_OOB		0x00400000
 
 /* The maximum number of blocks to scan for a bbt */
 #define NAND_BBT_SCAN_MAXBLOCKS	4
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 102e12c..68caf20 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -205,8 +205,8 @@ typedef enum {
 #define NAND_CHIPOPTIONS_MSK	(0x0000ffff & ~NAND_NO_AUTOINCR)
 
 /* Non chip related options */
-/* Use a flash based bad block table. This option is passed to the
- * default bad block table function. */
+/* Use a flash based bad block table. OOB identifier is saved in OOB area.
+ * This option is passed to the default bad block table function. */
 #define NAND_USE_FLASH_BBT	0x00010000
 /* This option skips the bbt scan during initialization. */
 #define NAND_SKIP_BBTSCAN	0x00020000
@@ -215,6 +215,9 @@ typedef enum {
 #define NAND_OWN_BUFFERS	0x00040000
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	0x00080000
+/* If passed additionally to NAND_USE_FLASH_BBT then BBT code will not touch
+ * the OOB area */
+#define NAND_USE_FLASH_BBT_NO_OOB	0x00100000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
-- 
1.7.2.3
