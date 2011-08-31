Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QyZwW-00059D-QO
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 01:50:19 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 10/12] mtd: nand: kill member `ops' of `struct
 nand_chip'
Date: Tue, 30 Aug 2011 18:45:45 -0700
Message-ID: <1314755147-17756-11-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
References: <1314755147-17756-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, b35362@freescale.com,
	linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The nand_chip.ops field is a struct that is passed around globally with
no particular reason. Every time it is used, it could just as easily be
replaced with a local struct that is updated on each operation. So make
it local.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c |   46 ++++++++++++++++++++++-------------------
 include/linux/mtd/nand.h     |    3 --
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e5c6a13..de2d1c4 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -406,6 +406,8 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	if (chip->bbt_options & NAND_BBT_USE_FLASH)
 		ret = nand_update_bbt(mtd, ofs);
 	else {
+		struct mtd_oob_ops ops;
+
 		nand_get_device(chip, mtd, FL_WRITING);
 
 		/*
@@ -414,13 +416,12 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		 * procedure. We write two bytes per location, so we dont have
 		 * to mess with 16 bit access.
 		 */
+		ops.len = ops.ooblen = 2;
+		ops.datbuf = NULL;
+		ops.oobbuf = buf;
+		ops.ooboffs = chip->badblockpos & ~0x01;
 		do {
-			chip->ops.len = chip->ops.ooblen = 2;
-			chip->ops.datbuf = NULL;
-			chip->ops.oobbuf = buf;
-			chip->ops.ooboffs = chip->badblockpos & ~0x01;
-
-			ret = nand_do_write_oob(mtd, ofs, &chip->ops);
+			ret = nand_do_write_oob(mtd, ofs, &ops);
 
 			i++;
 			ofs += mtd->writesize;
@@ -1573,6 +1574,7 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 		     size_t *retlen, uint8_t *buf)
 {
 	struct nand_chip *chip = mtd->priv;
+	struct mtd_oob_ops ops;
 	int ret;
 
 	/* Do not allow reads past end of device */
@@ -1583,13 +1585,13 @@ static int nand_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	nand_get_device(chip, mtd, FL_READING);
 
-	chip->ops.len = len;
-	chip->ops.datbuf = buf;
-	chip->ops.oobbuf = NULL;
+	ops.len = len;
+	ops.datbuf = buf;
+	ops.oobbuf = NULL;
 
-	ret = nand_do_read_ops(mtd, from, &chip->ops);
+	ret = nand_do_read_ops(mtd, from, &ops);
 
-	*retlen = chip->ops.retlen;
+	*retlen = ops.retlen;
 
 	nand_release_device(mtd);
 
@@ -2278,6 +2280,7 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 			    size_t *retlen, const uint8_t *buf)
 {
 	struct nand_chip *chip = mtd->priv;
+	struct mtd_oob_ops ops;
 	int ret;
 
 	/* Do not allow reads past end of device */
@@ -2292,13 +2295,13 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	/* Grab the device */
 	panic_nand_get_device(chip, mtd, FL_WRITING);
 
-	chip->ops.len = len;
-	chip->ops.datbuf = (uint8_t *)buf;
-	chip->ops.oobbuf = NULL;
+	ops.len = len;
+	ops.datbuf = (uint8_t *)buf;
+	ops.oobbuf = NULL;
 
-	ret = nand_do_write_ops(mtd, to, &chip->ops);
+	ret = nand_do_write_ops(mtd, to, &ops);
 
-	*retlen = chip->ops.retlen;
+	*retlen = ops.retlen;
 	return ret;
 }
 
@@ -2316,6 +2319,7 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 			  size_t *retlen, const uint8_t *buf)
 {
 	struct nand_chip *chip = mtd->priv;
+	struct mtd_oob_ops ops;
 	int ret;
 
 	/* Do not allow reads past end of device */
@@ -2326,13 +2330,13 @@ static int nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 
 	nand_get_device(chip, mtd, FL_WRITING);
 
-	chip->ops.len = len;
-	chip->ops.datbuf = (uint8_t *)buf;
-	chip->ops.oobbuf = NULL;
+	ops.len = len;
+	ops.datbuf = (uint8_t *)buf;
+	ops.oobbuf = NULL;
 
-	ret = nand_do_write_ops(mtd, to, &chip->ops);
+	ret = nand_do_write_ops(mtd, to, &ops);
 
-	*retlen = chip->ops.retlen;
+	*retlen = ops.retlen;
 
 	nand_release_device(mtd);
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 0b3d464..904131b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -427,7 +427,6 @@ struct nand_buffers {
  * @ecc:		[BOARDSPECIFIC] ECC control structure
  * @buffers:		buffer structure for read/write
  * @hwcontrol:		platform-specific hardware control structure
- * @ops:		oob operation operands
  * @erase_cmd:		[INTERN] erase command write function, selectable due
  *			to AND support.
  * @scan_bbt:		[REPLACEABLE] function to scan bad block table
@@ -535,8 +534,6 @@ struct nand_chip {
 	struct nand_buffers *buffers;
 	struct nand_hw_control hwcontrol;
 
-	struct mtd_oob_ops ops;
-
 	uint8_t *bbt;
 	struct nand_bbt_descr *bbt_td;
 	struct nand_bbt_descr *bbt_md;
-- 
1.7.5.4
