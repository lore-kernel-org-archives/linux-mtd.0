Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R1OYC-0001W3-AH
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2011 20:16:49 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 06/14] mtd: nand: fix style
Date: Wed, 7 Sep 2011 13:13:33 -0700
Message-ID: <1315426421-16243-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove some extra spaces
Consistently use '0x' prefix for bitfield-like constants
Spelling: "aplies" -> "applies"

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_bbt.c |   28 ++++++++++++++--------------
 1 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index b493f51..cba4c44 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -183,16 +183,16 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 	size_t retlen, len, totlen;
 	loff_t from;
 	int bits = td->options & NAND_BBT_NRBITS_MSK;
-	uint8_t msk = (uint8_t) ((1 << bits) - 1);
+	uint8_t msk = (uint8_t)((1 << bits) - 1);
 	u32 marker_len;
 	int reserved_block_code = td->reserved_block_code;
 
 	totlen = (num * bits) >> 3;
 	marker_len = add_marker_len(td);
-	from = ((loff_t) page) << this->page_shift;
+	from = ((loff_t)page) << this->page_shift;
 
 	while (totlen) {
-		len = min(totlen, (size_t) (1 << this->bbt_erase_shift));
+		len = min(totlen, (size_t)(1 << this->bbt_erase_shift));
 		if (marker_len) {
 			/*
 			 * In case the BBT marker is not in the OOB area it
@@ -250,7 +250,7 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
  * @mtd: MTD device structure
  * @buf: temporary buffer
  * @td: descriptor for the bad block table
- * @chip: read the table for a specific chip, -1 read all chips; aplies only if
+ * @chip: read the table for a specific chip, -1 read all chips; applies only if
  *        NAND_BBT_PERCHIP option is set
  *
  * Read the bad block table for all chips starting at a given page. We assume
@@ -743,12 +743,12 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 
 		bbtoffs = chip * (numblocks >> 2);
 
-		to = ((loff_t) page) << this->page_shift;
+		to = ((loff_t)page) << this->page_shift;
 
 		/* Must we save the block contents? */
 		if (td->options & NAND_BBT_SAVECONTENT) {
 			/* Make it block aligned */
-			to &= ~((loff_t) ((1 << this->bbt_erase_shift) - 1));
+			to &= ~((loff_t)((1 << this->bbt_erase_shift) - 1));
 			len = 1 << this->bbt_erase_shift;
 			res = mtd->read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
@@ -771,7 +771,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			pageoffs = page - (int)(to >> this->page_shift);
 			offs = pageoffs << this->page_shift;
 			/* Preset the bbt area with 0xff */
-			memset(&buf[offs], 0xff, (size_t) (numblocks >> sft));
+			memset(&buf[offs], 0xff, (size_t)(numblocks >> sft));
 			ooboffs = len + (pageoffs * mtd->oobsize);
 
 		} else if (td->options & NAND_BBT_NO_OOB) {
@@ -781,7 +781,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			if (td->options & NAND_BBT_VERSION)
 				offs++;
 			/* Calc length */
-			len = (size_t) (numblocks >> sft);
+			len = (size_t)(numblocks >> sft);
 			len += offs;
 			/* Make it page aligned! */
 			len = ALIGN(len, mtd->writesize);
@@ -791,7 +791,7 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			memcpy(buf, td->pattern, td->len);
 		} else {
 			/* Calc length */
-			len = (size_t) (numblocks >> sft);
+			len = (size_t)(numblocks >> sft);
 			/* Make it page aligned! */
 			len = ALIGN(len, mtd->writesize);
 			/* Preset the buffer with 0xff */
@@ -903,14 +903,14 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 			if (td->pages[i] == -1) {
 				rd = md;
 				td->version[i] = md->version[i];
-				writeops = 1;
+				writeops = 0x01;
 				goto writecheck;
 			}
 
 			if (md->pages[i] == -1) {
 				rd = td;
 				md->version[i] = td->version[i];
-				writeops = 2;
+				writeops = 0x02;
 				goto writecheck;
 			}
 
@@ -921,14 +921,14 @@ static int check_create(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_desc
 				goto writecheck;
 			}
 
-			if (((int8_t) (td->version[i] - md->version[i])) > 0) {
+			if (((int8_t)(td->version[i] - md->version[i])) > 0) {
 				rd = td;
 				md->version[i] = td->version[i];
-				writeops = 2;
+				writeops = 0x02;
 			} else {
 				rd = md;
 				td->version[i] = md->version[i];
-				writeops = 1;
+				writeops = 0x01;
 			}
 
 			goto writecheck;
-- 
1.7.5.4
