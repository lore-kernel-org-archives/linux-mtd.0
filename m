Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox9Gk-0001zk-SM
	for linux-mtd@lists.infradead.org; Sun, 19 Sep 2010 02:04:48 +0000
Received: by fxm4 with SMTP id 4so233741fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 19:03:53 -0700 (PDT)
From: maximlevitsky@gmail.com
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH V2] MTD: blktrans: Final version of hotplug support
Date: Sun, 19 Sep 2010 04:03:42 +0200
Message-Id: <4c956f87.c706df0a.4bfd.5014@mx.google.com>
In-Reply-To: <1284851558-1154-2-git-send-email-maximlevitsky@gmail.com>
References: <1284851558-1154-2-git-send-email-maximlevitsky@gmail.com>
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

From: Maxim Levitsky <maximlevitsky@gmail.com>

Or at least this patch claims it to be so...

Now it once again possible to remove mtdtrans and mtd drivers even
if underlying mtd device is mounted.
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

In addition to that I moved the blk_cleanup_queue back to del_mtd_blktrans_dev
because I now know that is ok.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c |   67 +++++++++++++++++++++------------------------
 1 files changed, 31 insertions(+), 36 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 62e6870..c124cbe 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -47,7 +47,6 @@ void blktrans_dev_release(struct kref *kref)
 		container_of(kref, struct mtd_blktrans_dev, ref);
 
 	dev->disk->private_data = NULL;
-	blk_cleanup_queue(dev->rq);
 	put_disk(dev->disk);
 	list_del(&dev->list);
 	kfree(dev);
@@ -133,6 +132,10 @@ static int mtd_blktrans_thread(void *arg)
 
 		if (!req && !(req = blk_fetch_request(rq))) {
 			set_current_state(TASK_INTERRUPTIBLE);
+
+			if (kthread_should_stop())
+				break;
+
 			spin_unlock_irq(rq->queue_lock);
 			schedule();
 			spin_lock_irq(rq->queue_lock);
@@ -176,54 +179,53 @@ static void mtd_blktrans_request(struct request_queue *rq)
 static int blktrans_open(struct block_device *bdev, fmode_t mode)
 {
 	struct mtd_blktrans_dev *dev = blktrans_dev_get(bdev->bd_disk);
-	int ret;
+	int ret = 0;
 
 	if (!dev)
-		return -ERESTARTSYS; /* FIXME: busy loop! -arnd*/
+		return -EIO;
 
-	lock_kernel();
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
-	unlock_kernel();
 	return ret;
 }
 
 static int blktrans_release(struct gendisk *disk, fmode_t mode)
 {
 	struct mtd_blktrans_dev *dev = blktrans_dev_get(disk);
-	int ret = -ENXIO;
+	int ret = 0;
 
 	if (!dev)
 		return ret;
 
-	lock_kernel();
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
-	unlock_kernel();
 	return ret;
 }
 
@@ -256,7 +258,6 @@ static int blktrans_ioctl(struct block_device *bdev, fmode_t mode,
 	if (!dev)
 		return ret;
 
-	lock_kernel();
 	mutex_lock(&dev->lock);
 
 	if (!dev->mtd)
@@ -271,7 +272,6 @@ static int blktrans_ioctl(struct block_device *bdev, fmode_t mode,
 	}
 unlock:
 	mutex_unlock(&dev->lock);
-	unlock_kernel();
 	blktrans_dev_put(dev);
 	return ret;
 }
@@ -385,9 +385,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	gd->queue = new->rq;
 
-	__get_mtd_device(new->mtd);
-	__module_get(tr->owner);
-
 	/* Create processing thread */
 	/* TODO: workqueue ? */
 	new->thread = kthread_run(mtd_blktrans_thread, new,
@@ -410,8 +407,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	}
 	return 0;
 error4:
-	module_put(tr->owner);
-	__put_mtd_device(new->mtd);
 	blk_cleanup_queue(new->rq);
 error3:
 	put_disk(new->disk);
@@ -448,17 +443,17 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	blk_start_queue(old->rq);
 	spin_unlock_irqrestore(&old->queue_lock, flags);
 
-	/* Ask trans driver for release to the mtd device */
+	blk_cleanup_queue(old->rq);
+
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
1.7.0.4
