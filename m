Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Na9fo-0003zp-RX
	for linux-mtd@lists.infradead.org; Wed, 27 Jan 2010 15:19:22 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx09.nokia.com (Switch-3.3.3/Switch-3.3.3) with ESMTP id
	o0RFJECG015807
	for <linux-mtd@lists.infradead.org>; Wed, 27 Jan 2010 09:19:15 -0600
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/5] UBI: fix attaching error path
Date: Wed, 27 Jan 2010 17:18:58 +0200
Message-Id: <1264605540-13144-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
References: <1264605540-13144-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

In the error path of 'ubi_attach_mtd_dev()' we have a tricky situation:
we have to release things differently depending on at which point
the failure happening. Namely, if @ubi->dev is not initialized, we have
to free everything ourselves. But if it was, we should not free the @ubi
object, because it will be freed in the 'dev_release()' function. And
we did not get this situation right.

This patch introduces additional argument to the 'uif_init()' function.
On exit, this argument indicates whether the final 'free(ubi)' will
happen in 'dev_release()' or not. So the caller always knows how to
properly release the resources.

Impact: all memory is now correctly released when UBI fails to attach
        an MTD device.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/build.c |   63 ++++++++++++++++++++++------------------------
 1 files changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 99ff57d..bc45ef9 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -365,11 +365,13 @@ static void dev_release(struct device *dev)
 /**
  * ubi_sysfs_init - initialize sysfs for an UBI device.
  * @ubi: UBI device description object
+ * @ref: set to %1 on exit in case of failure if a reference to @ubi->dev was
+ *       taken
  *
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-static int ubi_sysfs_init(struct ubi_device *ubi)
+static int ubi_sysfs_init(struct ubi_device *ubi, int *ref)
 {
 	int err;
 
@@ -381,6 +383,7 @@ static int ubi_sysfs_init(struct ubi_device *ubi)
 	if (err)
 		return err;
 
+	*ref = 1;
 	err = device_create_file(&ubi->dev, &dev_eraseblock_size);
 	if (err)
 		return err;
@@ -436,7 +439,7 @@ static void ubi_sysfs_close(struct ubi_device *ubi)
 }
 
 /**
- * kill_volumes - destroy all volumes.
+ * kill_volumes - destroy all user volumes.
  * @ubi: UBI device description object
  */
 static void kill_volumes(struct ubi_device *ubi)
@@ -449,36 +452,29 @@ static void kill_volumes(struct ubi_device *ubi)
 }
 
 /**
- * free_user_volumes - free all user volumes.
- * @ubi: UBI device description object
- *
- * Normally the volumes are freed at the release function of the volume device
- * objects. However, on error paths the volumes have to be freed before the
- * device objects have been initialized.
- */
-static void free_user_volumes(struct ubi_device *ubi)
-{
-	int i;
-
-	for (i = 0; i < ubi->vtbl_slots; i++)
-		if (ubi->volumes[i]) {
-			kfree(ubi->volumes[i]->eba_tbl);
-			kfree(ubi->volumes[i]);
-		}
-}
-
-/**
  * uif_init - initialize user interfaces for an UBI device.
  * @ubi: UBI device description object
+ * @ref: set to %1 on exit in case of failure if a reference to @ubi->dev was
+ *       taken, otherwise set to %0
+ *
+ * This function initializes various user interfaces for an UBI device. If the
+ * initialization fails at an early stage, this function frees all the
+ * resources it allocated, returns an error, and @ref is set to %0. However,
+ * if the initialization fails after the UBI device was registered in the
+ * driver core subsystem, this function takes a reference to @ubi->dev, because
+ * otherwise the release function ('dev_release()') would free whole @ubi
+ * object. The @ref argument is set to %1 in this case. The caller has to put
+ * this reference.
  *
  * This function returns zero in case of success and a negative error code in
- * case of failure. Note, this function destroys all volumes if it fails.
+ * case of failure.
  */
-static int uif_init(struct ubi_device *ubi)
+static int uif_init(struct ubi_device *ubi, int *ref)
 {
 	int i, err;
 	dev_t dev;
 
+	*ref = 0;
 	sprintf(ubi->ubi_name, UBI_NAME_STR "%d", ubi->ubi_num);
 
 	/*
@@ -506,7 +502,7 @@ static int uif_init(struct ubi_device *ubi)
 		goto out_unreg;
 	}
 
-	err = ubi_sysfs_init(ubi);
+	err = ubi_sysfs_init(ubi, ref);
 	if (err)
 		goto out_sysfs;
 
@@ -524,6 +520,8 @@ static int uif_init(struct ubi_device *ubi)
 out_volumes:
 	kill_volumes(ubi);
 out_sysfs:
+	if (*ref)
+		get_device(&ubi->dev);
 	ubi_sysfs_close(ubi);
 	cdev_del(&ubi->cdev);
 out_unreg:
@@ -877,7 +875,7 @@ static int ubi_reboot_notifier(struct notifier_block *n, unsigned long state,
 int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 {
 	struct ubi_device *ubi;
-	int i, err, do_free = 1;
+	int i, err, ref = 0;
 
 	/*
 	 * Check if we already have the same MTD device attached.
@@ -977,9 +975,9 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 			goto out_detach;
 	}
 
-	err = uif_init(ubi);
+	err = uif_init(ubi, &ref);
 	if (err)
-		goto out_nofree;
+		goto out_detach;
 
 	ubi->bgt_thread = kthread_create(ubi_thread, ubi, ubi->bgt_name);
 	if (IS_ERR(ubi->bgt_thread)) {
@@ -1027,12 +1025,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 
 out_uif:
 	uif_close(ubi);
-out_nofree:
-	do_free = 0;
 out_detach:
 	ubi_wl_close(ubi);
-	if (do_free)
-		free_user_volumes(ubi);
 	free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
 out_free:
@@ -1041,7 +1035,10 @@ out_free:
 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
 	vfree(ubi->dbg_peb_buf);
 #endif
-	kfree(ubi);
+	if (ref)
+		put_device(&ubi->dev);
+	else
+		kfree(ubi);
 	return err;
 }
 
@@ -1098,7 +1095,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 
 	/*
 	 * Get a reference to the device in order to prevent 'dev_release()'
-	 * from freeing @ubi object.
+	 * from freeing the @ubi object.
 	 */
 	get_device(&ubi->dev);
 
-- 
1.6.6
