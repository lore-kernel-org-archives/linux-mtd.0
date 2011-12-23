Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9a8-0005Ho-4L
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:11:01 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 22/28] mtd: introduce mtd_is_locked interface
Date: Fri, 23 Dec 2011 20:11:14 +0200
Message-Id: <1324663880-22477-23-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/mtdpart.c   |    2 +-
 include/linux/mtd/mtd.h |    8 ++++++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 516aee6..46b6a8b 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -852,7 +852,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (!mtd->is_locked)
 			ret = -EOPNOTSUPP;
 		else
-			ret = mtd->is_locked(mtd, einfo.start, einfo.length);
+			ret = mtd_is_locked(mtd, einfo.start, einfo.length);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index d65af37..ad487fc 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -295,7 +295,7 @@ static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	struct mtd_part *part = PART(mtd);
 	if ((len + ofs) > mtd->size)
 		return -EINVAL;
-	return part->master->is_locked(part->master, ofs + part->offset, len);
+	return mtd_is_locked(part->master, ofs + part->offset, len);
 }
 
 static void part_sync(struct mtd_info *mtd)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f30c358..8b99019 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -209,14 +209,13 @@ struct mtd_info {
 	void (*sync) (struct mtd_info *mtd);
 	int (*lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
+	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
-
 	/* Power Management functions */
 	int (*suspend) (struct mtd_info *mtd);
 	void (*resume) (struct mtd_info *mtd);
@@ -394,6 +393,11 @@ static inline int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return mtd->unlock(mtd, ofs, len);
 }
 
+static inline int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	return mtd->is_locked(mtd, ofs, len);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
