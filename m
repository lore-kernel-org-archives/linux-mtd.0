Date: Wed, 12 Dec 2007 13:55:37 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][JFFS2] Fix mount error in case of MLC flash
Message-ID: <20071212045537.GA24490@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Even though we don't use the OOB, we should use the bad block information.
Also we read a whole eraseblock at a time.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 272872d..91db883 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -111,7 +111,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 	if (!flashbuf) {
 		/* For NAND it's quicker to read a whole eraseblock at a time,
 		   apparently */
-		if (jffs2_cleanmarker_oob(c))
+		if (c->mtd->type == MTD_NANDFLASH)
 			buf_size = c->sector_size;
 		else
 			buf_size = PAGE_SIZE;
@@ -448,22 +448,24 @@ static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblo
 	D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Scanning block at 0x%x\n", ofs));
 
 #ifdef CONFIG_JFFS2_FS_WRITEBUFFER
-	if (jffs2_cleanmarker_oob(c)) {
+	if (c->mtd->type == MTD_NANDFLASH) {
 		int ret;
 
 		if (c->mtd->block_isbad(c->mtd, jeb->offset))
 			return BLK_STATE_BADBLOCK;
 
-		ret = jffs2_check_nand_cleanmarker(c, jeb);
-		D2(printk(KERN_NOTICE "jffs_check_nand_cleanmarker returned %d\n",ret));
+		if (jffs2_cleanmarker_oob(c)) {
+			ret = jffs2_check_nand_cleanmarker(c, jeb);
+			D2(printk(KERN_NOTICE "jffs_check_nand_cleanmarker returned %d\n",ret));
 
-		/* Even if it's not found, we still scan to see
-		   if the block is empty. We use this information
-		   to decide whether to erase it or not. */
-		switch (ret) {
-		case 0:		cleanmarkerfound = 1; break;
-		case 1: 	break;
-		default: 	return ret;
+			/* Even if it's not found, we still scan to see
+			   if the block is empty. We use this information
+			   to decide whether to erase it or not. */
+			switch (ret) {
+			case 0:		cleanmarkerfound = 1; break;
+			case 1: 	break;
+			default: 	return ret;
+			}
 		}
 	}
 #endif
