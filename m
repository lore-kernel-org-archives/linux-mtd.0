Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKmBz-00062I-Ua
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 10:03:24 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: [PATCH] UBI: block: do not use term "attach"
Date: Tue,  4 Mar 2014 12:02:53 +0200
Message-Id: <1393927373-1472-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We already use term attach/detach for UBI->MTD relations, let's not use this
for UBI->ubiblock relations to avoid confusion. Just use 'create' and 'delete'
instead. E.g., "create a R/O block device on top of a UBI volume".

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/block.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index cea7d1c..69955ce 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -29,10 +29,10 @@
  *
  *   LEB number = addressed byte / LEB size
  *
- * This feature is compiled in the UBI core, and adds a new 'block' parameter
- * to allow early block device attaching. Runtime  block attach/detach for UBI
- * volumes is provided through two new UBI ioctls: UBI_IOCVOLATTBLK and
- * UBI_IOCVOLDETBLK.
+ * This feature is compiled in the UBI core, and adds a 'block' parameter
+ * to allow early creation of block devices on top of UBI volumes. Runtime
+ * block creation/removal for UBI volumes is provided through two UBI ioctls:
+ * UBI_IOCVOLATTBLK and UBI_IOCVOLDETBLK.
  */
 
 #include <linux/module.h>
@@ -528,7 +528,7 @@ static int ubiblock_notify(struct notifier_block *nb,
 	switch (notification_type) {
 	case UBI_VOLUME_ADDED:
 		/*
-		 * We want to enforce explicit block device attaching for
+		 * We want to enforce explicit block device creation for
 		 * volumes, so when a volume is added we do nothing.
 		 */
 		break;
@@ -561,7 +561,7 @@ open_volume_desc(const char *name, int ubi_num, int vol_id)
 		return ubi_open_volume(ubi_num, vol_id, UBI_READONLY);
 }
 
-static int __init ubiblock_attach_from_param(void)
+static int __init ubiblock_create_from_param(void)
 {
 	int i, ret;
 	struct ubiblock_param *p;
@@ -592,7 +592,7 @@ static int __init ubiblock_attach_from_param(void)
 	return ret;
 }
 
-static void ubiblock_detach_all(void)
+static void ubiblock_remove_all(void)
 {
 	struct ubiblock *next;
 	struct ubiblock *dev;
@@ -618,13 +618,13 @@ int __init ubiblock_init(void)
 		return ubiblock_major;
 
 	/* Attach block devices from 'block=' module param */
-	ret = ubiblock_attach_from_param();
+	ret = ubiblock_create_from_param();
 	if (ret)
-		goto err_detach;
+		goto err_remove;
 
 	/*
-	 * Block devices needs to be attached to volumes explicitly
-	 * upon user request. So we ignore existing volumes.
+	 * Block devices are only created upon user requests, so we ignore
+	 * existing volumes.
 	 */
 	ret = ubi_register_volume_notifier(&ubiblock_notifier, 1);
 	if (ret)
@@ -633,14 +633,14 @@ int __init ubiblock_init(void)
 
 err_unreg:
 	unregister_blkdev(ubiblock_major, "ubiblock");
-err_detach:
-	ubiblock_detach_all();
+err_remove:
+	ubiblock_remove_all();
 	return ret;
 }
 
 void __exit ubiblock_exit(void)
 {
 	ubi_unregister_volume_notifier(&ubiblock_notifier);
-	ubiblock_detach_all();
+	ubiblock_remove_all();
 	unregister_blkdev(ubiblock_major, "ubiblock");
 }
-- 
1.8.5.3
