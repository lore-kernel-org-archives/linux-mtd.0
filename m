Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJi1E-0004G6-C5
 for linux-mtd@lists.infradead.org; Tue, 19 Aug 2014 11:56:05 +0000
Received: by mail-wi0-f169.google.com with SMTP id n3so5060700wiv.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2014 04:55:42 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: don't break long print messages
Date: Tue, 19 Aug 2014 13:55:34 +0200
Message-Id: <1408449334-6440-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This follows Chapter 2 of Linux's CodingStyle:
> However, never break user-visible strings such as printk messages,
> because that breaks the ability to grep for them.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 14 +++++---------
 drivers/mtd/nand/nand_bbt.c  | 23 ++++++++++-------------
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ae6e7c4..801cad1 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3936,8 +3936,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	case NAND_ECC_HW_OOB_FIRST:
 		/* Similar to NAND_ECC_HW, but a separate read_page handle */
 		if (!ecc->calculate || !ecc->correct || !ecc->hwctl) {
-			pr_warn("No ECC functions supplied; "
-				   "hardware ECC not possible\n");
+			pr_warn("No ECC functions supplied; hardware ECC not possible\n");
 			BUG();
 		}
 		if (!ecc->read_page)
@@ -3968,8 +3967,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		     ecc->read_page == nand_read_page_hwecc ||
 		     !ecc->write_page ||
 		     ecc->write_page == nand_write_page_hwecc)) {
-			pr_warn("No ECC functions supplied; "
-				   "hardware ECC not possible\n");
+			pr_warn("No ECC functions supplied; hardware ECC not possible\n");
 			BUG();
 		}
 		/* Use standard syndrome read/write page function? */
@@ -3993,9 +3991,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 			}
 			break;
 		}
-		pr_warn("%d byte HW ECC not possible on "
-			   "%d byte page size, fallback to SW ECC\n",
-			   ecc->size, mtd->writesize);
+		pr_warn("%d byte HW ECC not possible on %d byte page size, fallback to SW ECC\n",
+			ecc->size, mtd->writesize);
 		ecc->mode = NAND_ECC_SOFT;
 
 	case NAND_ECC_SOFT:
@@ -4048,8 +4045,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 		break;
 
 	case NAND_ECC_NONE:
-		pr_warn("NAND_ECC_NONE selected by board driver. "
-			   "This is not recommended!\n");
+		pr_warn("NAND_ECC_NONE selected by board driver. This is not recommended!\n");
 		ecc->read_page = nand_read_page_raw;
 		ecc->write_page = nand_write_page_raw;
 		ecc->read_oob = nand_read_oob_std;
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 443fa82..9bb8453 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -201,12 +201,12 @@ static int read_bbt(struct mtd_info *mtd, uint8_t *buf, int page, int num,
 		res = mtd_read(mtd, from, len, &retlen, buf);
 		if (res < 0) {
 			if (mtd_is_eccerr(res)) {
-				pr_info("nand_bbt: ECC error in BBT at "
-					"0x%012llx\n", from & ~mtd->writesize);
+				pr_info("nand_bbt: ECC error in BBT at 0x%012llx\n",
+					from & ~mtd->writesize);
 				return res;
 			} else if (mtd_is_bitflip(res)) {
-				pr_info("nand_bbt: corrected error in BBT at "
-					"0x%012llx\n", from & ~mtd->writesize);
+				pr_info("nand_bbt: corrected error in BBT at 0x%012llx\n",
+					from & ~mtd->writesize);
 				ret = res;
 			} else {
 				pr_info("nand_bbt: error reading BBT\n");
@@ -580,8 +580,8 @@ static int search_bbt(struct mtd_info *mtd, uint8_t *buf, struct nand_bbt_descr
 		if (td->pages[i] == -1)
 			pr_warn("Bad block table not found for chip %d\n", i);
 		else
-			pr_info("Bad block table found at page %d, version "
-				 "0x%02X\n", td->pages[i], td->version[i]);
+			pr_info("Bad block table found at page %d, version 0x%02X\n",
+				td->pages[i], td->version[i]);
 	}
 	return 0;
 }
@@ -725,12 +725,10 @@ static int write_bbt(struct mtd_info *mtd, uint8_t *buf,
 			res = mtd_read(mtd, to, len, &retlen, buf);
 			if (res < 0) {
 				if (retlen != len) {
-					pr_info("nand_bbt: error reading block "
-						"for writing the bad block table\n");
+					pr_info("nand_bbt: error reading block for writing the bad block table\n");
 					return res;
 				}
-				pr_warn("nand_bbt: ECC error while reading "
-					"block for writing bad block table\n");
+				pr_warn("nand_bbt: ECC error while reading block for writing bad block table\n");
 			}
 			/* Read oob data */
 			ops.ooblen = (len >> this->page_shift) * mtd->oobsize;
@@ -1338,9 +1336,8 @@ int nand_isbad_bbt(struct mtd_info *mtd, loff_t offs, int allowbbt)
 	block = (int)(offs >> this->bbt_erase_shift);
 	res = bbt_get_entry(this, block);
 
-	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: "
-			"(block %d) 0x%02x\n",
-			(unsigned int)offs, block, res);
+	pr_debug("nand_isbad_bbt(): bbt info for offs 0x%08x: (block %d) 0x%02x\n",
+		 (unsigned int)offs, block, res);
 
 	switch (res) {
 	case BBT_BLOCK_GOOD:
-- 
1.8.4.5
