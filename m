Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DyR-0001iI-6U
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:51:52 +0000
Received: by vxd2 with SMTP id 2so3424458vxd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 08:51:49 -0700 (PDT)
From: Grant Erickson <marathon96@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 2/3] MTD: Retry Large Buffer Allocations
Date: Fri,  8 Apr 2011 08:51:33 -0700
Message-Id: <1302277894-26132-3-git-send-email-marathon96@gmail.com>
In-Reply-To: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
References: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
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

Replace direct call to kmalloc for a potentially large, contiguous
buffer allocation with one to mtd_kmalloc_up_to which helps ensure the
operation can succeed under low-memory, highly- fragmented situations
albeit somewhat more slowly.

Signed-off-by: Grant Erickson <marathon96@gmail.com>
Tested-by: Ben Gardiner <bengardiner at nanometrics.ca>
---
 drivers/mtd/mtdchar.c |   50 ++++++++++++++++++++++--------------------------
 1 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 145b3d0d..9301464 100644
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
+ * The implementation below, using mtd_kmalloc_up_to, mitigates
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
@@ -285,21 +289,12 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
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
--
1.7.4.2
