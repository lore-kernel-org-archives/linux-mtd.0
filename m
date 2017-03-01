Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cizpO-0002Mm-Nw
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 08:41:46 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v2 4/6] nand: spi: Add BBT support
Date: Wed, 1 Mar 2017 16:52:08 +0800
Message-ID: <1488358330-23832-5-git-send-email-peterpandong@micron.com>
In-Reply-To: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
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

This commit enables BBT for spi nand. spi nand shares
the same BBT code with raw nand.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/spinand_base.c | 198 ++++++++++++++++++++++++++++++++----
 1 file changed, 178 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/spi/spinand_base.c b/drivers/mtd/nand/spi/spinand_base.c
index 442997d..6848289 100644
--- a/drivers/mtd/nand/spi/spinand_base.c
+++ b/drivers/mtd/nand/spi/spinand_base.c
@@ -1034,13 +1034,35 @@ static int spinand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 }
 
 /**
+ * spinand_block_checkbad - Check if a block is marked bad
+ * @mtd: MTD device structure
+ * @ofs: offset from device start
+ * @getchip: 0, if the chip is already selected
+ * @allowbbt: 1, if its allowed to access the bbt area
+ *
+ * Check, if the block is bad. Either by reading the bad block table or
+ * calling of the scan function.
+ */
+static int spinand_block_checkbad(struct mtd_info *mtd, loff_t ofs,
+			int getchip, int allowbbt)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+
+	if (!nand->bbt.bbt)
+		return spinand_block_bad(mtd, ofs, getchip);
+
+	/* Return info from the table */
+	return nand_isbad_bbt(nand, ofs, allowbbt);
+}
+
+/**
  * spinand_block_isbad - [MTD Interface] Check if block at offset is bad
  * @mtd: MTD device structure
  * @offs: offset relative to mtd start
  */
 static int spinand_block_isbad(struct mtd_info *mtd, loff_t offs)
 {
-	return spinand_block_bad(mtd, offs, 1);
+	return spinand_block_checkbad(mtd, offs, 1, 0);
 }
 
 /**
@@ -1067,22 +1089,31 @@ static int spinand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 	struct erase_info einfo = {0};
 	u32 block_addr;
 	u8 buf[2] = {0, 0};
-	int ret = 0;
-
-	/*erase bad block before mark bad block*/
-	einfo.mtd = mtd;
-	einfo.addr = ofs;
-	einfo.len = nand_eraseblock_size(nand);
-	spinand_erase(mtd, &einfo);
+	int res, ret = 0;
+
+	if (!nand->bbt.bbt || !(nand->bbt.options & NAND_BBT_NO_OOB_BBM)) {
+		/*erase bad block before mark bad block*/
+		einfo.mtd = mtd;
+		einfo.addr = ofs;
+		einfo.len = nand_eraseblock_size(nand);
+		spinand_erase(mtd, &einfo);
+
+		block_addr = nand_offs_to_eraseblock(nand, ofs);
+		ops.mode = MTD_OPS_PLACE_OOB;
+		ops.ooblen = 2;
+		ops.oobbuf = buf;
+		spinand_get_device(mtd_to_spinand(mtd));
+		ret = spinand_do_write_ops(mtd,
+			nand_eraseblock_to_offs(nand, block_addr), &ops);
+		spinand_release_device(mtd_to_spinand(mtd));
+	}
 
-	block_addr = nand_offs_to_eraseblock(nand, ofs);
-	ops.mode = MTD_OPS_PLACE_OOB;
-	ops.ooblen = 2;
-	ops.oobbuf = buf;
-	spinand_get_device(mtd_to_spinand(mtd));
-	ret = spinand_do_write_ops(mtd,
-		nand_eraseblock_to_offs(nand, block_addr), &ops);
-	spinand_release_device(mtd_to_spinand(mtd));
+	/* Mark block bad in BBT */
+	if (nand->bbt.bbt) {
+		res = nand_markbad_bbt(nand, ofs);
+		if (!ret)
+			ret = res;
+	}
 
 	if (!ret)
 		mtd->ecc_stats.badblocks++;
@@ -1112,13 +1143,15 @@ static int spinand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 }
 
 /**
- * spinand_erase - [MTD Interface] erase block(s)
+ * __spinand_erase - erase block(s)
  * @mtd: MTD device structure
  * @einfo: erase instruction
+ * @allowbbt: allow to access bbt
  *
  * Erase one ore more blocks
  */
-static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
+static int __spinand_erase(struct mtd_info *mtd, struct erase_info *einfo,
+			int allowbbt)
 {
 	struct spinand_device *chip = mtd_to_spinand(mtd);
 	struct nand_device *nand = mtd_to_nand(mtd);
@@ -1152,7 +1185,7 @@ static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
 
 	while (len) {
 		/* Check if we have a bad block, we do not erase bad blocks! */
-		if (spinand_block_bad(mtd, offs, 0)) {
+		if (spinand_block_checkbad(mtd, offs, 0, allowbbt)) {
 			pr_warn("%s: attempt to erase a bad block at 0x%012llx\n",
 			__func__, offs);
 			einfo->state = MTD_ERASE_FAILED;
@@ -1193,6 +1226,55 @@ static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
 	/* Return more or less happy */
 	return ret;
 }
+
+/**
+ * spinand_erase - [MTD Interface] erase block(s)
+ * @mtd: MTD device structure
+ * @einfo: erase instruction
+ *
+ * Erase one ore more blocks
+ */
+static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
+{
+	return __spinand_erase(mtd, einfo, 0);
+}
+
+
+static int spinand_erase_bbt(struct nand_device *nand, struct erase_info *einfo)
+{
+	return __spinand_erase(nand_to_mtd(nand), einfo, 1);
+}
+
+static int spinand_markbad(struct nand_device *nand, int block)
+{
+	struct mtd_oob_ops ops = {0};
+	u8 buf[2] = {0, 0};
+
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ops.ooboffs = 0;
+	ops.ooblen = 2;
+	ops.oobbuf = buf;
+
+	return spinand_do_write_ops(nand_to_mtd(nand),
+		nand_eraseblock_to_offs(nand, block), &ops);
+}
+
+/**
+ * spinand_block_isreserved - [MTD Interface] Check if a block is
+ * marked reserved.
+ * @mtd: MTD device structure
+ * @ofs: offset from device start
+ */
+static int spinand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+
+	if (!nand->bbt.bbt)
+		return 0;
+	/* Return info from the table */
+	return nand_isreserved_bbt(nand, ofs);
+}
+
 /**
  * spinand_scan_id_table - scan chip info in id table
  * @chip: SPI-NAND device structure
@@ -1260,6 +1342,74 @@ static void spinand_set_rd_wr_op(struct spinand_device *chip)
 		chip->write_cache_op = SPINAND_CMD_PROG_LOAD;
 }
 
+static const struct nand_ops spinand_ops = {
+	.erase = spinand_erase_bbt,
+	.markbad = spinand_markbad,
+};
+
+/*
+ * Define some generic bad / good block scan pattern which are used
+ * while scanning a device for factory marked good / bad blocks.
+ */
+static uint8_t scan_ff_pattern[] = { 0xff, 0xff };
+
+#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
+
+/**
+ * nand_create_badblock_pattern - [INTERN] Creates a BBT descriptor structure
+ * @this: NAND chip to create descriptor for
+ * @chip: SPI-NAND device structure
+ *
+ * This function allocates and initializes a nand_bbt_descr for BBM detection
+ * based on the properties of @this. The new descriptor is stored in
+ * this->badblock_pattern. Thus, this->badblock_pattern should be NULL when
+ * passed to this function.
+ */
+static int spinand_create_badblock_pattern(struct spinand_device *chip)
+{
+	struct nand_device *nand = &chip->base;
+	struct nand_bbt_descr *bd;
+
+	if (nand->bbt.bbp) {
+		pr_warn("Bad block pattern already allocated; not replacing\n");
+		return -EINVAL;
+	}
+	bd = kzalloc(sizeof(*bd), GFP_KERNEL);
+	if (!bd)
+		return -ENOMEM;
+	bd->options = nand->bbt.options & BADBLOCK_SCAN_MASK;
+	bd->offs = 0;
+	bd->len = 2;
+	bd->pattern = scan_ff_pattern;
+	bd->options |= NAND_BBT_DYNAMICSTRUCT;
+	nand->bbt.bbp = bd;
+	return 0;
+}
+
+static int spinand_default_bbt(struct mtd_info *mtd)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	int ret;
+
+	nand->bbt.options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
+	nand->bbt.td = NULL;
+	nand->bbt.md = NULL;
+
+	ret = spinand_create_badblock_pattern(chip);
+	if (ret)
+		return ret;
+
+	return nand_scan_bbt(nand);
+}
+
+static void spinand_fill_nandd(struct spinand_device *chip)
+{
+	struct nand_device *nand = &chip->base;
+
+	nand->ops = &spinand_ops;
+}
+
 /*
  * Manufacturer detection. Only used when the NAND is not ONFI or JEDEC
  * compliant and does not have a full-id or legacy-id entry in the nand_ids
@@ -1372,6 +1522,7 @@ int spinand_scan_ident(struct spinand_device *chip, u8 expect_mfr_id)
 		return -ENOMEM;
 
 	chip->oobbuf = chip->buf + nand_page_size(nand);
+	spinand_fill_nandd(chip);
 	spinand_lock_block(chip, BL_ALL_UNLOCKED);
 
 	return 0;
@@ -1418,11 +1569,13 @@ int spinand_scan_tail(struct spinand_device *chip)
 	mtd->_write_oob = spinand_write_oob;
 	mtd->_block_isbad = spinand_block_isbad;
 	mtd->_block_markbad = spinand_block_markbad;
+	mtd->_block_isreserved = spinand_block_isreserved;
 
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
 
-	return 0;
+	/* Build bad block table */
+	return spinand_default_bbt(mtd);
 }
 EXPORT_SYMBOL_GPL(spinand_scan_tail);
 
@@ -1458,10 +1611,15 @@ int spinand_scan_tail_release(struct spinand_device *chip)
 int spinand_release(struct spinand_device *chip)
 {
 	struct mtd_info *mtd = spinand_to_mtd(chip);
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct nand_bbt_descr *bd = nand->bbt.bbp;
 
 	mtd_device_unregister(mtd);
 	spinand_manufacturer_cleanup(chip);
 	kfree(chip->buf);
+	kfree(nand->bbt.bbt);
+	if (bd->options & NAND_BBT_DYNAMICSTRUCT)
+		kfree(bd);
 
 	return 0;
 }
-- 
1.9.1
