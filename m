Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
 helo=va3outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOjEm-0006M7-NX
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 07:10:18 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4 06/12] mtd: gpmi: rewrite the gpmi_ecc_write_oob() to
 support the jffs2
Date: Wed, 25 Sep 2013 14:58:15 +0800
Message-ID: <1380092301-21924-7-git-send-email-b32955@freescale.com>
In-Reply-To: <1380092301-21924-1-git-send-email-b32955@freescale.com>
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we use the ECC info which is get from the nand chip's datasheet,
we may have some freed oob area now.

This patch rewrites the gpmi_ecc_write_oob() to implement the ecc.write_oob().
We also update the comment for gpmi_hw_ecclayout.

Yes! We can support the JFFS2 for the SLC nand now.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   31 ++++++++++++++++++++++---------
 1 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index b4306bc..eba7b79 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -45,7 +45,10 @@ static struct nand_bbt_descr gpmi_bbt_descr = {
 	.pattern	= scan_ff_pattern
 };
 
-/*  We will use all the (page + OOB). */
+/*
+ * We may change the layout if we can get the ECC info from the datasheet,
+ * else we will use all the (page + OOB).
+ */
 static struct nand_ecclayout gpmi_hw_ecclayout = {
 	.eccbytes = 0,
 	.eccpos = { 0, },
@@ -1262,14 +1265,24 @@ static int gpmi_ecc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 static int
 gpmi_ecc_write_oob(struct mtd_info *mtd, struct nand_chip *chip, int page)
 {
-	/*
-	 * The BCH will use all the (page + oob).
-	 * Our gpmi_hw_ecclayout can only prohibit the JFFS2 to write the oob.
-	 * But it can not stop some ioctls such MEMWRITEOOB which uses
-	 * MTD_OPS_PLACE_OOB. So We have to implement this function to prohibit
-	 * these ioctls too.
-	 */
-	return -EPERM;
+	struct nand_oobfree *of = mtd->ecclayout->oobfree;
+	int status = 0;
+
+	/* Do we have available oob area? */
+	if (!of->length)
+		return -EPERM;
+
+	if (!nand_is_slc(chip))
+		return -EPERM;
+
+	pr_debug("page number is %d\n", page);
+
+	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize + of->offset, page);
+	chip->write_buf(mtd, chip->oob_poi + of->offset, of->length);
+	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+
+	status = chip->waitfunc(mtd, chip);
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
 }
 
 static int gpmi_block_markbad(struct mtd_info *mtd, loff_t ofs)
-- 
1.7.1
