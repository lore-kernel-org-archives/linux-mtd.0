Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6m5r-0000we-Nd
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 15:21:17 +0000
Received: by mail-bw0-f49.google.com with SMTP id 7so1638853bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 08:21:15 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/5] MTD: blktrans: Allow to unload the mtdtrans module if its
	block devices aren't open
Date: Fri, 15 Oct 2010 17:20:43 +0200
Message-Id: <1287156047-17439-2-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
References: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now it once again possible to remove mtdtrans module.
You still need to ensure that block devices of that module aren't mounted.
This is due to the fact that as long as a block device is open, it still exists,
therefore if we were to allow module removal, this block device might became used again.

This time in addition to code review, I also made the code
pass some torture tests like module reload in  a loop + read in a loop +
card insert/removal all at same time.

The blktrans_open/blktrans_release don't take the mtd table lock because:

While device is added (that includes execution of add_mtd_blktrans_dev)
the lock is already taken

Now suppose the device will never be removed. In this case even if we have changes
in mtd table, the entry that we need will stay exactly the same. (Note that we don't
look at table at all, just following private pointer of block device).

Now suppose that someone tries to remove the mtd device.
This will be propagated to trans driver which _ought_ to call del_mtd_blktrans_dev
which will take the per device lock, release the mtd device and set trans->mtd = NULL.
>From this point on, following opens won't even be able to know anything about that mtd device
(which at that point is likely not to exist)
Also the same care is taken not to trip over NULL mtd pointer in blktrans_dev_release.


Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |   52 ++++++++++++++++++++------------------------
 1 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 62e6870..352831b 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -176,7 +176,7 @@ static void mtd_blktrans_request(struct request_queue *rq)
 static int blktrans_open(struct block_device *bdev, fmode_t mode)
 {
 	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
-	int ret;
+	int ret = 0;
 
 	if (!dev)
 		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
@@ -184,17 +184,17 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	lock_kernel();
 	mutex_lock(&dev->lock);
 
-	if (!dev->mtd) {
-		ret = -ENXIO;
+	if (dev->open++)
 		goto unlock;
-	}
 
-	ret = !dev->open++ && dev->tr->open ? dev->tr->open(dev) : 0;
+	kref_get(&dev->ref);
+	__module_get(dev->tr->owner);
+
+	if (dev->mtd) {
+		ret = dev->tr->open ? dev->tr->open(dev) : 0;
+		__get_mtd_device(dev->mtd);
+	}
 
-	/* Take another reference on the device so it won't go away till
-		last release */
-	if (!ret)
-		kref_get(&dev->ref);
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
@@ -205,7 +205,7 @@ unlock:
 static int blktrans_release(struct gendisk *disk, fmode_t mode)
 {
 	struct mtd_blktrans_dev *dev = blktrans_dev_get(disk);
-	int ret = -ENXIO;
+	int ret = 0;
 
 	if (!dev)
 		return ret;
@@ -213,13 +213,16 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
 	lock_kernel();
 	mutex_lock(&dev->lock);
 
-	/* Release one reference, we sure its not the last one here*/
-	kref_put(&dev->ref, blktrans_dev_release);
-
-	if (!dev->mtd)
+	if (--dev->open)
 		goto unlock;
 
-	ret = !--dev->open && dev->tr->release ? dev->tr->release(dev) : 0;
+	kref_put(&dev->ref, blktrans_dev_release);
+	module_put(dev->tr->owner);
+
+	if (dev->mtd) {
+		ret = dev->tr->release ? dev->tr->release(dev) : 0;
+		__put_mtd_device(dev->mtd);
+	}
 unlock:
 	mutex_unlock(&dev->lock);
 	blktrans_dev_put(dev);
@@ -385,9 +388,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	gd->queue = new->rq;
 
-	__get_mtd_device(new->mtd);
-	__module_get(tr->owner);
-
 	/* Create processing thread */
 	/* TODO: workqueue ? */
 	new->thread = kthread_run(mtd_blktrans_thread, new,
@@ -410,8 +410,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	}
 	return 0;
 error4:
-	module_put(tr->owner);
-	__put_mtd_device(new->mtd);
 	blk_cleanup_queue(new->rq);
 error3:
 	put_disk(new->disk);
@@ -448,17 +446,15 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	blk_start_queue(old->rq);
 	spin_unlock_irqrestore(&old->queue_lock, flags);
 
-	/* Ask trans driver for release to the mtd device */
+	/* If the device is currently open, tell trans driver to close it,
+		then put mtd device, and don't touch it again */
 	mutex_lock(&old->lock);
-	if (old->open && old->tr->release) {
-		old->tr->release(old);
-		old->open = 0;
+	if (old->open) {
+		if (old->tr->release)
+			old->tr->release(old);
+		__put_mtd_device(old->mtd);
 	}
 
-	__put_mtd_device(old->mtd);
-	module_put(old->tr->owner);
-
-	/* At that point, we don't touch the mtd anymore */
 	old->mtd = NULL;
 
 	mutex_unlock(&old->lock);
-- 
1.7.1
