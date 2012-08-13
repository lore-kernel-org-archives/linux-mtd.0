Received: from mailserver5.natinst.com ([130.164.80.5]
 helo=spamkiller05.natinst.com)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T12Og-0006v6-Ul
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2012 21:42:04 +0000
Received: from mailserv58-us.natinst.com (nb-hsrp-1338.natinst.com
 [130.164.19.133])
 by spamkiller05.natinst.com (8.14.4/8.14.4) with ESMTP id q7DLfomo006051
 for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2012 16:41:56 -0500
From: Jeff Westfahl <jeff.westfahl@ni.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: Added a device flag for subpage read support
Date: Mon, 13 Aug 2012 16:35:30 -0500
Message-Id: <1344893730-11345-1-git-send-email-jeff.westfahl@ni.com>
Cc: Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Added a NAND device flag for subpage read support. Previously this was
hard coded based on large page and soft ECC.
Updated base NAND driver to use the new subpage read flag if the NAND is
large page and soft ECC.

Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
---
 drivers/mtd/nand/nand_base.c |    9 +++++++--
 include/linux/mtd/nand.h     |    7 ++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a11253a..a1cb9b3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1525,7 +1525,8 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 				ret = chip->ecc.read_page_raw(mtd, chip, bufpoi,
 							      oob_required,
 							      page);
-			else if (!aligned && NAND_SUBPAGE_READ(chip) && !oob)
+			else if (!aligned && NAND_HAS_SUBPAGE_READ(chip) &&
+				 !oob)
 				ret = chip->ecc.read_subpage(mtd, chip,
 							col, bytes, bufpoi);
 			else
@@ -1542,7 +1543,7 @@ static int nand_do_read_ops(struct mtd_info *mtd, loff_t from,
 
 			/* Transfer not aligned data */
 			if (!aligned) {
-				if (!NAND_SUBPAGE_READ(chip) && !oob &&
+				if (!NAND_HAS_SUBPAGE_READ(chip) && !oob &&
 				    !(mtd->ecc_stats.failed - stats.failed) &&
 				    (ops->mode != MTD_OPS_RAW)) {
 					chip->pagebuf = realpage;
@@ -3477,6 +3478,10 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* Invalidate the pagebuffer reference */
 	chip->pagebuf = -1;
 
+	/* Large page NAND with SOFT_ECC should support subpage reads */
+	if ((chip->ecc.mode == NAND_ECC_SOFT) && (chip->page_shift > 9))
+		chip->options |= NAND_SUBPAGE_READ;
+
 	/* Fill in remaining MTD driver data */
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = (chip->options & NAND_ROM) ? MTD_CAP_ROM :
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 57977c6..738540d 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -200,6 +200,9 @@ typedef enum {
 /* Device behaves just like nand, but is readonly */
 #define NAND_ROM		0x00000800
 
+/* Device supports subpage reads */
+#define NAND_SUBPAGE_READ	0x00001000
+
 /* Options valid for Samsung large page devices */
 #define NAND_SAMSUNG_LP_OPTIONS \
 	(NAND_NO_PADDING | NAND_CACHEPRG | NAND_COPYBACK)
@@ -208,9 +211,7 @@ typedef enum {
 #define NAND_MUST_PAD(chip) (!(chip->options & NAND_NO_PADDING))
 #define NAND_HAS_CACHEPROG(chip) ((chip->options & NAND_CACHEPRG))
 #define NAND_HAS_COPYBACK(chip) ((chip->options & NAND_COPYBACK))
-/* Large page NAND with SOFT_ECC should support subpage reads */
-#define NAND_SUBPAGE_READ(chip) ((chip->ecc.mode == NAND_ECC_SOFT) \
-					&& (chip->page_shift > 9))
+#define NAND_HAS_SUBPAGE_READ(chip) ((chip->options & NAND_SUBPAGE_READ))
 
 /* Mask to zero out the chip options, which come from the id table */
 #define NAND_CHIPOPTIONS_MSK	0x0000ffff
-- 
1.7.1
