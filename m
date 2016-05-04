Received: from skprod3.natinst.com ([130.164.80.24] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ay6Pw-0007Ks-3v
 for linux-mtd@lists.infradead.org; Wed, 04 May 2016 23:41:20 +0000
From: Kyle Roeschley <kyle.roeschley@ni.com>
To: boris.brezillon@free-electrons.com, richard@nod.at
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, beanhuo@micron.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nathan.sullivan@ni.com, xander.huff@ni.com, peterpansjtu@gmail.com
Subject: [PATCH v4] mtd: nand_bbt: scan for next free bbt block if writing bbt
 fails
Date: Wed, 4 May 2016 18:40:45 -0500
Message-Id: <1462405245-19333-1-git-send-email-kyle.roeschley@ni.com>
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

Based on original code implemented by Jeff Westfahl
<jeff.westfahl@ni.com>.

Signed-off-by: Kyle Roeschley <kyle.roeschley@ni.com>
Suggested-by: Jeff Westfahl <jeff.westfahl@ni.com>
---
v4: Don't ignore write protection while marking bad BBT blocks
    Correctly call block_markbad
    Minor cleanups

v3: Don't overload mtd->priv
    Keep nand_erase_nand from erroring on protected BBT blocks

v2: Mark OOB area in each block as well as BBT
    Avoid marking read-only, bad address, or known bad blocks as bad

 drivers/mtd/nand/nand_bbt.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2fbb523..dfc68e0 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -663,6 +663,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			goto write;
 		}
 
+next:
 		/*
 		 * Automatic placement of the bad block table. Search direction
 		 * top -> down?
@@ -787,14 +788,50 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 		einfo.addr = to;
 		einfo.len = 1 << this->bbt_erase_shift;
 		res = nand_erase_nand(mtd, &einfo, 1);
-		if (res < 0)
+		if (res == -EIO) {
+			/*
+			 * This block is bad. Mark it as such and see if
+			 * there's another block available in the BBT area.
+			 */
+			int block = page >>
+				    (this->bbt_erase_shift - this->page_shift);
+			pr_info("nand_bbt: failed to erase block %d when writing BBT\n",
+				block);
+			bbt_mark_entry(this, block, BBT_BLOCK_WORN);
+
+			res = this->block_markbad(mtd, to);
+			if (res)
+				pr_warn("nand_bbt: error %d while marking block %d bad\n",
+					res, block);
+			td->pages[chip] = -1;
+			goto next;
+		} else if (res) {
 			goto outerr;
+		}
 
 		res = scan_write_bbt(mtd, to, len, buf,
 				td->options & NAND_BBT_NO_OOB ? NULL :
 				&buf[len]);
-		if (res < 0)
+		if (res == -EIO) {
+			/*
+			 * This block is bad. Mark it as such and see if
+			 * there's another block available in the BBT area.
+			 */
+			int block = page >>
+				    (this->bbt_erase_shift - this->page_shift);
+			pr_info("nand_bbt: failed to write block %d when writing BBT\n",
+				block);
+			bbt_mark_entry(this, block, BBT_BLOCK_WORN);
+
+			res = this->block_markbad(mtd, to);
+			if (res)
+				pr_warn("nand_bbt: error %d while marking block %d bad\n",
+					res, block);
+			td->pages[chip] = -1;
+			goto next;
+		} else if (res) {
 			goto outerr;
+		}
 
 		pr_info("Bad block table written to 0x%012llx, version 0x%02X\n",
 			 (unsigned long long)to, td->version[chip]);
-- 
2.8.1
