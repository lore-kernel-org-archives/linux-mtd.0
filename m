Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P10ha-0000hX-F4
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 17:44:23 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] mtd/nand: pull in td into read_bbt()
Date: Wed, 29 Sep 2010 19:43:51 +0200
Message-Id: <1285782234-32509-3-git-send-email-bigeasy@linutronix.de>
In-Reply-To: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
References: <1285782234-32509-1-git-send-email-bigeasy@linutronix.de>
Cc: tglx@linutronix.de, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No code change.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/nand/nand_bbt.c |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index a2a4e17..587297e 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -161,21 +161,22 @@ static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
  * @buf:	temporary buffer
  * @page:	the starting page
  * @num:	the number of bbt descriptors to read
- * @bits:	number of bits per block
+ * @td:		the bbt describtion table
  * @offs:	offset in the memory table
- * @reserved_block_code:	Pattern to identify reserved blocks
  *
  * Read the bad block table starting from page.
  *
  */
 static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
-		    int bits, int offs, int reserved_block_code)
+		struct nand_bbt_descr *td, int offs)
 {
 	int res, i, j, act = 0;
 	struct nand_chip *this = mtd->priv;
 	size_t retlen, len, totlen;
 	loff_t from;
+	int bits = td->options & NAND_BBT_NRBITS_MSK;
 	uint8_t msk = (uint8_t) ((1 << bits) - 1);
+	int reserved_block_code = td->reserved_block_code;
 
 	totlen = (num * bits) >> 3;
 	from = ((loff_t) page) << this->page_shift;
@@ -238,20 +239,21 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 {
 	struct nand_chip *this = mtd->priv;
 	int res = 0, i;
-	int bits;
 
-	bits = td->options & NAND_BBT_NRBITS_MSK;
 	if (td->options & NAND_BBT_PERCHIP) {
 		int offs = 0;
 		for (i = 0; i < this->numchips; i++) {
 			if (chip == -1 || chip == i)
-				res = read_bbt (mtd, buf, td->pages[i], this->chipsize >> this->bbt_erase_shift, bits, offs, td->reserved_block_code);
+				res = read_bbt(mtd, buf, td->pages[i],
+					this->chipsize >> this->bbt_erase_shift,
+					td, offs);
 			if (res)
 				return res;
 			offs += this->chipsize >> (this->bbt_erase_shift + 2);
 		}
 	} else {
-		res = read_bbt (mtd, buf, td->pages[0], mtd->size >> this->bbt_erase_shift, bits, 0, td->reserved_block_code);
+		res = read_bbt(mtd, buf, td->pages[0],
+				mtd->size >> this->bbt_erase_shift, td, 0);
 		if (res)
 			return res;
 	}
-- 
1.7.2.3
