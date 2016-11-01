Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c1dcd-0008VN-PG
 for linux-mtd@lists.infradead.org; Tue, 01 Nov 2016 18:17:20 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 4/5] mtd: nand: implement 'max_bad_blocks' mtd function
Date: Tue, 1 Nov 2016 13:16:29 -0500
Message-ID: <1478024190-13713-5-git-send-email-zach.brown@ni.com>
In-Reply-To: <1478024190-13713-1-git-send-email-zach.brown@ni.com>
References: <1478024190-13713-1-git-send-email-zach.brown@ni.com>
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

Implement the new mtd function 'max_bad_blocks'. Using the chip's
bb_per_die and blocks_per_die fields to determine the maximum bad blocks
to reserve for an MTD.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
Signed-off-by: Zach Brown <zach.brown@ni.com>
---
 drivers/mtd/nand/nand_base.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3bde96a..be48e37 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3236,6 +3236,40 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 }
 
 /**
+ * nand_max_bad_blocks - [MTD Interface] Max number of bad blocks for an mtd
+ * @mtd: MTD device structure
+ * @ofs: offset relative to mtd start
+ * @len: length of mtd
+ */
+static int nand_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	uint32_t part_start_block;
+	uint32_t part_end_block;
+	uint32_t part_start_lun;
+	uint32_t part_end_lun;
+
+	/* bb_per_lun and blocks_per_lun used to determine
+	 * the maximum bad block count.
+	 */
+	if (!chip->bb_per_die || !chip->blocks_per_die)
+		return -ENOTSUPP;
+
+	/* Get the start and end of the partition in erase blocks. */
+	part_start_block = mtd_div_by_eb(ofs, mtd);
+	part_end_block = mtd_div_by_eb(len, mtd) + part_start_block - 1;
+
+	/* Get the start and end LUNs of the partition. */
+	part_start_lun = part_start_block / chip->blocks_per_die;
+	part_end_lun = part_end_block / chip->blocks_per_die;
+
+	/* Look up the bad blocks per unit and multiply by the number of units
+	 * that the partition spans.
+	 */
+	return chip->bb_per_die * (part_end_lun - part_start_lun + 1);
+}
+
+/**
  * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
  * @mtd: MTD device structure
  * @chip: nand chip info structure
@@ -4767,6 +4801,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->_block_isreserved = nand_block_isreserved;
 	mtd->_block_isbad = nand_block_isbad;
 	mtd->_block_markbad = nand_block_markbad;
+	mtd->_max_bad_blocks = nand_max_bad_blocks;
 	mtd->writebufsize = mtd->writesize;
 
 	/*
-- 
2.7.4
