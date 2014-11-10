Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnwAZ-0004A2-Gu
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 21:06:40 +0000
Received: by mail-pd0-f180.google.com with SMTP id ft15so8509263pdb.25
 for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2014 13:06:15 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: cafe_nand: drop duplicate .write_page implementation
Date: Mon, 10 Nov 2014 13:06:04 -0800
Message-Id: <1415653564-23113-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This write_page() function is functionally equivalent to the default in
nand_base.c. Its only difference is in subpage programming support,
which cafe_nand.c does not advertise, so the difference is negligible.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c | 45 --------------------------------------------
 1 file changed, 45 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 4e66726da9aa..9a0f45f1d932 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -529,50 +529,6 @@ static int cafe_nand_write_page_lowlevel(struct mtd_info *mtd,
 	return 0;
 }
 
-static int cafe_nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-			uint32_t offset, int data_len, const uint8_t *buf,
-			int oob_required, int page, int cached, int raw)
-{
-	int status;
-
-	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
-
-	if (unlikely(raw))
-		status = chip->ecc.write_page_raw(mtd, chip, buf, oob_required);
-	else
-		status = chip->ecc.write_page(mtd, chip, buf, oob_required);
-
-	if (status < 0)
-		return status;
-
-	/*
-	 * Cached progamming disabled for now, Not sure if its worth the
-	 * trouble. The speed gain is not very impressive. (2.3->2.6Mib/s)
-	 */
-	cached = 0;
-
-	if (!cached || !(chip->options & NAND_CACHEPRG)) {
-
-		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
-		status = chip->waitfunc(mtd, chip);
-		/*
-		 * See if operation failed and additional status checks are
-		 * available
-		 */
-		if ((status & NAND_STATUS_FAIL) && (chip->errstat))
-			status = chip->errstat(mtd, chip, FL_WRITING, status,
-					       page);
-
-		if (status & NAND_STATUS_FAIL)
-			return -EIO;
-	} else {
-		chip->cmdfunc(mtd, NAND_CMD_CACHEDPROG, -1, -1);
-		status = chip->waitfunc(mtd, chip);
-	}
-
-	return 0;
-}
-
 static int cafe_nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 {
 	return 0;
@@ -800,7 +756,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	cafe->nand.ecc.hwctl  = (void *)cafe_nand_bug;
 	cafe->nand.ecc.calculate = (void *)cafe_nand_bug;
 	cafe->nand.ecc.correct  = (void *)cafe_nand_bug;
-	cafe->nand.write_page = cafe_nand_write_page;
 	cafe->nand.ecc.write_page = cafe_nand_write_page_lowlevel;
 	cafe->nand.ecc.write_oob = cafe_nand_write_oob;
 	cafe->nand.ecc.read_page = cafe_nand_read_page;
-- 
1.9.1
