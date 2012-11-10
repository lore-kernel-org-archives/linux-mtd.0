Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TXDcC-00065Z-W3
 for linux-mtd@lists.infradead.org; Sat, 10 Nov 2012 16:09:01 +0000
Received: by mail-gg0-f177.google.com with SMTP id h1so963268gge.36
 for <linux-mtd@lists.infradead.org>; Sat, 10 Nov 2012 08:08:57 -0800 (PST)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH] mtd_blkdevs: Replace request handler kthread with a
 workqueue
Date: Sat, 10 Nov 2012 13:08:20 -0300
Message-Id: <1352563700-5268-1-git-send-email-elezegarcia@gmail.com>
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

By replacing a kthread with a workqueue, the code is now a bit clearer.
There's also a slight reduction of code size (numbers apply for x86):
Before:
   text	   data	    bss	    dec	    hex	filename
   3248	     36	      0	   3284	    cd4	drivers/mtd/mtd_blkdevs.o

After:
   text	   data	    bss	    dec	    hex	filename
   3150	     36	      0	   3186	    c72	drivers/mtd/mtd_blkdevs.o

Due to lack of real hardware, tests have been performed on an emulated
environment with mtdswap and mtdblock over nandsim devices.
Some real testing should be done, before merging this patch.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c    |   47 +++++++++++++----------------------------
 include/linux/mtd/blktrans.h |    4 ++-
 2 files changed, 18 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index f1f0671..ba375ba 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -32,7 +32,6 @@
 #include <linux/hdreg.h>
 #include <linux/init.h>
 #include <linux/mutex.h>
-#include <linux/kthread.h>
 #include <asm/uaccess.h>
 
 #include "mtdcore.h"
@@ -121,16 +120,14 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
 
 int mtd_blktrans_cease_background(struct mtd_blktrans_dev *dev)
 {
-	if (kthread_should_stop())
-		return 1;
-
 	return dev->bg_stop;
 }
 EXPORT_SYMBOL_GPL(mtd_blktrans_cease_background);
 
-static int mtd_blktrans_thread(void *arg)
+static void mtd_blktrans_work(struct work_struct *work)
 {
-	struct mtd_blktrans_dev *dev = arg;
+	struct mtd_blktrans_dev *dev =
+		container_of(work, struct mtd_blktrans_dev, work);
 	struct mtd_blktrans_ops *tr = dev->tr;
 	struct request_queue *rq = dev->rq;
 	struct request *req = NULL;
@@ -138,7 +135,7 @@ static int mtd_blktrans_thread(void *arg)
 
 	spin_lock_irq(rq->queue_lock);
 
-	while (!kthread_should_stop()) {
+	while (1) {
 		int res;
 
 		dev->bg_stop = false;
@@ -156,15 +153,7 @@ static int mtd_blktrans_thread(void *arg)
 				background_done = !dev->bg_stop;
 				continue;
 			}
-			set_current_state(TASK_INTERRUPTIBLE);
-
-			if (kthread_should_stop())
-				set_current_state(TASK_RUNNING);
-
-			spin_unlock_irq(rq->queue_lock);
-			schedule();
-			spin_lock_irq(rq->queue_lock);
-			continue;
+			break;
 		}
 
 		spin_unlock_irq(rq->queue_lock);
@@ -185,8 +174,6 @@ static int mtd_blktrans_thread(void *arg)
 		__blk_end_request_all(req, -EIO);
 
 	spin_unlock_irq(rq->queue_lock);
-
-	return 0;
 }
 
 static void mtd_blktrans_request(struct request_queue *rq)
@@ -199,10 +186,8 @@ static void mtd_blktrans_request(struct request_queue *rq)
 	if (!dev)
 		while ((req = blk_fetch_request(rq)) != NULL)
 			__blk_end_request_all(req, -ENODEV);
-	else {
-		dev->bg_stop = true;
-		wake_up_process(dev->thread);
-	}
+	else
+		queue_work(dev->wq, &dev->work);
 }
 
 static int blktrans_open(struct block_device *bdev, fmode_t mode)
@@ -437,14 +422,13 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	gd->queue = new->rq;
 
-	/* Create processing thread */
-	/* TODO: workqueue ? */
-	new->thread = kthread_run(mtd_blktrans_thread, new,
-			"%s%d", tr->name, new->mtd->index);
-	if (IS_ERR(new->thread)) {
-		ret = PTR_ERR(new->thread);
+	/* Create processing workqueue */
+	new->wq = alloc_workqueue("%s%d", 0, 0,
+				  tr->name, new->mtd->index);
+	if (!new->wq)
 		goto error4;
-	}
+	INIT_WORK(&new->work, mtd_blktrans_work);
+
 	gd->driverfs_dev = &new->mtd->dev;
 
 	if (new->readonly)
@@ -484,9 +468,8 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	/* Stop new requests to arrive */
 	del_gendisk(old->disk);
 
-
-	/* Stop the thread */
-	kthread_stop(old->thread);
+	/* Stop workqueue. This will perform any pending request. */
+	destroy_workqueue(old->wq);
 
 	/* Kill current requests */
 	spin_lock_irqsave(&old->queue_lock, flags);
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index ed270bd..4eb0a50 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -23,6 +23,7 @@
 #include <linux/mutex.h>
 #include <linux/kref.h>
 #include <linux/sysfs.h>
+#include <linux/workqueue.h>
 
 struct hd_geometry;
 struct mtd_info;
@@ -43,7 +44,8 @@ struct mtd_blktrans_dev {
 	struct kref ref;
 	struct gendisk *disk;
 	struct attribute_group *disk_attributes;
-	struct task_struct *thread;
+	struct workqueue_struct *wq;
+	struct work_struct work;
 	struct request_queue *rq;
 	spinlock_t queue_lock;
 	void *priv;
-- 
1.7.8.6
