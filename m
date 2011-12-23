Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9a3-0005HI-IL
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:10:57 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 18/28] mtd: introduce mtd_writev interface
Date: Fri, 23 Dec 2011 20:11:10 +0200
Message-Id: <1324663880-22477-19-git-send-email-dedekind1@gmail.com>
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
 drivers/mtd/mtdconcat.c |    5 +++--
 drivers/mtd/mtdpart.c   |    4 ++--
 fs/jffs2/writev.c       |    2 +-
 include/linux/mtd/mtd.h |   18 ++++++++++++------
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 3d9c1ff..6fdae19 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -227,8 +227,9 @@ concat_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		if (!(subdev->flags & MTD_WRITEABLE))
 			err = -EROFS;
 		else
-			err = subdev->writev(subdev, &vecs_copy[entry_low],
-				entry_high - entry_low + 1, to, &retsize);
+			err = mtd_writev(subdev, &vecs_copy[entry_low],
+					 entry_high - entry_low + 1, to,
+					 &retsize);
 
 		vecs_copy[entry_high].iov_len = old_iov_len - size;
 		vecs_copy[entry_high].iov_base += size;
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 0bb16d6..c0bfa88 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -238,8 +238,8 @@ static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	struct mtd_part *part = PART(mtd);
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
-	return part->master->writev(part->master, vecs, count,
-					to + part->offset, retlen);
+	return mtd_writev(part->master, vecs, count, to + part->offset,
+			  retlen);
 }
 
 static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
diff --git a/fs/jffs2/writev.c b/fs/jffs2/writev.c
index b05710f..d0ef068 100644
--- a/fs/jffs2/writev.c
+++ b/fs/jffs2/writev.c
@@ -52,7 +52,7 @@ int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 	}
 
 	if (c->mtd->writev)
-		return c->mtd->writev(c->mtd, vecs, count, to, retlen);
+		return mtd_writev(c->mtd, vecs, count, to, retlen);
 	else {
 		return mtd_fake_writev(c->mtd, vecs, count, to, retlen);
 	}
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index b58e5e8..4129cb5 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -204,18 +204,14 @@ struct mtd_info {
 				    size_t *retlen, u_char *buf);
 	int (*lock_user_prot_reg) (struct mtd_info *mtd, loff_t from,
 				   size_t len);
+	int (*writev) (struct mtd_info *mtd, const struct kvec *vecs,
+			unsigned long count, loff_t to, size_t *retlen);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	/* kvec-based read/write methods.
-	   NB: The 'count' parameter is the number of _vectors_, each of
-	   which contains an (ofs, len) tuple.
-	*/
-	int (*writev) (struct mtd_info *mtd, const struct kvec *vecs, unsigned long count, loff_t to, size_t *retlen);
-
 	/* Sync */
 	void (*sync) (struct mtd_info *mtd);
 
@@ -375,6 +371,16 @@ static inline int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 	return mtd->lock_user_prot_reg(mtd, from, len);
 }
 
+/*
+ * kvec-based read/write method. NB: The 'count' parameter is the number of
+ * _vectors_, each of which contains an (ofs, len) tuple.
+ */
+static inline int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
+			     unsigned long count, loff_t to, size_t *retlen)
+{
+	return mtd->writev(mtd, vecs, count, to, retlen);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
