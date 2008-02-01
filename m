Received: from [210.94.41.89] (helo=party)
	by bombadil.infradead.org with esmtpsa (Exim 4.68 #1 (Red Hat Linux))
	id 1JKkkC-0008Fa-OS
	for linux-mtd@lists.infradead.org; Fri, 01 Feb 2008 01:31:06 +0000
Date: Fri, 1 Feb 2008 10:30:54 +0900
From: Kyungmin Park <kmpark@infradead.org>
To: linux-mtd@lists.infradead.org
Subject: [RFC/REFERENCE PATCH] Use the scatterlist in mtd_blkdevs
Message-ID: <20080201013054.GA14577@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Now I'm working for CRAMFS optimization for OneNAND.

I try to find optimization point in the cramfs and reduce the memory operation from 3 to 1 in case of uncompressed files (aka XIP files).

In current implementation it has 1 flash read and 2 memory copies.
  Page cache read from flash
  Copy from page cache to local buffer
  Copy local buffer to requested page

In case of uncompressed file, we can issue the requested page to flash directly.

Yes, next access it hits the page cache but forme also requires one more memory copy.

It's working well other devices such as MMC. However it's not in MTD.
Since current mtdblock handles fixed defined blksize and doesn't pass the enough length to optimize the in device level.

Otherwise other flashes, NOR and NAND, OneNAND can optimize the read/write performance if it has beyond page size by read-while-load, cache read, and so on.
Now I added the readsects function pointer with 'len', then OneNAND driver can use the read-while-load feature.

However there's one problem. Each kernel versions the page allocation is some different. Some kernel allocates the page as ascending order we wish, but others descending order. Unfortunately the latest kernel is the latter. So there's no big improvement.

One thing that I said is that we need to new interface to pass buffer with length to optimize in device level.

Any comments are welcome.

Thank you,
Kyungmin Park
---
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 839eed8..51452d7 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -22,6 +22,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/kthread.h>
+#include <linux/scatterlist.h>
 #include <asm/uaccess.h>
 
 #include "mtdcore.h"
@@ -32,6 +33,7 @@ struct mtd_blkcore_priv {
 	struct task_struct *thread;
 	struct request_queue *rq;
 	spinlock_t queue_lock;
+	struct scatterlist sg;
 };
 
 static int do_blktrans_request(struct mtd_blktrans_ops *tr,
@@ -54,9 +56,13 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
 
 	switch(rq_data_dir(req)) {
 	case READ:
-		for (; nsect > 0; nsect--, block++, buf += tr->blksize)
-			if (tr->readsect(dev, block, buf))
+		if (tr->readsects) {
+			if (tr->readsects(dev, block, buf, nsect << 9))
 				return 0;
+		} else 
+			for (; nsect > 0; nsect--, block++, buf += tr->blksize)
+				if (tr->readsect(dev, block, buf))
+					return 0;
 		return 1;
 
 	case WRITE:
@@ -74,6 +80,53 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
 	}
 }
 
+static int blk_rq_map_sg_one(struct request_queue *q, struct request *rq,
+		  struct scatterlist *sglist)
+{
+	struct bio_vec *bvec, *bvprv;
+	struct req_iterator iter;
+	struct scatterlist *sg;
+	int nsegs, cluster;
+
+	nsegs = 0;
+	cluster = q->queue_flags & (1 << QUEUE_FLAG_CLUSTER);
+
+	/*
+	 * for each bio in rq
+	 */
+	bvprv = NULL;
+	sg = NULL;
+	rq_for_each_segment(bvec, rq, iter) {
+		int nbytes = bvec->bv_len;
+
+		if (bvprv && cluster) {
+			if (sg->length + nbytes > q->max_segment_size)
+				break;
+
+			if (!BIOVEC_PHYS_MERGEABLE(bvprv, bvec))
+				break;
+			if (!BIOVEC_SEG_BOUNDARY(q, bvprv, bvec))
+				break;
+
+			sg->length += nbytes;
+		} else {
+			if (!sg)
+				sg = sglist;
+			else
+				break;
+
+			sg_set_page(sg, bvec->bv_page, nbytes, bvec->bv_offset);
+			nsegs++;
+		}
+		bvprv = bvec;
+	} /* segments in rq */
+
+	if (sg)
+		__sg_mark_end(sg);
+
+	return nsegs;
+}
+
 static int mtd_blktrans_thread(void *arg)
 {
 	struct mtd_blktrans_ops *tr = arg;
@@ -101,6 +154,16 @@ static int mtd_blktrans_thread(void *arg)
 		dev = req->rq_disk->private_data;
 		tr = dev->tr;
 
+		if (req->current_nr_sectors != req->nr_sectors) {
+			struct scatterlist *sg = &tr->blkcore_priv->sg;
+			int nsg = blk_rq_map_sg_one(req->q, req, sg);
+			if (nsg) {
+				req->current_nr_sectors = sg->length >> 9;
+				if (req->current_nr_sectors > req->nr_sectors)
+					req->current_nr_sectors = req->nr_sectors;
+			}
+		}
+
 		spin_unlock_irq(rq->queue_lock);
 
 		mutex_lock(&dev->lock);
@@ -109,7 +172,11 @@ static int mtd_blktrans_thread(void *arg)
 
 		spin_lock_irq(rq->queue_lock);
 
-		end_request(req, res);
+		if (!end_that_request_chunk(req, res, req->current_nr_sectors << 9)) {
+			add_disk_randomness(req->rq_disk);
+			blkdev_dequeue_request(req);
+			end_that_request_last(req, res);
+		}
 	}
 	spin_unlock_irq(rq->queue_lock);
 
@@ -363,18 +430,14 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	if (ret) {
 		printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
 		       tr->name, tr->major, ret);
-		kfree(tr->blkcore_priv);
-		mutex_unlock(&mtd_table_mutex);
-		return ret;
+		goto out;
 	}
 	spin_lock_init(&tr->blkcore_priv->queue_lock);
 
 	tr->blkcore_priv->rq = blk_init_queue(mtd_blktrans_request, &tr->blkcore_priv->queue_lock);
 	if (!tr->blkcore_priv->rq) {
-		unregister_blkdev(tr->major, tr->name);
-		kfree(tr->blkcore_priv);
-		mutex_unlock(&mtd_table_mutex);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out_rq;
 	}
 
 	tr->blkcore_priv->rq->queuedata = tr;
@@ -384,11 +447,8 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	tr->blkcore_priv->thread = kthread_run(mtd_blktrans_thread, tr,
 			"%sd", tr->name);
 	if (IS_ERR(tr->blkcore_priv->thread)) {
-		blk_cleanup_queue(tr->blkcore_priv->rq);
-		unregister_blkdev(tr->major, tr->name);
-		kfree(tr->blkcore_priv);
-		mutex_unlock(&mtd_table_mutex);
-		return PTR_ERR(tr->blkcore_priv->thread);
+		ret = PTR_ERR(tr->blkcore_priv->thread);
+		goto out_thread;
 	}
 
 	INIT_LIST_HEAD(&tr->devs);
@@ -402,6 +462,15 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	mutex_unlock(&mtd_table_mutex);
 
 	return 0;
+
+out_thread:
+	blk_cleanup_queue(tr->blkcore_priv->rq);
+out_rq:
+	unregister_blkdev(tr->major, tr->name);
+out:
+	kfree(tr->blkcore_priv);
+	mutex_unlock(&mtd_table_mutex);
+	return ret;
 }
 
 int deregister_mtd_blktrans(struct mtd_blktrans_ops *tr)
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 952da30..d771889 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -245,13 +245,24 @@ static int mtdblock_readsect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
 	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
-	return do_cached_read(mtdblk, block<<9, 512, buf);
+	struct mtd_blktrans_ops *tr = dev->tr;
+	return do_cached_read(mtdblk, block<<tr->blkshift, tr->blksize, buf);
+}
+
+static int mtdblock_readsects(struct mtd_blktrans_dev *dev,
+				unsigned long block, char *buf, size_t len)
+{
+	/* mtd_blktrans_thread */
+	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtd_blktrans_ops *tr = dev->tr;
+	return do_cached_read(mtdblk, block<<tr->blkshift, len, buf);
 }
 
 static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 			      unsigned long block, char *buf)
 {
 	struct mtdblk_dev *mtdblk = mtdblks[dev->devnum];
+	struct mtd_blktrans_ops *tr = dev->tr;
 	if (unlikely(!mtdblk->cache_data && mtdblk->cache_size)) {
 		mtdblk->cache_data = vmalloc(mtdblk->mtd->erasesize);
 		if (!mtdblk->cache_data)
@@ -261,7 +272,7 @@ static int mtdblock_writesect(struct mtd_blktrans_dev *dev,
 		 * return -EAGAIN sometimes, but why bother?
 		 */
 	}
-	return do_cached_write(mtdblk, block<<9, 512, buf);
+	return do_cached_write(mtdblk, block<<tr->blkshift, tr->blksize, buf);
 }
 
 static int mtdblock_open(struct mtd_blktrans_dev *mbd)
@@ -346,7 +357,7 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 	dev->mtd = mtd;
 	dev->devnum = mtd->index;
 
-	dev->size = mtd->size >> 9;
+	dev->size = mtd->size >> tr->blkshift;
 	dev->tr = tr;
 
 	if (!(mtd->flags & MTD_WRITEABLE))
@@ -370,6 +381,7 @@ static struct mtd_blktrans_ops mtdblock_tr = {
 	.flush		= mtdblock_flush,
 	.release	= mtdblock_release,
 	.readsect	= mtdblock_readsect,
+	.readsects	= mtdblock_readsects,
 	.writesect	= mtdblock_writesect,
 	.add_mtd	= mtdblock_add_mtd,
 	.remove_dev	= mtdblock_remove_dev,
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index 9a6e2f9..a21f5a9 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -44,6 +44,10 @@ struct mtd_blktrans_ops {
 	int (*writesect)(struct mtd_blktrans_dev *dev,
 		     unsigned long block, char *buffer);
 
+	/* Multiple reads functions */
+	int (*readsects)(struct mtd_blktrans_dev *dev,
+			unsigned long block, char *buffer, size_t len);
+
 	/* Block layer ioctls */
 	int (*getgeo)(struct mtd_blktrans_dev *dev, struct hd_geometry *geo);
 	int (*flush)(struct mtd_blktrans_dev *dev);
