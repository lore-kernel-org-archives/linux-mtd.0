Received: from atlantis.8hz.com ([212.129.237.78])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EdD1G-0001un-Uu
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2005 15:39:46 -0500
Received: from atlantis.8hz.com (localhost [127.0.0.1])
	by atlantis.8hz.com (Postfix) with ESMTP id 611F0BA71
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Nov 2005 21:39:32 +0100 (CET)
Received: (from sean@localhost)
	by atlantis.8hz.com (8.13.1/8.13.1/Submit) id jAIKdWT6029430
	for linux-mtd@lists.infradead.org; Fri, 18 Nov 2005 21:39:32 +0100 (CET)
	(envelope-from sean@mess.org)
Date: Fri, 18 Nov 2005 21:39:32 +0100
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20051118203932.GA29374@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: forget in block layer for ftl's
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is my first stab at implementing a forget functionality in the block
layer which the FTL's can use. 

See:

http://lists.infradead.org/pipermail/linux-mtd/2005-June/012858.html

Right now it's still very limited as only the FAT file system driver and
the RFD FTL uses the functionality.

Basically, I've added a blkdev_issue_forget() function to the block
layer and .forgetsect() to struct mtd_blktrans_ops.

I would really appreciate your comments on this approach.

The patch is against 2.6.15-rc1.


Sean

diff -urpN linux-2.6.14/block/ll_rw_blk.c linux-forget/block/ll_rw_blk.c
--- linux-2.6.14/block/ll_rw_blk.c	2005-11-18 06:25:51.000000000 +0100
+++ linux-forget/block/ll_rw_blk.c	2005-11-18 21:22:31.000000000 +0100
@@ -1058,6 +1058,7 @@ static char *rq_flags[] = {
 	"REQ_DRIVE_TASK",
 	"REQ_DRIVE_TASKFILE",
 	"REQ_PREEMPT",
+	"REQ_FORGET",
 	"REQ_PM_SUSPEND",
 	"REQ_PM_RESUME",
 	"REQ_PM_SHUTDOWN",
@@ -2379,6 +2380,44 @@ int blkdev_issue_flush(struct block_devi
 
 EXPORT_SYMBOL(blkdev_issue_flush);
 
+/**
+ * blkdev_issue_forget() - inform block device of stale sectors
+ * @bdev: block device to issue forget for
+ * @sector: first sector that can be forgotten
+ * @size: amount of bytes that can be forgotten
+ */
+
+void blkdev_issue_forget(struct block_device *bdev, sector_t sector, int size)
+{
+	request_queue_t *q;
+	struct request *rq;
+
+	q = bdev_get_queue(bdev);
+
+	rq = blk_get_request(q, WRITE, __GFP_WAIT);
+	rq->errors = 0;
+	rq->rq_disk = bdev->bd_disk;
+	rq->bio = NULL;
+	rq->buffer = NULL;
+	rq->timeout = 60*HZ;
+	rq->data = NULL;
+	rq->data_len = 0;
+	rq->flags |= REQ_FORGET | REQ_SOFTBARRIER | REQ_NOMERGE;
+	rq->sector = sector;
+	rq->current_nr_sectors = size >> 9;
+
+	if (bdev != bdev->bd_contains) {
+		struct hd_struct *p = bdev->bd_part;
+
+		rq->sector += p->start_sect;
+		rq->rq_disk = bdev->bd_contains;
+	}
+
+	elv_add_request(q, rq, ELEVATOR_INSERT_BACK, 1);
+}
+
+EXPORT_SYMBOL(blkdev_issue_forget);
+
 static void drive_stat_acct(struct request *rq, int nr_sectors, int new_io)
 {
 	int rw = rq_data_dir(rq);
diff -urpN linux-2.6.14/drivers/mtd/mtd_blkdevs.c linux-forget/drivers/mtd/mtd_blkdevs.c
--- linux-2.6.14/drivers/mtd/mtd_blkdevs.c	2005-11-18 06:26:01.000000000 +0100
+++ linux-forget/drivers/mtd/mtd_blkdevs.c	2005-11-18 21:13:52.000000000 +0100
@@ -46,6 +46,15 @@ static int do_blktrans_request(struct mt
 	nsect = req->current_nr_sectors;
 	buf = req->buffer;
 
+	if (req->flags & REQ_FORGET)  {
+		if (tr->forgetsect)
+			for (; nsect > 0; nsect--) 
+				if (tr->forgetsect(dev, block++))
+					return 0;
+
+		return 1;
+	}
+
 	if (!(req->flags & REQ_CMD))
 		return 0;
 
diff -urpN linux-2.6.14/drivers/mtd/rfd_ftl.c linux-forget/drivers/mtd/rfd_ftl.c
--- linux-2.6.14/drivers/mtd/rfd_ftl.c	2005-11-18 06:26:02.000000000 +0100
+++ linux-forget/drivers/mtd/rfd_ftl.c	2005-11-18 21:20:57.000000000 +0100
@@ -621,6 +621,19 @@ err:
 	return rc;
 }
 
+static int rfd_ftl_forgetsect(struct mtd_blktrans_dev *dev, u_long sector)
+{
+	struct partition *part = (struct partition*)dev;
+
+	u_long addr = part->sector_map[sector];
+	if (addr == -1)
+		return 0;
+
+	part->sector_map[sector] = -1;
+
+	return mark_sector_deleted(part, addr);
+}
+
 static int find_free_sector(const struct partition *part, const struct block *block)
 {
 	int i, stop;
@@ -830,10 +843,11 @@ struct mtd_blktrans_ops rfd_ftl_tr = {
 	.part_bits	= PART_BITS,
 	.readsect	= rfd_ftl_readsect,
 	.writesect	= rfd_ftl_writesect,
+	.forgetsect	= rfd_ftl_forgetsect,
 	.getgeo		= rfd_ftl_getgeo,
 	.add_mtd	= rfd_ftl_add_mtd,
 	.remove_dev	= rfd_ftl_remove_dev,
-	.owner		= THIS_MODULE,
+	.owner		= THIS_MODULE
 };
 
 static int __init init_rfd_ftl(void)
diff -urpN linux-2.6.14/fs/fat/fatent.c linux-forget/fs/fat/fatent.c
--- linux-2.6.14/fs/fat/fatent.c	2005-10-28 02:02:08.000000000 +0200
+++ linux-forget/fs/fat/fatent.c	2005-11-18 21:24:21.000000000 +0100
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/fs.h>
 #include <linux/msdos_fs.h>
+#include <linux/blkdev.h>
 
 struct fatent_operations {
 	void (*ent_blocknr)(struct super_block *, int, int *, sector_t *);
@@ -530,6 +531,10 @@ int fat_free_clusters(struct inode *inod
 	fatent_init(&fatent);
 	lock_fat(sbi);
 	do {
+		blkdev_issue_forget(sb->s_bdev, sbi->data_start + 
+				(cluster << (sbi->cluster_bits - 9)),
+				sbi->cluster_size);
+
 		cluster = fat_ent_read(inode, &fatent, cluster);
 		if (cluster < 0) {
 			err = cluster;
diff -urpN linux-2.6.14/include/linux/blkdev.h linux-forget/include/linux/blkdev.h
--- linux-2.6.14/include/linux/blkdev.h	2005-11-18 06:26:18.000000000 +0100
+++ linux-forget/include/linux/blkdev.h	2005-11-18 04:31:44.000000000 +0100
@@ -226,6 +226,7 @@ enum rq_flag_bits {
 	__REQ_DRIVE_TASK,
 	__REQ_DRIVE_TASKFILE,
 	__REQ_PREEMPT,		/* set for "ide_preempt" requests */
+	__REQ_FORGET,		/* forget sectors request */
 	__REQ_PM_SUSPEND,	/* suspend request */
 	__REQ_PM_RESUME,	/* resume request */
 	__REQ_PM_SHUTDOWN,	/* shutdown request */
@@ -256,6 +257,7 @@ enum rq_flag_bits {
 #define REQ_DRIVE_TASK	(1 << __REQ_DRIVE_TASK)
 #define REQ_DRIVE_TASKFILE	(1 << __REQ_DRIVE_TASKFILE)
 #define REQ_PREEMPT	(1 << __REQ_PREEMPT)
+#define REQ_FORGET	(1 << __REQ_FORGET)
 #define REQ_PM_SUSPEND	(1 << __REQ_PM_SUSPEND)
 #define REQ_PM_RESUME	(1 << __REQ_PM_RESUME)
 #define REQ_PM_SHUTDOWN	(1 << __REQ_PM_SHUTDOWN)
@@ -466,6 +468,7 @@ enum {
 #define blk_barrier_rq(rq)	((rq)->flags & REQ_HARDBARRIER)
 #define blk_barrier_preflush(rq)	((rq)->flags & REQ_BAR_PREFLUSH)
 #define blk_barrier_postflush(rq)	((rq)->flags & REQ_BAR_POSTFLUSH)
+#define blk_barrier_forget(rq)	((rq->flags & REQ_BAR_FORGET)
 
 #define list_entry_rq(ptr)	list_entry((ptr), struct request, queuelist)
 
@@ -691,6 +695,7 @@ extern long blk_congestion_wait(int rw, 
 
 extern void blk_rq_bio_prep(request_queue_t *, struct request *, struct bio *);
 extern int blkdev_issue_flush(struct block_device *, sector_t *);
+extern void blkdev_issue_forget(struct block_device *, sector_t, int);
 
 #define MAX_PHYS_SEGMENTS 128
 #define MAX_HW_SEGMENTS 128
diff -urpN linux-2.6.14/include/linux/mtd/blktrans.h linux-forget/include/linux/mtd/blktrans.h
--- linux-2.6.14/include/linux/mtd/blktrans.h	2005-11-18 06:26:18.000000000 +0100
+++ linux-forget/include/linux/mtd/blktrans.h	2005-11-18 05:39:32.000000000 +0100
@@ -42,6 +42,7 @@ struct mtd_blktrans_ops {
 		    unsigned long block, char *buffer);
 	int (*writesect)(struct mtd_blktrans_dev *dev,
 		     unsigned long block, char *buffer);
+	int (*forgetsect)(struct mtd_blktrans_dev *dev, unsigned long block);
 
 	/* Block layer ioctls */
 	int (*getgeo)(struct mtd_blktrans_dev *dev, struct hd_geometry *geo);
