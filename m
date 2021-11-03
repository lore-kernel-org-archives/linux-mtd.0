Return-Path: <SRS0=aZmf=PW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FA7C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 12:29:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0726660C51
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Nov 2021 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0726660C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZr8IQP9wf1+L4w++FtV/iGZ3UJoeuFnA8Z3Pkhzbq0=; b=ksOMotRrb/alRP
	alAra/XpcZ17g2GKMaYReZYNI6Vjoi+z+Se3WAak5qCyZzU/ZvHjtJDtMJmyjOlL9m4yJ4pifVowD
	SVSRu4VqWfpQCz4ETf9j5VIOXQ4vopdiBcX16Ll5i4aSC3qGL5ncZFbJFSpAlxfXgX9UwH7HKb0Md
	eTnTZzTVf653na1XWCgAqk96Zovv3obkEFE2hzptjmMwF3WyQ8NpDyFkT02pUPDKE4/ICaXKN/axE
	8Y2V6JDjmmiJciKwP/W4/5J8iwP9WwMh5Toulj5BtEb9RSGzdYl7T67zXgbiqK6NkLgEm7KE1XsqY
	r2pZhsvYsWjeb+65Un0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miFNN-0058x3-He; Wed, 03 Nov 2021 12:28:21 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1miFHC-0056IW-HF; Wed, 03 Nov 2021 12:21:58 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, hch@lst.de, penguin-kernel@i-love.sakura.ne.jp,
 dan.j.williams@intel.com, vishal.l.verma@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, richard@nod.at, miquel.raynal@bootlin.com,
 vigneshr@ti.com, efremov@linux.com, song@kernel.org,
 martin.petersen@oracle.com, hare@suse.de, jack@suse.cz,
 ming.lei@redhat.com, tj@kernel.org, mcgrof@kernel.org
Cc: linux-mtd@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] block: make __register_blkdev() return an error
Date: Wed,  3 Nov 2021 05:21:56 -0700
Message-Id: <20211103122157.1215783-13-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103122157.1215783-1-mcgrof@kernel.org>
References: <20211103122157.1215783-1-mcgrof@kernel.org>
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

This makes __register_blkdev() return an error, and also changes the
probe() call to return an error as well.

We expand documentation for the probe call to ensure that if the block
device already exists we don't return on error on that condition. We do
this as otherwise we loose ability to handle concurrent requests if the
block device already existed.

Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 block/bdev.c            |  5 ++++-
 block/genhd.c           | 21 +++++++++++++++------
 drivers/block/ataflop.c | 19 ++++++++++++++-----
 drivers/block/brd.c     |  7 +++++--
 drivers/block/floppy.c  | 17 +++++++++++++----
 drivers/block/loop.c    | 11 ++++++++---
 drivers/md/md.c         | 12 +++++++++---
 drivers/scsi/sd.c       |  3 ++-
 include/linux/genhd.h   |  4 ++--
 9 files changed, 72 insertions(+), 27 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index b4dab2fb6a74..876306c6ba6e 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -736,10 +736,13 @@ struct block_device *blkdev_get_no_open(dev_t dev)
 {
 	struct block_device *bdev;
 	struct inode *inode;
+	int ret;
 
 	inode = ilookup(blockdev_superblock, dev);
 	if (!inode) {
-		blk_request_module(dev);
+		ret = blk_request_module(dev);
+		if (ret)
+			return NULL;
 		inode = ilookup(blockdev_superblock, dev);
 		if (!inode)
 			return NULL;
diff --git a/block/genhd.c b/block/genhd.c
index febaaa55125a..7b56767e9e32 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -183,7 +183,7 @@ static struct blk_major_name {
 	struct blk_major_name *next;
 	int major;
 	char name[16];
-	void (*probe)(dev_t devt);
+	int (*probe)(dev_t devt);
 } *major_names[BLKDEV_MAJOR_HASH_SIZE];
 static DEFINE_MUTEX(major_names_lock);
 static DEFINE_SPINLOCK(major_names_spinlock);
@@ -213,7 +213,13 @@ void blkdev_show(struct seq_file *seqf, off_t offset)
  * @major: the requested major device number [1..BLKDEV_MAJOR_MAX-1]. If
  *         @major = 0, try to allocate any unused major number.
  * @name: the name of the new block device as a zero terminated string
- * @probe: allback that is called on access to any minor number of @major
+ * @probe: callback that is called on access to any minor number of @major.
+ * 	This will return 0 if the block device is already present or was
+ * 	not present and it succcessfully added a new one. If the block device
+ * 	was not already present but it was a valid request an error reflecting
+ * 	the reason why adding the block device is returned. An error should not
+ * 	be returned if the block device already exists as otherwise concurrent
+ * 	requests to open an existing block device would fail.
  *
  * The @name must be unique within the system.
  *
@@ -231,7 +237,7 @@ void blkdev_show(struct seq_file *seqf, off_t offset)
  * Use register_blkdev instead for any new code.
  */
 int __register_blkdev(unsigned int major, const char *name,
-		void (*probe)(dev_t devt))
+		int (*probe)(dev_t devt))
 {
 	struct blk_major_name **n, *p;
 	int index, ret = 0;
@@ -672,17 +678,18 @@ static ssize_t disk_badblocks_store(struct device *dev,
 	return badblocks_store(disk->bb, page, len, 0);
 }
 
-void blk_request_module(dev_t devt)
+int blk_request_module(dev_t devt)
 {
 	unsigned int major = MAJOR(devt);
 	struct blk_major_name **n;
+	int err;
 
 	mutex_lock(&major_names_lock);
 	for (n = &major_names[major_to_index(major)]; *n; n = &(*n)->next) {
 		if ((*n)->major == major && (*n)->probe) {
-			(*n)->probe(devt);
+			err = (*n)->probe(devt);
 			mutex_unlock(&major_names_lock);
-			return;
+			return err;
 		}
 	}
 	mutex_unlock(&major_names_lock);
@@ -690,6 +697,8 @@ void blk_request_module(dev_t devt)
 	if (request_module("block-major-%d-%d", MAJOR(devt), MINOR(devt)) > 0)
 		/* Make old-style 2.4 aliases work */
 		request_module("block-major-%d", MAJOR(devt));
+
+	return 0;
 }
 
 /*
diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index 170dd193cef6..805c2d12e358 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -2008,22 +2008,31 @@ static int ataflop_alloc_disk(unsigned int drive, unsigned int type)
 	return 0;
 }
 
-static void ataflop_probe(dev_t dev)
+static int ataflop_probe(dev_t dev)
 {
 	int drive = MINOR(dev) & 3;
 	int type  = MINOR(dev) >> 2;
+	int err = 0;
 
 	if (type)
 		type--;
 
 	if (drive >= FD_MAX_UNITS || type >= NUM_DISK_MINORS)
-		return;
+		return -EINVAL;
+
 	if (!unit[drive].disk[type]) {
-		if (ataflop_alloc_disk(drive, type) == 0) {
-			add_disk(unit[drive].disk[type]);
-			unit[drive].registered[type] = true;
+		err = ataflop_alloc_disk(drive, type);
+		if (err == 0) {
+			err = add_disk(unit[drive].disk[type]);
+			if (err) {
+				blk_cleanup_disk(unit[drive].disk[type]);
+				unit[drive].disk[type] = NULL;
+			} else
+				unit[drive].registered[type] = true;
 		}
 	}
+
+	return err;
 }
 
 static void atari_floppy_cleanup(void)
diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index a896ee175d86..fa6f532035fc 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -437,9 +437,12 @@ static int brd_alloc(int i)
 	return err;
 }
 
-static void brd_probe(dev_t dev)
+static int brd_probe(dev_t dev)
 {
-	brd_alloc(MINOR(dev) / max_part);
+	int ret =  brd_alloc(MINOR(dev) / max_part);
+	if (ret == -EEXIST)
+		return 0;
+	return ret;
 }
 
 static void brd_del_one(struct brd_device *brd)
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 3873e789478e..ff3422f517a6 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4518,21 +4518,30 @@ static int floppy_alloc_disk(unsigned int drive, unsigned int type)
 
 static DEFINE_MUTEX(floppy_probe_lock);
 
-static void floppy_probe(dev_t dev)
+static int floppy_probe(dev_t dev)
 {
 	unsigned int drive = (MINOR(dev) & 3) | ((MINOR(dev) & 0x80) >> 5);
 	unsigned int type = (MINOR(dev) >> 2) & 0x1f;
+	int err = 0;
 
 	if (drive >= N_DRIVE || !floppy_available(drive) ||
 	    type >= ARRAY_SIZE(floppy_type))
-		return;
+		return -EINVAL;
 
 	mutex_lock(&floppy_probe_lock);
 	if (!disks[drive][type]) {
-		if (floppy_alloc_disk(drive, type) == 0)
-			add_disk(disks[drive][type]);
+		err = floppy_alloc_disk(drive, type);
+		if (err == 0) {
+			err = add_disk(disks[drive][type]);
+			if (err) {
+				blk_cleanup_disk(disks[drive][type]);
+				disks[drive][type] = NULL;
+			}
+		}
 	}
 	mutex_unlock(&floppy_probe_lock);
+
+	return err;
 }
 
 static int __init do_floppy_init(void)
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 3c09a33fa1c7..dfc2859274a4 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -2089,13 +2089,18 @@ static void loop_remove(struct loop_device *lo)
 	kfree(lo);
 }
 
-static void loop_probe(dev_t dev)
+static int loop_probe(dev_t dev)
 {
 	int idx = MINOR(dev) >> part_shift;
+	int ret;
 
 	if (max_loop && idx >= max_loop)
-		return;
-	loop_add(idx);
+		return -EINVAL;
+	ret = loop_add(idx);
+	if (ret == -EEXIST)
+		return 0;
+
+	return ret;
 }
 
 static int loop_control_remove(int idx)
diff --git a/drivers/md/md.c b/drivers/md/md.c
index 5111ed966947..cdfabb90acb5 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5737,12 +5737,18 @@ static int md_alloc(dev_t dev, char *name)
 	return error;
 }
 
-static void md_probe(dev_t dev)
+static int md_probe(dev_t dev)
 {
+	int error = 0;
+
 	if (MAJOR(dev) == MD_MAJOR && MINOR(dev) >= 512)
-		return;
+		return -EINVAL;
 	if (create_on_open)
-		md_alloc(dev, NULL);
+		error = md_alloc(dev, NULL);
+	if (error == -EEXIST)
+		return 0;
+
+	return error;
 }
 
 static int add_named_array(const char *val, const struct kernel_param *kp)
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 65875a598d62..a135d5c48829 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -632,8 +632,9 @@ static struct scsi_driver sd_template = {
  * Don't request a new module, as that could deadlock in multipath
  * environment.
  */
-static void sd_default_probe(dev_t devt)
+static int sd_default_probe(dev_t devt)
 {
+	return 0;
 }
 
 /*
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 59eabbc3a36b..016623245725 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -290,7 +290,7 @@ struct gendisk *__blk_alloc_disk(int node, struct lock_class_key *lkclass);
 void blk_cleanup_disk(struct gendisk *disk);
 
 int __register_blkdev(unsigned int major, const char *name,
-		void (*probe)(dev_t devt));
+		int (*probe)(dev_t devt));
 #define register_blkdev(major, name) \
 	__register_blkdev(major, name, NULL)
 void unregister_blkdev(unsigned int major, const char *name);
@@ -322,7 +322,7 @@ static inline int bd_register_pending_holders(struct gendisk *disk)
 dev_t part_devt(struct gendisk *disk, u8 partno);
 void inc_diskseq(struct gendisk *disk);
 dev_t blk_lookup_devt(const char *name, int partno);
-void blk_request_module(dev_t devt);
+int blk_request_module(dev_t devt);
 #ifdef CONFIG_BLOCK
 void printk_all_partitions(void);
 #else /* CONFIG_BLOCK */
-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
