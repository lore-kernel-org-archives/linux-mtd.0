Received: from nf-out-0910.google.com ([64.233.182.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L9kOL-0006aq-U6
	for linux-mtd@lists.infradead.org; Mon, 08 Dec 2008 17:59:34 +0000
Received: by nf-out-0910.google.com with SMTP id d21so613346nfb.22
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Dec 2008 09:59:33 -0800 (PST)
Subject: [PATCH] [UBI] 1/4 UBI volume notifications - UBI changes
From: dmitry pervushin <dpervushin@gmail.com>
To: dpervushin@gmail.com
Content-Type: text/plain
Date: Mon, 08 Dec 2008 20:59:20 +0300
Message-Id: <1228759160.7622.28.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dpervushin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: dmitry pervushin <dimka@embeddedalley.com>

---
 drivers/mtd/ubi/build.c |   32 ++++++++++++++++++++++-
 drivers/mtd/ubi/cdev.c  |    2 +-
 drivers/mtd/ubi/kapi.c  |   29 +++++++++++++++++++++
 drivers/mtd/ubi/ubi.h   |   64 +++++++++++++++++++++++++++-------------------
 drivers/mtd/ubi/vmt.c   |   39 +++++++++++-----------------
 include/linux/mtd/ubi.h |   17 ++++++++++++
 6 files changed, 130 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 634e2e8..fe9e329 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -122,6 +122,34 @@ static struct device_attribute dev_mtd_num =
 	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
 
 /**
+ * ubi_enum_volumes - enumerate all existing volumes
+ */
+int ubi_enum_volumes(void *context,
+	void (*enumerator)(void *context, int ubi, const char *volume_name))
+{
+	int ubi_num, i, count = 0;
+	struct ubi_device *ubi;
+
+	spin_lock(&ubi_devices_lock);
+	for (ubi_num = 0; ubi_num < UBI_MAX_DEVICES; ubi_num++) {
+		ubi = ubi_devices[ubi_num];
+		if (!ubi)
+			continue;
+		spin_lock(&ubi->volumes_lock);
+		for (i = 0; i < ubi->vtbl_slots; i++) {
+			if (!ubi->volumes[i])
+				continue;
+			enumerator(context, ubi_num, ubi->volumes[i]->name);
+			count++;
+		}
+		spin_unlock(&ubi->volumes_lock);
+	}
+	spin_unlock(&ubi_devices_lock);
+	return count;
+}
+
+
+/**
  * ubi_get_device - get UBI device.
  * @ubi_num: UBI device number
  *
@@ -842,6 +870,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 			goto out_detach;
 	}
 
+	/* when processing uif_init, we already might want to open the volume */
+	ubi_devices[ubi_num] = ubi;
 	err = uif_init(ubi);
 	if (err)
 		goto out_nofree;
@@ -874,12 +904,12 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 		ubi->thread_enabled = 1;
 	wake_up_process(ubi->bgt_thread);
 
-	ubi_devices[ubi_num] = ubi;
 	return ubi_num;
 
 out_uif:
 	uif_close(ubi);
 out_nofree:
+	ubi_devices[ubi_num] = NULL;
 	do_free = 0;
 out_detach:
 	ubi_wl_close(ubi);
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index b30a0b8..64a5398 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -395,7 +395,7 @@ static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
 			vol->corrupted = 1;
 		}
 		vol->checked = 1;
-		ubi_gluebi_updated(vol);
+		ubi_volume_notify(UBI_VOLUME_CHANGED, ubi->ubi_num, vol->name);
 		revoke_exclusive(desc, UBI_READWRITE);
 	}
 
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 5d9bcf1..0f3256b 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -656,3 +656,32 @@ int ubi_sync(int ubi_num)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ubi_sync);
+
+BLOCKING_NOTIFIER_HEAD(ubi_notifiers);
+
+static void do_notify_added(void *context, int ubi, const char *name)
+{
+	struct notifier_block *nb = context;
+	struct ubi_volume_notification nt;
+
+	nt.ubi_device = ubi;
+	nt.volume_name = name;
+	nb->notifier_call(context, UBI_VOLUME_ADDED, &nt);
+}
+
+int ubi_register_volume_notifier(struct notifier_block *nb, int ignore_existing)
+{
+	if (!ignore_existing) {
+	       down_read(&ubi_notifiers.rwsem);
+	       ubi_enum_volumes(nb, do_notify_added);
+	       up_read(&ubi_notifiers.rwsem);
+	}
+	return blocking_notifier_chain_register(&ubi_notifiers, nb);
+}
+EXPORT_SYMBOL_GPL(ubi_register_volume_notifier);
+
+int ubi_unregister_volume_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&ubi_notifiers, nb);
+}
+EXPORT_SYMBOL_GPL(ubi_unregister_volume_notifier);
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 1c3fa18..b82aaf0 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -38,6 +38,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/ubi.h>
+#include <linux/notifier.h>
 
 #include "ubi-media.h"
 #include "scan.h"
@@ -196,10 +197,6 @@ struct ubi_volume_desc;
  * @updating: %1 if the volume is being updated
  * @changing_leb: %1 if the atomic LEB change ioctl command is in progress
  *
- * @gluebi_desc: gluebi UBI volume descriptor
- * @gluebi_refcount: reference count of the gluebi MTD device
- * @gluebi_mtd: MTD device description object of the gluebi MTD device
- *
  * The @corrupted field indicates that the volume's contents is corrupted.
  * Since UBI protects only static volumes, this field is not relevant to
  * dynamic volumes - it is user's responsibility to assure their data
@@ -242,17 +239,6 @@ struct ubi_volume {
 	unsigned int upd_marker:1;
 	unsigned int updating:1;
 	unsigned int changing_leb:1;
-
-#ifdef CONFIG_MTD_UBI_GLUEBI
-	/*
-	 * Gluebi-related stuff may be compiled out.
-	 * Note: this should not be built into UBI but should be a separate
-	 * ubimtd driver which works on top of UBI and emulates MTD devices.
-	 */
-	struct ubi_volume_desc *gluebi_desc;
-	int gluebi_refcount;
-	struct mtd_info gluebi_mtd;
-#endif
 };
 
 /**
@@ -447,6 +433,7 @@ extern struct file_operations ubi_cdev_operations;
 extern struct file_operations ubi_vol_cdev_operations;
 extern struct class *ubi_class;
 extern struct mutex ubi_devices_mutex;
+extern struct blocking_notifier_head ubi_notifiers;
 
 /* vtbl.c */
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
@@ -479,17 +466,6 @@ int ubi_calc_data_len(const struct ubi_device *ubi, const void *buf,
 int ubi_check_volume(struct ubi_device *ubi, int vol_id);
 void ubi_calculate_reserved(struct ubi_device *ubi);
 
-/* gluebi.c */
-#ifdef CONFIG_MTD_UBI_GLUEBI
-int ubi_create_gluebi(struct ubi_device *ubi, struct ubi_volume *vol);
-int ubi_destroy_gluebi(struct ubi_volume *vol);
-void ubi_gluebi_updated(struct ubi_volume *vol);
-#else
-#define ubi_create_gluebi(ubi, vol) 0
-#define ubi_destroy_gluebi(vol) 0
-#define ubi_gluebi_updated(vol)
-#endif
-
 /* eba.c */
 int ubi_eba_unmap_leb(struct ubi_device *ubi, struct ubi_volume *vol,
 		      int lnum);
@@ -539,7 +515,41 @@ struct ubi_device *ubi_get_device(int ubi_num);
 void ubi_put_device(struct ubi_device *ubi);
 struct ubi_device *ubi_get_by_major(int major);
 int ubi_major2num(int major);
+int ubi_enum_volumes(void *context,
+       void (*enumerator)(void *context, int ubi, const char *volume_name));
 
+static inline char *ubi_notification(enum ubi_volume_notification_type t)
+{
+	static char *nstr[] = { 
+	 [UBI_VOLUME_ADDED]	= "Added",
+	 [UBI_VOLUME_DELETED]	= "Deleted",
+	 [UBI_VOLUME_RENAMING]	= "Renaming",
+	 [UBI_VOLUME_RENAMED]	= "Renamed",
+	 [UBI_VOLUME_CHANGED]	= "Changed",
+	};
+	return nstr[t];
+}
+/**
+ * ubi_volume_notify - notify all registered clients about volume changes
+ *
+ * @t: notification type
+ * @ubi_device: device number
+ * @volume_name: name of created/removed/changed volume
+ */
+static inline int ubi_volume_notify(enum ubi_volume_notification_type t,
+		int ubi_device, char *volume_name)
+{
+       struct ubi_volume_notification nt;
+
+       nt.ubi_device = ubi_device;
+       nt.volume_name = volume_name;
+       dbg_gen("%s: %s volume %s on device %d\n",
+		       __func__,
+		       ubi_notification(t),
+		       volume_name,
+		       ubi_device);
+       return blocking_notifier_call_chain(&ubi_notifiers, t, &nt);
+}
 /*
  * ubi_rb_for_each_entry - walk an RB-tree.
  * @rb: a pointer to type 'struct rb_node' to to use as a loop counter
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 3531ca9..e6bedaa 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -320,10 +320,6 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 		goto out_mapping;
 	}
 
-	err = ubi_create_gluebi(ubi, vol);
-	if (err)
-		goto out_cdev;
-
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
@@ -333,7 +329,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	err = device_register(&vol->dev);
 	if (err) {
 		ubi_err("cannot register device");
-		goto out_gluebi;
+		goto out_cdev;
 	}
 
 	err = volume_sysfs_init(ubi, vol);
@@ -361,6 +357,8 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	ubi->vol_count += 1;
 	spin_unlock(&ubi->volumes_lock);
 
+	ubi_volume_notify(UBI_VOLUME_ADDED, ubi->ubi_num, vol->name);
+
 	err = paranoid_check_volumes(ubi);
 	return err;
 
@@ -376,10 +374,6 @@ out_sysfs:
 	do_free = 0;
 	get_device(&vol->dev);
 	volume_sysfs_close(vol);
-out_gluebi:
-	if (ubi_destroy_gluebi(vol))
-		dbg_err("cannot destroy gluebi for volume %d:%d",
-			ubi->ubi_num, vol_id);
 out_cdev:
 	cdev_del(&vol->cdev);
 out_mapping:
@@ -431,13 +425,10 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 		err = -EBUSY;
 		goto out_unlock;
 	}
+	ubi_volume_notify(UBI_VOLUME_DELETED, ubi->ubi_num, vol->name);
 	ubi->volumes[vol_id] = NULL;
 	spin_unlock(&ubi->volumes_lock);
 
-	err = ubi_destroy_gluebi(vol);
-	if (err)
-		goto out_err;
-
 	if (!no_vtbl) {
 		err = ubi_change_vtbl_record(ubi, vol_id, NULL);
 		if (err)
@@ -473,6 +464,7 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 	return err;
 
 out_err:
+	ubi_volume_notify(UBI_VOLUME_ADDED, ubi->ubi_num, vol->name);
 	ubi_err("cannot remove volume %d, error %d", vol_id, err);
 	spin_lock(&ubi->volumes_lock);
 	ubi->volumes[vol_id] = vol;
@@ -590,6 +582,8 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 			(long long)vol->used_ebs * vol->usable_leb_size;
 	}
 
+	ubi_volume_notify(UBI_VOLUME_CHANGED, ubi->ubi_num, vol->name);
+
 	err = paranoid_check_volumes(ubi);
 	return err;
 
@@ -631,10 +625,14 @@ int ubi_rename_volumes(struct ubi_device *ubi, struct list_head *rename_list)
 		} else {
 			struct ubi_volume *vol = re->desc->vol;
 
+			ubi_volume_notify(UBI_VOLUME_RENAMING,
+				ubi->ubi_num, vol->name);
 			spin_lock(&ubi->volumes_lock);
 			vol->name_len = re->new_name_len;
 			memcpy(vol->name, re->new_name, re->new_name_len + 1);
 			spin_unlock(&ubi->volumes_lock);
+			ubi_volume_notify(UBI_VOLUME_RENAMED,
+				ubi->ubi_num, vol->name);
 		}
 	}
 
@@ -670,10 +668,6 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 		return err;
 	}
 
-	err = ubi_create_gluebi(ubi, vol);
-	if (err)
-		goto out_cdev;
-
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
@@ -681,21 +675,19 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 	sprintf(&vol->dev.bus_id[0], "%s_%d", ubi->ubi_name, vol->vol_id);
 	err = device_register(&vol->dev);
 	if (err)
-		goto out_gluebi;
+		goto out_cdev;
 
 	err = volume_sysfs_init(ubi, vol);
 	if (err) {
 		cdev_del(&vol->cdev);
-		err = ubi_destroy_gluebi(vol);
 		volume_sysfs_close(vol);
 		return err;
 	}
 
+	ubi_volume_notify(UBI_VOLUME_ADDED, ubi->ubi_num, vol->name);
 	err = paranoid_check_volumes(ubi);
 	return err;
 
-out_gluebi:
-	err = ubi_destroy_gluebi(vol);
 out_cdev:
 	cdev_del(&vol->cdev);
 	return err;
@@ -711,12 +703,11 @@ out_cdev:
  */
 void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 {
-	int err;
-
 	dbg_gen("free volume %d", vol->vol_id);
 
+	ubi_volume_notify(UBI_VOLUME_DELETED, ubi->ubi_num, vol->name);
+
 	ubi->volumes[vol->vol_id] = NULL;
-	err = ubi_destroy_gluebi(vol);
 	cdev_del(&vol->cdev);
 	volume_sysfs_close(vol);
 }
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 6316faf..3eb3997 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -184,4 +184,21 @@ static inline int ubi_change(struct ubi_volume_desc *desc, int lnum,
 	return ubi_leb_change(desc, lnum, buf, len, UBI_UNKNOWN);
 }
 
+int ubi_register_volume_notifier(struct notifier_block *nb,
+		int ignore_existing);
+int ubi_unregister_volume_notifier(struct notifier_block *nb);
+
+struct ubi_volume_notification {
+	int ubi_device;
+	const char *volume_name;
+};
+
+enum ubi_volume_notification_type {
+	UBI_VOLUME_ADDED,
+	UBI_VOLUME_DELETED,
+	UBI_VOLUME_CHANGED,
+	UBI_VOLUME_RENAMING,
+	UBI_VOLUME_RENAMED,
+};
+
 #endif /* !__LINUX_UBI_H__ */
-- 
1.5.6
