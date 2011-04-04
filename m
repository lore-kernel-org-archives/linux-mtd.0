Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6oNN-0005Xj-Dv
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 18:19:46 +0000
Received: by vws8 with SMTP id 8so5289703vws.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 11:19:44 -0700 (PDT)
From: Grant Erickson <marathon96@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] MTD: Retry Read/Write Transfer Buffer Allocations
Date: Mon,  4 Apr 2011 11:19:34 -0700
Message-Id: <1301941174-10050-1-git-send-email-marathon96@gmail.com>
In-Reply-To: <1301705049-15593-1-git-send-email-marathon96@gmail.com>
References: <1301705049-15593-1-git-send-email-marathon96@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When handling user space read or write requests via mtd_{read,write},
exponentially back off on the size of the requested kernel transfer
buffer until it succeeds or until the requested transfer buffer size
falls below the page size.

This helps ensure the operation can succeed under low-memory,
highly-fragmented situations albeit somewhat more slowly.

  v2: Added __GFP_NOWARN flag and made common retry loop a function
      as recommended by Artem.

Signed-off-by: Grant Erickson <marathon96@gmail.com>
---
 drivers/mtd/mtdchar.c |   66 +++++++++++++++++++++++++++++++++---------------
 1 files changed, 45 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 145b3d0d..df9be51 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -166,11 +166,44 @@ static int mtd_close(struct inode *inode, struct file *file)
 	return 0;
 } /* mtd_close */
 
-/* FIXME: This _really_ needs to die. In 2.5, we should lock the
-   userspace buffer down and use it directly with readv/writev.
-*/
+/* Back in April 2005, Linus wrote:
+ * 
+ *   FIXME: This _really_ needs to die. In 2.5, we should lock the
+ *   userspace buffer down and use it directly with readv/writev.
+ *
+ * The implementation below, using mtd_try_alloc, mitigates allocation
+ * failures when the sytem is under low-memory situations or if memory
+ * is highly fragmented at the cost of reducing the performance of the
+ * requested transfer due to a smaller buffer size.
+ *
+ * A more complex but more memory-efficient implementation based on
+ * get_user_pages and iovecs to cover extents of those pages is a
+ * longer-term goal, as intimated by Linus above. However, for the
+ * write case, this requires yet more complex head and tail transfer
+ * handling when those head and tail offsets and sizes are such that
+ * alignment requirements are not met in the NAND subdriver.
+ */
 #define MAX_KMALLOC_SIZE 0x20000
 
+static void *mtd_try_alloc(size_t *size)
+{
+	const gfp_t flags = (GFP_KERNEL | __GFP_NOWARN);
+	size_t try;
+	void *kbuf;
+
+	try = min_t(size_t, *size, MAX_KMALLOC_SIZE);
+
+	do {
+		kbuf = kmalloc(try, flags);
+	} while (!kbuf && ((try >>= 1) >= PAGE_SIZE));
+
+	if (kbuf) {
+		*size = try;
+	}
+
+	return kbuf;
+}
+
 static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t *ppos)
 {
 	struct mtd_file_info *mfi = file->private_data;
@@ -179,6 +212,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	size_t total_retlen=0;
 	int ret=0;
 	int len;
+	size_t size;
 	char *kbuf;
 
 	DEBUG(MTD_DEBUG_LEVEL0,"MTD_read\n");
@@ -189,23 +223,16 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	if (!count)
 		return 0;
 
-	/* FIXME: Use kiovec in 2.5 to lock down the user's buffers
-	   and pass them directly to the MTD functions */
+	size = count;
 
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
+	kbuf = mtd_try_alloc(&size);
 
 	if (!kbuf)
 		return -ENOMEM;
 
 	while (count) {
 
-		if (count > MAX_KMALLOC_SIZE)
-			len = MAX_KMALLOC_SIZE;
-		else
-			len = count;
+		len = min_t(size_t, count, size);
 
 		switch (mfi->mode) {
 		case MTD_MODE_OTP_FACTORY:
@@ -268,6 +295,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
+	size_t size;
 	char *kbuf;
 	size_t retlen;
 	size_t total_retlen=0;
@@ -285,21 +313,16 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 	if (!count)
 		return 0;
 
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
+	size = count;
+
+	kbuf = mtd_try_alloc(&size);
 
 	if (!kbuf)
 		return -ENOMEM;
 
 	while (count) {
 
-		if (count > MAX_KMALLOC_SIZE)
-			len = MAX_KMALLOC_SIZE;
-		else
-			len = count;
+		len = min_t(size_t, count, size);
 
 		if (copy_from_user(kbuf, buf, len)) {
 			kfree(kbuf);
--
1.7.4.2
