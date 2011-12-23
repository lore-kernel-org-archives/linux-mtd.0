Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9aI-0005S9-3a
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:11:13 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 28/28] mtd: introduce mtd_put_device interface
Date: Fri, 23 Dec 2011 20:11:20 +0200
Message-Id: <1324663880-22477-29-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/mtdcore.c   |    2 +-
 fs/logfs/super.c        |    6 +++---
 include/linux/mtd/mtd.h |   18 ++++++++++++------
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index fbecbe8..8395b61 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -677,7 +677,7 @@ void __put_mtd_device(struct mtd_info *mtd)
 	BUG_ON(mtd->usecount < 0);
 
 	if (mtd->put_device)
-		mtd->put_device(mtd);
+		mtd_put_device(mtd);
 
 	module_put(mtd->owner);
 }
diff --git a/fs/logfs/super.c b/fs/logfs/super.c
index e795c234..2234d29 100644
--- a/fs/logfs/super.c
+++ b/fs/logfs/super.c
@@ -503,7 +503,7 @@ static void logfs_kill_sb(struct super_block *sb)
 	logfs_cleanup_rw(sb);
 	if (super->s_erase_page)
 		__free_page(super->s_erase_page);
-	super->s_devops->put_device(super);
+	mtd_put_device(super);
 	logfs_mempool_destroy(super->s_btree_pool);
 	logfs_mempool_destroy(super->s_alias_pool);
 	kfree(super);
@@ -522,14 +522,14 @@ static struct dentry *logfs_get_sb_device(struct logfs_super *super,
 	err = -EINVAL;
 	sb = sget(type, logfs_sb_test, logfs_sb_set, super);
 	if (IS_ERR(sb)) {
-		super->s_devops->put_device(super);
+		mtd_put_device(super);
 		kfree(super);
 		return ERR_CAST(sb);
 	}
 
 	if (sb->s_root) {
 		/* Device is already in use */
-		super->s_devops->put_device(super);
+		mtd_put_device(super);
 		kfree(super);
 		return dget(sb->s_root);
 	}
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 0e696b7..e8c4409 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -215,6 +215,7 @@ struct mtd_info {
 	int (*suspend) (struct mtd_info *mtd);
 	void (*resume) (struct mtd_info *mtd);
 	int (*get_device) (struct mtd_info *mtd);
+	void (*put_device) (struct mtd_info *mtd);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
@@ -233,12 +234,6 @@ struct mtd_info {
 	struct module *owner;
 	struct device dev;
 	int usecount;
-
-	/* If the driver is something smart, like UBI, it may need to maintain
-	 * its own reference counting. The below functions are only for driver.
-	 * The driver may register its callbacks. These callbacks are not
-	 * supposed to be called by MTD users */
-	void (*put_device) (struct mtd_info *mtd);
 };
 
 /*
@@ -414,11 +409,22 @@ static inline int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return mtd->block_markbad(mtd, ofs);
 }
 
+/*
+ * If the driver is something smart, like UBI, it may need to maintain its own
+ * reference counting. The below functions are only for driver. The driver may
+ * register its callbacks. These callbacks are not supposed to be called by MTD
+ * users.
+ */
 static inline int mtd_get_device(struct mtd_info *mtd)
 {
 	return mtd->get_device(mtd);
 }
 
+static inline void mtd_put_device(struct mtd_info *mtd)
+{
+	return mtd->put_device(mtd);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
