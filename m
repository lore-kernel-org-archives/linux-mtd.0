Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYKSl-000827-UH
 for linux-mtd@lists.infradead.org; Fri, 12 Aug 2016 21:58:08 +0000
From: Kyle Roeschley <kyle.roeschley@ni.com>
To: boris.brezillon@free-electrons.com, richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nathan.sullivan@ni.com, xander.huff@ni.com, peterpansjtu@gmail.com
Subject: [PATCH v7 1/2] mtd: nand_bbt: Move BBT block selection logic out of
 write_bbt()
Date: Fri, 12 Aug 2016 16:58:22 -0500
Message-Id: <1471039103-6745-1-git-send-email-kyle.roeschley@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@free-electrons.com>

This clarifies the write_bbt() by removing the write label and
clarifying the error/exit path.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Tested-by: Kyle Roeschley <kyle.roeschley@ni.com>
---
v7: Move all code cleanup into first patch
    Correct documentation of mark_bbt_block_bad
    Make pr_warn messages consistent
    Add Tested-bys

v6: Split functionality of write_bbt out into new functions

v5: De-duplicate bad block handling

v4: Don't ignore write protection while marking bad BBT blocks
    Correctly call block_markbad
    Minor cleanups

v3: Don't overload mtd->priv
    Keep nand_erase_nand from erroring on protected BBT blocks

v2: Mark OOB area in each block as well as BBT
    Avoid marking read-only, bad address, or known bad blocks as bad

 drivers/mtd/nand/nand_bbt.c | 114 +++++++++++++++++++++++++++++---------------
 1 file changed, 76 insertions(+), 38 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2fbb523..918db24 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -605,6 +605,69 @@ static void search_read_bbts(struct mtd_info *mtd, uint8_t *buf,
 }
 
 /**
+ * get_bbt_block - Get the first valid eraseblock suitable to store a BBT
+ * @this: the NAND device
+ * @td: the BBT description
+ * @md: the mirror BBT descriptor
+ * @chip: the CHIP selector
+ *
+ * This functions returns a positive block number pointing a valid eraseblock
+ * suitable to store a BBT (i.e. in the range reserved for BBT), or -ENOSPC if
+ * all blocks are already used of marked bad. If td->pages[chip] was already
+ * pointing to a valid block we re-use it, otherwise we search for the next
+ * valid one.
+ */
+static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
+			 struct nand_bbt_descr *md, int chip)
+{
+	int startblock, dir, page, numblocks, i;
+
+	/*
+	 * There was already a version of the table, reuse the page. This
+	 * applies for absolute placement too, as we have the page number in
+	 * td->pages.
+	 */
+	if (td->pages[chip] != -1)
+		return td->pages[chip] >>
+				(this->bbt_erase_shift - this->page_shift);
+
+	numblocks = (int)(this->chipsize >> this->bbt_erase_shift);
+	if (!(td->options & NAND_BBT_PERCHIP))
+		numblocks *= this->numchips;
+
+	/*
+	 * Automatic placement of the bad block table. Search direction
+	 * top -> down?
+	 */
+	if (td->options & NAND_BBT_LASTBLOCK) {
+		startblock = numblocks * (chip + 1) - 1;
+		dir = -1;
+	} else {
+		startblock = chip * numblocks;
+		dir = 1;
+	}
+
+	for (i = 0; i < td->maxblocks; i++) {
+		int block = startblock + dir * i;
+
+		/* Check, if the block is bad */
+		switch (bbt_get_entry(this, block)) {
+		case BBT_BLOCK_WORN:
+		case BBT_BLOCK_FACTORY_BAD:
+			continue;
+		}
+
+		page = block << (this->bbt_erase_shift - this->page_shift);
+
+		/* Check, if the block is used by the mirror table */
+		if (!md || md->pages[chip] != page)
+			return block;
+	}
+
+	return -ENOSPC;
+}
+
+/**
  * write_bbt - [GENERIC] (Re)write the bad block table
  * @mtd: MTD device structure
  * @buf: temporary buffer
@@ -621,7 +684,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	struct nand_chip *this = mtd_to_nand(mtd);
 	struct erase_info einfo;
 	int i, res, chip = 0;
-	int bits, startblock, dir, page, offs, numblocks, sft, sftmsk;
+	int bits, page, offs, numblocks, sft, sftmsk;
 	int nrchips, pageoffs, ooboffs;
 	uint8_t msk[4];
 	uint8_t rcode = td->reserved_block_code;
@@ -652,46 +715,21 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 	}
 
 	/* Loop through the chips */
-	for (; chip < nrchips; chip++) {
-		/*
-		 * There was already a version of the table, reuse the page
-		 * This applies for absolute placement too, as we have the
-		 * page nr. in td->pages.
-		 */
-		if (td->pages[chip] != -1) {
-			page = td->pages[chip];
-			goto write;
+	while (chip < nrchips) {
+		int block;
+
+		block = get_bbt_block(this, td, md, chip);
+		if (block < 0) {
+			pr_err("No space left to write bad block table\n");
+			res = block;
+			goto outerr;
 		}
 
 		/*
-		 * Automatic placement of the bad block table. Search direction
-		 * top -> down?
+		 * get_bbt_block() returns a block number, shift the value to
+		 * get a page number.
 		 */
-		if (td->options & NAND_BBT_LASTBLOCK) {
-			startblock = numblocks * (chip + 1) - 1;
-			dir = -1;
-		} else {
-			startblock = chip * numblocks;
-			dir = 1;
-		}
-
-		for (i = 0; i < td->maxblocks; i++) {
-			int block = startblock + dir * i;
-			/* Check, if the block is bad */
-			switch (bbt_get_entry(this, block)) {
-			case BBT_BLOCK_WORN:
-			case BBT_BLOCK_FACTORY_BAD:
-				continue;
-			}
-			page = block <<
-				(this->bbt_erase_shift - this->page_shift);
-			/* Check, if the block is used by the mirror table */
-			if (!md || md->pages[chip] != page)
-				goto write;
-		}
-		pr_err("No space left to write bad block table\n");
-		return -ENOSPC;
-	write:
+		page = block << (this->bbt_erase_shift - this->page_shift);
 
 		/* Set up shift count and masks for the flash table */
 		bits = td->options & NAND_BBT_NRBITS_MSK;
@@ -800,7 +838,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			 (unsigned long long)to, td->version[chip]);
 
 		/* Mark it as used */
-		td->pages[chip] = page;
+		td->pages[chip++] = page;
 	}
 	return 0;
 
-- 
2.8.1
