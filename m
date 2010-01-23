Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYTkv-0004Op-99
	for linux-mtd@lists.infradead.org; Sat, 23 Jan 2010 00:21:41 +0000
Received: by bwz4 with SMTP id 4so1645250bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 16:21:36 -0800 (PST)
Subject: [PATCH 2/8] blktrans: track open and close calls.
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
In-Reply-To: <1264205925.31827.3.camel@maxim-laptop>
References: <1264205925.31827.3.camel@maxim-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 23 Jan 2010 02:21:32 +0200
Message-ID: <1264206092.31827.6.camel@maxim-laptop>
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

>From 1ed89e9f7355284eaebbacb1d083e3bbd54aa3bc Mon Sep 17 00:00:00 2001
From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Sat, 23 Jan 2010 02:03:13 +0200
Subject: [PATCH 2/8] blktrans: track open and close calls.

This patch adds tracking for open and close calls.
Now trans ->open and ->release are never called twise in a row
->release is also called once before mtd device disappers

Proper locking will be added in follow up patch

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c    |   19 +++++++++++++++++++
 include/linux/mtd/blktrans.h |    1 +
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 3d9802e..c2d97a0 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -128,6 +128,9 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	if (!get_mtd_device(NULL, dev->mtd->index))
 		goto out;
 
+	if (dev->open++)
+ 		goto out;
+
 	if (!try_module_get(tr->owner))
 		goto out_tr;
 
@@ -153,6 +156,10 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
 	struct mtd_blktrans_ops *tr = dev->tr;
 	int ret = 0;
 
+	dev->open--;
+	if (dev->open)
+		return 0;
+
 	if (tr->release)
 		ret = tr->release(dev);
 
@@ -304,6 +311,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (new->readonly)
 		set_disk_ro(gd, 1);
 
+	new->open = 0;
 	add_disk(gd);
 
 	return 0;
@@ -332,6 +340,17 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 
 	/* Stop the thread */
 	kthread_stop(old->thread);
+
+	if (old->open) {
+		if (old->tr->release)
+			old->tr->release(old);
+		put_mtd_device(old->mtd);
+	}
+
+	/* From now on, no calls into trans can be made */
+	/* Mtd device will be gone real soon now */
+	old->mtd = NULL;
+
  
 	blk_cleanup_queue(old->rq);
 	return 0;
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index a4b3928..507f7b2 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -24,6 +24,7 @@ struct mtd_blktrans_dev {
 	int devnum;
 	unsigned long size;
 	int readonly;
+	int open;
 	struct gendisk *disk;
 	struct task_struct *thread;
 	struct request_queue *rq;
-- 
1.6.3.3
