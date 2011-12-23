Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9a4-0005IH-OS
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:59 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 19/28] mtd: introduce mtd_sync interface
Date: Fri, 23 Dec 2011 20:11:11 +0200
Message-Id: <1324663880-22477-20-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ftl.c       |    2 +-
 drivers/mtd/mtdblock.c  |    4 ++--
 drivers/mtd/mtdchar.c   |    2 +-
 drivers/mtd/mtdconcat.c |    2 +-
 drivers/mtd/mtdpart.c   |    2 +-
 drivers/mtd/mtdswap.c   |    2 +-
 drivers/mtd/rfd_ftl.c   |    2 +-
 drivers/mtd/ubi/kapi.c  |    2 +-
 fs/jffs2/super.c        |    2 +-
 fs/logfs/dev_mtd.c      |    2 +-
 include/linux/mtd/mtd.h |    9 ++++++---
 11 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index d591b1d..c9c9029 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -651,7 +651,7 @@ static int reclaim_block(partition_t *part)
 		pr_debug("ftl_cs: waiting for transfer "
 		      "unit to be prepared...\n");
 		if (part->mbd.mtd->sync)
-			part->mbd.mtd->sync(part->mbd.mtd);
+			mtd_sync(part->mbd.mtd);
 	    } else {
 		static int ne = 0;
 		if (++ne < 5)
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index ac7f1f1..496e1a6 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -323,7 +323,7 @@ static int mtdblock_release(struct mtd_blktrans_dev *mbd)
 	if (!--mtdblk->count) {
 		/* It was the last usage. Free the cache */
 		if (mbd->mtd->sync)
-			mbd->mtd->sync(mbd->mtd);
+			mtd_sync(mbd->mtd);
 		vfree(mtdblk->cache_data);
 	}
 
@@ -343,7 +343,7 @@ static int mtdblock_flush(struct mtd_blktrans_dev *dev)
 	mutex_unlock(&mtdblk->cache_mutex);
 
 	if (dev->mtd->sync)
-		dev->mtd->sync(dev->mtd);
+		mtd_sync(dev->mtd);
 	return 0;
 }
 
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 41be99c..a96a353 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -155,7 +155,7 @@ static int mtdchar_close(struct inode *inode, struct file *file)
 
 	/* Only sync if opened RW */
 	if ((file->f_mode & FMODE_WRITE) && mtd->sync)
-		mtd->sync(mtd);
+		mtd_sync(mtd);
 
 	iput(mfi->ino);
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 6fdae19..cc2336e 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -620,7 +620,7 @@ static void concat_sync(struct mtd_info *mtd)
 
 	for (i = 0; i < concat->num_subdev; i++) {
 		struct mtd_info *subdev = concat->subdev[i];
-		subdev->sync(subdev);
+		mtd_sync(subdev);
 	}
 }
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index c0bfa88..2b54505 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -301,7 +301,7 @@ static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 static void part_sync(struct mtd_info *mtd)
 {
 	struct mtd_part *part = PART(mtd);
-	part->master->sync(part->master);
+	mtd_sync(part->master);
 }
 
 static int part_suspend(struct mtd_info *mtd)
diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 8579739..cb794e7 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1048,7 +1048,7 @@ static int mtdswap_flush(struct mtd_blktrans_dev *dev)
 	struct mtdswap_dev *d = MTDSWAP_MBD_TO_MTDSWAP(dev);
 
 	if (d->mtd->sync)
-		d->mtd->sync(d->mtd);
+		mtd_sync(d->mtd);
 	return 0;
 }
 
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index c594bb7..5426d42 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -449,7 +449,7 @@ static int reclaim_block(struct partition *part, u_long *old_sector)
 
 	/* we have a race if sync doesn't exist */
 	if (part->mbd.mtd->sync)
-		part->mbd.mtd->sync(part->mbd.mtd);
+		mtd_sync(part->mbd.mtd);
 
 	score = 0x7fffffff; /* MAX_INT */
 	best_block = -1;
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 1a35fc5..9f265cc 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -715,7 +715,7 @@ int ubi_sync(int ubi_num)
 		return -ENODEV;
 
 	if (ubi->mtd->sync)
-		ubi->mtd->sync(ubi->mtd);
+		mtd_sync(ubi->mtd);
 
 	ubi_put_device(ubi);
 	return 0;
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index e7e9744..e78bf3c 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -337,7 +337,7 @@ static void jffs2_put_super (struct super_block *sb)
 	kfree(c->inocache_list);
 	jffs2_clear_xattr_subsystem(c);
 	if (c->mtd->sync)
-		c->mtd->sync(c->mtd);
+		mtd_sync(c->mtd);
 
 	D1(printk(KERN_DEBUG "jffs2_put_super returning\n"));
 }
diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index 1842440..0ca7a07 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -120,7 +120,7 @@ static void logfs_mtd_sync(struct super_block *sb)
 	struct mtd_info *mtd = logfs_super(sb)->s_mtd;
 
 	if (mtd->sync)
-		mtd->sync(mtd);
+		mtd_sync(mtd);
 }
 
 static int logfs_mtd_readpage(void *_sb, struct page *page)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 4129cb5..47ea19c 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -206,15 +206,13 @@ struct mtd_info {
 				   size_t len);
 	int (*writev) (struct mtd_info *mtd, const struct kvec *vecs,
 			unsigned long count, loff_t to, size_t *retlen);
+	void (*sync) (struct mtd_info *mtd);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	/* Sync */
-	void (*sync) (struct mtd_info *mtd);
-
 	/* Chip-supported device locking */
 	int (*lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
@@ -381,6 +379,11 @@ static inline int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	return mtd->writev(mtd, vecs, count, to, retlen);
 }
 
+static inline void mtd_sync(struct mtd_info *mtd)
+{
+	mtd->sync(mtd);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
