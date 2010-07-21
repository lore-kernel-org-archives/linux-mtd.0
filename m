Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Obj7p-00006p-05
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 23:54:57 +0000
From: "Brian Norris" <norris@broadcom.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] mtd/nand: Update nand_default_block_markbad()
Date: Wed, 21 Jul 2010 16:53:47 -0700
Message-ID: <1279756427-9143-1-git-send-email-norris@broadcom.com>
In-Reply-To: <1279059181-29300-1-git-send-email-norris@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <David.Woodhouse@intel.com>,
	Brian Norris <norris@broadcom.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an update that depends on the previous patches I sent.

We can now write to all the appropriate BB marker locations (i.e.
pages 1 AND 2, bytes 1 AND 6) with nand_default_block_markbad() if
necessary, according to the flags marked in chip->options.

Note that I removed the line:
	ofs += mtd->oobsize;
Unless I am wrong, this line was completely unnecessary in the
first place.

Signed-off-by: Brian Norris <norris@broadcom.com>
---
 drivers/mtd/nand/nand_base.c |   34 ++++++++++++++++++++++++----------
 1 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index c2901bd..ee6a6f8 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -397,7 +397,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd->priv;
 	uint8_t buf[2] = { 0, 0 };
-	int block, ret;
+	int block, ret, i = 0;
 
 	if (chip->options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
@@ -411,17 +411,31 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	if (chip->options & NAND_USE_FLASH_BBT)
 		ret = nand_update_bbt(mtd, ofs);
 	else {
-		/* We write two bytes, so we dont have to mess with 16 bit
-		 * access
-		 */
 		nand_get_device(chip, mtd, FL_WRITING);
-		ofs += mtd->oobsize;
-		chip->ops.len = chip->ops.ooblen = 2;
-		chip->ops.datbuf = NULL;
-		chip->ops.oobbuf = buf;
-		chip->ops.ooboffs = chip->badblockpos & ~0x01;
 
-		ret = nand_do_write_oob(mtd, ofs, &chip->ops);
+		/* Write to first two pages and to byte 1 and 6 if necessary.
+		 * If we write to more than one location, the first error
+		 * encountered quits the procedure. We write two bytes per
+		 * location, so we dont have to mess with 16 bit access.
+		 */
+		do {
+			chip->ops.len = chip->ops.ooblen = 2;
+			chip->ops.datbuf = NULL;
+			chip->ops.oobbuf = buf;
+			chip->ops.ooboffs = chip->badblockpos & ~0x01;
+
+			ret = nand_do_write_oob(mtd, ofs, &chip->ops);
+
+			if (!ret && (chip->options & NAND_BBT_SCANBYTE1AND6)) {
+				chip->ops.ooboffs = NAND_SMALL_BADBLOCK_POS
+					& ~0x01;
+				ret = nand_do_write_oob(mtd, ofs, &chip->ops);
+			}
+			i++;
+			ofs += mtd->writesize;
+		} while (!ret && (chip->options & NAND_BBT_SCAN2NDPAGE) &&
+				i < 2);
+
 		nand_release_device(mtd);
 	}
 	if (!ret)
-- 
1.7.0.4
