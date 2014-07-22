Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9PUB-0006yL-5g
 for linux-mtd@lists.infradead.org; Tue, 22 Jul 2014 02:07:23 +0000
Received: by mail-pa0-f49.google.com with SMTP id hz1so10803020pad.8
 for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2014 19:07:01 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: remove dead non-char logic
Date: Mon, 21 Jul 2014 19:06:47 -0700
Message-Id: <1405994807-19337-1-git-send-email-computersforpeace@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD used to allow compiling out character device support. This was
dropped in the following commit, but some of the accompanying logic was
never dropped:

  commit 660685d9d1b4730f0b5ca97fa95f272f99c63bce
  Author: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
  Date:   Thu Mar 14 13:27:40 2013 +0200

      mtd: merge mtdchar module with mtdcore

The weird logic was flagged by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e4831b4159db..fe073b92c310 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -105,12 +105,11 @@ static LIST_HEAD(mtd_notifiers);
  */
 static void mtd_release(struct device *dev)
 {
-	struct mtd_info __maybe_unused *mtd = dev_get_drvdata(dev);
+	struct mtd_info *mtd = dev_get_drvdata(dev);
 	dev_t index = MTD_DEVT(mtd->index);
 
-	/* remove /dev/mtdXro node if needed */
-	if (index)
-		device_destroy(&mtd_class, index + 1);
+	/* remove /dev/mtdXro node */
+	device_destroy(&mtd_class, index + 1);
 }
 
 static int mtd_cls_suspend(struct device *dev, pm_message_t state)
@@ -442,10 +441,8 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (device_register(&mtd->dev) != 0)
 		goto fail_added;
 
-	if (MTD_DEVT(i))
-		device_create(&mtd_class, mtd->dev.parent,
-			      MTD_DEVT(i) + 1,
-			      NULL, "mtd%dro", i);
+	device_create(&mtd_class, mtd->dev.parent, MTD_DEVT(i) + 1, NULL,
+		      "mtd%dro", i);
 
 	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
 	/* No need to get a refcount on the module containing
-- 
1.9.1
