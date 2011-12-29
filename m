Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCFV-0004Rf-7K
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:26:10 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 17/27] mtd: introduce mtd_lock_user_prot_reg interface
Date: Thu, 29 Dec 2011 11:27:21 +0200
Message-Id: <1325150851-2805-18-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
References: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
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
 include/linux/mtd/mtd.h |   10 ++++++++--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index a29d6421..41be99c 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -960,7 +960,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 			return -EFAULT;
 		if (!mtd->lock_user_prot_reg)
 			return -EOPNOTSUPP;
-		ret = mtd->lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
+		ret = mtd_lock_user_prot_reg(mtd, oinfo.start, oinfo.length);
 		break;
 	}
 #endif
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 1e7b8d1..0bb16d6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -229,7 +229,7 @@ static int part_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 		size_t len)
 {
 	struct mtd_part *part = PART(mtd);
-	return part->master->lock_user_prot_reg(part->master, from, len);
+	return mtd_lock_user_prot_reg(part->master, from, len);
 }
 
 static int part_writev(struct mtd_info *mtd, const struct kvec *vecs,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 5549607..b58e5e8 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -202,14 +202,14 @@ struct mtd_info {
 				   size_t len, size_t *retlen, u_char *buf);
 	int (*write_user_prot_reg) (struct mtd_info *mtd, loff_t to, size_t len,
 				    size_t *retlen, u_char *buf);
+	int (*lock_user_prot_reg) (struct mtd_info *mtd, loff_t from,
+				   size_t len);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
 	 */
 	struct backing_dev_info *backing_dev_info;
 
-	int (*lock_user_prot_reg) (struct mtd_info *mtd, loff_t from, size_t len);
-
 	/* kvec-based read/write methods.
 	   NB: The 'count' parameter is the number of _vectors_, each of
 	   which contains an (ofs, len) tuple.
@@ -369,6 +369,12 @@ static inline int mtd_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
 	return mtd->write_user_prot_reg(mtd, to, len, retlen, buf);
 }
 
+static inline int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
+					 size_t len)
+{
+	return mtd->lock_user_prot_reg(mtd, from, len);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
