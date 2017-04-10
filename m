Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxTw2-0001qS-Ld
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 07:40:43 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@atmel.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v5 3/6] nand: spi: Add bad block support
Date: Mon, 10 Apr 2017 15:51:50 +0800
Message-ID: <1491810713-27795-4-git-send-email-peterpandong@micron.com>
In-Reply-To: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
References: <1491810713-27795-1-git-send-email-peterpandong@micron.com>
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

Add isbad and markbad support for SPI NAND. And do not
erase bad blocks in spi_nand_erase. BBT is also enabled
in this patch.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/core.c | 329 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 322 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index eb7af9d..52113fc 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -19,6 +19,10 @@
 #include <linux/jiffies.h>
 #include <linux/mtd/spinand.h>
 #include <linux/slab.h>
+#include <linux/of.h>
+
+static int spinand_erase_skip_bbt(struct mtd_info *mtd,
+				  struct erase_info *einfo);
 
 /*
  * spinand_exec_op - execute SPI NAND operation by controller ->exec_op() hook
@@ -878,11 +882,154 @@ static int spinand_write_oob(struct mtd_info *mtd, loff_t to,
 }
 
 /*
- * spinand_erase - [MTD Interface] erase block(s)
+ * spinand_block_bad - check if block at offset is bad by bad block marker
+ * @mtd: MTD device structure
+ * @offs: offset from device start
+ */
+static int spinand_block_bad(struct mtd_info *mtd, loff_t offs)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct mtd_oob_ops ops = {0};
+	u32 block_addr;
+	u8 bad[2] = {0, 0};
+	u8 ret = 0;
+	unsigned int max_bitflips;
+
+	block_addr = nand_offs_to_eraseblock(nand, offs);
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ops.ooblen = 2;
+	ops.oobbuf = bad;
+	spinand_read_pages(mtd, nand_eraseblock_to_offs(nand, block_addr),
+			   &ops, &max_bitflips);
+	if (bad[0] != 0xFF || bad[1] != 0xFF)
+		ret =  1;
+
+	return ret;
+}
+
+/*
+ * spinand_block_checkbad - check if a block is marked bad
+ * @mtd: MTD device structure
+ * @offs: offset from device start
+ * @allowbbt: 1, if allowe to access the bbt area
+ * Description:
+ *   Check, if the block is bad. Either by reading the bad block table or
+ *   reading bad block marker.
+ */
+static int spinand_block_checkbad(struct mtd_info *mtd, loff_t offs,
+				  int allowbbt)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+	int ret;
+
+	if (nand_bbt_is_initialized(nand))
+		ret = nand_isbad_bbt(nand, offs, allowbbt);
+	else
+		ret = spinand_block_bad(mtd, offs);
+
+	return ret;
+}
+
+/*
+ * spinand_block_isbad - [MTD Interface] check if block at offset is bad
+ * @mtd: MTD device structure
+ * @offs: offset from device start
+ */
+static int spinand_block_isbad(struct mtd_info *mtd, loff_t offs)
+{
+	struct spinand_device *chip = mtd_to_spinand(mtd);
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = spinand_block_checkbad(mtd, offs, 0);
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+/*
+ * spinand_block_markbad_lowlevel - mark a block bad
+ * @mtd: MTD device structure
+ * @offs: offset from device start
+ *
+ * This function performs the generic bad block marking steps (i.e., bad
+ * block table(s) and/or marker(s)).
+ *
+ * We try operations in the following order:
+ *  (1) erase the affected block, to allow OOB marker to be written cleanly
+ *  (2) write bad block marker to OOB area of affected block (unless flag
+ *      NAND_BBT_NO_OOB_BBM is present)
+ *  (3) update the BBT
+ */
+static int spinand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t offs)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct mtd_oob_ops ops = {0};
+	struct erase_info einfo = {0};
+	u32 block_addr;
+	u8 buf[2] = {0, 0};
+	int res, ret = 0;
+
+	if (!nand_bbt_is_initialized(nand) ||
+	    !(nand->bbt.options & NAND_BBT_NO_OOB_BBM)) {
+		/*erase bad block before mark bad block*/
+		einfo.mtd = mtd;
+		einfo.addr = offs;
+		einfo.len = nand_eraseblock_size(nand);
+		spinand_erase_skip_bbt(mtd, &einfo);
+
+		block_addr = nand_offs_to_eraseblock(nand, offs);
+		ops.mode = MTD_OPS_PLACE_OOB;
+		ops.ooblen = 2;
+		ops.oobbuf = buf;
+		ret = spinand_do_write_ops(mtd,
+					   nand_eraseblock_to_offs(nand,
+								   block_addr),
+					   &ops);
+	}
+
+	/* Mark block bad in BBT */
+	if (nand_bbt_is_initialized(nand)) {
+		res = nand_markbad_bbt(nand, offs);
+		if (!ret)
+			ret = res;
+	}
+
+	if (!ret)
+		mtd->ecc_stats.badblocks++;
+
+	return ret;
+}
+
+/*
+ * spinand_block_markbad - [MTD Interface] mark block at the given offset
+ * as bad
+ * @mtd: MTD device structure
+ * @offs: offset relative to mtd start
+ */
+static int spinand_block_markbad(struct mtd_info *mtd, loff_t offs)
+{
+	int ret;
+
+	ret = spinand_block_isbad(mtd, offs);
+	if (ret) {
+		/* If it was bad already, return success and do nothing */
+		if (ret > 0)
+			return 0;
+		return ret;
+	}
+
+	return spinand_block_markbad_lowlevel(mtd, offs);
+}
+
+/*
+ * spinand_erase - erase block(s)
  * @mtd: MTD device structure
  * @einfo: erase instruction
+ * @allowbbt: allow to access bbt
  */
-static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
+static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo,
+			 int allowbbt)
 {
 	struct spinand_device *chip = mtd_to_spinand(mtd);
 	struct nand_device *nand = mtd_to_nand(mtd);
@@ -901,6 +1048,14 @@ static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
 	einfo->state = MTD_ERASING;
 
 	while (len) {
+		/* Check if we have a bad block, we do not erase bad blocks! */
+		if (spinand_block_checkbad(mtd, offs, allowbbt)) {
+			dev_warn(chip->dev,
+				"attempt to erase a bad block at 0x%012llx\n",
+				 offs);
+			einfo->state = MTD_ERASE_FAILED;
+			goto erase_exit;
+		}
 		spinand_write_enable(chip);
 		spinand_erase_block(chip, nand_offs_to_page(nand, offs));
 		ret = spinand_wait(chip, &status);
@@ -937,6 +1092,33 @@ static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
 }
 
 /*
+ * spinand_erase_skip_bbt - [MTD Interface] erase block(s) except BBT
+ * @mtd: MTD device structure
+ * @einfo: erase instruction
+ */
+static int spinand_erase_skip_bbt(struct mtd_info *mtd,
+				  struct erase_info *einfo)
+{
+	return spinand_erase(mtd, einfo, 0);
+}
+
+/*
+ * spinand_block_isreserved - [MTD Interface] check if a block is
+ * marked reserved.
+ * @mtd: MTD device structure
+ * @offs: offset from device start
+ */
+static int spinand_block_isreserved(struct mtd_info *mtd, loff_t offs)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+
+	if (!nand_bbt_is_initialized(nand))
+		return 0;
+	/* Return info from the table */
+	return nand_isreserved_bbt(nand, offs);
+}
+
+/*
  * spinand_set_rd_wr_op - choose the best read write command
  * @chip: SPI NAND device structure
  * Description:
@@ -970,6 +1152,106 @@ static void spinand_set_rd_wr_op(struct spinand_device *chip)
 		chip->write_cache_op = SPINAND_CMD_PROG_LOAD;
 }
 
+/*
+ * spinand_erase_bbt - erase block(s) including BBT
+ * @nand: nand device structure
+ * @einfo: erase instruction
+ */
+static int spinand_erase_bbt(struct nand_device *nand,
+			     struct erase_info *einfo)
+{
+	return spinand_erase(nand_to_mtd(nand), einfo, 1);
+}
+
+/*
+ * spinand_erase_bbt - write bad block marker to certain block
+ * @nand: nand device structure
+ * @block: block to mark bad
+ */
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
+				    nand_eraseblock_to_offs(nand, block),
+				    &ops);
+}
+
+static const struct nand_ops spinand_ops = {
+	.erase = spinand_erase_bbt,
+	.markbad = spinand_markbad,
+};
+
+/*
+ * Define some generic bad/good block scan pattern which are used
+ * while scanning a device for factory marked good/bad blocks.
+ */
+static u8 scan_ff_pattern[] = { 0xff, 0xff };
+
+#define BADBLOCK_SCAN_MASK (~NAND_BBT_NO_OOB)
+
+/*
+ * spinand_create_badblock_pattern - creates a BBT descriptor structure
+ * @chip: SPI NAND device structure
+ *
+ * This function allocates and initializes a nand_bbt_descr for BBM detection.
+ * The new descriptor is stored in nand->bbt.bbp. Thus, nand->bbt.bbp should
+ * be NULL when passed to this function.
+ */
+static int spinand_create_badblock_pattern(struct spinand_device *chip)
+{
+	struct nand_device *nand = &chip->base;
+	struct nand_bbt_descr *bd;
+
+	if (nand->bbt.bbp) {
+		dev_err(chip->dev,
+			"Bad block pattern already allocated; not replacing\n");
+		return -EINVAL;
+	}
+	bd = devm_kzalloc(chip->dev, sizeof(*bd), GFP_KERNEL);
+	if (!bd)
+		return -ENOMEM;
+	bd->options = nand->bbt.options & BADBLOCK_SCAN_MASK;
+	bd->offs = 0;
+	bd->len = 2;
+	bd->pattern = scan_ff_pattern;
+	bd->options |= NAND_BBT_DYNAMICSTRUCT;
+	nand->bbt.bbp = bd;
+
+	return 0;
+}
+
+/*
+ * spinand_scan_bbt - scan BBT in SPI NAND device
+ * @chip: SPI NAND device structure
+ */
+static int spinand_scan_bbt(struct spinand_device *chip)
+{
+	struct nand_device *nand = &chip->base;
+	int ret;
+
+	/*
+	 * It's better to put BBT marker in-band, since some oob area
+	 * is not ecc protected by internal(on-die) ECC
+	 */
+	if (nand->bbt.options & NAND_BBT_USE_FLASH)
+		nand->bbt.options |= NAND_BBT_NO_OOB;
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
 static const struct spinand_manufacturer *spinand_manufacturers[] = {};
 
 /*
@@ -1024,14 +1306,30 @@ static void spinand_manufacturer_cleanup(struct spinand_device *chip)
 }
 
 /*
+ * TODO: move of_get_nand_on_flash_bbt() to generic NAND core
+ */
+static bool of_get_nand_on_flash_bbt(struct device_node *np)
+{
+	return of_property_read_bool(np, "nand-on-flash-bbt");
+}
+
+/*
  * spinand_dt_init - Initialize SPI NAND by device tree node
  * @chip: SPI NAND device structure
  *
- * TODO: put ecc_mode, ecc_strength, ecc_step, bbt, etc in here
- * and move it in generic NAND core.
+ * TODO: put ecc_mode, ecc_strength, ecc_step, etc in here and move
+ * it in generic NAND core.
  */
 static void spinand_dt_init(struct spinand_device *chip)
 {
+	struct nand_device *nand = &chip->base;
+	struct device_node *dn = nand_get_of_node(nand);
+
+	if (!dn)
+		return;
+
+	if (of_get_nand_on_flash_bbt(dn))
+		nand->bbt.options |= NAND_BBT_USE_FLASH;
 }
 
 /*
@@ -1085,13 +1383,14 @@ static int spinand_init(struct spinand_device *chip)
 				 GFP_KERNEL);
 	if (!chip->buf) {
 		ret = -ENOMEM;
-		goto err;
+		goto err1;
 	}
 
 	chip->oobbuf = chip->buf + nand_page_size(nand);
 
 	spinand_manufacturer_init(chip);
 
+	nand->ops = &spinand_ops;
 	mtd->name = chip->name;
 	mtd->size = nand_size(nand);
 	mtd->erasesize = nand_eraseblock_size(nand);
@@ -1109,11 +1408,14 @@ static int spinand_init(struct spinand_device *chip)
 	if (ret < 0)
 		ret = 0;
 	mtd->oobavail = ret;
-	mtd->_erase = spinand_erase;
+	mtd->_erase = spinand_erase_skip_bbt;
 	mtd->_read = spinand_read;
 	mtd->_write = spinand_write;
 	mtd->_read_oob = spinand_read_oob;
 	mtd->_write_oob = spinand_write_oob;
+	mtd->_block_isbad = spinand_block_isbad;
+	mtd->_block_markbad = spinand_block_markbad;
+	mtd->_block_isreserved = spinand_block_isreserved;
 
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3,
@@ -1121,9 +1423,18 @@ static int spinand_init(struct spinand_device *chip)
 	/* After power up, all blocks are locked, so unlock it here. */
 	spinand_lock_block(chip, BL_ALL_UNLOCKED);
 
+	/* Build bad block table */
+	ret = spinand_scan_bbt(chip);
+	if (ret) {
+		dev_err(chip->dev, "Scan Bad Block Table failed.\n");
+		goto err2;
+	}
+
 	return nand_register(nand);
 
-err:
+err2:
+	devm_kfree(chip->dev, chip->buf);
+err1:
 	return ret;
 }
 
@@ -1191,10 +1502,14 @@ int spinand_register(struct spinand_device *chip)
 int spinand_unregister(struct spinand_device *chip)
 {
 	struct nand_device *nand = &chip->base;
+	struct nand_bbt_descr *bd = nand->bbt.bbp;
 
 	nand_unregister(nand);
 	spinand_manufacturer_cleanup(chip);
 	devm_kfree(chip->dev, chip->buf);
+	kfree(nand->bbt.bbt);
+	if (bd->options & NAND_BBT_DYNAMICSTRUCT)
+		devm_kfree(chip->dev, bd);
 
 	return 0;
 }
-- 
1.9.1
