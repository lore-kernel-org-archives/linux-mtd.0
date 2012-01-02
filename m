Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgr0-0003WL-7d
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:19:03 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/17] mtd: do not use mtd->block_markbad directly
Date: Mon,  2 Jan 2012 14:20:47 +0200
Message-Id: <1325506847-23470-18-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Instead, use the new 'mtd_can_have_bb()', or just rely on 'mtd_block_markbad()'
return code, which will be -EOPNOTSUPP if bad blocks are not supported.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c   |    5 +----
 drivers/mtd/mtdconcat.c |    2 +-
 drivers/mtd/mtdoops.c   |    2 +-
 drivers/mtd/mtdswap.c   |    2 +-
 fs/jffs2/wbuf.c         |    3 ---
 include/linux/mtd/mtd.h |    2 ++
 6 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 64efcbf..50c6a1e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -877,10 +877,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 
 		if (copy_from_user(&offs, argp, sizeof(loff_t)))
 			return -EFAULT;
-		if (!mtd->block_markbad)
-			ret = -EOPNOTSUPP;
-		else
-			return mtd_block_markbad(mtd, offs);
+		return mtd_block_markbad(mtd, offs);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index fbf3cb1..1ed5103 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -673,7 +673,7 @@ static int concat_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	struct mtd_concat *concat = CONCAT(mtd);
 	int i, err = -EINVAL;
 
-	if (!concat->subdev[0]->block_markbad)
+	if (!mtd_can_have_bb(concat->subdev[0]))
 		return 0;
 
 	if (ofs > mtd->size)
diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index a4c8f67..db8e827 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -199,7 +199,7 @@ badblock:
 		return;
 	}
 
-	if (mtd->block_markbad && ret == -EIO) {
+	if (mtd_can_have_bb(mtd) && ret == -EIO) {
 		ret = mtd_block_markbad(mtd, cxt->nextpage * record_size);
 		if (ret < 0) {
 			printk(KERN_ERR "mtdoops: block_markbad failed, aborting\n");
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 3fc8cb2..c92f0f6 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -274,7 +274,7 @@ static int mtdswap_handle_badblock(struct mtdswap_dev *d, struct swap_eb *eb)
 	eb->root = NULL;
 
 	/* badblocks not supported */
-	if (!d->mtd->block_markbad)
+	if (!mtd_can_have_bb(d->mtd))
 		return 1;
 
 	offset = mtdswap_eb_offset(d, eb);
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
index fd96b75..30e8f47 100644
--- a/fs/jffs2/wbuf.c
+++ b/fs/jffs2/wbuf.c
@@ -1130,9 +1130,6 @@ int jffs2_write_nand_badblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *
 	if( ++jeb->bad_count < MAX_ERASE_FAILURES)
 		return 0;
 
-	if (!c->mtd->block_markbad)
-		return 1; // What else can we do?
-
 	printk(KERN_WARNING "JFFS2: marking eraseblock at %08x\n as bad", bad_offset);
 	ret = mtd_block_markbad(c->mtd, bad_offset);
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 7e35755..1a81fde 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -447,6 +447,8 @@ static inline int mtd_block_isbad(struct mtd_info *mtd, loff_t ofs)
 
 static inline int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
+	if (!mtd->block_markbad)
+		return -EOPNOTSUPP;
 	return mtd->block_markbad(mtd, ofs);
 }
 
-- 
1.7.7.3
