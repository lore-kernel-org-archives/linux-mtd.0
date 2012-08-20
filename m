Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3S2j-0001aC-RH
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 13:29:22 +0000
Received: by bkcji2 with SMTP id ji2so2188609bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 06:29:20 -0700 (PDT)
Date: Mon, 20 Aug 2012 16:29:15 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: Rename create_bbt()'s 'len' variable to 'numpages'
Message-ID: <20120820162915.7f93e6c4@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rename 'len' variable of create_bbt/scan_block_fast/scan_block_full to
'numpages', since it really means number of pages to scan when
searching for the BBM (and not the byte length of the scan).

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 9a5402e..24b0a4c 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -401,7 +401,7 @@ static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 /* Scan a given block full */
 static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 			   loff_t offs, uint8_t *buf, size_t readlen,
-			   int scanlen, int len)
+			   int scanlen, int numpages)
 {
 	int ret, j;
 
@@ -410,7 +410,7 @@ static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 	if (ret && !mtd_is_bitflip_or_eccerr(ret))
 		return ret;
 
-	for (j = 0; j < len; j++, buf += scanlen) {
+	for (j = 0; j < numpages; j++, buf += scanlen) {
 		if (check_pattern(buf, scanlen, mtd->writesize, bd))
 			return 1;
 	}
@@ -419,7 +419,7 @@ static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 
 /* Scan a given block partially */
 static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
-			   loff_t offs, uint8_t *buf, int len)
+			   loff_t offs, uint8_t *buf, int numpages)
 {
 	struct mtd_oob_ops ops;
 	int j, ret;
@@ -430,7 +430,7 @@ static int scan_block_fast(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 	ops.datbuf = NULL;
 	ops.mode = MTD_OPS_PLACE_OOB;
 
-	for (j = 0; j < len; j++) {
+	for (j = 0; j < numpages; j++) {
 		/*
 		 * Read the full oob until read_oob is fixed to handle single
 		 * byte reads for 16 bit buswidth.
@@ -463,7 +463,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	struct nand_bbt_descr *bd, int chip)
 {
 	struct nand_chip *this = mtd->priv;
-	int i, numblocks, len, scanlen;
+	int i, numblocks, numpages, scanlen;
 	int startblock;
 	loff_t from;
 	size_t readlen;
@@ -471,11 +471,11 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	pr_info("Scanning device for bad blocks\n");
 
 	if (bd->options & NAND_BBT_SCANALLPAGES)
-		len = 1 << (this->bbt_erase_shift - this->page_shift);
+		numpages = 1 << (this->bbt_erase_shift - this->page_shift);
 	else if (bd->options & NAND_BBT_SCAN2NDPAGE)
-		len = 2;
+		numpages = 2;
 	else
-		len = 1;
+		numpages = 1;
 
 	if (!(bd->options & NAND_BBT_SCANEMPTY)) {
 		/* We need only read few bytes from the OOB area */
@@ -484,7 +484,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	} else {
 		/* Full page content should be read */
 		scanlen = mtd->writesize + mtd->oobsize;
-		readlen = len * mtd->writesize;
+		readlen = numpages * mtd->writesize;
 	}
 
 	if (chip == -1) {
@@ -508,7 +508,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 	}
 
 	if (this->bbt_options & NAND_BBT_SCANLASTPAGE)
-		from += mtd->erasesize - (mtd->writesize * len);
+		from += mtd->erasesize - (mtd->writesize * numpages);
 
 	for (i = startblock; i < numblocks;) {
 		int ret;
@@ -517,9 +517,9 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		if (bd->options & NAND_BBT_SCANALLPAGES)
 			ret = scan_block_full(mtd, bd, from, buf, readlen,
-					      scanlen, len);
+					      scanlen, numpages);
 		else
-			ret = scan_block_fast(mtd, bd, from, buf, len);
+			ret = scan_block_fast(mtd, bd, from, buf, numpages);
 
 		if (ret < 0)
 			return ret;
