Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJocp-0003Zy-2s
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 11:27:48 +0000
Subject: [PATCH 3/4] mtdoops: Ensure sequential write to the buffer
From: Richard Purdie <rpurdie@rpsys.net>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Tue, 29 Jan 2008 11:27:13 +0000
Message-Id: <1201606033.5017.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From a5ef8a78b4214f5efcc7310e71dd1e351672af3f Mon Sep 17 00:00:00 2001
From: Richard Purdie <rpurdie@rpsys.net>
Date: Tue, 29 Jan 2008 10:21:56 +0000
Subject: [PATCH] [MTD] mtdoops: Ensure sequential write to the buffer

Add a spinlock to ensure writes to the mtdoops buffer memory are
sequential and don't race.

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>
---
 drivers/mtd/mtdoops.c |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 72c434c..1687521 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -28,6 +28,7 @@
 #include <linux/workqueue.h>
 #include <linux/sched.h>
 #include <linux/wait.h>
+#include <linux/spinlock.h>
 #include <linux/mtd/mtd.h>
 
 #define OOPS_PAGE_SIZE 4096
@@ -42,6 +43,9 @@ struct mtdoops_context {
 	int nextcount;
 
 	void *oops_buf;
+
+	/* writecount and disabling ready are spin lock protected */
+	spinlock_t writecount_lock;
 	int ready;
 	int writecount;
 } oops_cxt;
@@ -290,11 +294,22 @@ static void mtdoops_console_sync(void)
 {
 	struct mtdoops_context *cxt = &oops_cxt;
 	struct mtd_info *mtd = cxt->mtd;
+	unsigned long flags;
 
 	if (!cxt->ready || !mtd || cxt->writecount == 0)
 		return;
 
+	/* 
+	 *  Once ready is 0 and we've held the lock no further writes to the 
+	 *  buffer will happen
+	 */
+	spin_lock_irqsave(&cxt->writecount_lock, flags);
+	if (!cxt->ready) {
+		spin_unlock_irqrestore(&cxt->writecount_lock, flags);
+		return;
+	}
 	cxt->ready = 0;
+	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
 
 	schedule_work(&cxt->work_write);
 }
@@ -304,6 +319,7 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 {
 	struct mtdoops_context *cxt = co->data;
 	struct mtd_info *mtd = cxt->mtd;
+	unsigned long flags;
 
 	if (!oops_in_progress) {
 		mtdoops_console_sync();
@@ -313,6 +329,13 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 	if (!cxt->ready || !mtd)
 		return;
 
+	/* Locking on writecount ensures sequential writes to the buffer */
+	spin_lock_irqsave(&cxt->writecount_lock, flags);
+
+	/* Check ready status didn't change whilst waiting for the lock */
+	if (!cxt->ready)
+		return;
+
 	if (cxt->writecount == 0) {
 		u32 *stamp = cxt->oops_buf;
 		*stamp = cxt->nextcount;
@@ -324,6 +347,11 @@ mtdoops_console_write(struct console *co, const char *s, unsigned int count)
 
 	memcpy(cxt->oops_buf + cxt->writecount, s, count);
 	cxt->writecount += count;
+
+	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
+
+	if (cxt->writecount == OOPS_PAGE_SIZE)
+		mtdoops_console_sync();
 }
 
 static int __init mtdoops_console_setup(struct console *co, char *options)
-- 
1.5.2.3
