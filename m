From: Ben Shelton <ben.shelton@ni.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com, richard@nod.at
Subject: [PATCH 2/3] mtd: nand: implement 'max_bad_blocks' mtd function
Date: Mon, 11 May 2015 10:19:55 -0500
Message-Id: <1431357596-29959-3-git-send-email-ben.shelton@ni.com>
In-Reply-To: <1431357596-29959-1-git-send-email-ben.shelton@ni.com>
References: <1431357596-29959-1-git-send-email-ben.shelton@ni.com>
Cc: Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jeff Westfahl <jeff.westfahl@ni.com>

Implement the new mtd function 'max_bad_blocks'. Use the "bad blocks
maximum per LUN" field in the ONFI parameter page to find the maximum
number of bad blocks to reserve for an MTD, taking into account the
number of LUNs in the NAND device and how many LUNs the MTD spans.

>From the ONFI 1.0 spec: "This field contains the maximum number of
blocks that may be defective at manufacture and over the life of the
device per LUN. The maximum rating assumes that the host is following
the block endurance requirements and the ECC requirements reported in
the parameter page."

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
---
 drivers/mtd/nand/nand_base.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c2e1232..a97d08e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2884,6 +2884,40 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 }
 
 /**
+ * nand_max_bad_blocks - [MTD Interface] Max number of bad blocks for an mtd
+ * @mtd: MTD device structure
+ * @ofs: offset relative to mtd start
+ * @len: length of mtd
+ */
+static int nand_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
+{
+	struct nand_chip *chip = mtd->priv;
+	uint32_t part_start_block;
+	uint32_t part_end_block;
+	uint32_t part_start_lun;
+	uint32_t part_end_lun;
+
+	/* ONFI is used to determine the maximum bad block count. */
+	if (!chip->onfi_version)
+		return -ENOTSUPP;
+
+	/* Get the start and end of the partition in erase blocks. */
+	part_start_block = mtd_div_by_eb(ofs, mtd);
+	part_end_block = mtd_div_by_eb(len, mtd) + part_start_block - 1;
+
+	/* Get the start and end LUNs of the partition. */
+	part_start_lun = part_start_block / chip->onfi_params.blocks_per_lun;
+	part_end_lun = part_end_block / chip->onfi_params.blocks_per_lun;
+
+	/*
+	 * Look up the bad blocks per unit and multiply by the number of units
+	 * that the partition spans.
+	 */
+	return chip->onfi_params.bb_per_lun *
+		(part_end_lun - part_start_lun + 1);
+}
+
+/**
  * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
  * @mtd: MTD device structure
  * @chip: nand chip info structure
@@ -4179,6 +4213,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->_block_isreserved = nand_block_isreserved;
 	mtd->_block_isbad = nand_block_isbad;
 	mtd->_block_markbad = nand_block_markbad;
+	mtd->_max_bad_blocks = nand_max_bad_blocks;
 	mtd->writebufsize = mtd->writesize;
 
 	/* propagate ecc info to mtd_info */
-- 
2.4.0
