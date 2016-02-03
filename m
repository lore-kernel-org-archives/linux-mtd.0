Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQtIV-0007gK-8D
 for linux-mtd@lists.infradead.org; Wed, 03 Feb 2016 09:00:24 +0000
From: Archit Taneja <architt@codeaurora.org>
To: computersforpeace@gmail.com,
	boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, cernekee@gmail.com, sboyd@codeaurora.org,
 andy.gross@linaro.org, dehrenberg@google.com,
 linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v8 1/3] mtd: nand: don't select chip in nand_chip's block_bad
 op
Date: Wed,  3 Feb 2016 14:29:49 +0530
Message-Id: <1454489991-14717-2-git-send-email-architt@codeaurora.org>
In-Reply-To: <1454489991-14717-1-git-send-email-architt@codeaurora.org>
References: <1453360399-32029-1-git-send-email-architt@codeaurora.org>
 <1454489991-14717-1-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One of the arguments passed to struct nand_chip's block_bad op is
'getchip', which, if true, is supposed to get and select the nand device,
and later unselect and release the device.

This op is intended to be replaceable by drivers. The drivers shouldn't
be responsible for selecting/unselecting chip. Like other ops, the chip
should already be selected before the block_bad op is called.

Remove the getchip argument from the block_bad op and
nand_block_checkbad. Move the chip selection to nand_block_isbad, since it
is the only caller to nand_block_checkbad which requires chip selection.

Modify nand_block_bad (the default function for the op) such that it
doesn't select the chip.

Remove the getchip argument from the bad_block funcs in cafe_nand,
diskonchip and docg4 drivers.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Archit Taneja <architt@codeaurora.org>
---
v7: Updated cafe_nand, diskonchip and docg4 drivers.

v6: As suggested by Boris, remove getchip arg altogether and select the
    chip in nand_block_isbad

 drivers/mtd/nand/cafe_nand.c  |  2 +-
 drivers/mtd/nand/diskonchip.c |  2 +-
 drivers/mtd/nand/docg4.c      |  2 +-
 drivers/mtd/nand/nand_base.c  | 41 +++++++++++++++++++----------------------
 include/linux/mtd/nand.h      |  2 +-
 5 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 00c15e2..68c3048 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -537,7 +537,7 @@ static int cafe_nand_write_page_lowlevel(struct mtd_info *mtd,
 	return 0;
 }
 
-static int cafe_nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
+static int cafe_nand_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
 	return 0;
 }
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index a5c0466..dfd6cd5 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -798,7 +798,7 @@ static int doc200x_dev_ready(struct mtd_info *mtd)
 	}
 }
 
-static int doc200x_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
+static int doc200x_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
 	/* This is our last resort if we couldn't find or create a BBT.  Just
 	   pretend all blocks are good. */
diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index 95cd139..33a1788 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1121,7 +1121,7 @@ static int docg4_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return ret;
 }
 
-static int docg4_block_neverbad(struct mtd_info *mtd, loff_t ofs, int getchip)
+static int docg4_block_neverbad(struct mtd_info *mtd, loff_t ofs)
 {
 	/* only called when module_param ignore_badblocks is set */
 	return 0;
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 928081b..1809c20 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -317,9 +317,9 @@ static void nand_read_buf16(struct mtd_info *mtd, uint8_t *buf, int len)
  *
  * Check, if the block is bad.
  */
-static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
+static int nand_block_bad(struct mtd_info *mtd, loff_t ofs)
 {
-	int page, chipnr, res = 0, i = 0;
+	int page, res = 0, i = 0;
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	u16 bad;
 
@@ -328,15 +328,6 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 
 	page = (int)(ofs >> chip->page_shift) & chip->pagemask;
 
-	if (getchip) {
-		chipnr = (int)(ofs >> chip->chip_shift);
-
-		nand_get_device(mtd, FL_READING);
-
-		/* Select the NAND device */
-		chip->select_chip(mtd, chipnr);
-	}
-
 	do {
 		if (chip->options & NAND_BUSWIDTH_16) {
 			chip->cmdfunc(mtd, NAND_CMD_READOOB,
@@ -361,11 +352,6 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 		i++;
 	} while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE));
 
-	if (getchip) {
-		chip->select_chip(mtd, -1);
-		nand_release_device(mtd);
-	}
-
 	return res;
 }
 
@@ -503,19 +489,17 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
  * nand_block_checkbad - [GENERIC] Check if a block is marked bad
  * @mtd: MTD device structure
  * @ofs: offset from device start
- * @getchip: 0, if the chip is already selected
  * @allowbbt: 1, if its allowed to access the bbt area
  *
  * Check, if the block is bad. Either by reading the bad block table or
  * calling of the scan function.
  */
-static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int getchip,
-			       int allowbbt)
+static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int allowbbt)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	if (!chip->bbt)
-		return chip->block_bad(mtd, ofs, getchip);
+		return chip->block_bad(mtd, ofs);
 
 	/* Return info from the table */
 	return nand_isbad_bbt(mtd, ofs, allowbbt);
@@ -2918,7 +2902,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	while (len) {
 		/* Check if we have a bad block, we do not erase bad blocks! */
 		if (nand_block_checkbad(mtd, ((loff_t) page) <<
-					chip->page_shift, 0, allowbbt)) {
+					chip->page_shift, allowbbt)) {
 			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
 				    __func__, page);
 			instr->state = MTD_ERASE_FAILED;
@@ -3005,7 +2989,20 @@ static void nand_sync(struct mtd_info *mtd)
  */
 static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 {
-	return nand_block_checkbad(mtd, offs, 1, 0);
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	int chipnr = (int)(offs >> chip->chip_shift);
+	int ret;
+
+	/* Select the NAND device */
+	nand_get_device(mtd, FL_READING);
+	chip->select_chip(mtd, chipnr);
+
+	ret = nand_block_checkbad(mtd, offs, 0);
+
+	chip->select_chip(mtd, -1);
+	nand_release_device(mtd);
+
+	return ret;
 }
 
 /**
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 3e92be1..c15818e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -650,7 +650,7 @@ struct nand_chip {
 	void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
 	void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
 	void (*select_chip)(struct mtd_info *mtd, int chip);
-	int (*block_bad)(struct mtd_info *mtd, loff_t ofs, int getchip);
+	int (*block_bad)(struct mtd_info *mtd, loff_t ofs);
 	int (*block_markbad)(struct mtd_info *mtd, loff_t ofs);
 	void (*cmd_ctrl)(struct mtd_info *mtd, int dat, unsigned int ctrl);
 	int (*dev_ready)(struct mtd_info *mtd);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
