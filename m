Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5D6-0007tv-2h
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 07:50:10 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH 09/11] nand: spi: Add BBT support
Date: Tue, 21 Feb 2017 16:00:08 +0800
Message-ID: <1487664010-25926-10-git-send-email-peterpandong@micron.com>
In-Reply-To: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
References: <1487664010-25926-1-git-send-email-peterpandong@micron.com>
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

This commit enables BBT for SPI NAND. We also define
SPINAND_SKIP_BBTSCAN to skip to use BBT for some
chipset vendors' request.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/spi-nand-base.c | 195 +++++++++++++++++++++++++++++++----
 include/linux/mtd/spi-nand.h         |   1 +
 2 files changed, 176 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/nand/spi/spi-nand-base.c b/drivers/mtd/nand/spi/spi-nand-base.c
index 57986d5..5ac4b26 100644
--- a/drivers/mtd/nand/spi/spi-nand-base.c
+++ b/drivers/mtd/nand/spi/spi-nand-base.c
@@ -960,6 +960,27 @@ static int spi_nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 	return ret;
 }
 
+/**
+ * spi_nand_block_checkbad - Check if a block is marked bad
+ * @mtd: MTD device structure
+ * @ofs: offset from device start
+ * @getchip: 0, if the chip is already selected
+ * @allowbbt: 1, if its allowed to access the bbt area
+ *
+ * Check, if the block is bad. Either by reading the bad block table or
+ * calling of the scan function.
+ */
+static int spi_nand_block_checkbad(struct mtd_info *mtd, loff_t ofs,
+			int getchip, int allowbbt)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+
+	if (!nand->bbt.bbt)
+		return spi_nand_block_bad(mtd, ofs, getchip);
+
+	/* Return info from the table */
+	return nand_isbad_bbt(nand, ofs, allowbbt);
+}
 
 /**
  * spi_nand_block_isbad - [MTD Interface] Check if block at offset is bad
@@ -968,7 +989,7 @@ static int spi_nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
  */
 static int spi_nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 {
-	return spi_nand_block_bad(mtd, offs, 1);
+	return spi_nand_block_checkbad(mtd, offs, 1, 0);
 }
 
 /**
@@ -995,22 +1016,31 @@ static int spi_nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
 	struct erase_info einfo = {0};
 	u32 block_addr;
 	u8 buf[2] = {0, 0};
-	int ret = 0;
-
-	/*erase bad block before mark bad block*/
-	einfo.mtd = mtd;
-	einfo.addr = ofs;
-	einfo.len = nand_eraseblock_size(nand);
-	spi_nand_erase(mtd, &einfo);
+	int res, ret = 0;
+
+	if (!nand->bbt.bbt || !(nand->bbt.options & NAND_BBT_NO_OOB_BBM)) {
+		/*erase bad block before mark bad block*/
+		einfo.mtd = mtd;
+		einfo.addr = ofs;
+		einfo.len = nand_eraseblock_size(nand);
+		spi_nand_erase(mtd, &einfo);
+
+		block_addr = nand_offs_to_eraseblock(nand, ofs);
+		ops.mode = MTD_OPS_PLACE_OOB;
+		ops.ooblen = 2;
+		ops.oobbuf = buf;
+		spi_nand_get_device(mtd, FL_WRITING);
+		ret = spi_nand_do_write_ops(mtd,
+			nand_eraseblock_to_offs(nand, block_addr), &ops);
+		spi_nand_release_device(mtd);
+	}
 
-	block_addr = nand_offs_to_eraseblock(nand, ofs);
-	ops.mode = MTD_OPS_PLACE_OOB;
-	ops.ooblen = 2;
-	ops.oobbuf = buf;
-	spi_nand_get_device(mtd, FL_WRITING);
-	ret = spi_nand_do_write_ops(mtd,
-		nand_eraseblock_to_offs(nand, block_addr), &ops);
-	spi_nand_release_device(mtd);
+	/* Mark block bad in BBT */
+	if (nand->bbt.bbt) {
+		res = nand_markbad_bbt(nand, ofs);
+		if (!ret)
+			ret = res;
+	}
 
 	if (!ret)
 		mtd->ecc_stats.badblocks++;
@@ -1040,13 +1070,15 @@ static int spi_nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 }
 
 /**
- * spi_nand_erase - [MTD Interface] erase block(s)
+ * __spi_nand_erase - erase block(s)
  * @mtd: MTD device structure
  * @einfo: erase instruction
+ * @allowbbt: allow to access bbt
  *
  * Erase one ore more blocks
  */
-static int spi_nand_erase(struct mtd_info *mtd, struct erase_info *einfo)
+static int __spi_nand_erase(struct mtd_info *mtd, struct erase_info *einfo,
+			int allowbbt)
 {
 	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
 	struct nand_device *nand = mtd_to_nand(mtd);
@@ -1081,7 +1113,7 @@ static int spi_nand_erase(struct mtd_info *mtd, struct erase_info *einfo)
 
 	while (len) {
 		/* Check if we have a bad block, we do not erase bad blocks! */
-		if (spi_nand_block_bad(mtd, offs, 0)) {
+		if (spi_nand_block_checkbad(mtd, offs, 0, allowbbt)) {
 			pr_warn("%s: attempt to erase a bad block at 0x%012llx\n",
 			__func__, offs);
 			einfo->state = MTD_ERASE_FAILED;
@@ -1124,6 +1156,55 @@ static int spi_nand_erase(struct mtd_info *mtd, struct erase_info *einfo)
 }
 
 /**
+ * spi_nand_erase - [MTD Interface] erase block(s)
+ * @mtd: MTD device structure
+ * @einfo: erase instruction
+ *
+ * Erase one ore more blocks
+ */
+static int spi_nand_erase(struct mtd_info *mtd, struct erase_info *einfo)
+{
+	return __spi_nand_erase(mtd, einfo, 0);
+}
+
+
+static int spi_nand_erase_bbt(struct nand_device *nand, struct erase_info *einfo)
+{
+	return __spi_nand_erase(nand_to_mtd(nand), einfo, 1);
+}
+
+static int spi_nand_markbad(struct nand_device *nand, int block)
+{
+	struct mtd_oob_ops ops = {0};
+	u8 buf[2] = {0, 0};
+
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ops.ooboffs = 0;
+	ops.ooblen = 2;
+	ops.oobbuf = buf;
+
+	return spi_nand_do_write_ops(nand_to_mtd(nand),
+		nand_eraseblock_to_offs(nand, block), &ops);
+
+}
+
+/**
+ * spi_nand_block_isreserved - [MTD Interface] Check if a block is
+ * marked reserved.
+ * @mtd: MTD device structure
+ * @ofs: offset from device start
+ */
+static int spi_nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+
+	if (!nand->bbt.bbt)
+		return 0;
+	/* Return info from the table */
+	return nand_isreserved_bbt(nand, ofs);
+}
+
+/**
  * spi_nand_scan_id_table - scan chip info in id table
  * @chip: SPI-NAND device structure
  * @id: point to manufacture id and device id
@@ -1191,6 +1272,74 @@ static void spi_nand_set_rd_wr_op(struct spi_nand_chip *chip)
 		chip->write_cache_op = SPINAND_CMD_PROG_LOAD;
 }
 
+static const struct nand_ops spi_nand_ops = {
+	.erase = spi_nand_erase_bbt,
+	.markbad = spi_nand_markbad,
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
+static int spi_nand_create_badblock_pattern(struct spi_nand_chip *chip)
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
+static int spi_nand_default_bbt(struct mtd_info *mtd)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct spi_nand_chip *chip = mtd_to_spi_nand(mtd);
+	int ret;
+
+	nand->bbt.options |= NAND_BBT_USE_FLASH | NAND_BBT_NO_OOB;
+	nand->bbt.td = NULL;
+	nand->bbt.md = NULL;
+
+	ret = spi_nand_create_badblock_pattern(chip);
+	if (ret)
+		return ret;
+
+	return nand_scan_bbt(nand);
+}
+
+static void spi_nand_fill_nandd(struct spi_nand_chip *chip)
+{
+	struct nand_device *nand = &chip->base;
+
+	nand->ops = &spi_nand_ops;
+}
+
 /**
  * spi_nand_scan_ident - [SPI-NAND Interface] Scan for the SPI-NAND device
  * @chip: SPI-NAND device structure
@@ -1232,6 +1381,7 @@ int spi_nand_scan_ident(struct spi_nand_chip *chip)
 		return -ENOMEM;
 
 	chip->oobbuf = chip->buf + nand_page_size(nand);
+	spi_nand_fill_nandd(chip);
 	spi_nand_lock_block(chip, BL_ALL_UNLOCKED);
 
 	return 0;
@@ -1281,11 +1431,16 @@ int spi_nand_scan_tail(struct spi_nand_chip *chip)
 	mtd->_write_oob = spi_nand_write_oob;
 	mtd->_block_isbad = spi_nand_block_isbad;
 	mtd->_block_markbad = spi_nand_block_markbad;
+	mtd->_block_isreserved = spi_nand_block_isreserved;
 
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
 
-	return 0;
+	/* Check, if we should skip the bad block table scan */
+	if (chip->options & SPINAND_SKIP_BBTSCAN)
+		return 0;
+	/* Build bad block table */
+	return spi_nand_default_bbt(mtd);
 }
 EXPORT_SYMBOL_GPL(spi_nand_scan_tail);
 
diff --git a/include/linux/mtd/spi-nand.h b/include/linux/mtd/spi-nand.h
index cdacec4..5f362b6 100644
--- a/include/linux/mtd/spi-nand.h
+++ b/include/linux/mtd/spi-nand.h
@@ -251,6 +251,7 @@ struct spi_nand_cmd_cfg {
 
 /*SPI NAND chip options*/
 #define SPINAND_NEED_PLANE_SELECT	(1 << 0)
+#define SPINAND_SKIP_BBTSCAN		(1 << 3)
 
 /*SPI NAND manufacture ID definition*/
 #define SPINAND_MFR_MICRON		0x2C
-- 
1.9.1
