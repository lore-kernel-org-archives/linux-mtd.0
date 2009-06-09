Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1ME6R7-0000Tv-Lc
	for linux-mtd@lists.infradead.org; Tue, 09 Jun 2009 18:52:48 +0000
Received: by fxm8 with SMTP id 8so259217fxm.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Jun 2009 11:52:39 -0700 (PDT)
From: Mika Korhonen <mika.j.korhonen@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD OneNAND: typo fixes
Date: Tue,  9 Jun 2009 21:52:35 +0300
Message-Id: <1244573555-8577-1-git-send-email-mika.j.korhonen@gmail.com>
Cc: Mika Korhonen <mika.j.korhonen@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mika Korhonen <mika.j.korhonen@gmail.com>
---
 drivers/mtd/onenand/onenand_base.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 864327e..4c18736 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1182,7 +1182,7 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
  			/*
  			 * Chip boundary handling in DDP
  			 * Now we issued chip 1 read and pointed chip 1
- 			 * bufferam so we have to point chip 0 bufferam.
+			 * bufferram so we have to point chip 0 bufferram.
  			 */
  			if (ONENAND_IS_DDP(this) &&
  			    unlikely(from == (this->chipsize >> 1))) {
@@ -1858,8 +1858,8 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 			ONENAND_SET_NEXT_BUFFERRAM(this);
 
 		/*
-		 * 2 PLANE, MLC, and Flex-OneNAND doesn't support
-		 * write-while-programe feature.
+		 * 2 PLANE, MLC, and Flex-OneNAND do not support
+		 * write-while-program feature.
 		 */
 		if (!ONENAND_IS_2PLANE(this) && !first) {
 			ONENAND_SET_PREV_BUFFERRAM(this);
@@ -1870,7 +1870,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 			onenand_update_bufferram(mtd, prev, !ret && !prev_subpage);
 			if (ret) {
 				written -= prevlen;
-				printk(KERN_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
+				printk(KERN_ERR "onenand_write_ops_nolock: write failed %d\n", ret);
 				break;
 			}
 
@@ -1896,7 +1896,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 			/* In partial page write we don't update bufferram */
 			onenand_update_bufferram(mtd, to, !ret && !subpage);
 			if (ret) {
-				printk(KERN_ERR "onenand_write_ops_nolock: write filaed %d\n", ret);
+				printk(KERN_ERR "onenand_write_ops_nolock: write failed %d\n", ret);
 				break;
 			}
 
@@ -2192,7 +2192,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	/* Grab the lock and see if the device is available */
 	onenand_get_device(mtd, FL_ERASING);
 
-	/* Loop throught the pages */
+	/* Loop through the blocks */
 	instr->state = MTD_ERASING;
 
 	while (len) {
@@ -2319,7 +2319,7 @@ static int onenand_default_block_markbad(struct mtd_info *mtd, loff_t ofs)
         if (bbm->bbt)
                 bbm->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
 
-        /* We write two bytes, so we dont have to mess with 16 bit access */
+        /* We write two bytes, so we don't have to mess with 16-bit access */
         ofs += mtd->oobsize + (bbm->badblockpos & ~0x01);
 	/* FIXME : What to do when marking SLC block in partition
 	 * 	   with MLC erasesize? For now, it is not advisable to
@@ -2548,7 +2548,7 @@ static void onenand_unlock_all(struct mtd_info *mtd)
 
 #ifdef CONFIG_MTD_ONENAND_OTP
 
-/* Interal OTP operation */
+/* Internal OTP operation */
 typedef int (*otp_op_t)(struct mtd_info *mtd, loff_t form, size_t len,
 		size_t *retlen, u_char *buf);
 
@@ -2912,7 +2912,7 @@ static void onenand_check_features(struct mtd_info *mtd)
 		this->options |= ONENAND_HAS_2PLANE;
 
 	case ONENAND_DEVICE_DENSITY_2Gb:
-		/* 2Gb DDP don't have 2 plane */
+		/* 2Gb DDP does not have 2 plane */
 		if (!ONENAND_IS_DDP(this))
 			this->options |= ONENAND_HAS_2PLANE;
 		this->options |= ONENAND_HAS_UNLOCK_ALL;
@@ -3374,7 +3374,7 @@ static int onenand_probe(struct mtd_info *mtd)
 	/* It's real page size */
 	this->writesize = mtd->writesize;
 
-	/* REVIST: Multichip handling */
+	/* REVISIT: Multichip handling */
 
 	if (FLEXONENAND(this))
 		flexonenand_get_size(mtd);
-- 
1.6.0.4
