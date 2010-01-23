Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYTmW-0004wt-Rf
	for linux-mtd@lists.infradead.org; Sat, 23 Jan 2010 00:23:21 +0000
Received: by bwz4 with SMTP id 4so1645704bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 16:23:16 -0800 (PST)
Subject: [PATCH 3/8] blktrans: don't free mtd_blktrans_dev, core will do
	that for you
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
In-Reply-To: <1264205925.31827.3.camel@maxim-laptop>
References: <1264205925.31827.3.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 23 Jan 2010 02:23:12 +0200
Message-ID: <1264206192.31827.7.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 926e8cf37572691246011945e3266ca140319b41 Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Sat, 23 Jan 2010 02:04:32 +0200
Subject: [PATCH 3/8] blktrans: don't free mtd_blktrans_dev, core will do that for you

We need that structure till last user exits, and that might be years after
mtd device disappered.

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/ftl.c            |    1 -
 drivers/mtd/inftlcore.c      |    1 -
 drivers/mtd/mtd_blkdevs.c    |   16 +++++++++++++++-
 drivers/mtd/mtdblock.c       |    1 -
 drivers/mtd/mtdblock_ro.c    |    1 -
 drivers/mtd/nftlcore.c       |    1 -
 drivers/mtd/rfd_ftl.c        |    1 -
 drivers/mtd/ssfdc.c          |    1 -
 include/linux/mtd/blktrans.h |    1 +
 9 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index e56d6b4..62da9eb 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1082,7 +1082,6 @@ static void ftl_remove_dev(struct mtd_blktrans_dev *dev)
 {
 	del_mtd_blktrans_dev(dev);
 	ftl_freepart((partition_t *)dev);
-	kfree(dev);
 }
 
 static struct mtd_blktrans_ops ftl_tr = {
diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index 8aca552..015a7fe 100755
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -139,7 +139,6 @@ static void inftl_remove_dev(struct mtd_blktrans_dev *dev)
 
 	kfree(inftl->PUtable);
 	kfree(inftl->VUtable);
-	kfree(inftl);
 }
 
 /*
diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index c2d97a0..c95e1ff 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -129,7 +129,11 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 		goto out;
 
 	if (dev->open++)
- 		goto out;
+		goto out;
+
+	if (dev->deleted)
+		goto out;
+
 
 	if (!try_module_get(tr->owner))
 		goto out_tr;
@@ -169,6 +173,14 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
 		module_put(tr->owner);
 	}
 
+	/* Free the private data */
+	if (dev->deleted) {
+		module_put(tr->owner);
+		mutex_unlock(&dev->lock);
+		kfree(dev);
+		return 0;
+	}
+
 	return ret;
 }
 
@@ -338,6 +350,8 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	/* stop new requests to arrive */
 	del_gendisk(old->disk);
 
+	old->deleted = 1;
+
 	/* Stop the thread */
 	kthread_stop(old->thread);
 
diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 9f41b1a..d8322cc 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -368,7 +368,6 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
 {
 	del_mtd_blktrans_dev(dev);
-	kfree(dev);
 }
 
 static struct mtd_blktrans_ops mtdblock_tr = {
diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 852165f..54ff288 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -49,7 +49,6 @@ static void mtdblock_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 static void mtdblock_remove_dev(struct mtd_blktrans_dev *dev)
 {
 	del_mtd_blktrans_dev(dev);
-	kfree(dev);
 }
 
 static struct mtd_blktrans_ops mtdblock_tr = {
diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index 1002e18..a4578bf 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -126,7 +126,6 @@ static void nftl_remove_dev(struct mtd_blktrans_dev *dev)
 	del_mtd_blktrans_dev(dev);
 	kfree(nftl->ReplUnitTable);
 	kfree(nftl->EUNtable);
-	kfree(nftl);
 }
 
 /*
diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index d2aa9c4..63b83c0 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -817,7 +817,6 @@ static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 	vfree(part->sector_map);
 	kfree(part->header_cache);
 	kfree(part->blocks);
-	kfree(part);
 }
 
 static struct mtd_blktrans_ops rfd_ftl_tr = {
diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index 3f67e00..81c4ecd 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -375,7 +375,6 @@ static void ssfdcr_remove_dev(struct mtd_blktrans_dev *dev)
 
 	del_mtd_blktrans_dev(dev);
 	kfree(ssfdc->logic_block_map);
-	kfree(ssfdc);
 }
 
 static int ssfdcr_readsect(struct mtd_blktrans_dev *dev,
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index 507f7b2..e276aca 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -24,6 +24,7 @@ struct mtd_blktrans_dev {
 	int devnum;
 	unsigned long size;
 	int readonly;
+	int deleted;
 	int open;
 	struct gendisk *disk;
 	struct task_struct *thread;
-- 
1.6.3.3
