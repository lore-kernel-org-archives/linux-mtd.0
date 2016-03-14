Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIb7-0004o4-AM
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:11 +0000
Received: by mail-pa0-x244.google.com with SMTP id hj7so13598667pac.1
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:49 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 05/11] mtd: nand: use new BBT API instead of old ones
Date: Mon, 14 Mar 2016 02:47:58 +0000
Message-Id: <1457923684-13505-6-git-send-email-peterpandong@micron.com>
In-Reply-To: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use new BBT APIs (nand_bbt_*()) in NAND. Keep old APIs (nand_*_bbt())
exist temporarily.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/docg4.c     |   7 +-
 drivers/mtd/nand/nand_base.c | 151 ++++++++++++++++++++++++++++++++++++++++---
 include/linux/mtd/nand.h     |  15 ++++-
 3 files changed, 160 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/docg4.c b/drivers/mtd/nand/docg4.c
index d86a60e..6fce881 100644
--- a/drivers/mtd/nand/docg4.c
+++ b/drivers/mtd/nand/docg4.c
@@ -1021,6 +1021,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 	uint8_t *buf;
 	int i, block;
 	__u32 eccfailed_stats = mtd->ecc_stats.failed;
+	struct nand_bbt *nand_bbt = nand_get_bbt(nand);
 
 	buf = kzalloc(DOCG4_PAGE_SIZE, GFP_KERNEL);
 	if (buf == NULL)
@@ -1036,7 +1037,7 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 	 * operation after device power-up.  The above read ensures it never is.
 	 * Ugly, I know.
 	 */
-	if (nand->bbt == NULL)  /* no memory-based bbt */
+	if (nand_bbt == NULL)  /* no memory-based bbt */
 		goto exit;
 
 	if (mtd->ecc_stats.failed > eccfailed_stats) {
@@ -1063,8 +1064,8 @@ static int __init read_factory_bbt(struct mtd_info *mtd)
 		unsigned long bits = ~buf[i];
 		for_each_set_bit(bitnum, &bits, 8) {
 			int badblock = block + 7 - bitnum;
-			nand->bbt[badblock / 4] |=
-				0x03 << ((badblock % 4) * 2);
+			nand_bbt_markbad_factory(nand_bbt,
+					badblock << nand->bbt_erase_shift);
 			mtd->ecc_stats.badblocks++;
 			dev_notice(doc->dev, "factory-marked bad block: %d\n",
 				   badblock);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b6facac..6f0e3b9 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -417,6 +417,7 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 	int res, ret = 0;
+	struct nand_bbt *nand_bbt = nand_get_bbt(chip);
 
 	if (!(chip->bbt_options & NAND_BBT_NO_OOB_BBM)) {
 		struct erase_info einfo;
@@ -435,8 +436,8 @@ static int nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 	}
 
 	/* Mark block bad in BBT */
-	if (chip->bbt) {
-		res = nand_markbad_bbt(mtd, ofs);
+	if (nand_bbt) {
+		res = nand_bbt_markbad(nand_bbt, ofs);
 		if (!ret)
 			ret = res;
 	}
@@ -477,11 +478,12 @@ static int nand_check_wp(struct mtd_info *mtd)
 static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_bbt *nand_bbt = nand_get_bbt(chip);
 
-	if (!chip->bbt)
+	if (!nand_bbt)
 		return 0;
 	/* Return info from the table */
-	return nand_isreserved_bbt(mtd, ofs);
+	return nand_bbt_isreserved(nand_bbt, ofs);
 }
 
 /**
@@ -496,12 +498,18 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 static int nand_block_checkbad(struct mtd_info *mtd, loff_t ofs, int allowbbt)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_bbt *nand_bbt = nand_get_bbt(chip);
 
-	if (!chip->bbt)
+	if (!nand_bbt)
 		return chip->block_bad(mtd, ofs);
 
 	/* Return info from the table */
-	return nand_isbad_bbt(mtd, ofs, allowbbt);
+	if (nand_bbt_isbad(nand_bbt, ofs))
+		return 1;
+	else if (allowbbt)
+		return 0;
+	else
+		return nand_bbt_isreserved(nand_bbt, ofs);
 }
 
 /**
@@ -2996,6 +3004,129 @@ erase_exit:
 	return ret;
 }
 
+/* NAND BBT helper - erase a block, including reserved blocks */
+static int nand_bbt_erase_block(struct mtd_info *mtd, loff_t addr)
+{
+	struct erase_info einfo;
+	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	memset(&einfo, 0, sizeof(einfo));
+	einfo.mtd = mtd;
+	einfo.addr = addr;
+	einfo.len = 1ULL << chip->phys_erase_shift;
+
+	return nand_erase_nand(mtd, &einfo, 1);
+}
+
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
+/**
+ * nand_create_factory_badblock_pattern - [INTERN] Creates a BBT descriptor
+ * structure for factory bad block marker
+ * @chip: NAND chip to create descriptor for
+ *
+ * This function allocates and initializes a badblock_pattern for factory bad
+ * block marker based on the properties of @chip when chip.badblock_pattern
+ * is NULL.
+ */
+static int nand_create_factory_badblock_pattern(struct nand_chip *chip)
+{
+	struct nand_bbt_descr *bd;
+
+	if (chip->badblock_pattern) {
+		pr_warn("Bad block pattern already allocated; not replacing\n");
+		return -EINVAL;
+	}
+	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
+	if (!bd)
+		return -ENOMEM;
+	bd->options = chip->bbt_options & BADBLOCK_SCAN_MASK;
+	bd->offs = chip->badblockpos;
+	bd->len = (chip->options & NAND_BUSWIDTH_16) ? 2 : 1;
+	bd->pattern = scan_ff_pattern;
+	bd->options |= NAND_BADBLOCK_PATTERN_ALLOC;
+	chip->badblock_pattern = bd;
+
+	return 0;
+}
+
+static int nand_is_bad_bbm(struct mtd_info *mtd, loff_t addr)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct mtd_oob_ops ops;
+	struct nand_bbt_descr *bd = chip->badblock_pattern;
+	int j, ret;
+	int numpages;
+
+	if (bd->options & NAND_BBT_SCAN2NDPAGE)
+		numpages = 2;
+	else
+		numpages = 1;
+
+	if (bd->options & NAND_BBT_SCANLASTPAGE)
+		addr += mtd->erasesize - (mtd->writesize * numpages);
+
+	ops.ooblen = mtd->oobsize;
+	ops.oobbuf = chip->buffers->databuf;
+	ops.ooboffs = 0;
+	ops.datbuf = NULL;
+	ops.mode = MTD_OPS_PLACE_OOB;
+
+	for (j = 0; j < numpages; j++) {
+		/*
+		 * Read the full oob until read_oob is fixed to handle single
+		 * byte reads for 16 bit buswidth.
+		 */
+		ret = nand_do_read_oob(mtd, addr, &ops);
+		/* Ignore ECC errors when checking for BBM */
+		if (ret && !mtd_is_bitflip_or_eccerr(ret))
+			return ret;
+
+		if (memcmp(chip->buffers->databuf + bd->offs,
+				bd->pattern, bd->len))
+			return 1;
+
+		addr += mtd->writesize;
+	}
+
+	return 0;
+}
+
+static const struct nand_bbt_ops default_bbt_ops = {
+	.erase = nand_bbt_erase_block,
+	.is_bad_bbm = nand_is_bad_bbm,
+};
+
+static int nand_default_bbt(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_bbt *nand_bbt = NULL;
+	struct nand_chip_layout_info *info =
+		kzalloc(sizeof(struct nand_chip_layout_info), GFP_KERNEL);
+
+	if (!info)
+		return -ENOMEM;
+
+	info->numchips = chip->numchips;
+	info->chipsize = chip->chipsize;
+	info->chip_shift = chip->chip_shift;
+	info->bbt_erase_shift = chip->phys_erase_shift;
+	info->page_shift = chip->page_shift;
+
+	if (!chip->badblock_pattern &&
+		nand_create_factory_badblock_pattern(chip))
+		return -ENOMEM;
+
+	nand_bbt = nand_bbt_create(mtd, &default_bbt_ops,
+				info, chip->bbt_options,
+				chip->bbt_td, chip->bbt_md);
+	if (IS_ERR(nand_bbt))
+		return PTR_ERR(nand_bbt);
+	chip->nand_bbt = nand_bbt;
+
+	return 0;
+}
+
 /**
  * nand_sync - [MTD Interface] sync
  * @mtd: MTD device structure
@@ -4456,20 +4587,22 @@ EXPORT_SYMBOL(nand_scan);
 void nand_release(struct mtd_info *mtd)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_bbt *nand_bbt = nand_get_bbt(chip);
 
 	if (chip->ecc.mode == NAND_ECC_SOFT_BCH)
 		nand_bch_free((struct nand_bch_control *)chip->ecc.priv);
 
 	mtd_device_unregister(mtd);
 
-	/* Free bad block table memory */
-	kfree(chip->bbt);
+	/* Destroy bad block table */
+	if (nand_bbt)
+		nand_bbt_destroy(nand_bbt);
 	if (!(chip->options & NAND_OWN_BUFFERS))
 		kfree(chip->buffers);
 
 	/* Free bad block descriptor memory */
 	if (chip->badblock_pattern && chip->badblock_pattern->options
-			& NAND_BBT_DYNAMICSTRUCT)
+			& NAND_BADBLOCK_PATTERN_ALLOC)
 		kfree(chip->badblock_pattern);
 }
 EXPORT_SYMBOL_GPL(nand_release);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 56574ba..5072041 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -204,6 +204,12 @@ typedef enum {
  */
 #define NAND_USE_BOUNCE_BUFFER	0x00100000
 
+/*
+ * Flag to mark that the badblock_pattern is allocated dynamicaly and must
+ * be freed in nand_release().
+ */
+#define NAND_BADBLOCK_PATTERN_ALLOC	0x08000000
+
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */
 #define NAND_CONTROLLER_ALLOC	0x80000000
@@ -646,6 +652,8 @@ struct nand_buffers {
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
  * @bbt:		[INTERN] bad block table pointer
+ * @nand_bbt:		[INTERN] pointer to bad block table structure, which
+ *			includes all information needed by Bad Block Management
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
  *			lookup.
  * @bbt_md:		[REPLACEABLE] bad block table mirror descriptor
@@ -732,6 +740,7 @@ struct nand_chip {
 	struct nand_hw_control hwcontrol;
 
 	uint8_t *bbt;
+	struct nand_bbt *nand_bbt;
 	struct nand_bbt_descr *bbt_td;
 	struct nand_bbt_descr *bbt_md;
 
@@ -884,7 +893,6 @@ struct nand_manufacturers {
 extern struct nand_flash_dev nand_flash_ids[];
 extern struct nand_manufacturers nand_manuf_ids[];
 
-extern int nand_default_bbt(struct mtd_info *mtd);
 extern int nand_markbad_bbt(struct mtd_info *mtd, loff_t offs);
 extern int nand_isreserved_bbt(struct mtd_info *mtd, loff_t offs);
 extern int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt);
@@ -1014,6 +1022,11 @@ static inline int jedec_feature(struct nand_chip *chip)
 		: 0;
 }
 
+static inline struct nand_bbt *nand_get_bbt(struct nand_chip *chip)
+{
+	return chip->nand_bbt;
+}
+
 /*
  * struct nand_sdr_timings - SDR NAND chip timings
  *
-- 
1.9.1
