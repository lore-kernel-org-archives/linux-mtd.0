Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqs-0003Sw-VZ
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:56 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/17] mtd: harmonize mtd_writev usage
Date: Mon,  2 Jan 2012 14:20:41 +0200
Message-Id: <1325506847-23470-12-git-send-email-dedekind1@gmail.com>
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

This patch makes the 'mtd_writev()' function more usable and logical. We first
teach it to fall-back to the 'default_mtd_writev()' function if the MTD driver
does not define its own '->writev()' method. Then we make block2mtd and JFFS2
just 'mtd_writev()' instead of 'default_mtd_writev()' function. This means we
can now stop exporting 'default_mtd_writev()' and instead, export
'mtd_writev()'. This is much cleaner and more logical, as well as allows us to
get read of another direct 'mtd->writev' access in JFFS2.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/block2mtd.c |    2 +-
 drivers/mtd/mtdcore.c           |   26 +++++++++++++++++++++++---
 fs/jffs2/writev.c               |    6 +-----
 include/linux/mtd/mtd.h         |   16 ++--------------
 4 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index b78f231..c16f6b4 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -288,7 +288,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
 	dev->mtd.flags = MTD_CAP_RAM;
 	dev->mtd.erase = block2mtd_erase;
 	dev->mtd.write = block2mtd_write;
-	dev->mtd.writev = default_mtd_writev;
+	dev->mtd.writev = mtd_writev;
 	dev->mtd.sync = block2mtd_sync;
 	dev->mtd.read = block2mtd_read;
 	dev->mtd.priv = dev;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 53a200f..4d0f3e5 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -696,8 +696,8 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
-		       unsigned long count, loff_t to, size_t *retlen)
+static int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
+			      unsigned long count, loff_t to, size_t *retlen)
 {
 	unsigned long i;
 	size_t totlen = 0, thislen;
@@ -716,7 +716,27 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	*retlen = totlen;
 	return ret;
 }
-EXPORT_SYMBOL_GPL(default_mtd_writev);
+
+/*
+ * mtd_writev - the vector-based MTD write method
+ * @mtd: mtd device description object pointer
+ * @vecs: the vectors to write
+ * @count: count of vectors in @vecs
+ * @to: the MTD device offset to write to
+ * @retlen: on exit contains the count of bytes written to the MTD device.
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
+	       unsigned long count, loff_t to, size_t *retlen)
+{
+	*retlen = 0;
+	if (!mtd->writev)
+		return default_mtd_writev(mtd, vecs, count, to, retlen);
+	return mtd->writev(mtd, vecs, count, to, retlen);
+}
+EXPORT_SYMBOL_GPL(mtd_writev);
 
 /**
  * mtd_kmalloc_up_to - allocate a contiguous buffer up to the specified size
diff --git a/fs/jffs2/writev.c b/fs/jffs2/writev.c
index 8d70407..a1bda9d 100644
--- a/fs/jffs2/writev.c
+++ b/fs/jffs2/writev.c
@@ -26,11 +26,7 @@ int jffs2_flash_direct_writev(struct jffs2_sb_info *c, const struct kvec *vecs,
 		}
 	}
 
-	if (c->mtd->writev)
-		return mtd_writev(c->mtd, vecs, count, to, retlen);
-	else {
-		return default_mtd_writev(c->mtd, vecs, count, to, retlen);
-	}
+	return mtd_writev(c->mtd, vecs, count, to, retlen);
 }
 
 int jffs2_flash_direct_write(struct jffs2_sb_info *c, loff_t ofs, size_t len,
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a994129..a58ecf4 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -394,16 +394,8 @@ static inline int mtd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 	return mtd->lock_user_prot_reg(mtd, from, len);
 }
 
-/*
- * kvec-based read/write method. NB: The 'count' parameter is the number of
- * _vectors_, each of which contains an (ofs, len) tuple.
- */
-static inline int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
-			     unsigned long count, loff_t to, size_t *retlen)
-{
-	*retlen = 0;
-	return mtd->writev(mtd, vecs, count, to, retlen);
-}
+int mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
+	       unsigned long count, loff_t to, size_t *retlen);
 
 static inline void mtd_sync(struct mtd_info *mtd)
 {
@@ -510,10 +502,6 @@ struct mtd_notifier {
 
 extern void register_mtd_user (struct mtd_notifier *new);
 extern int unregister_mtd_user (struct mtd_notifier *old);
-
-int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
-		       unsigned long count, loff_t to, size_t *retlen);
-
 void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
 
 void mtd_erase_callback(struct erase_info *instr);
-- 
1.7.7.3
