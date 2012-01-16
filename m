Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RmsQ3-0005Dc-Na
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2012 19:40:40 +0000
Received: by iakl21 with SMTP id l21so10941102iak.36
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2012 11:40:35 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: fixup "mtd: nand: erase block before marking bad"
Date: Mon, 16 Jan 2012 11:40:45 -0800
Message-Id: <1326742845-22788-1-git-send-email-computersforpeace@gmail.com>
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

The following commit had an incorrect solution:

   mtd: nand: erase block before marking bad
   commit ece080820c9dddf467b6da08a8bfbab66615a03b

When trying to erase a block before writing to its OOB marker, we erase
after we mark the memory BBT. This causes an error like this:

   nand_erase_nand: attempt to erase a bad block at page 0x00000000

This patch is a fixup that moves the erase code block to the correct
location.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   19 +++++++++++--------
 1 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ecc3f52..c6603d4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -400,6 +400,17 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	uint8_t buf[2] = { 0, 0 };
 	int block, ret, i = 0;
 
+	if (!(chip->bbt_options & NAND_BBT_USE_FLASH)) {
+		struct erase_info einfo;
+
+		/* Attempt erase before marking OOB */
+		memset(&einfo, 0, sizeof(einfo));
+		einfo.mtd = mtd;
+		einfo.addr = ofs;
+		einfo.len = 1 << chip->phys_erase_shift;
+		nand_erase_nand(mtd, &einfo, 0);
+	}
+
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
 
@@ -413,14 +424,6 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		ret = nand_update_bbt(mtd, ofs);
 	else {
 		struct mtd_oob_ops ops;
-		struct erase_info einfo;
-
-		/* Attempt erase before marking OOB */
-		memset(&einfo, 0, sizeof(einfo));
-		einfo.mtd = mtd;
-		einfo.addr = ofs;
-		einfo.len = 1 << chip->phys_erase_shift;
-		nand_erase_nand(mtd, &einfo, 0);
 
 		nand_get_device(chip, mtd, FL_WRITING);
 
-- 
1.7.5.4
