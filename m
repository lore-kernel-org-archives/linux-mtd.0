Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9a6-0005HI-0l
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:11:00 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 21/28] mtd: introduce mtd_unlock interface
Date: Fri, 23 Dec 2011 20:11:13 +0200
Message-Id: <1324663880-22477-22-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/mtdchar.c   |    2 +-
 drivers/mtd/mtdconcat.c |    2 +-
 drivers/mtd/mtdcore.c   |    2 +-
 drivers/mtd/mtdpart.c   |    2 +-
 include/linux/mtd/mtd.h |    7 ++++++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index ae03197..516aee6 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -838,7 +838,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (!mtd->unlock)
 			ret = -EOPNOTSUPP;
 		else
-			ret = mtd->unlock(mtd, einfo.start, einfo.length);
+			ret = mtd_unlock(mtd, einfo.start, einfo.length);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 97d6360..272ebc0 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -596,7 +596,7 @@ static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 			size = len;
 
 		if (subdev->unlock) {
-			err = subdev->unlock(subdev, ofs, size);
+			err = mtd_unlock(subdev, ofs, size);
 			if (err)
 				break;
 		} else
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e36191a..4a21557 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -340,7 +340,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	/* Some chips always power up locked. Unlock them now */
 	if ((mtd->flags & MTD_WRITEABLE)
 	    && (mtd->flags & MTD_POWERUP_LOCK) && mtd->unlock) {
-		if (mtd->unlock(mtd, 0, mtd->size))
+		if (mtd_unlock(mtd, 0, mtd->size))
 			printk(KERN_WARNING
 			       "%s: unlock failed, writes may not work\n",
 			       mtd->name);
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index a5e7a21..d65af37 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -287,7 +287,7 @@ static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct mtd_part *part = PART(mtd);
 	if ((len + ofs) > mtd->size)
 		return -EINVAL;
-	return part->master->unlock(part->master, ofs + part->offset, len);
+	return mtd_unlock(part->master, ofs + part->offset, len);
 }
 
 static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 167bac2e..f30c358 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -208,13 +208,13 @@ struct mtd_info {
 			unsigned long count, loff_t to, size_t *retlen);
 	void (*sync) (struct mtd_info *mtd);
 	int (*lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
+	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
 	/* Power Management functions */
@@ -389,6 +389,11 @@ static inline int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return mtd->lock(mtd, ofs, len);
 }
 
+static inline int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	return mtd->unlock(mtd, ofs, len);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
