Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NetPY-000351-MO
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 16:58:13 +0000
Received: by bwz20 with SMTP id 20so2398617bwz.20
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Feb 2010 08:58:04 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 03/17] blktrans: track open and close calls.
Date: Tue,  9 Feb 2010 18:57:31 +0200
Message-Id: <1265734665-22656-4-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1265734665-22656-1-git-send-email-maximlevitsky@gmail.com>
References: <1265734665-22656-1-git-send-email-maximlevitsky@gmail.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, joern <joern@logfs.org>,
	Vitaly Wool <vitalywool@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds tracking for open and close calls.
Now trans ->open and ->release are never called twise in a row
->release is also called once before mtd device disappers

Proper locking will be added in follow up patch

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c    |   17 +++++++++++++++++
 include/linux/mtd/blktrans.h |    1 +
 2 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 93c87af..9ac8f22 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -128,6 +128,9 @@ static int blktrans_open(struct block_device *bdev, fmode_t mode)
 	if (!get_mtd_device(NULL, dev->mtd->index))
 		goto out;
 
+	if (dev->open++)
+		goto out;
+
 	if (!try_module_get(tr->owner))
 		goto out_tr;
 
@@ -153,6 +156,9 @@ static int blktrans_release(struct gendisk *disk, fmode_t mode)
 	struct mtd_blktrans_ops *tr = dev->tr;
 	int ret = 0;
 
+	if (--dev->open)
+		return 0;
+
 	if (tr->release)
 		ret = tr->release(dev);
 
@@ -304,6 +310,7 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	if (new->readonly)
 		set_disk_ro(gd, 1);
 
+	new->open = 0;
 	add_disk(gd);
 
 	return 0;
@@ -333,6 +340,16 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	/* Stop the thread */
 	kthread_stop(old->thread);
 
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
 }
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
