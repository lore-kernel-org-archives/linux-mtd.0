Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JJpAy-00072h-Ph
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 12:02:53 +0000
Subject: [RFC PATCH 2/3] mtdoops: Use the panic_write function when present
From: Richard Purdie <rpurdie@rpsys.net>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Tue, 29 Jan 2008 11:59:28 +0000
Message-Id: <1201607968.5017.49.camel@localhost.localdomain>
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

When the MTD provides a panic_write function, use it.

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>

---
 drivers/mtd/mtdoops.c |   26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

Index: kernel-hacking/drivers/mtd/mtdoops.c
===================================================================
--- kernel-hacking.orig/drivers/mtd/mtdoops.c	2008-01-29 11:20:33.000000000 +0000
+++ kernel-hacking/drivers/mtd/mtdoops.c	2008-01-29 11:55:57.000000000 +0000
@@ -28,6 +28,7 @@
 #include <linux/workqueue.h>
 #include <linux/sched.h>
 #include <linux/wait.h>
+#include <linux/delay.h>
 #include <linux/spinlock.h>
 #include <linux/mtd/mtd.h>
 
@@ -183,10 +184,8 @@ badblock:
 	goto badblock;
 }
 
-static void mtdoops_workfunc_write(struct work_struct *work)
+static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 {
-	struct mtdoops_context *cxt =
-			container_of(work, struct mtdoops_context, work_write);
 	struct mtd_info *mtd = cxt->mtd;
 	size_t retlen;
 	int ret;
@@ -195,7 +194,11 @@ static void mtdoops_workfunc_write(struc
 		memset(cxt->oops_buf + cxt->writecount, 0xff,
 					OOPS_PAGE_SIZE - cxt->writecount);
 
-	ret = mtd->write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
+	if (panic)
+		ret = mtd->panic_write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
+					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+	else
+		ret = mtd->write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
 					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
 
 	cxt->writecount = 0;
@@ -205,6 +208,15 @@ static void mtdoops_workfunc_write(struc
 			cxt->nextpage * OOPS_PAGE_SIZE, retlen,	OOPS_PAGE_SIZE, ret);
 
 	mtdoops_inc_counter(cxt);
+}
+
+
+static void mtdoops_workfunc_write(struct work_struct *work)
+{
+	struct mtdoops_context *cxt =
+			container_of(work, struct mtdoops_context, work_write);
+
+	mtdoops_write(cxt, 0);
 }					
 
 static void find_next_position(struct mtdoops_context *cxt)
@@ -314,7 +326,11 @@ static void mtdoops_console_sync(void)
 	cxt->ready = 0;
 	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
 
-	schedule_work(&cxt->work_write);
+	if (mtd->panic_write && in_interrupt())
+		/* Interrupt context, we're going to panic so try and log */
+		mtdoops_write(cxt, 1);
+	else
+		schedule_work(&cxt->work_write);
 }
 
 static void
