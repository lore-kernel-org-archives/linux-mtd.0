Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZTvY-0008JF-IV
	for linux-mtd@lists.infradead.org; Thu, 15 Jul 2010 19:17:02 +0000
From: "Brian Norris" <norris@broadcom.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3 2/2] mtd/nand: More BB Detection, dynamic scan
 options
Date: Thu, 15 Jul 2010 12:15:44 -0700
Message-ID: <1279221344-12121-1-git-send-email-norris@broadcom.com>
In-Reply-To: <4C3CFD4A.3020708@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <David.Woodhouse@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Brian Norris <norris@broadcom.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a revision to PATCH 2/2 that I sent. Link:
http://lists.infradead.org/pipermail/linux-mtd/2010-July/030911.html

Added new flag for scanning of both bytes 1 and 6 of the OOB for
a BB marker (instead of simply one or the other).

The "check_pattern" and "check_short_pattern" functions were updated
to include support for scanning the two different locations in the OOB.

In order to handle increases in variety of necessary scanning patterns,
I implemented dynamic memory allocation of nand_bbt_descr structs
in new function 'nand_create_default_bbt_descr()'. This replaces
some increasingly-unwieldy, statically-declared descriptors. It can
replace several more (e.g. "flashbased" structs). However, I do not
test the flashbased options personally.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   14 +++++
 drivers/mtd/nand/nand_bbt.c  |  127 ++++++++++++++++++++++++------------------
 include/linux/mtd/bbm.h      |    4 +
 3 files changed, 90 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index bd69790..c2901bd 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2963,6 +2963,15 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
 			 *maf_id == NAND_MFR_MICRON))
 		chip->options |= NAND_BBT_SCAN2NDPAGE;
 
+	/*
+	 * Numonyx/ST 2K pages, x8 bus use BOTH byte 1 and 6
+	 */
+	if (!(busw & NAND_BUSWIDTH_16) &&
+			*maf_id == NAND_MFR_STMICRO &&
+			mtd->writesize == 2048) {
+		chip->options |= NAND_BBT_SCANBYTE1AND6;
+		chip->badblockpos = 0;
+	}
 
 	/* Check for AND chips with 4 page planes */
 	if (chip->options & NAND_4PAGE_ARRAY)
@@ -3322,6 +3331,11 @@ void nand_release(struct mtd_info *mtd)
 	kfree(chip->bbt);
 	if (!(chip->options & NAND_OWN_BUFFERS))
 		kfree(chip->buffers);
+
+	/* Free bad block descriptor memory */
+	if (chip->badblock_pattern && chip->badblock_pattern->options
+			& NAND_BBT_DYNAMICSTRUCT)
+		kfree(chip->badblock_pattern);
 }
 
 EXPORT_SYMBOL_GPL(nand_lock);
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index ec1700e..469de17 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -93,6 +93,28 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
 			return -1;
 	}
 
+	/* Check both positions 1 and 6 for pattern? */
+	if (td->options & NAND_BBT_SCANBYTE1AND6) {
+		if (td->options & NAND_BBT_SCANEMPTY) {
+			p += td->len;
+			end += NAND_SMALL_BADBLOCK_POS - td->offs;
+			/* Check region between positions 1 and 6 */
+			for (i = 0; i < NAND_SMALL_BADBLOCK_POS - td->offs - td->len;
+					i++) {
+				if (*p++ != 0xff)
+					return -1;
+			}
+		}
+		else {
+			p += NAND_SMALL_BADBLOCK_POS - td->offs;
+		}
+		/* Compare the pattern */
+		for (i = 0; i < td->len; i++) {
+			if (p[i] != td->pattern[i])
+				return -1;
+		}
+	}
+
 	if (td->options & NAND_BBT_SCANEMPTY) {
 		p += td->len;
 		end += td->len;
@@ -124,6 +146,13 @@ static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
 		if (p[td->offs + i] != td->pattern[i])
 			return -1;
 	}
+	/* Need to check location 1 AND 6? */
+	if (td->options & NAND_BBT_SCANBYTE1AND6) {
+		for (i = 0; i < td->len; i++) {
+			if (p[NAND_SMALL_BADBLOCK_POS + i] != td->pattern[i])
+				return -1;
+		}
+	}
 	return 0;
 }
 
@@ -397,12 +426,10 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 	if (bd->options & NAND_BBT_SCANALLPAGES)
 		len = 1 << (this->bbt_erase_shift - this->page_shift);
-	else {
-		if (bd->options & NAND_BBT_SCAN2NDPAGE)
-			len = 2;
-		else
-			len = 1;
-	}
+	else if (bd->options & NAND_BBT_SCAN2NDPAGE)
+		len = 2;
+	else
+		len = 1;
 
 	if (!(bd->options & NAND_BBT_SCANEMPTY)) {
 		/* We need only read few bytes from the OOB area */
@@ -1092,41 +1119,6 @@ int nand_update_bbt(struct mtd_info *mtd, loff_t offs)
  * while scanning a device for factory marked good / bad blocks. */
 static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
 
-static struct nand_bbt_descr smallpage_memorybased = {
-	.options = 0,
-	.offs = NAND_SMALL_BADBLOCK_POS,
-	.len = 1,
-	.pattern = scan_ff_pattern
-};
-
-static struct nand_bbt_descr smallpage_scan2nd_memorybased = {
-	.options = NAND_BBT_SCAN2NDPAGE,
-	.offs = NAND_SMALL_BADBLOCK_POS,
-	.len = 2,
-	.pattern = scan_ff_pattern
-};
-
-static struct nand_bbt_descr largepage_memorybased = {
-	.options = 0,
-	.offs = NAND_LARGE_BADBLOCK_POS,
-	.len = 1,
-	.pattern = scan_ff_pattern
-};
-
-static struct nand_bbt_descr largepage_scan2nd_memorybased = {
-	.options = NAND_BBT_SCAN2NDPAGE,
-	.offs = NAND_LARGE_BADBLOCK_POS,
-	.len = 2,
-	.pattern = scan_ff_pattern
-};
-
-static struct nand_bbt_descr lastpage_memorybased = {
-	.options = NAND_BBT_SCANLASTPAGE,
-	.offs = 0,
-	.len = 1,
-	.pattern = scan_ff_pattern
-};
-
 static struct nand_bbt_descr smallpage_flashbased = {
 	.options = NAND_BBT_SCAN2NDPAGE,
 	.offs = NAND_SMALL_BADBLOCK_POS,
@@ -1175,6 +1167,43 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 	.pattern = mirror_pattern
 };
 
+#define BBT_SCAN_OPTIONS (NAND_BBT_SCANLASTPAGE | NAND_BBT_SCAN2NDPAGE | \
+		NAND_BBT_SCANBYTE1AND6)
+/**
+ * nand_create_default_bbt_descr - [Internal] Creates a BBT descriptor structure
+ * @this:	NAND chip to create descriptor for
+ *
+ * This function allocates and initializes a nand_bbt_descr for BBM detection
+ * based on the properties of "this". The new descriptor is stored in
+ * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
+ * passed to this function.
+ *
+ * TODO: Handle other flags, replace other static structs
+ *        (e.g. handle NAND_BBT_FLASH for flash-based BBT,
+ *             replace smallpage_flashbased)
+ *
+ */
+static int nand_create_default_bbt_descr(struct nand_chip *this)
+{
+	struct nand_bbt_descr *bd;
+	if (this->badblock_pattern) {
+		printk(KERN_WARNING "BBT descr already allocated; not replacing.\n");
+		return -EINVAL;
+	}
+	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
+	if (!bd) {
+		printk(KERN_ERR "nand_create_default_bbt_descr: Out of memory\n");
+		return -ENOMEM;
+	}
+	bd->options = this->options & BBT_SCAN_OPTIONS;
+	bd->offs = this->badblockpos;
+	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
+	bd->pattern = scan_ff_pattern;
+	bd->options |= NAND_BBT_DYNAMICSTRUCT;
+	this->badblock_pattern = bd;
+	return 0;
+}
+
 /**
  * nand_default_bbt - [NAND Interface] Select a default bad block table for the device
  * @mtd:	MTD device structure
@@ -1217,20 +1246,8 @@ int nand_default_bbt(struct mtd_info *mtd)
 	} else {
 		this->bbt_td = NULL;
 		this->bbt_md = NULL;
-		if (!this->badblock_pattern) {
-			if (this->options & NAND_BBT_SCANLASTPAGE)
-				this->badblock_pattern = &lastpage_memorybased;
-			else if (this->options & NAND_BBT_SCAN2NDPAGE)
-				this->badblock_pattern = this->badblockpos ==
-					NAND_SMALL_BADBLOCK_POS ?
-					&smallpage_scan2nd_memorybased :
-					&largepage_scan2nd_memorybased;
-			else
-				this->badblock_pattern = this->badblockpos ==
-					NAND_SMALL_BADBLOCK_POS ?
-					&smallpage_memorybased :
-					&largepage_memorybased;
-		}
+		if (!this->badblock_pattern)
+			nand_create_default_bbt_descr(this);
 	}
 	return nand_scan_bbt(mtd, this->badblock_pattern);
 }
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 8ad0b86..a04b962 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -84,6 +84,10 @@ struct nand_bbt_descr {
 #define NAND_BBT_SCAN2NDPAGE	0x00004000
 /* Search good / bad pattern on the last page of the eraseblock */
 #define NAND_BBT_SCANLASTPAGE	0x00008000
+/* Chip stores bad block marker on BOTH 1st and 6th bytes of OOB */
+#define NAND_BBT_SCANBYTE1AND6 0x00100000
+/* The nand_bbt_descr was created dynamicaly and must be freed */
+#define NAND_BBT_DYNAMICSTRUCT 0x00200000
 
 /* The maximum number of blocks to scan for a bbt */
 #define NAND_BBT_SCAN_MAXBLOCKS	4
-- 
1.7.0.4
