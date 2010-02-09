Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NetPi-000351-8l
	for linux-mtd@lists.infradead.org; Tue, 09 Feb 2010 16:58:22 +0000
Received: by mail-bw0-f220.google.com with SMTP id 20so2398617bwz.20
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Feb 2010 08:58:13 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 07/17] blktrans: allow FTL drivers to export sysfs attributes
Date: Tue,  9 Feb 2010 18:57:35 +0200
Message-Id: <1265734665-22656-8-git-send-email-maximlevitsky@gmail.com>
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

This patch add ability to export sysfs attributes below
block disk device.
This can be used to pass UDEV information about the FTL
and could include vendor, serial, version, etc...

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c    |   11 ++++++++++-
 include/linux/mtd/blktrans.h |    2 ++
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 9992b2d..ac9d3f5 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -316,7 +316,6 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	set_capacity(gd, (new->size * tr->blksize) >> 9);
 
-
 	/* Create the request queue */
 	spin_lock_init(&new->queue_lock);
 	new->rq = blk_init_queue(mtd_blktrans_request, &new->queue_lock);
@@ -349,6 +348,11 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 	new->open = 0;
 	add_disk(gd);
 
+	if (new->disk_attributes)
+		sysfs_create_group(&disk_to_dev(gd)->kobj,
+					new->disk_attributes);
+
+
 	return 0;
 error4:
 	blk_cleanup_queue(new->rq);
@@ -375,6 +379,11 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	/* stop new requests to arrive */
 	del_gendisk(old->disk);
 
+
+	if (old->disk_attributes)
+		sysfs_remove_group(&disk_to_dev(old->disk)->kobj,
+						old->disk_attributes);
+
 	/* flush current requests */
 	spin_lock_irqsave(&old->queue_lock, flags);
 	old->deleted = 1;
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index e276aca..faf1e54 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -9,6 +9,7 @@
 #define __MTD_TRANS_H__
 
 #include <linux/mutex.h>
+#include <linux/sysfs.h>
 
 struct hd_geometry;
 struct mtd_info;
@@ -27,6 +28,7 @@ struct mtd_blktrans_dev {
 	int deleted;
 	int open;
 	struct gendisk *disk;
+	struct attribute_group *disk_attributes;
 	struct task_struct *thread;
 	struct request_queue *rq;
 	spinlock_t queue_lock;
-- 
1.6.3.3
