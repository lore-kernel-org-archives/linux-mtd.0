Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAOJn-0002Ju-T6
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 22:18:21 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/3] mtd: nand: Drop unused cached programming support
Date: Tue, 16 May 2017 00:17:41 +0200
Message-Id: <1494886663-20700-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1494886663-20700-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1494886663-20700-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cached programming is always skipped, so drop the associated code until
we decide to really support it.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 38 ++++++++++++--------------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 54a1dfa327ff..6b98c032ef50 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2720,7 +2720,7 @@ static int nand_write_page_syndrome(struct mtd_info *mtd,
  */
 static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 		uint32_t offset, int data_len, const uint8_t *buf,
-		int oob_required, int page, int cached, int raw)
+		int oob_required, int page, int raw)
 {
 	int status, subpage;
 
@@ -2746,31 +2746,19 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (status < 0)
 		return status;
 
+	if (nand_standard_page_accessors(&chip->ecc))
+		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	status = chip->waitfunc(mtd, chip);
 	/*
-	 * Cached progamming disabled for now. Not sure if it's worth the
-	 * trouble. The speed gain is not very impressive. (2.3->2.6Mib/s).
+	 * See if operation failed and additional status checks are
+	 * available.
 	 */
-	cached = 0;
-
-	if (!cached || !NAND_HAS_CACHEPROG(chip)) {
-
-		if (nand_standard_page_accessors(&chip->ecc))
-			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
-		status = chip->waitfunc(mtd, chip);
-		/*
-		 * See if operation failed and additional status checks are
-		 * available.
-		 */
-		if ((status & NAND_STATUS_FAIL) && (chip->errstat))
-			status = chip->errstat(mtd, chip, FL_WRITING, status,
-					       page);
+	if ((status & NAND_STATUS_FAIL) && (chip->errstat))
+		status = chip->errstat(mtd, chip, FL_WRITING, status,
+				       page);
 
-		if (status & NAND_STATUS_FAIL)
-			return -EIO;
-	} else {
-		chip->cmdfunc(mtd, NAND_CMD_CACHEDPROG, -1, -1);
-		status = chip->waitfunc(mtd, chip);
-	}
+	if (status & NAND_STATUS_FAIL)
+		return -EIO;
 
 	return 0;
 }
@@ -2877,7 +2865,6 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 
 	while (1) {
 		int bytes = mtd->writesize;
-		int cached = writelen > bytes && page != blockmask;
 		uint8_t *wbuf = buf;
 		int use_bufpoi;
 		int part_pagewr = (column || writelen < mtd->writesize);
@@ -2895,7 +2882,6 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		if (use_bufpoi) {
 			pr_debug("%s: using write bounce buffer for buf@%p\n",
 					 __func__, buf);
-			cached = 0;
 			if (part_pagewr)
 				bytes = min_t(int, bytes - column, writelen);
 			chip->pagebuf = -1;
@@ -2914,7 +2900,7 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 		}
 
 		ret = nand_write_page(mtd, chip, column, bytes, wbuf,
-				      oob_required, page, cached,
+				      oob_required, page,
 				      (ops->mode == MTD_OPS_RAW));
 		if (ret)
 			break;
-- 
2.7.4
