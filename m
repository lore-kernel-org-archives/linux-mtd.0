Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZRCI-0007D3-Qh
 for linux-mtd@lists.infradead.org; Mon, 15 Aug 2016 23:21:35 +0000
From: Kyle Roeschley <kyle.roeschley@ni.com>
To: boris.brezillon@free-electrons.com, richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nathan.sullivan@ni.com, xander.huff@ni.com, peterpansjtu@gmail.com
Subject: [PATCH v8 2/2] mtd: nand_bbt: scan for next free bbt block if writing
 bbt fails
Date: Mon, 15 Aug 2016 18:22:02 -0500
Message-Id: <1471303322-2479-2-git-send-email-kyle.roeschley@ni.com>
In-Reply-To: <1471303322-2479-1-git-send-email-kyle.roeschley@ni.com>
References: <1471303322-2479-1-git-send-email-kyle.roeschley@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If erasing or writing the BBT fails, we should mark the current BBT
block as bad and use the BBT descriptor to scan for the next available
unused block in the BBT. We should only return a failure if there isn't
any space left.

Signed-off-by: Kyle Roeschley <kyle.roeschley@ni.com>
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Suggested-by: Jeff Westfahl <jeff.westfahl@ni.com>
Tested-by: Kyle Roeschley <kyle.roeschley@ni.com>
---
 drivers/mtd/nand/nand_bbt.c | 51 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 9fbd664..7695efe 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -668,6 +668,37 @@ static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
 }
 
 /**
+ * mark_bbt_block_bad - Mark one of the block reserved for BBT bad
+ * @this: the NAND device
+ * @td: the BBT description
+ * @chip: the CHIP selector
+ * @block: the BBT block to mark
+ *
+ * Blocks reserved for BBT can become bad. This functions is an helper to mark
+ * such blocks as bad. It takes care of updating the in-memory BBT, marking the
+ * block as bad using a bad block marker and invalidating the associated
+ * td->pages[] entry.
+ */
+static void mark_bbt_block_bad(struct nand_chip *this,
+			       struct nand_bbt_descr *td,
+			       int chip, int block)
+{
+	struct mtd_info *mtd = nand_to_mtd(this);
+	loff_t to;
+	int res;
+
+	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
+
+	to = (loff_t)block << this->bbt_erase_shift;
+	res = this->block_markbad(mtd, to);
+	if (res)
+		pr_warn("nand_bbt: error %d while marking block %d bad\n",
+			res, block);
+
+	td->pages[chip] = -1;
+}
+
+/**
  * write_bbt - [GENERIC] (Re)write the bad block table
  * @mtd: MTD device structure
  * @buf: temporary buffer
@@ -715,7 +746,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	}
 
 	/* Loop through the chips */
-	for (; chip < nrchips; chip++) {
+	while (chip < nrchips) {
 		int block;
 
 		block = get_bbt_block(this, td, md, chip);
@@ -825,20 +856,28 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		einfo.addr = to;
 		einfo.len = 1 << this->bbt_erase_shift;
 		res = nand_erase_nand(mtd, &einfo, 1);
-		if (res < 0)
-			goto outerr;
+		if (res < 0) {
+			pr_warn("nand_bbt: error while erasing BBT block %d\n",
+				res);
+			mark_bbt_block_bad(this, td, chip, block);
+			continue;
+		}
 
 		res = scan_write_bbt(mtd, to, len, buf,
 				td->options & NAND_BBT_NO_OOB ? NULL :
 				&buf[len]);
-		if (res < 0)
-			goto outerr;
+		if (res < 0) {
+			pr_warn("nand_bbt: error while writing BBT block %d\n",
+				res);
+			mark_bbt_block_bad(this, td, chip, block);
+			continue;
+		}
 
 		pr_info("Bad block table written to 0x%012llx, version 0x%02X\n",
 			 (unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
-		td->pages[chip] = page;
+		td->pages[chip++] = page;
 	}
 	return 0;
 
-- 
2.8.1
