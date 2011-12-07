Received: from mail-qy0-f177.google.com ([209.85.216.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYOjc-00061P-4Z
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 21:09:00 +0000
Received: by qcsf1 with SMTP id f1so914519qcs.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 13:08:58 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd: nand: write bad block marker even with BBT
Date: Wed,  7 Dec 2011 13:08:20 -0800
Message-Id: <1323292100-19280-1-git-send-email-computersforpeace@gmail.com>
Cc: Jim Quinlan <jim2101024@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add and option (NAND_BBT_WRITE_BBM) for writing bad block markers to
proper OOB area on each block in addition to flash-based BBT. This is
useful when:

 * bootloader cannot read the flash-based BBT format
 * BBT is corrupted and the flash must be rescanned for bad
   blocks; we want to remember bad blocks that were marked from Linux

Adapted from code by Matthieu CASTET.

Cc: Matthieu CASTET <matthieu.castet@parrot.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Last year's discussion thread:
    http://lists.infradead.org/pipermail/linux-mtd/2010-October/032942.html

I'll address the criticisms:

"add a BUG_ON to catch misuse cases when NAND_WRITE_BB [now named
NAND_BBT_WRITE_BBM] is used without NAND_USE_FLASH_BBT - they should go
in pair"

NAND_BBT_WRITE_BBM has no special effect when used without
NAND_BBT_USE_FLASH; it's already the default behavior. So I don't expect
it to be an issue.

"And also, how about cases when BBT is updated, but OOB did not because
of a power cut"

Not a very likely case as bad blocks are written infrequently, plus for
the situations where we're writing BBM simply because the bootloader
doesn't understand our BBT, having 99% of blocks marked properly is
better than none.

 drivers/mtd/nand/nand_base.c |   11 +++++++++--
 include/linux/mtd/bbm.h      |    9 +++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 35b4565..6d619f7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -392,7 +392,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd->priv;
 	uint8_t buf[2] = { 0, 0 };
-	int block, ret, i = 0;
+	int block, ret = 0, i = 0;
 
 	if (chip->bbt_options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
@@ -405,7 +405,14 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	/* Do we have a flash based bad block table? */
 	if (chip->bbt_options & NAND_BBT_USE_FLASH)
 		ret = nand_update_bbt(mtd, ofs);
-	else {
+	/*
+	 * Write bad block marker to OOB, in one of two cases:
+	 *  (1) we don't have flash-based BBT
+	 *  (2) we have flash-based BBT but also want to keep markers in OOB in
+	 *      each block
+	 */
+	if (!(chip->bbt_options & NAND_BBT_USE_FLASH) ||
+			(chip->bbt_options & NAND_BBT_WRITE_BBM)) {
 		struct mtd_oob_ops ops;
 
 		nand_get_device(chip, mtd, FL_WRITING);
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index c4eec22..61fcb30 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -112,6 +112,15 @@ struct nand_bbt_descr {
 #define NAND_BBT_USE_FLASH	0x00020000
 /* Do not store flash based bad block table in OOB area; store it in-band */
 #define NAND_BBT_NO_OOB		0x00040000
+/*
+ * Write bad block marker to OOB when marking new bad blocks. This is the
+ * default behavior without NAND_USE_FLASH_BBT, so this is only useful in
+ * conjunction with NAND_USE_FLASH_BBT.
+ * One might need bad blocks marked in each block as well as in BBT when
+ * bootloader cannot read the flash-based BBT format or when the BBT is
+ * corrupted and the flash must be rescanned for bad blocks.
+ */
+#define NAND_BBT_WRITE_BBM	0x00080000
 
 /*
  * Flag set by nand_create_default_bbt_descr(), marking that the nand_bbt_descr
-- 
1.7.5.4
