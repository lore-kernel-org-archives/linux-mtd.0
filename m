Received: from mail-qw0-f42.google.com ([209.85.216.42])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ROCAx-0006pr-6T
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2011 17:43:04 +0000
Received: by qadc16 with SMTP id c16so1686960qad.15
 for <linux-mtd@lists.infradead.org>; Wed, 09 Nov 2011 09:42:57 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: stable@vger.kernel.org
Subject: [BACKPORT] mtd: nand_base: always initialise oob_poi before writing
 OOB data
Date: Wed,  9 Nov 2011 09:42:26 -0800
Message-Id: <1320860547-9121-1-git-send-email-computersforpeace@gmail.com>
Cc: "THOMSON, Adam \(Adam\)" <adam.thomson@alcatel-lucent.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@suse.de>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>

commit f722013ee9fd24623df31dec9a91a6d02c3e2f2f upstream.

In nand_do_write_ops() code it is possible for a caller to provide
ops.oobbuf populated and ops.mode == MTD_OOB_AUTO, which currently
means that the chip->oob_poi buffer isn't initialised to all 0xFF.
The nand_fill_oob() method then carries out the task of copying
the provided OOB data to oob_poi, but with MTD_OOB_AUTO it skips
areas marked as unavailable by the layout struct, including the
bad block marker bytes.

An example of this causing issues is when the last OOB data read
was from the start of a bad block where the markers are not 0xFF,
and the caller wishes to write new OOB data at the beginning of
another block. In this scenario the caller would provide OOB data,
but nand_fill_oob() would skip the bad block marker bytes in
oob_poi before copying the OOB data provided by the caller.
This means that when the OOB data is written back to NAND,
the block is inadvertently marked as bad without the caller knowing.
This has been witnessed when using YAFFS2 where tags are stored
in the OOB.

To avoid this oob_poi is always initialised to 0xFF to make sure
no left over data is inadvertently written back to the OOB area.

Credits to Brian Norris <computersforpeace@gmail.com> for fixing this
patch.

Signed-off-by: Adam Thomson <adam.thomson@alcatel-lucent.com>
Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>
Cc: stable@kernel.org [2.6.20+]
---
Backported to 3.1, as requested. The conflict was simply a change in
whitespace between 3.1 and the original commit.

 drivers/mtd/nand/nand_base.c |   27 ++++++++++++++++-----------
 1 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 1525cd0..408e1d0a 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2088,14 +2088,22 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 
 /**
  * nand_fill_oob - [Internal] Transfer client buffer to oob
- * @chip:	nand chip structure
+ * @mtd:	MTD device structure
  * @oob:	oob data buffer
  * @len:	oob data write length
  * @ops:	oob ops structure
  */
-static uint8_t *nand_fill_oob(struct nand_chip *chip, uint8_t *oob, size_t len,
-						struct mtd_oob_ops *ops)
+static uint8_t *nand_fill_oob(struct mtd_info *mtd, uint8_t *oob, size_t len,
+			      struct mtd_oob_ops *ops)
 {
+	struct nand_chip *chip = mtd->priv;
+
+	/*
+	 * Initialise to all 0xFF, to avoid the possibility of left over OOB
+	 * data from a previous OOB read.
+	 */
+	memset(chip->oob_poi, 0xff, mtd->oobsize);
+
 	switch (ops->mode) {
 
 	case MTD_OOB_PLACE:
@@ -2192,10 +2200,6 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 	    (chip->pagebuf << chip->page_shift) < (to + ops->len))
 		chip->pagebuf = -1;
 
-	/* If we're not given explicit OOB data, let it be 0xFF */
-	if (likely(!oob))
-		memset(chip->oob_poi, 0xff, mtd->oobsize);
-
 	/* Don't allow multipage oob writes with offset */
 	if (oob && ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
 		return -EINVAL;
@@ -2217,8 +2221,11 @@ static int nand_do_write_ops(struct mtd_info *mtd, loff_t to,
 
 		if (unlikely(oob)) {
 			size_t len = min(oobwritelen, oobmaxlen);
-			oob = nand_fill_oob(chip, oob, len, ops);
+			oob = nand_fill_oob(mtd, oob, len, ops);
 			oobwritelen -= len;
+		} else {
+			/* We still need to erase leftover OOB data */
+			memset(chip->oob_poi, 0xff, mtd->oobsize);
 		}
 
 		ret = chip->write_page(mtd, chip, wbuf, page, cached,
@@ -2392,10 +2399,8 @@ static int nand_do_write_oob(struct mtd_info *mtd, loff_t to,
 	if (page == chip->pagebuf)
 		chip->pagebuf = -1;
 
-	memset(chip->oob_poi, 0xff, mtd->oobsize);
-	nand_fill_oob(chip, ops->oobbuf, ops->ooblen, ops);
+	nand_fill_oob(mtd, ops->oobbuf, ops->ooblen, ops);
 	status = chip->ecc.write_oob(mtd, chip, page & chip->pagemask);
-	memset(chip->oob_poi, 0xff, mtd->oobsize);
 
 	if (status)
 		return status;
-- 
1.7.5.4
