Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgeRN-0006Mj-Q1
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2011 15:32:18 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: mtdcore: export symbols cleanup
Date: Fri, 30 Dec 2011 17:34:14 +0200
Message-Id: <1325259254-21208-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325259254-21208-1-git-send-email-dedekind1@gmail.com>
References: <1325259254-21208-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The mtdcore.c file is a bit inconsistent - some EXPORT_SYMBOL_GPL declarations
follow the corresponding functions, some are placed at the end. This patch
harmonizes the file so that EXPORT_SYMBOL_GPL declarations follow the
corresponding function.

It also removes few extra newlines and trailing white-spaces.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c |   24 +++++++++---------------
 1 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 85a3f19..53a200f 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -128,7 +128,7 @@ static int mtd_cls_suspend(struct device *dev, pm_message_t state)
 static int mtd_cls_resume(struct device *dev)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
-	
+
 	if (mtd && mtd->resume)
 		mtd_resume(mtd);
 	return 0;
@@ -517,7 +517,6 @@ EXPORT_SYMBOL_GPL(mtd_device_unregister);
  *	or removal of MTD devices. Causes the 'add' callback to be immediately
  *	invoked for each MTD device currently present in the system.
  */
-
 void register_mtd_user (struct mtd_notifier *new)
 {
 	struct mtd_info *mtd;
@@ -533,6 +532,7 @@ void register_mtd_user (struct mtd_notifier *new)
 
 	mutex_unlock(&mtd_table_mutex);
 }
+EXPORT_SYMBOL_GPL(register_mtd_user);
 
 /**
  *	unregister_mtd_user - unregister a 'user' of MTD devices.
@@ -543,7 +543,6 @@ void register_mtd_user (struct mtd_notifier *new)
  *	'remove' callback to be immediately invoked for each MTD device
  *	currently present in the system.
  */
-
 int unregister_mtd_user (struct mtd_notifier *old)
 {
 	struct mtd_info *mtd;
@@ -559,7 +558,7 @@ int unregister_mtd_user (struct mtd_notifier *old)
 	mutex_unlock(&mtd_table_mutex);
 	return 0;
 }
-
+EXPORT_SYMBOL_GPL(unregister_mtd_user);
 
 /**
  *	get_mtd_device - obtain a validated handle for an MTD device
@@ -572,7 +571,6 @@ int unregister_mtd_user (struct mtd_notifier *old)
  *	both, return the num'th driver only if its address matches. Return
  *	error code if not.
  */
-
 struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 {
 	struct mtd_info *ret = NULL, *other;
@@ -605,6 +603,7 @@ out:
 	mutex_unlock(&mtd_table_mutex);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(get_mtd_device);
 
 
 int __get_mtd_device(struct mtd_info *mtd)
@@ -625,6 +624,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 	mtd->usecount++;
 	return 0;
 }
+EXPORT_SYMBOL_GPL(__get_mtd_device);
 
 /**
  *	get_mtd_device_nm - obtain a validated handle for an MTD device by
@@ -634,7 +634,6 @@ int __get_mtd_device(struct mtd_info *mtd)
  * 	This function returns MTD device description structure in case of
  * 	success and an error code in case of failure.
  */
-
 struct mtd_info *get_mtd_device_nm(const char *name)
 {
 	int err = -ENODEV;
@@ -663,6 +662,7 @@ out_unlock:
 	mutex_unlock(&mtd_table_mutex);
 	return ERR_PTR(err);
 }
+EXPORT_SYMBOL_GPL(get_mtd_device_nm);
 
 void put_mtd_device(struct mtd_info *mtd)
 {
@@ -671,6 +671,7 @@ void put_mtd_device(struct mtd_info *mtd)
 	mutex_unlock(&mtd_table_mutex);
 
 }
+EXPORT_SYMBOL_GPL(put_mtd_device);
 
 void __put_mtd_device(struct mtd_info *mtd)
 {
@@ -682,6 +683,7 @@ void __put_mtd_device(struct mtd_info *mtd)
 
 	module_put(mtd->owner);
 }
+EXPORT_SYMBOL_GPL(__put_mtd_device);
 
 /*
  * default_mtd_writev - the default writev method
@@ -714,6 +716,7 @@ int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 	*retlen = totlen;
 	return ret;
 }
+EXPORT_SYMBOL_GPL(default_mtd_writev);
 
 /**
  * mtd_kmalloc_up_to - allocate a contiguous buffer up to the specified size
@@ -763,15 +766,6 @@ void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size)
 	 */
 	return kmalloc(*size, GFP_KERNEL);
 }
-
-EXPORT_SYMBOL_GPL(get_mtd_device);
-EXPORT_SYMBOL_GPL(get_mtd_device_nm);
-EXPORT_SYMBOL_GPL(__get_mtd_device);
-EXPORT_SYMBOL_GPL(put_mtd_device);
-EXPORT_SYMBOL_GPL(__put_mtd_device);
-EXPORT_SYMBOL_GPL(register_mtd_user);
-EXPORT_SYMBOL_GPL(unregister_mtd_user);
-EXPORT_SYMBOL_GPL(default_mtd_writev);
 EXPORT_SYMBOL_GPL(mtd_kmalloc_up_to);
 
 #ifdef CONFIG_PROC_FS
-- 
1.7.7.3
