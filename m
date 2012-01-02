Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqu-0003TG-2Z
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:58 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/17] mtd: do not use mtd->sync directly
Date: Mon,  2 Jan 2012 14:20:42 +0200
Message-Id: <1325506847-23470-13-git-send-email-dedekind1@gmail.com>
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

This patch teaches 'mtd_sync()' to do nothing when the MTD driver does
not have the '->sync()' method, which allows us to remove all direct
'mtd->sync' accesses.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ftl.c       |    3 +--
 drivers/mtd/mtdblock.c  |    7 ++-----
 drivers/mtd/mtdchar.c   |    2 +-
 drivers/mtd/mtdswap.c   |    3 +--
 drivers/mtd/rfd_ftl.c   |    3 +--
 drivers/mtd/ubi/kapi.c  |    4 +---
 fs/jffs2/super.c        |    4 +---
 fs/logfs/dev_mtd.c      |    3 +--
 include/linux/mtd/mtd.h |    3 ++-
 9 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index c9c9029..19d6372 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -650,8 +650,7 @@ static int reclaim_block(partition_t *part)
 	    if (queued) {
 		pr_debug("ftl_cs: waiting for transfer "
 		      "unit to be prepared...\n");
-		if (part->mbd.mtd->sync)
-			mtd_sync(part->mbd.mtd);
+		mtd_sync(part->mbd.mtd);
 	    } else {
 		static int ne = 0;
 		if (++ne < 5)
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 496e1a6..af65912 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -322,8 +322,7 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 
 	if (!--mtdblk->count) {
 		/* It was the last usage. Free the cache */
-		if (mbd->mtd->sync)
-			mtd_sync(mbd->mtd);
+		mtd_sync(mbd->mtd);
 		vfree(mtdblk->cache_data);
 	}
 
@@ -341,9 +340,7 @@ static int mtdblock_flush(struct mtd_blktrans_dev *dev)
 	mutex_lock(&mtdblk->cache_mutex);
 	write_cached_data(mtdblk);
 	mutex_unlock(&mtdblk->cache_mutex);
-
-	if (dev->mtd->sync)
-		mtd_sync(dev->mtd);
+	mtd_sync(dev->mtd);
 	return 0;
 }
 
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 2020a16..23a5110 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -154,7 +154,7 @@ static int mtdchar_close(struct inode *inode, struct file *file)
 	pr_debug("MTD_close\n");
 
 	/* Only sync if opened RW */
-	if ((file->f_mode & FMODE_WRITE) && mtd->sync)
+	if ((file->f_mode & FMODE_WRITE))
 		mtd_sync(mtd);
 
 	iput(mfi->ino);
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 4441c08..fe4426c 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1047,8 +1047,7 @@ static int mtdswap_flush(struct mtd_blktrans_dev *dev)
 {
 	struct mtdswap_dev *d = MTDSWAP_MBD_TO_MTDSWAP(dev);
 
-	if (d->mtd->sync)
-		mtd_sync(d->mtd);
+	mtd_sync(d->mtd);
 	return 0;
 }
 
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 5426d42..233b946 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -448,8 +448,7 @@ static int reclaim_block(struct partition *part, u_long *old_sector)
 	int rc;
 
 	/* we have a race if sync doesn't exist */
-	if (part->mbd.mtd->sync)
-		mtd_sync(part->mbd.mtd);
+	mtd_sync(part->mbd.mtd);
 
 	score = 0x7fffffff; /* MAX_INT */
 	best_block = -1;
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 9f265cc..9fdb353 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -714,9 +714,7 @@ int ubi_sync(int ubi_num)
 	if (!ubi)
 		return -ENODEV;
 
-	if (ubi->mtd->sync)
-		mtd_sync(ubi->mtd);
-
+	mtd_sync(ubi->mtd);
 	ubi_put_device(ubi);
 	return 0;
 }
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index e78bf3c..5863a36 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -336,9 +336,7 @@ static void jffs2_put_super (struct super_block *sb)
 	jffs2_flash_cleanup(c);
 	kfree(c->inocache_list);
 	jffs2_clear_xattr_subsystem(c);
-	if (c->mtd->sync)
-		mtd_sync(c->mtd);
-
+	mtd_sync(c->mtd);
 	D1(printk(KERN_DEBUG "jffs2_put_super returning\n"));
 }
 
diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index 136c736..3f465882 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -119,8 +119,7 @@ static void logfs_mtd_sync(struct super_block *sb)
 {
 	struct mtd_info *mtd = logfs_super(sb)->s_mtd;
 
-	if (mtd->sync)
-		mtd_sync(mtd);
+	mtd_sync(mtd);
 }
 
 static int logfs_mtd_readpage(void *_sb, struct page *page)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a58ecf4..305f12b 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -399,7 +399,8 @@ int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 
 static inline void mtd_sync(struct mtd_info *mtd)
 {
-	mtd->sync(mtd);
+	if (mtd->sync)
+		mtd->sync(mtd);
 }
 
 /* Chip-supported device locking */
-- 
1.7.7.3
