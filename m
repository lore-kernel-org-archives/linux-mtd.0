From: Artem.Bityutskiy@nokia.com (Artem Bityutskiy)
Date: Tue, 26 Apr 2011 11:42:10 +0300
Subject: [PATCH] mtd: a fix candidate for mtd_kmalloc_up_to
Message-ID: <mailman.210.1303807262.1530.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This is a fix candidate for the problem reported here:

http://lists.infradead.org/pipermail/linux-mtd/2011-April/035190.html

If it is OK, we'll need to fold it to Grant's patches and add
credits to Stefano Babic <sbabic@denx.de> there, probably in form of a
"Tested-by:" tag.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/mtdchar.c   |    4 ++--
 drivers/mtd/mtdcore.c   |   28 ++++++++++++++++++----------
 fs/jffs2/scan.c         |    2 +-
 include/linux/mtd/mtd.h |    2 +-
 4 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 9301464..7b7f992 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -203,7 +203,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(&size);
+	kbuf = mtd_kmalloc_up_to(mtd, &size);
 	if (!kbuf)
 		return -ENOMEM;
 
@@ -289,7 +289,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 	if (!count)
 		return 0;
 
-	kbuf = mtd_kmalloc_up_to(&size);
+	kbuf = mtd_kmalloc_up_to(mtd, &size);
 	if (!kbuf)
 		return -ENOMEM;
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 6f720cc..a50348b 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -651,6 +651,9 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
  * ask the memory allocator to avoid re-trying, swapping, writing back
  * or performing I/O.
  *
+ * Note, this function also makes sure that the allocated buffer is aligned to
+ * the MTD device's min. I/O unit, i.e. the "mtd->writesize" value.
+ *
  * This is called, for example by mtd_{read,write} and jffs2_scan_medium,
  * to handle smaller (i.e. degraded) buffer allocations under low- or
  * fragmented-memory situations where such reduced allocations, from a
@@ -658,24 +661,29 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
  *
  * Returns a pointer to the allocated buffer on success; otherwise, NULL.
  */
-void *mtd_kmalloc_up_to(size_t *size)
+void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size)
 {
 	gfp_t flags = __GFP_NOWARN | __GFP_WAIT |
 		       __GFP_NORETRY | __GFP_NO_KSWAPD;
-	size_t try;
+	size_t min_alloc = max_t(size_t, mtd->writesize, PAGE_SIZE);
 	void *kbuf;
 
-	try = min_t(size_t, *size, KMALLOC_MAX_SIZE);
+	*size = min_t(size_t, *size, KMALLOC_MAX_SIZE);
 
-	do {
-		if (try <= PAGE_SIZE)
-			flags = GFP_KERNEL;
+	while (*size > min_alloc) {
+		kbuf = kmalloc(*size, flags);
+		if (kbuf)
+			return kbuf;
 
-		kbuf = kmalloc(try, flags);
-	} while (!kbuf && ((try >>= 1) >= PAGE_SIZE));
+		*size >>= 1;
+		*size = ALIGN(*size, mtd->writesize);
+	}
 
-	*size = try;
-	return kbuf;
+	/*
+	 * For the last resort allocation allow 'kmalloc()' to do all sorts of
+	 * things (write-back, dropping caches, etc) by using GFP_KERNEL.
+	 */
+	return kmalloc(*size, GFP_KERNEL);
 }
 
 EXPORT_SYMBOL_GPL(add_mtd_device);
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index e393213..8d8cd34 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -120,7 +120,7 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 		D1(printk(KERN_DEBUG "Trying to allocate readbuf of %zu "
 			"bytes\n", try_size));
 
-		flashbuf = mtd_kmalloc_up_to(&try_size);
+		flashbuf = mtd_kmalloc_up_to(c->mtd, &try_size);
 		if (!flashbuf)
 			return -ENOMEM;
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a5d31ba..06b489a 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -348,7 +348,7 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 int default_mtd_readv(struct mtd_info *mtd, struct kvec *vecs,
 		      unsigned long count, loff_t from, size_t *retlen);
 
-void *mtd_kmalloc_up_to(size_t *size);
+void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
 
 #ifdef CONFIG_MTD_PARTITIONS
 void mtd_erase_callback(struct erase_info *instr);
-- 
1.7.2.3



-- 
Best Regards,
Artem Bityutskiy (?????????? ????????????????)
