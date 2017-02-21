Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cg5D1-0007tJ-34
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 07:50:05 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH 08/11] nand: spi: Add bad block support
Date: Tue, 21 Feb 2017 16:00:07 +0800
Message-ID: <1487664010-25926-9-git-send-email-peterpandong@micron.com>
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

Add isbad and markbad support for SPI NAND. And do not
erase bad blocks in spi_nand_erase.

Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 drivers/mtd/nand/spi/spi-nand-base.c | 120 +++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/drivers/mtd/nand/spi/spi-nand-base.c b/drivers/mtd/nand/spi/spi-nand-base.c
index c77721d..57986d5 100644
--- a/drivers/mtd/nand/spi/spi-nand-base.c
+++ b/drivers/mtd/nand/spi/spi-nand-base.c
@@ -34,6 +34,8 @@
 	{.name = NULL},
 };
 
+static int spi_nand_erase(struct mtd_info *mtd, struct erase_info *einfo);
+
 /**
  * spi_nand_get_device - [GENERIC] Get chip for selected access
  * @mtd: MTD device structure
@@ -929,6 +931,115 @@ static int spi_nand_write_oob(struct mtd_info *mtd, loff_t to,
 }
 
 /**
+ * spi_nand_block_bad - Check if block at offset is bad
+ * @mtd: MTD device structure
+ * @offs: offset relative to mtd start
+ * @getchip: 0, if the chip is already selected
+ */
+static int spi_nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
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
+		spi_nand_get_device(mtd, FL_READING);
+	spi_nand_do_read_ops(mtd, nand_eraseblock_to_offs(nand, block_addr), &ops);
+	if (getchip)
+		spi_nand_release_device(mtd);
+	if (bad[0] != 0xFF || bad[1] != 0xFF)
+		ret =  1;
+
+	return ret;
+}
+
+
+/**
+ * spi_nand_block_isbad - [MTD Interface] Check if block at offset is bad
+ * @mtd: MTD device structure
+ * @offs: offset relative to mtd start
+ */
+static int spi_nand_block_isbad(struct mtd_info *mtd, loff_t offs)
+{
+	return spi_nand_block_bad(mtd, offs, 1);
+}
+
+/**
+ * spi_nand_block_markbad_lowlevel - mark a block bad
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
+static int spi_nand_block_markbad_lowlevel(struct mtd_info *mtd, loff_t ofs)
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
+	spi_nand_erase(mtd, &einfo);
+
+	block_addr = nand_offs_to_eraseblock(nand, ofs);
+	ops.mode = MTD_OPS_PLACE_OOB;
+	ops.ooblen = 2;
+	ops.oobbuf = buf;
+	spi_nand_get_device(mtd, FL_WRITING);
+	ret = spi_nand_do_write_ops(mtd,
+		nand_eraseblock_to_offs(nand, block_addr), &ops);
+	spi_nand_release_device(mtd);
+
+	if (!ret)
+		mtd->ecc_stats.badblocks++;
+
+	return ret;
+}
+
+/**
+ * spi_nand_block_markbad - [MTD Interface] Mark block at the given offset
+ * as bad
+ * @mtd: MTD device structure
+ * @ofs: offset relative to mtd start
+ */
+static int spi_nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
+{
+	int ret;
+
+	ret = spi_nand_block_isbad(mtd, ofs);
+	if (ret) {
+		/* If it was bad already, return success and do nothing */
+		if (ret > 0)
+			return 0;
+		return ret;
+	}
+
+	return spi_nand_block_markbad_lowlevel(mtd, ofs);
+}
+
+/**
  * spi_nand_erase - [MTD Interface] erase block(s)
  * @mtd: MTD device structure
  * @einfo: erase instruction
@@ -969,6 +1080,13 @@ static int spi_nand_erase(struct mtd_info *mtd, struct erase_info *einfo)
 	einfo->state = MTD_ERASING;
 
 	while (len) {
+		/* Check if we have a bad block, we do not erase bad blocks! */
+		if (spi_nand_block_bad(mtd, offs, 0)) {
+			pr_warn("%s: attempt to erase a bad block at 0x%012llx\n",
+			__func__, offs);
+			einfo->state = MTD_ERASE_FAILED;
+			goto erase_exit;
+		}
 		spi_nand_write_enable(chip);
 		spi_nand_erase_block(chip, nand_offs_to_page(nand, offs));
 		ret = spi_nand_wait(chip, &status);
@@ -1161,6 +1279,8 @@ int spi_nand_scan_tail(struct spi_nand_chip *chip)
 	mtd->_write = spi_nand_write;
 	mtd->_read_oob = spi_nand_read_oob;
 	mtd->_write_oob = spi_nand_write_oob;
+	mtd->_block_isbad = spi_nand_block_isbad;
+	mtd->_block_markbad = spi_nand_block_markbad;
 
 	if (!mtd->bitflip_threshold)
 		mtd->bitflip_threshold = DIV_ROUND_UP(mtd->ecc_strength * 3, 4);
-- 
1.9.1
