Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SkGwP-0000cI-19
 for linux-mtd@lists.infradead.org; Thu, 28 Jun 2012 15:47:33 +0000
Received: by eekd17 with SMTP id d17so886005eek.36
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2012 08:47:30 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC] nand_btt : use nand chip->block_bad
Date: Thu, 28 Jun 2012 17:47:22 +0200
Message-Id: <1340898442-1585-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This allow to have only one code for detecting bad block.
Also block_bad support badblockbits configuration, for case
where there are bitflip in bad block marker.
---
 drivers/mtd/nand/nand_bbt.c |  102 +------------------------------------------
 1 file changed, 2 insertions(+), 100 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 30d1319..3d4f6ef 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -123,28 +123,6 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
 }
 
 /**
- * check_short_pattern - [GENERIC] check if a pattern is in the buffer
- * @buf: the buffer to search
- * @td:	search pattern descriptor
- *
- * Check for a pattern at the given place. Used to search bad block tables and
- * good / bad block identifiers. Same as check_pattern, but no optional empty
- * check.
- */
-static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
-{
-	int i;
-	uint8_t *p = buf;
-
-	/* Compare the pattern */
-	for (i = 0; i < td->len; i++) {
-		if (p[td->offs + i] != td->pattern[i])
-			return -1;
-	}
-	return 0;
-}
-
-/**
  * add_marker_len - compute the length of the marker in data area
  * @td: BBT descriptor used for computation
  *
@@ -398,56 +376,6 @@ static int read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 	return 1;
 }
 
-/* Scan a given block full */
-static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
-			   loff_t offs, uint8_t *buf, size_t readlen,
-			   int scanlen, int len)
-{
-	int ret, j;
-
-	ret = scan_read_raw_oob(mtd, buf, offs, readlen);
-	/* Ignore ECC errors when checking for BBM */
-	if (ret && !mtd_is_bitflip_or_eccerr(ret))
-		return ret;
-
-	for (j = 0; j < len; j++, buf += scanlen) {
-		if (check_pattern(buf, scanlen, mtd->writesize, bd))
-			return 1;
-	}
-	return 0;
-}
-
-/* Scan a given block partially */
-static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
-			   loff_t offs, uint8_t *buf, int len)
-{
-	struct mtd_oob_ops ops;
-	int j, ret;
-
-	ops.ooblen = mtd->oobsize;
-	ops.oobbuf = buf;
-	ops.ooboffs = 0;
-	ops.datbuf = NULL;
-	ops.mode = MTD_OPS_PLACE_OOB;
-
-	for (j = 0; j < len; j++) {
-		/*
-		 * Read the full oob until read_oob is fixed to handle single
-		 * byte reads for 16 bit buswidth.
-		 */
-		ret = mtd_read_oob(mtd, offs, &ops);
-		/* Ignore ECC errors when checking for BBM */
-		if (ret && !mtd_is_bitflip_or_eccerr(ret))
-			return ret;
-
-		if (check_short_pattern(buf, bd))
-			return 1;
-
-		offs += mtd->writesize;
-	}
-	return 0;
-}
-
 /**
  * create_bbt - [GENERIC] Create a bad block table by scanning the device
  * @mtd: MTD device structure
@@ -463,30 +391,12 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	struct nand_bbt_descr *bd, int chip)
 {
 	struct nand_chip *this = mtd->priv;
-	int i, numblocks, len, scanlen;
+	int i, numblocks;
 	int startblock;
 	loff_t from;
-	size_t readlen;
 
 	pr_info("Scanning device for bad blocks\n");
 
-	if (bd->options & NAND_BBT_SCANALLPAGES)
-		len = 1 << (this->bbt_erase_shift - this->page_shift);
-	else if (bd->options & NAND_BBT_SCAN2NDPAGE)
-		len = 2;
-	else
-		len = 1;
-
-	if (!(bd->options & NAND_BBT_SCANEMPTY)) {
-		/* We need only read few bytes from the OOB area */
-		scanlen = 0;
-		readlen = bd->len;
-	} else {
-		/* Full page content should be read */
-		scanlen = mtd->writesize + mtd->oobsize;
-		readlen = len * mtd->writesize;
-	}
-
 	if (chip == -1) {
 		/*
 		 * Note that numblocks is 2 * (real numblocks) here, see i+=2
@@ -507,20 +417,12 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 		from = (loff_t)startblock << (this->bbt_erase_shift - 1);
 	}
 
-	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
-		from += mtd->erasesize - (mtd->writesize * len);
-
 	for (i = startblock; i < numblocks;) {
 		int ret;
 
 		BUG_ON(bd->options & NAND_BBT_NO_OOB);
 
-		if (bd->options & NAND_BBT_SCANALLPAGES)
-			ret = scan_block_full(mtd, bd, from, buf, readlen,
-					      scanlen, len);
-		else
-			ret = scan_block_fast(mtd, bd, from, buf, len);
-
+		ret = this->block_bad(mtd, from, 1);
 		if (ret < 0)
 			return ret;
 
-- 
1.7.10.4
