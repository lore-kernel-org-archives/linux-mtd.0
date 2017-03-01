Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cizpF-0002LT-QL
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 08:41:37 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v2 3/6] nand: spi: Add bad block support
Date: Wed, 1 Mar 2017 16:52:07 +0800
Message-ID: <1488358330-23832-4-git-send-email-peterpandong@micron.com>
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

Add isbad and markbad support for SPI NAND. And do not
erase bad blocks in spi_nand_erase.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/spinand_base.c | 116 ++++++++++++++++++++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/drivers/mtd/nand/spi/spinand_base.c b/drivers/mtd/nand/spi/spinand_base.c
index 1bc57e9..442997d 100644
--- a/drivers/mtd/nand/spi/spinand_base.c
+++ b/drivers/mtd/nand/spi/spinand_base.c
@@ -1003,6 +1003,113 @@ static int spinand_write_oob(struct mtd_info *mtd, loff_t to,
 	return ret;
 }
 
+/**
+ * spinand_block_bad - Check if block at offset is bad
+ * @mtd: MTD device structure
+ * @offs: offset relative to mtd start
+ * @getchip: 0, if the chip is already selected
+ */
+static int spinand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct mtd_oob_ops ops = {0};
+	u32 block_addr;
+	u8 bad[2] = {0, 0};
+	u8 ret = 0;
+
+	block_addr = nand_offs_to_eraseblock(nand, ofs);
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ops.ooblen = 2;
+	ops.oobbuf = bad;
+
+	if (getchip)
+		spinand_get_device(mtd_to_spinand(mtd));
+	spinand_do_read_ops(mtd, nand_eraseblock_to_offs(nand, block_addr), &ops);
+	if (getchip)
+		spinand_release_device(mtd_to_spinand(mtd));
+	if (bad[0] != 0xFF || bad[1] != 0xFF)
+		ret =  1;
+
+	return ret;
+}
+
+/**
+ * spinand_block_isbad - [MTD Interface] Check if block at offset is bad
+ * @mtd: MTD device structure
+ * @offs: offset relative to mtd start
+ */
+static int spinand_block_isbad(struct mtd_info *mtd, loff_t offs)
+{
+	return spinand_block_bad(mtd, offs, 1);
+}
+
+/**
+ * spinand_block_markbad_lowlevel - mark a block bad
+ * @mtd: MTD device structure
+ * @ofs: offset from device start
+ *
+ * This function performs the generic bad block marking steps (i.e., bad
+ * block table(s) and/or marker(s)). We only allow the hardware driver to
+ * specify how to write bad block markers to OOB (chip->block_markbad).
+ *
+ * We try operations in the following order:
+ *  (1) erase the affected block, to allow OOB marker to be written cleanly
+ *  (2) write bad block marker to OOB area of affected block (unless flag
+ *      NAND_BBT_NO_OOB_BBM is present)
+ *  (3) update the BBT
+ * Note that we retain the first error encountered in (2) or (3), finish the
+ * procedures, and dump the error in the end.
+*/
+static int spinand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
+{
+	struct nand_device *nand = mtd_to_nand(mtd);
+	struct mtd_oob_ops ops = {0};
+	struct erase_info einfo = {0};
+	u32 block_addr;
+	u8 buf[2] = {0, 0};
+	int ret = 0;
+
+	/*erase bad block before mark bad block*/
+	einfo.mtd = mtd;
+	einfo.addr = ofs;
+	einfo.len = nand_eraseblock_size(nand);
+	spinand_erase(mtd, &einfo);
+
+	block_addr = nand_offs_to_eraseblock(nand, ofs);
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ops.ooblen = 2;
+	ops.oobbuf = buf;
+	spinand_get_device(mtd_to_spinand(mtd));
+	ret = spinand_do_write_ops(mtd,
+		nand_eraseblock_to_offs(nand, block_addr), &ops);
+	spinand_release_device(mtd_to_spinand(mtd));
+
+	if (!ret)
+		mtd->ecc_stats.badblocks++;
+
+	return ret;
+}
+
+/**
+ * spinand_block_markbad - [MTD Interface] Mark block at the given offset
+ * as bad
+ * @mtd: MTD device structure
+ * @ofs: offset relative to mtd start
+ */
+static int spinand_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	int ret;
+
+	ret = spinand_block_isbad(mtd, ofs);
+	if (ret) {
+		/* If it was bad already, return success and do nothing */
+		if (ret > 0)
+			return 0;
+		return ret;
+	}
+
+	return spinand_block_markbad_lowlevel(mtd, ofs);
+}
 
 /**
  * spinand_erase - [MTD Interface] erase block(s)
@@ -1044,6 +1151,13 @@ static int spinand_erase(struct mtd_info *mtd, struct erase_info *einfo)
 	einfo->state = MTD_ERASING;
 
 	while (len) {
+		/* Check if we have a bad block, we do not erase bad blocks! */
+		if (spinand_block_bad(mtd, offs, 0)) {
+			pr_warn("%s: attempt to erase a bad block at 0x%012llx\n",
+			__func__, offs);
+			einfo->state = MTD_ERASE_FAILED;
+			goto erase_exit;
+		}
 		spinand_write_enable(chip);
 		spinand_erase_block(chip, nand_offs_to_page(nand, offs));
 		ret = spinand_wait(chip, &status);
@@ -1302,6 +1416,8 @@ int spinand_scan_tail(struct spinand_device *chip)
 	mtd->_write = spinand_write;
 	mtd->_read_oob = spinand_read_oob;
 	mtd->_write_oob = spinand_write_oob;
+	mtd->_block_isbad = spinand_block_isbad;
+	mtd->_block_markbad = spinand_block_markbad;
 
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
-- 
1.9.1
