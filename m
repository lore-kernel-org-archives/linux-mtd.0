Received: from mail-fx0-f223.google.com ([209.85.220.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NgHeo-0001cN-I8
	for linux-mtd@lists.infradead.org; Sat, 13 Feb 2010 13:03:40 +0000
Received: by mail-fx0-f223.google.com with SMTP id 23so3374239fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Feb 2010 05:03:34 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 05/14] blktrans: allow FTL drivers to export sysfs attributes
Date: Sat, 13 Feb 2010 15:03:04 +0200
Message-Id: <1266066193-17625-6-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1266066193-17625-1-git-send-email-maximlevitsky@gmail.com>
References: <1266066193-17625-1-git-send-email-maximlevitsky@gmail.com>
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

This patch adds an ability to export sysfs attributes below
the block disk device.

This can be used to pass the udev an information about the FTL
and could include the vendor, serial, version, etc...

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c    |    9 +++++++++
 include/linux/mtd/blktrans.h |    2 ++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 1bc9c76..6850091 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -359,6 +359,11 @@ int add_mtd_blktrans_dev(struct mtd_blktrans_dev *new)
 
 	add_disk(gd);
 
+	if (new->disk_attributes)
+		sysfs_create_group(&disk_to_dev(gd)->kobj,
+					new->disk_attributes);
+
+
 	return 0;
 error4:
 	module_put(tr->owner);
@@ -387,6 +392,10 @@ int del_mtd_blktrans_dev(struct mtd_blktrans_dev *old)
 	/* Stop new requests to arrive */
 	del_gendisk(old->disk);
 
+	if (old->disk_attributes)
+		sysfs_remove_group(&disk_to_dev(old->disk)->kobj,
+						old->disk_attributes);
+
 	/* Stop the thread */
 	kthread_stop(old->thread);
 
diff --git a/include/linux/mtd/blktrans.h b/include/linux/mtd/blktrans.h
index d89b8fb..b481ccd 100644
--- a/include/linux/mtd/blktrans.h
+++ b/include/linux/mtd/blktrans.h
@@ -10,6 +10,7 @@
 
 #include <linux/mutex.h>
 #include <linux/kref.h>
+#include <linux/sysfs.h>
 
 struct hd_geometry;
 struct mtd_info;
@@ -28,6 +29,7 @@ struct mtd_blktrans_dev {
 	int open;
 	struct kref ref;
 	struct gendisk *disk;
+	struct attribute_group *disk_attributes;
 	struct task_struct *thread;
 	struct request_queue *rq;
 	spinlock_t queue_lock;
-- 
1.6.3.3
