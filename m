Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE59DC7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0dvZDUJCAAZP2F5n0oJGYAjZjkSkInE/ppFg9S0mZU=; b=f9IayAHU3kx6ws
	8rIsQWPorcpx8GaZsyPl6/rcnjZZn2uHW5dAZq+MhSWHEMBVWQXOiMwcpyirKB6wp4Zt1ME5gul2K
	oohPdpAkQtmaIjAQPghtya1HPV8InYElkcXkrKVes+t7Abnwv2FMmZlVrPbBoM0JmTyJaktUGa2WA
	FvTh4kSUXs78BINrADEM0+uUJhE4dPh3XTcByi3D1Tg3BKmXYzsTv8YVVpY4DcCDmpR/WxLxrqrp8
	ki9iPsMAyKW+ybojirGniVmbKRQiMaS/UYreQisr6RFV3z87LCuoc6YTvj+WXabIdKJqsubWRgrmM
	GCAaNzHOxYSyKIXZuDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Miu-009H6M-2Q;
	Tue, 23 May 2023 07:46:24 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mis-009H2l-0d;
	Tue, 23 May 2023 07:46:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 16/24] block: move more code to early-lookup.c
Date: Tue, 23 May 2023 09:45:27 +0200
Message-Id: <20230523074535.249802-17-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523074535.249802-1-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

blk_lookup_devt is only used by code in early-lookup.c, so move it
there.

printk_all_partitions and it's helper bdevt_str are only used by the
early init code in init/do_mounts.c, so they should go there as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/early-lookup.c   | 92 ++++++++++++++++++++++++++++++++++++++++++
 block/genhd.c          | 92 ------------------------------------------
 include/linux/blkdev.h |  1 -
 3 files changed, 92 insertions(+), 93 deletions(-)

diff --git a/block/early-lookup.c b/block/early-lookup.c
index 9fc30d039508af..6016e781b6a0e2 100644
--- a/block/early-lookup.c
+++ b/block/early-lookup.c
@@ -120,6 +120,35 @@ static int devt_from_partlabel(const char *label, dev_t *devt)
 	return 0;
 }
 
+static dev_t blk_lookup_devt(const char *name, int partno)
+{
+	dev_t devt = MKDEV(0, 0);
+	struct class_dev_iter iter;
+	struct device *dev;
+
+	class_dev_iter_init(&iter, &block_class, NULL, &disk_type);
+	while ((dev = class_dev_iter_next(&iter))) {
+		struct gendisk *disk = dev_to_disk(dev);
+
+		if (strcmp(dev_name(dev), name))
+			continue;
+
+		if (partno < disk->minors) {
+			/* We need to return the right devno, even
+			 * if the partition doesn't exist yet.
+			 */
+			devt = MKDEV(MAJOR(dev->devt),
+				     MINOR(dev->devt) + partno);
+		} else {
+			devt = part_devt(disk, partno);
+			if (devt)
+				break;
+		}
+	}
+	class_dev_iter_exit(&iter);
+	return devt;
+}
+
 static int devt_from_devname(const char *name, dev_t *devt)
 {
 	int part;
@@ -222,3 +251,66 @@ int early_lookup_bdev(const char *name, dev_t *devt)
 	return devt_from_devnum(name, devt);
 }
 EXPORT_SYMBOL_GPL(early_lookup_bdev);
+
+static char __init *bdevt_str(dev_t devt, char *buf)
+{
+	if (MAJOR(devt) <= 0xff && MINOR(devt) <= 0xff) {
+		char tbuf[BDEVT_SIZE];
+		snprintf(tbuf, BDEVT_SIZE, "%02x%02x", MAJOR(devt), MINOR(devt));
+		snprintf(buf, BDEVT_SIZE, "%-9s", tbuf);
+	} else
+		snprintf(buf, BDEVT_SIZE, "%03x:%05x", MAJOR(devt), MINOR(devt));
+
+	return buf;
+}
+
+/*
+ * print a full list of all partitions - intended for places where the root
+ * filesystem can't be mounted and thus to give the victim some idea of what
+ * went wrong
+ */
+void __init printk_all_partitions(void)
+{
+	struct class_dev_iter iter;
+	struct device *dev;
+
+	class_dev_iter_init(&iter, &block_class, NULL, &disk_type);
+	while ((dev = class_dev_iter_next(&iter))) {
+		struct gendisk *disk = dev_to_disk(dev);
+		struct block_device *part;
+		char devt_buf[BDEVT_SIZE];
+		unsigned long idx;
+
+		/*
+		 * Don't show empty devices or things that have been
+		 * suppressed
+		 */
+		if (get_capacity(disk) == 0 || (disk->flags & GENHD_FL_HIDDEN))
+			continue;
+
+		/*
+		 * Note, unlike /proc/partitions, I am showing the numbers in
+		 * hex - the same format as the root= option takes.
+		 */
+		rcu_read_lock();
+		xa_for_each(&disk->part_tbl, idx, part) {
+			if (!bdev_nr_sectors(part))
+				continue;
+			printk("%s%s %10llu %pg %s",
+			       bdev_is_partition(part) ? "  " : "",
+			       bdevt_str(part->bd_dev, devt_buf),
+			       bdev_nr_sectors(part) >> 1, part,
+			       part->bd_meta_info ?
+					part->bd_meta_info->uuid : "");
+			if (bdev_is_partition(part))
+				printk("\n");
+			else if (dev->parent && dev->parent->driver)
+				printk(" driver: %s\n",
+					dev->parent->driver->name);
+			else
+				printk(" (driver?)\n");
+		}
+		rcu_read_unlock();
+	}
+	class_dev_iter_exit(&iter);
+}
diff --git a/block/genhd.c b/block/genhd.c
index 1cb489b927d50a..aa28f296fe391b 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -318,18 +318,6 @@ void blk_free_ext_minor(unsigned int minor)
 	ida_free(&ext_devt_ida, minor);
 }
 
-static char *bdevt_str(dev_t devt, char *buf)
-{
-	if (MAJOR(devt) <= 0xff && MINOR(devt) <= 0xff) {
-		char tbuf[BDEVT_SIZE];
-		snprintf(tbuf, BDEVT_SIZE, "%02x%02x", MAJOR(devt), MINOR(devt));
-		snprintf(buf, BDEVT_SIZE, "%-9s", tbuf);
-	} else
-		snprintf(buf, BDEVT_SIZE, "%03x:%05x", MAJOR(devt), MINOR(devt));
-
-	return buf;
-}
-
 void disk_uevent(struct gendisk *disk, enum kobject_action action)
 {
 	struct block_device *part;
@@ -755,57 +743,6 @@ void blk_request_module(dev_t devt)
 }
 #endif /* CONFIG_BLOCK_LEGACY_AUTOLOAD */
 
-/*
- * print a full list of all partitions - intended for places where the root
- * filesystem can't be mounted and thus to give the victim some idea of what
- * went wrong
- */
-void __init printk_all_partitions(void)
-{
-	struct class_dev_iter iter;
-	struct device *dev;
-
-	class_dev_iter_init(&iter, &block_class, NULL, &disk_type);
-	while ((dev = class_dev_iter_next(&iter))) {
-		struct gendisk *disk = dev_to_disk(dev);
-		struct block_device *part;
-		char devt_buf[BDEVT_SIZE];
-		unsigned long idx;
-
-		/*
-		 * Don't show empty devices or things that have been
-		 * suppressed
-		 */
-		if (get_capacity(disk) == 0 || (disk->flags & GENHD_FL_HIDDEN))
-			continue;
-
-		/*
-		 * Note, unlike /proc/partitions, I am showing the numbers in
-		 * hex - the same format as the root= option takes.
-		 */
-		rcu_read_lock();
-		xa_for_each(&disk->part_tbl, idx, part) {
-			if (!bdev_nr_sectors(part))
-				continue;
-			printk("%s%s %10llu %pg %s",
-			       bdev_is_partition(part) ? "  " : "",
-			       bdevt_str(part->bd_dev, devt_buf),
-			       bdev_nr_sectors(part) >> 1, part,
-			       part->bd_meta_info ?
-					part->bd_meta_info->uuid : "");
-			if (bdev_is_partition(part))
-				printk("\n");
-			else if (dev->parent && dev->parent->driver)
-				printk(" driver: %s\n",
-					dev->parent->driver->name);
-			else
-				printk(" (driver?)\n");
-		}
-		rcu_read_unlock();
-	}
-	class_dev_iter_exit(&iter);
-}
-
 #ifdef CONFIG_PROC_FS
 /* iterator */
 static void *disk_seqf_start(struct seq_file *seqf, loff_t *pos)
@@ -1339,35 +1276,6 @@ dev_t part_devt(struct gendisk *disk, u8 partno)
 	return devt;
 }
 
-dev_t blk_lookup_devt(const char *name, int partno)
-{
-	dev_t devt = MKDEV(0, 0);
-	struct class_dev_iter iter;
-	struct device *dev;
-
-	class_dev_iter_init(&iter, &block_class, NULL, &disk_type);
-	while ((dev = class_dev_iter_next(&iter))) {
-		struct gendisk *disk = dev_to_disk(dev);
-
-		if (strcmp(dev_name(dev), name))
-			continue;
-
-		if (partno < disk->minors) {
-			/* We need to return the right devno, even
-			 * if the partition doesn't exist yet.
-			 */
-			devt = MKDEV(MAJOR(dev->devt),
-				     MINOR(dev->devt) + partno);
-		} else {
-			devt = part_devt(disk, partno);
-			if (devt)
-				break;
-		}
-	}
-	class_dev_iter_exit(&iter);
-	return devt;
-}
-
 struct gendisk *__alloc_disk_node(struct request_queue *q, int node_id,
 		struct lock_class_key *lkclass)
 {
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index dd00e9cf840da5..361341aea82ce5 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -837,7 +837,6 @@ static inline void bd_unlink_disk_holder(struct block_device *bdev,
 
 dev_t part_devt(struct gendisk *disk, u8 partno);
 void inc_diskseq(struct gendisk *disk);
-dev_t blk_lookup_devt(const char *name, int partno);
 void blk_request_module(dev_t devt);
 
 extern int blk_register_queue(struct gendisk *disk);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
