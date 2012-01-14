Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rlt6B-00023b-Oc
 for linux-mtd@lists.infradead.org; Sat, 14 Jan 2012 02:12:04 +0000
Received: by mail-iy0-f177.google.com with SMTP id l21so6125714iak.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 18:12:03 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/4] mtd: nand: fix SCAN2NDPAGE check for BBM
Date: Fri, 13 Jan 2012 18:11:48 -0800
Message-Id: <1326507110-10893-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1326507110-10893-1-git-send-email-computersforpeace@gmail.com>
References: <1326507110-10893-1-git-send-email-computersforpeace@gmail.com>
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

nand_block_bad() doesn't check the correct pages when
NAND_BBT_SCAN2NDPAGE is enabled. It should scan both the OOB region of
both the 1st and 2nd page of each block.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   40 +++++++++++++++++++++++-----------------
 1 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f0e768f..c1ec4fb 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -338,7 +338,7 @@ static int nand_verify_buf16(struct mtd_info *mtd, const uint8_t *buf, int len)
  */
 static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 {
-	int page, chipnr, res = 0;
+	int page, chipnr, res = 0, i = 0;
 	struct nand_chip *chip = mtd->priv;
 	u16 bad;
 
@@ -356,23 +356,29 @@ static int nand_block_bad(struct mtd_info *mtd, loff_t ofs, int getchip)
 		chip->select_chip(mtd, chipnr);
 	}
 
-	if (chip->options & NAND_BUSWIDTH_16) {
-		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos & 0xFE,
-			      page);
-		bad = cpu_to_le16(chip->read_word(mtd));
-		if (chip->badblockpos & 0x1)
-			bad >>= 8;
-		else
-			bad &= 0xFF;
-	} else {
-		chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos, page);
-		bad = chip->read_byte(mtd);
-	}
+	do {
+		if (chip->options & NAND_BUSWIDTH_16) {
+			chip->cmdfunc(mtd, NAND_CMD_READOOB,
+					chip->badblockpos & 0xFE, page);
+			bad = cpu_to_le16(chip->read_word(mtd));
+			if (chip->badblockpos & 0x1)
+				bad >>= 8;
+			else
+				bad &= 0xFF;
+		} else {
+			chip->cmdfunc(mtd, NAND_CMD_READOOB, chip->badblockpos,
+					page);
+			bad = chip->read_byte(mtd);
+		}
 
-	if (likely(chip->badblockbits == 8))
-		res = bad != 0xFF;
-	else
-		res = hweight8(bad) < chip->badblockbits;
+		if (likely(chip->badblockbits == 8))
+			res = bad != 0xFF;
+		else
+			res = hweight8(bad) < chip->badblockbits;
+		ofs += mtd->writesize;
+		page = (int)(ofs >> chip->page_shift) & chip->pagemask;
+		i++;
+	} while (!res && i < 2 && (chip->bbt_options & NAND_BBT_SCAN2NDPAGE));
 
 	if (getchip)
 		nand_release_device(mtd);
-- 
1.7.5.4
