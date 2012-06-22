Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SiDO4-0004gf-BQ
 for linux-mtd@lists.infradead.org; Fri, 22 Jun 2012 23:35:37 +0000
Received: by mail-pb0-f49.google.com with SMTP id rq13so4463143pbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 22 Jun 2012 16:35:36 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/8] mtd: nand: rename '_raw' BBT scan functions
Date: Fri, 22 Jun 2012 16:35:42 -0700
Message-Id: <1340408145-24531-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

None of these scanning functions use MTD_OPS_RAW mode any more, so there's
really nothing 'raw' about them. Rename them to (hopefully) make the code
a little clearer.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 4123705..35e8cdf 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -288,7 +288,7 @@ static int read_abs_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 }
 
 /* BBT marker is in the first page, no OOB */
-static int scan_read_raw_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+static int scan_read_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 			 struct nand_bbt_descr *td)
 {
 	size_t retlen;
@@ -301,8 +301,8 @@ static int scan_read_raw_data(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	return mtd_read(mtd, offs, len, &retlen, buf);
 }
 
-/* Scan read raw data from flash */
-static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+/* Scan read data from flash */
+static int scan_read_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 			 size_t len)
 {
 	struct mtd_oob_ops ops;
@@ -329,13 +329,13 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 	return 0;
 }
 
-static int scan_read_raw(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
+static int scan_read(struct mtd_info *mtd, uint8_t *buf, loff_t offs,
 			 size_t len, struct nand_bbt_descr *td)
 {
 	if (td->options & NAND_BBT_NO_OOB)
-		return scan_read_raw_data(mtd, buf, offs, td);
+		return scan_read_data(mtd, buf, offs, td);
 	else
-		return scan_read_raw_oob(mtd, buf, offs, len);
+		return scan_read_oob(mtd, buf, offs, len);
 }
 
 /* Scan write data with oob to flash */
@@ -380,7 +380,7 @@ static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 
 	/* Read the primary version, if available */
 	if (td->options & NAND_BBT_VERSION) {
-		scan_read_raw(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
+		scan_read(mtd, buf, (loff_t)td->pages[0] << this->page_shift,
 			      mtd->writesize, td);
 		td->version[0] = buf[bbt_get_ver_offs(mtd, td)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
@@ -389,7 +389,7 @@ static void read_abs_bbts(struct mtd_info *mtd, uint8_t *buf,
 
 	/* Read the mirror version, if available */
 	if (md && (md->options & NAND_BBT_VERSION)) {
-		scan_read_raw(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
+		scan_read(mtd, buf, (loff_t)md->pages[0] << this->page_shift,
 			      mtd->writesize, md);
 		md->version[0] = buf[bbt_get_ver_offs(mtd, md)];
 		pr_info("Bad block table at page %d, version 0x%02X\n",
@@ -404,7 +404,7 @@ static int scan_block_full(struct mtd_info *mtd, struct nand_bbt_descr *bd,
 {
 	int ret, j;
 
-	ret = scan_read_raw_oob(mtd, buf, offs, readlen);
+	ret = scan_read_oob(mtd, buf, offs, readlen);
 	/* Ignore ECC errors when checking for BBM */
 	if (ret && !mtd_is_bitflip_or_eccerr(ret))
 		return ret;
@@ -593,7 +593,7 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 			loff_t offs = (loff_t)actblock << this->bbt_erase_shift;
 
 			/* Read first page */
-			scan_read_raw(mtd, buf, offs, mtd->writesize, td);
+			scan_read(mtd, buf, offs, mtd->writesize, td);
 			if (!check_pattern(buf, scanlen, mtd->writesize, td)) {
 				td->pages[i] = actblock << blocktopage;
 				if (td->options & NAND_BBT_VERSION) {
-- 
1.7.10
