Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7V6A-0008Hc-UK
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2011 15:56:52 +0000
Received: by vws8 with SMTP id 8so1474579vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Apr 2011 08:56:49 -0700 (PDT)
From: Grant Erickson <marathon96@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3] Retry Large Buffer Allocations
Date: Wed,  6 Apr 2011 08:56:42 -0700
Message-Id: <1302105402-12990-1-git-send-email-marathon96@gmail.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When handling user space read or write requests via mtd_{read,write}
or JFFS2 medium scan requests, exponentially back off on the size of
the requested kernel transfer buffer until it succeeds or until the
requested transfer buffer size falls below the page size.

This helps ensure the operation can succeed under low-memory,
highly-fragmented situations albeit somewhat more slowly.

  v2: Incorporated coding style and comment feedback from Artem.
  v3: Incorporated more feedback from Artem. Retargeted patch against
      l2-mtd-2.6.

Signed-off-by: Grant Erickson <marathon96@gmail.com>
---
 drivers/mtd/mtdchar.c   |   50 +++++++++++++++++++++-------------------------
 drivers/mtd/mtdcore.c   |   41 ++++++++++++++++++++++++++++++++++++++
 fs/jffs2/scan.c         |   11 +++++----
 include/linux/mtd/mtd.h |    2 +
 4 files changed, 72 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 145b3d0d..8651a79 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -166,10 +166,23 @@ static int mtd_close(struct inode *inode, struct file *file)
 	return 0;
 } /* mtd_close */
 
-/* FIXME: This _really_ needs to die. In 2.5, we should lock the
-   userspace buffer down and use it directly with readv/writev.
-*/
-#define MAX_KMALLOC_SIZE 0x20000
+/* Back in April 2005, Linus wrote:
+ *
+ *   FIXME: This _really_ needs to die. In 2.5, we should lock the
+ *   userspace buffer down and use it directly with readv/writev.
+ *
+ * The implementation below, using mtd_alloc_up_to, mitigates
+ * allocation failures when the system is under low-memory situations
+ * or if memory is highly fragmented at the cost of reducing the
+ * performance of the requested transfer due to a smaller buffer size.
+ *
+ * A more complex but more memory-efficient implementation based on
+ * get_user_pages and iovecs to cover extents of those pages is a
+ * longer-term goal, as intimated by Linus above. However, for the
+ * write case, this requires yet more complex head and tail transfer
+ * handling when those head and tail offsets and sizes are such that
+ * alignment requirements are not met in the NAND subdriver.
+ */
 
 static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t *ppos)
 {
@@ -179,6 +192,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	size_t total_retlen=0;
 	int ret=0;
 	int len;
+	size_t size = count;
 	char *kbuf;
 
 	DEBUG(MTD_DEBUG_LEVEL0,"MTD_read\n");
@@ -189,23 +203,12 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	if (!count)
 		return 0;
 
-	/* FIXME: Use kiovec in 2.5 to lock down the user's buffers
-	   and pass them directly to the MTD functions */
-
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
-
+	kbuf = mtd_kmalloc_up_to(&size);
 	if (!kbuf)
 		return -ENOMEM;
 
 	while (count) {
-
-		if (count > MAX_KMALLOC_SIZE)
-			len = MAX_KMALLOC_SIZE;
-		else
-			len = count;
+		len = min_t(size_t, count, size);
 
 		switch (mfi->mode) {
 		case MTD_MODE_OTP_FACTORY:
@@ -268,6 +271,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
+	size_t size = count;
 	char *kbuf;
 	size_t retlen;
 	size_t total_retlen=0;
@@ -285,20 +289,12 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 	if (!count)
 		return 0;
 
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
-
+	kbuf = mtd_kmalloc_up_to(&size);
 	if (!kbuf)
 		return -ENOMEM;
 
 	while (count) {
-
-		if (count > MAX_KMALLOC_SIZE)
-			len = MAX_KMALLOC_SIZE;
-		else
-			len = count;
+		len = min_t(size_t, count, size);
 
 		if (copy_from_user(kbuf, buf, len)) {
 			kfree(kbuf);
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index da69bc8..6f720cc 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -638,6 +638,46 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	return ret;
 }
 
+/**
+ * mtd_kmalloc_up_to - allocate a contiguous buffer up to the specified size
+ * @size: A pointer to the ideal or maximum size of the allocation. Points
+ *        to the actual allocation size on success.
+ *
+ * This routine attempts to allocate a contiguous kernel buffer up to
+ * the specified size, backing off the size of the request exponentially
+ * until the request succeeds or until the allocation size falls below
+ * the system page size. This attempts to make sure it does not adversely
+ * impact system performance, so when allocating more than one page, we
+ * ask the memory allocator to avoid re-trying, swapping, writing back
+ * or performing I/O.
+ *
+ * This is called, for example by mtd_{read,write} and jffs2_scan_medium,
+ * to handle smaller (i.e. degraded) buffer allocations under low- or
+ * fragmented-memory situations where such reduced allocations, from a
+ * requested ideal, are allowed.
+ *
+ * Returns a pointer to the allocated buffer on success; otherwise, NULL.
+ */
+void *mtd_kmalloc_up_to(size_t *size)
+{
+	gfp_t flags = __GFP_NOWARN | __GFP_WAIT |
+		       __GFP_NORETRY | __GFP_NO_KSWAPD;
+	size_t try;
+	void *kbuf;
+
+	try = min_t(size_t, *size, KMALLOC_MAX_SIZE);
+
+	do {
+		if (try <= PAGE_SIZE)
+			flags = GFP_KERNEL;
+
+		kbuf = kmalloc(try, flags);
+	} while (!kbuf && ((try >>= 1) >= PAGE_SIZE));
+
+	*size = try;
+	return kbuf;
+}
+
 EXPORT_SYMBOL_GPL(add_mtd_device);
 EXPORT_SYMBOL_GPL(del_mtd_device);
 EXPORT_SYMBOL_GPL(get_mtd_device);
@@ -648,6 +688,7 @@ EXPORT_SYMBOL_GPL(__put_mtd_device);
 EXPORT_SYMBOL_GPL(register_mtd_user);
 EXPORT_SYMBOL_GPL(unregister_mtd_user);
 EXPORT_SYMBOL_GPL(default_mtd_writev);
+EXPORT_SYMBOL_GPL(mtd_kmalloc_up_to);
 
 #ifdef CONFIG_PROC_FS
 
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index b632ddd..0850037 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -117,14 +117,15 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 		else
 			buf_size = PAGE_SIZE;
 
-		/* Respect kmalloc limitations */
-		if (buf_size > 128*1024)
-			buf_size = 128*1024;
+		D1(printk(KERN_DEBUG "Trying to allocate readbuf of %d "
+			"bytes\n", buf_size));
 
-		D1(printk(KERN_DEBUG "Allocating readbuf of %d bytes\n", buf_size));
-		flashbuf = kmalloc(buf_size, GFP_KERNEL);
+		flashbuf = mtd_kmalloc_up_to(&buf_size);
 		if (!flashbuf)
 			return -ENOMEM;
+
+		D1(printk(KERN_DEBUG "Allocated readbuf of %d bytes\n",
+			buf_size));
 	}
 
 	if (jffs2_sum_active()) {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 9d5306b..a5d31ba 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -348,7 +348,8 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 int default_mtd_readv(struct mtd_info *mtd, struct kvec *vecs,
 		      unsigned long count, loff_t from, size_t *retlen);
 
+void *mtd_kmalloc_up_to(size_t *size);
+
 #ifdef CONFIG_MTD_PARTITIONS
 void mtd_erase_callback(struct erase_info *instr);
 #else
--
1.7.4.2
