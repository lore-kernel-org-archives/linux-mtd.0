Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NetPz-00032k-US
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 16:58:37 +0000
Received: by mail-bw0-f220.google.com with SMTP id 20so2398515bwz.20
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Feb 2010 08:58:31 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 13/17] NAND: make ->check_bad more user friendly
Date: Tue,  9 Feb 2010 18:57:41 +0200
Message-Id: <1265734665-22656-14-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1265734665-22656-1-git-send-email-maximlevitsky@gmail.com>
References: <1265734665-22656-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, joern <joern@logfs.org>,
	Vitaly Wool <vitalywool@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently to implement a custom ->check_bad one need to call
nand_get_device, nand_release_device.
Also it not possible to use mtd->read_oob because they call
nand_get_device too.
Refactor the code, so check_bad now always has to do nand_get_device
Thus it can use plain mtd->read_oob

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c  |    2 +-
 drivers/mtd/nand/diskonchip.c |    2 +-
 drivers/mtd/nand/nand_base.c  |   74 ++++++++++++++++++++++++++---------------
 include/linux/mtd/nand.h      |    2 +-
 4 files changed, 50 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index c828d9a..8211197 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -577,7 +577,7 @@ static int cafe_nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
-static int cafe_nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
+static int cafe_nand_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
 	return 0;
 }
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index b126cf8..ea3a3c9 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -854,7 +854,7 @@ static int doc200x_dev_ready(struct mtd_info *mtd)
 	}
 }
 
-static int doc200x_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
+static int doc200x_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
 	/* This is our last resort if we couldn't find or create a BBT.  Just
 	   pretend all blocks are good. */
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c393df3..86fa40a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -312,22 +312,18 @@ static int nand_verify_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
  *
  * Check, if the block is bad.
  */
-static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
+static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
 	int page, chipnr, res = 0;
 	struct nand_chip *chip = mtd->priv;
 	u16 bad;
 
 	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
+	chipnr = (int)(ofs >> chip->chip_shift);
+	nand_get_device(chip, mtd, FL_READING);
 
-	if (getchip) {
-		chipnr = (int)(ofs >> chip->chip_shift);
-
-		nand_get_device(chip, mtd, FL_READING);
-
-		/* Select the NAND device */
-		chip->select_chip(mtd, chipnr);
-	}
+	/* Select the NAND device */
+	chip->select_chip(mtd, chipnr);
 
 	if (chip->options & NAND_BUSWIDTH_16) {
 		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos & 0xFE,
@@ -343,9 +339,7 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 			res = 1;
 	}
 
-	if (getchip)
-		nand_release_device(mtd);
-
+	nand_release_device(mtd);
 	return res;
 }
 
@@ -410,19 +404,17 @@ static int nand_check_wp(struct mtd_info *mtd)
  * nand_block_checkbad - [GENERIC] Check if a block is marked bad
  * @mtd:	MTD device structure
  * @ofs:	offset from device start
- * @getchip:	0, if the chip is already selected
  * @allowbbt:	1, if its allowed to access the bbt area
  *
  * Check, if the block is bad. Either by reading the bad block table or
  * calling of the scan function.
  */
-static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
-			       int allowbbt)
+static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int allowbbt)
 {
 	struct nand_chip *chip = mtd->priv;
 
 	if (!chip->bbt)
-		return chip->block_bad(mtd, ofs, getchip);
+		return chip->block_bad(mtd, ofs);
 
 	/* Return info from the table */
 	return nand_isbad_bbt(mtd, ofs, allowbbt);
@@ -2277,6 +2269,40 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return nand_erase_nand(mtd, instr, 0);
 }
 
+/**
+ * nand_erase_nand - [Internal] check to see if range contains bad blocks
+ * @mtd:	MTD device structure
+ * @offs:	start offset
+ * @len:	length of the range
+ * @allowbbt:	allow access to bbt
+ *
+ * Sanity check before doing the erase
+ */
+static int nand_check_range(struct mtd_info *mtd, loff_t offs, loff_t len,
+			int allow_bbt)
+{
+	struct nand_chip *chip = mtd->priv;
+	int page = offs >> chip->page_shift;
+	int mask = (1 << chip->page_shift) - 1;
+
+	if (len & mask || offs & mask) {
+		DEBUG(MTD_DEBUG_LEVEL0, "%s Unaligned access\n", __func__);
+		return -EINVAL;
+	}
+
+	while (offs < len) {
+		if (nand_block_checkbad(mtd, offs, allow_bbt)) {
+			printk(KERN_WARNING "%s: attempt to erase a bad block "
+					"at page 0x%08x\n", __func__, page);
+				return -EIO;
+		}
+
+		offs += (1 < chip->page_shift);
+		page++;
+	}
+	return 0;
+}
+
 #define BBT_PAGE_MASK	0xffffff3f
 /**
  * nand_erase_nand - [Internal] erase block(s)
@@ -2321,6 +2347,10 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 
 	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 
+	/* See if we were asked to erase bad blocks */
+	if (nand_check_range(mtd, instr->addr, instr->len, allowbbt))
+		return -EINVAL;
+
 	/* Grab the lock and see if the device is available */
 	nand_get_device(chip, mtd, FL_ERASING);
 
@@ -2357,16 +2387,6 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	instr->state = MTD_ERASING;
 
 	while (len) {
-		/*
-		 * heck if we have a bad block, we do not erase bad blocks !
-		 */
-		if (nand_block_checkbad(mtd, ((loff_t) page) <<
-					chip->page_shift, 0, allowbbt)) {
-			printk(KERN_WARNING "%s: attempt to erase a bad block "
-					"at page 0x%08x\n", __func__, page);
-			instr->state = MTD_ERASE_FAILED;
-			goto erase_exit;
-		}
 
 		/*
 		 * Invalidate the page cache, if we erase the block which
@@ -2490,7 +2510,7 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 	if (offs > mtd->size)
 		return -EINVAL;
 
-	return nand_block_checkbad(mtd, offs, 1, 0);
+	return nand_block_checkbad(mtd, offs, 0);
 }
 
 /**
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ccab9df..921f24b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -364,7 +364,7 @@ struct nand_chip {
 	void		(*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
 	int		(*verify_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
 	void		(*select_chip)(struct mtd_info *mtd, int chip);
-	int		(*block_bad)(struct mtd_info *mtd, loff_t ofs, int getchip);
+	int		(*block_bad)(struct mtd_info *mtd, loff_t ofs);
 	int		(*block_markbad)(struct mtd_info *mtd, loff_t ofs);
 	void		(*cmd_ctrl)(struct mtd_info *mtd, int dat,
 				    unsigned int ctrl);
-- 
1.6.3.3
