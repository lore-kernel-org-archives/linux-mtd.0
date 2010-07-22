Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Obzor-0006Ip-B8
	for linux-mtd@lists.infradead.org; Thu, 22 Jul 2010 17:44:30 +0000
Subject: [PATCH 2.6.35] mtd: blktrans: Move device and module ref-counting
	back to open/release
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain
Date: Thu, 22 Jul 2010 18:44:20 +0100
Message-Id: <1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 048d87199566663e4edc4880df3703c04bcf41d9 "mtd: blktrans: Hotplug
fixes" causes the MTD and the MTD driver module's ref-counts to be
bumped for each block device that is created, whether or not it's
actually in use.

This means that before removing an MTD or driver module one must first
remove all the associated block devices.  But the block devices will
be removed only when the MTDs themselves are removed, which is no
longer possible.

Change blktrans_open() and blktrans_release() to grab the
mtd_table_mutex as well as the mtd_blktrans_dev lock, and move the
calls to __mtd_{get,put}_device() and {__get,put}_module() back
into these functions.

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
Currently the sfc module and presumably any other MTD driver module
cannot be unloaded if mtd_blkdevs is loaded.  This patch restores the
behaviour of 2.6.34 and ealier releases: it can be unloaded if and only
if no related MTD char or block devices are currently open.  Please send
this to Linus in time for 2.6.35.

Ben.

 drivers/mtd/mtd_blkdevs.c |   28 +++++++++++++++++-----------
 1 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 03e19c1..686240b 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -166,6 +166,7 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	if (!dev)
 		return -ERESTARTSYS;
 
+	mutex_lock(&mtd_table_mutex);
 	mutex_lock(&dev->lock);
 
 	if (!dev->mtd) {
@@ -173,14 +174,22 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 		goto unlock;
 	}
 
+	__get_mtd_device(dev->mtd);
+	__module_get(dev->tr->owner);
 	ret = !dev->open++ && dev->tr->open ? dev->tr->open(dev) : 0;
 
-	/* Take another reference on the device so it won't go away till
-		last release */
-	if (!ret)
+	if (!ret) {
+		/* Take another reference on the device so it won't go
+		 * away till last release */
 		kref_get(&dev->ref);
+	} else {
+		module_put(dev->tr->owner);
+		__put_mtd_device(dev->mtd);
+	}
+
 unlock:
 	mutex_unlock(&dev->lock);
+	mutex_unlock(&mtd_table_mutex);
 	blktrans_dev_put(dev);
 	return ret;
 }
@@ -193,6 +202,7 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
 	if (!dev)
 		return ret;
 
+	mutex_lock(&mtd_table_mutex);
 	mutex_lock(&dev->lock);
 
 	/* Release one reference, we sure its not the last one here*/
@@ -202,8 +212,12 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
 		goto unlock;
 
 	ret = !--dev->open && dev->tr->release ? dev->tr->release(dev) : 0;
+	module_put(dev->tr->owner);
+	__put_mtd_device(dev->mtd);
+
 unlock:
 	mutex_unlock(&dev->lock);
+	mutex_unlock(&mtd_table_mutex);
 	blktrans_dev_put(dev);
 	return ret;
 }
@@ -363,9 +377,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	gd->queue = new->rq;
 
-	__get_mtd_device(new->mtd);
-	__module_get(tr->owner);
-
 	/* Create processing thread */
 	/* TODO: workqueue ? */
 	new->thread = kthread_run(mtd_blktrans_thread, new,
@@ -388,8 +399,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	}
 	return 0;
 error4:
-	module_put(tr->owner);
-	__put_mtd_device(new->mtd);
 	blk_cleanup_queue(new->rq);
 error3:
 	put_disk(new->disk);
@@ -432,9 +441,6 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 		old->open = 0;
 	}
 
-	__put_mtd_device(old->mtd);
-	module_put(old->tr->owner);
-
 	/* At that point, we don't touch the mtd anymore */
 	old->mtd = NULL;
 
-- 
1.6.2.5

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
