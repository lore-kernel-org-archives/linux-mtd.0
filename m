Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q20Sv-00066s-H1
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2011 12:13:39 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2MCDYdm027148
	for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2011 14:13:34 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: Use fallback in memory allocation for mtd_{read,write}
Date: Tue, 22 Mar 2011 14:13:29 +0200
Message-Id: <1300796009-15019-1-git-send-email-jarkko.lavinen@nokia.com>
Cc: jarkko.lavinen@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kmalloc used in mtd_read() and mtd_write() can fail if the request
size is large and memory is fragmented.  Use fall-back mechanism which
will quietly retry the allocation by halving the allocation size in each
retry.

Signed-off-by: Jarkko Lavinen <jarkko.lavinen@nokia.com>
---
 drivers/mtd/mtdchar.c |   44 ++++++++++++++++++++++++++++++--------------
 1 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 145b3d0d..18263d8 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -171,12 +171,33 @@ static int mtd_close(struct inode *inode, struct file *file)
 */
 #define MAX_KMALLOC_SIZE 0x20000
 
+static void *mtd_buf_alloc(size_t *size)
+{
+	void *kbuf;
+	size_t next;
+
+	if (*size > MAX_KMALLOC_SIZE)
+		*size = MAX_KMALLOC_SIZE;
+
+	kbuf = kmalloc(*size, GFP_KERNEL | __GFP_NOWARN);
+	next = 1 << (fls(*size - 1) - 1);
+
+	while (!kbuf && next >= PAGE_SIZE) {
+		*size = next;
+		next /= 2;
+		kbuf = kmalloc(*size, GFP_KERNEL | __GFP_NOWARN);
+	}
+
+	return kbuf;
+}
+
 static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t *ppos)
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
 	size_t retlen=0;
 	size_t total_retlen=0;
+	size_t alloc;
 	int ret=0;
 	int len;
 	char *kbuf;
@@ -192,18 +213,14 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	/* FIXME: Use kiovec in 2.5 to lock down the user's buffers
 	   and pass them directly to the MTD functions */
 
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
-
+	alloc = count;
+	kbuf = mtd_buf_alloc(&alloc);
 	if (!kbuf)
 		return -ENOMEM;
 
 	while (count) {
-
-		if (count > MAX_KMALLOC_SIZE)
-			len = MAX_KMALLOC_SIZE;
+		if (count > alloc)
+			len = alloc;
 		else
 			len = count;
 
@@ -271,6 +288,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 	char *kbuf;
 	size_t retlen;
 	size_t total_retlen=0;
+	size_t alloc;
 	int ret=0;
 	int len;
 
@@ -285,18 +303,16 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 	if (!count)
 		return 0;
 
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
+	alloc = count;
+	kbuf = mtd_buf_alloc(&alloc);
 
 	if (!kbuf)
 		return -ENOMEM;
 
 	while (count) {
 
-		if (count > MAX_KMALLOC_SIZE)
-			len = MAX_KMALLOC_SIZE;
+		if (count > alloc)
+			len = alloc;
 		else
 			len = count;
 
-- 
1.7.2.5
