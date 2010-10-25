Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PAIaB-00066P-Sg
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 08:39:08 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
	by co202.xi-lite.net (Postfix) with ESMTPS id DF7782602BA
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 11:05:58 +0200 (CEST)
Message-ID: <4CC54223.2050401@parrot.com>
Date: Mon, 25 Oct 2010 10:38:59 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] write bad block marker even with BBT
Content-Type: multipart/mixed; boundary="------------060305050001030305010700"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------060305050001030305010700
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Add a new flag to force writing bad block marker if we use bad block table.
This allow to solve problem where bootloader don't support reading BBT.

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>

--------------060305050001030305010700
Content-Type: text/x-diff; name="mtd_btt.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="mtd_btt.diff"

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ddffe76..4d79a8d 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -396,7 +396,7 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd->priv;
 	uint8_t buf[2] = { 0, 0 };
-	int block, ret, i = 0;
+	int block, ret = 0, i = 0;
 
 	if (chip->options & NAND_BBT_SCANLASTPAGE)
 		ofs += mtd->erasesize - mtd->writesize;
@@ -409,7 +409,12 @@ static int nand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	/* Do we have a flash based bad block table ? */
 	if (chip->options & NAND_USE_FLASH_BBT)
 		ret = nand_update_bbt(mtd, ofs);
-	else {
+
+	/* Write the bad block marker if we don't have BBT, or driver
+	 * request it (in case the bootloader doesn't support reading it
+	 * or we loose BBT).
+	 */
+	if (!(chip->options & NAND_USE_FLASH_BBT) || chip->options & NAND_WRITE_BB) {
 		nand_get_device(chip, mtd, FL_WRITING);
 
 		/* Write to first two pages and to byte 1 and 6 if necessary.
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 102e12c..2efd2f9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -215,6 +215,8 @@ typedef enum {
 #define NAND_OWN_BUFFERS	0x00040000
 /* Chip may not exist, so silence any errors in scan */
 #define NAND_SCAN_SILENT_NODEV	0x00080000
+/* in case of NAND_USE_FLASH_BBT, write also bad block marker */
+#define NAND_WRITE_BB	0x00100000
 
 /* Options set by nand scan */
 /* Nand scan has allocated controller struct */

--------------060305050001030305010700--
