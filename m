Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5ox3-0006q4-8b
	for linux-mtd@lists.infradead.org; Sat, 02 Apr 2011 00:44:30 +0000
Received: by gwb1 with SMTP id 1so1732784gwb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 17:44:27 -0700 (PDT)
From: Grant Erickson <marathon96@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: Retry Read/Write Transfer Buffer Allocations
Date: Fri,  1 Apr 2011 17:44:09 -0700
Message-Id: <1301705049-15593-1-git-send-email-marathon96@gmail.com>
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

Signed-off-by: Grant Erickson <marathon96@gmail.com>
---
 drivers/mtd/mtdchar.c |   30 ++++++++++++++----------------
 1 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 145b3d0d..d887b91 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -179,6 +179,7 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	size_t total_retlen=0;
 	int ret=0;
 	int len;
+	size_t size;
 	char *kbuf;
 
 	DEBUG(MTD_DEBUG_LEVEL0,"MTD_read\n");
@@ -192,20 +193,18 @@ static ssize_t mtd_read(struct file *file, char __user *buf, size_t count,loff_t
 	/* FIXME: Use kiovec in 2.5 to lock down the user's buffers
 	   and pass them directly to the MTD functions */
 
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
+	size = min_t(size_t, count, MAX_KMALLOC_SIZE);
+
+	do {
+		kbuf=kmalloc(size, GFP_KERNEL);
+	} while (!kbuf && ((size >>= 1) >= PAGE_SIZE));
 
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
@@ -268,6 +267,7 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
+	size_t size;
 	char *kbuf;
 	size_t retlen;
 	size_t total_retlen=0;
@@ -285,20 +285,18 @@ static ssize_t mtd_write(struct file *file, const char __user *buf, size_t count
 	if (!count)
 		return 0;
 
-	if (count > MAX_KMALLOC_SIZE)
-		kbuf=kmalloc(MAX_KMALLOC_SIZE, GFP_KERNEL);
-	else
-		kbuf=kmalloc(count, GFP_KERNEL);
+	size = min_t(size_t, count, MAX_KMALLOC_SIZE);
+
+	do {
+		kbuf=kmalloc(size, GFP_KERNEL);
+	} while (!kbuf && ((size >>= 1) >= PAGE_SIZE));
 
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
