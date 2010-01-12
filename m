Received: from exchange.solarflare.com ([216.237.3.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NUprw-0007x1-E2
	for linux-mtd@lists.infradead.org; Tue, 12 Jan 2010 23:09:58 +0000
Subject: [PATCHv2 6/7] mtd: Replace static array of devices with an idr
	structure
From: Ben Hutchings <bhutchings@solarflare.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Date: Tue, 12 Jan 2010 23:09:44 +0000
Message-Id: <1263337784.3011.26.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-net-drivers@solarflare.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
---
 drivers/mtd/mtdcore.c   |  151 +++++++++++++++++++++++++----------------------
 drivers/mtd/mtdcore.h   |   12 +----
 include/linux/mtd/mtd.h |    1 -
 3 files changed, 81 insertions(+), 83 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 402d417..b3b98d1 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -17,6 +17,7 @@
 #include <linux/init.h>
 #include <linux/mtd/compatmac.h>
 #include <linux/proc_fs.h>
+#include <linux/idr.h>
 
 #include <linux/mtd/mtd.h>
 #include "internal.h"
@@ -33,13 +34,18 @@ static struct class mtd_class = {
 	.resume = mtd_cls_resume,
 };
 
+static DEFINE_IDR(mtd_idr);
+
 /* These are exported solely for the purpose of mtd_blkdevs.c. You
    should not use them for _anything_ else */
 DEFINE_MUTEX(mtd_table_mutex);
-struct mtd_info *mtd_table[MAX_MTD_DEVICES];
-
 EXPORT_SYMBOL_GPL(mtd_table_mutex);
-EXPORT_SYMBOL_GPL(mtd_table);
+
+struct mtd_info *__mtd_next_device(int i)
+{
+	return idr_get_next(&mtd_idr, &i);
+}
+EXPORT_SYMBOL_GPL(__mtd_next_device);
 
 static LIST_HEAD(mtd_notifiers);
 
@@ -235,13 +241,13 @@ static struct device_type mtd_devtype = {
  *	Add a device to the list of MTD devices present in the system, and
  *	notify each currently active MTD 'user' of its arrival. Returns
  *	zero on success or 1 on failure, which currently will only happen
- *	if the number of present devices exceeds MAX_MTD_DEVICES (i.e. 16)
- *	or there's a sysfs error.
+ *	if there is insufficient memory or a sysfs error.
  */
 
 int add_mtd_device(struct mtd_info *mtd)
 {
-	int i;
+	struct mtd_notifier *not;
+	int i, error;
 
 	if (!mtd->backing_dev_info) {
 		switch (mtd->type) {
@@ -260,70 +266,73 @@ int add_mtd_device(struct mtd_info *mtd)
 	BUG_ON(mtd->writesize == 0);
 	mutex_lock(&mtd_table_mutex);
 
-	for (i=0; i < MAX_MTD_DEVICES; i++)
-		if (!mtd_table[i]) {
-			struct mtd_notifier *not;
-
-			mtd_table[i] = mtd;
-			mtd->index = i;
-			mtd->usecount = 0;
-
-			if (is_power_of_2(mtd->erasesize))
-				mtd->erasesize_shift = ffs(mtd->erasesize) - 1;
-			else
-				mtd->erasesize_shift = 0;
-
-			if (is_power_of_2(mtd->writesize))
-				mtd->writesize_shift = ffs(mtd->writesize) - 1;
-			else
-				mtd->writesize_shift = 0;
-
-			mtd->erasesize_mask = (1 << mtd->erasesize_shift) - 1;
-			mtd->writesize_mask = (1 << mtd->writesize_shift) - 1;
-
-			/* Some chips always power up locked. Unlock them now */
-			if ((mtd->flags & MTD_WRITEABLE)
-			    && (mtd->flags & MTD_POWERUP_LOCK) && mtd->unlock) {
-				if (mtd->unlock(mtd, 0, mtd->size))
-					printk(KERN_WARNING
-					       "%s: unlock failed, "
-					       "writes may not work\n",
-					       mtd->name);
-			}
+	do {
+		if (!idr_pre_get(&mtd_idr, GFP_KERNEL))
+			goto fail_locked;
+		error = idr_get_new(&mtd_idr, mtd, &i);
+	} while (error == -EAGAIN);
 
-			/* Caller should have set dev.parent to match the
-			 * physical device.
-			 */
-			mtd->dev.type = &mtd_devtype;
-			mtd->dev.class = &mtd_class;
-			mtd->dev.devt = MTD_DEVT(i);
-			dev_set_name(&mtd->dev, "mtd%d", i);
-			dev_set_drvdata(&mtd->dev, mtd);
-			if (device_register(&mtd->dev) != 0) {
-				mtd_table[i] = NULL;
-				break;
-			}
+	if (error)
+		goto fail_locked;
 
-			if (MTD_DEVT(i))
-				device_create(&mtd_class, mtd->dev.parent,
-						MTD_DEVT(i) + 1,
-						NULL, "mtd%dro", i);
-
-			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
-			/* No need to get a refcount on the module containing
-			   the notifier, since we hold the mtd_table_mutex */
-			list_for_each_entry(not, &mtd_notifiers, list)
-				not->add(mtd);
-
-			mutex_unlock(&mtd_table_mutex);
-			/* We _know_ we aren't being removed, because
-			   our caller is still holding us here. So none
-			   of this try_ nonsense, and no bitching about it
-			   either. :) */
-			__module_get(THIS_MODULE);
-			return 0;
-		}
+	mtd->index = i;
+	mtd->usecount = 0;
+
+	if (is_power_of_2(mtd->erasesize))
+		mtd->erasesize_shift = ffs(mtd->erasesize) - 1;
+	else
+		mtd->erasesize_shift = 0;
+
+	if (is_power_of_2(mtd->writesize))
+		mtd->writesize_shift = ffs(mtd->writesize) - 1;
+	else
+		mtd->writesize_shift = 0;
+
+	mtd->erasesize_mask = (1 << mtd->erasesize_shift) - 1;
+	mtd->writesize_mask = (1 << mtd->writesize_shift) - 1;
+
+	/* Some chips always power up locked. Unlock them now */
+	if ((mtd->flags & MTD_WRITEABLE)
+	    && (mtd->flags & MTD_POWERUP_LOCK) && mtd->unlock) {
+		if (mtd->unlock(mtd, 0, mtd->size))
+			printk(KERN_WARNING
+			       "%s: unlock failed, writes may not work\n",
+			       mtd->name);
+	}
+
+	/* Caller should have set dev.parent to match the
+	 * physical device.
+	 */
+	mtd->dev.type = &mtd_devtype;
+	mtd->dev.class = &mtd_class;
+	mtd->dev.devt = MTD_DEVT(i);
+	dev_set_name(&mtd->dev, "mtd%d", i);
+	dev_set_drvdata(&mtd->dev, mtd);
+	if (device_register(&mtd->dev) != 0)
+		goto fail_added;
+
+	if (MTD_DEVT(i))
+		device_create(&mtd_class, mtd->dev.parent,
+			      MTD_DEVT(i) + 1,
+			      NULL, "mtd%dro", i);
+
+	DEBUG(0, "mtd: Giving out device %d to %s\n", i, mtd->name);
+	/* No need to get a refcount on the module containing
+	   the notifier, since we hold the mtd_table_mutex */
+	list_for_each_entry(not, &mtd_notifiers, list)
+		not->add(mtd);
+
+	mutex_unlock(&mtd_table_mutex);
+	/* We _know_ we aren't being removed, because
+	   our caller is still holding us here. So none
+	   of this try_ nonsense, and no bitching about it
+	   either. :) */
+	__module_get(THIS_MODULE);
+	return 0;
 
+fail_added:
+	idr_remove(&mtd_idr, i);
+fail_locked:
 	mutex_unlock(&mtd_table_mutex);
 	return 1;
 }
@@ -344,7 +353,7 @@ int del_mtd_device (struct mtd_info *mtd)
 
 	mutex_lock(&mtd_table_mutex);
 
-	if (mtd_table[mtd->index] != mtd) {
+	if (idr_find(&mtd_idr, mtd->index) != mtd) {
 		ret = -ENODEV;
 	} else if (mtd->usecount) {
 		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
@@ -360,7 +369,7 @@ int del_mtd_device (struct mtd_info *mtd)
 		list_for_each_entry(not, &mtd_notifiers, list)
 			not->remove(mtd);
 
-		mtd_table[mtd->index] = NULL;
+		idr_remove(&mtd_idr, mtd->index);
 
 		module_put(THIS_MODULE);
 		ret = 0;
@@ -448,8 +457,8 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 				break;
 			}
 		}
-	} else if (num >= 0 && num < MAX_MTD_DEVICES) {
-		ret = mtd_table[num];
+	} else if (num >= 0) {
+		ret = idr_find(&mtd_idr, num);
 		if (mtd && mtd != ret)
 			ret = NULL;
 	}
diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
index e2f93a3..6a64fde 100644
--- a/drivers/mtd/mtdcore.h
+++ b/drivers/mtd/mtdcore.h
@@ -8,17 +8,7 @@
    should not use them for _anything_ else */
 
 extern struct mutex mtd_table_mutex;
-extern struct mtd_info *mtd_table[MAX_MTD_DEVICES];
-
-static inline struct mtd_info *__mtd_next_device(int i)
-{
-	while (i < MAX_MTD_DEVICES) {
-		if (mtd_table[i])
-			return mtd_table[i];
-		i++;
-	}
-	return NULL;
-}
+extern struct mtd_info *__mtd_next_device(int i);
 
 #define mtd_for_each_device(mtd)			\
 	for ((mtd) = __mtd_next_device(0);		\
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 0f32a9b..ba53ecc 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -20,7 +20,6 @@
 
 #define MTD_CHAR_MAJOR 90
 #define MTD_BLOCK_MAJOR 31
-#define MAX_MTD_DEVICES 32
 
 #define MTD_ERASE_PENDING      	0x01
 #define MTD_ERASING		0x02
-- 
1.5.5


-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
