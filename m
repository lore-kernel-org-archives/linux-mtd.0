Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LxT8L-0001cH-0u
	for linux-mtd@lists.infradead.org; Fri, 24 Apr 2009 21:40:40 +0000
Subject: [PATCH, UBI] ubi notifications
From: dmitry pervushin <dpervushin@embeddedalley.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Sat, 25 Apr 2009 01:39:43 +0400
Message-Id: <1240609183.32546.19.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dpervushin@embeddedalley.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

UBI volume notifications is intended to create the API to get clients
notified about volume creation/deletion, renaming and changing(actually,
resizing). A client can subscribe to these notifications using
ubi_volume_register and cancel the subsription using
ubi_volume_unregister. When UBI volume change occurs, the atomic
notifier will be called. Client also can request "added" event on all
volumes that existed before client subscribed to the notifications.

Using notifications instead of calling functions ubi_gluebi_xxx allows
MTD emulation layer to be more flexible; say, now is it possible to
build it as a module and load/unload it on demand.

Thanks Artem Bityutskiy for reviewing the patch and many very valuable
comments.

Signed-off-by: dmitry pervushin <dpervushin@embeddedalley.com>

---
 drivers/mtd/ubi/build.c |   73 ++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/ubi/cdev.c  |    2 +
 drivers/mtd/ubi/kapi.c  |   46 ++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h   |   37 ++++++++++++++++++++++++
 drivers/mtd/ubi/vmt.c   |    7 ++++
 include/linux/mtd/ubi.h |   36 +++++++++++++++++++++++
 6 files changed, 198 insertions(+), 3 deletions(-)

Index: linux-2.6/drivers/mtd/ubi/build.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/build.c
+++ linux-2.6/drivers/mtd/ubi/build.c
@@ -122,6 +122,69 @@ static struct device_attribute dev_mtd_n
 	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
 
 /**
+ * ubi_enum_volumes - enumerate volumes on device and send notification.
+ * @t: notification type to send
+ * @ubi: UBI device
+ * @nb: notifier to be called, or %NULL to send to system-wide notification
+ *
+ * Walk on the list of volumes that are created on device @ubi and send the
+ * notification specified by @t.
+ *
+ * Returns number of volumes processed.
+ */
+int ubi_enum_volumes(enum ubi_volume_notification_type t,
+		     struct ubi_device *ubi, struct notifier_block *nb)
+{
+	int i, count = 0;
+	struct ubi_volume_notification nt;
+
+	nt.ubi_num = ubi->ubi_num;
+
+	spin_lock(&ubi->volumes_lock);
+	for (i = 0; i < ubi->vtbl_slots; i++) {
+		if (!ubi->volumes[i])
+			continue;
+		nt.vol_id = ubi->volumes[i]->vol_id;
+		spin_unlock(&ubi->volumes_lock);
+		if (nb)
+			nb->notifier_call(nb, t, &nt);
+		else
+			blocking_notifier_call_chain(&ubi_notifiers,
+						     t, &nt);
+		count++;
+		spin_lock(&ubi->volumes_lock);
+	}
+	spin_unlock(&ubi->volumes_lock);
+	return count;
+}
+
+/**
+ * ubi_enum_all_volumes - enumerate all existing volumes and send notification.
+ * @t: notification type to send.
+ * @nb: notifier to be called, or %NULL to send to system-wide notification
+ *
+ * Using ubi_enum_volumes to enumerate volumes on the UBI device, enumerate
+ * all existing UBI devices.
+ */
+int ubi_enum_all_volumes(enum ubi_volume_notification_type t,
+			 struct notifier_block *nb)
+{
+	int n;
+	struct ubi_device *ubi;
+	int count = 0;
+
+	spin_lock(&ubi_devices_lock);
+	for (n = 0; n < UBI_MAX_DEVICES; n++) {
+		ubi = ubi_devices[n];
+		spin_unlock(&ubi_devices_lock);
+		if (ubi)
+			count += ubi_enum_volumes(t, ubi, nb);
+		spin_lock(&ubi_devices_lock);
+	}
+	spin_unlock(&ubi_devices_lock);
+	return count;
+}
+/**
  * ubi_get_device - get UBI device.
  * @ubi_num: UBI device number
  *
@@ -877,6 +940,7 @@ int ubi_attach_mtd_dev(struct mtd_info *
 	wake_up_process(ubi->bgt_thread);
 
 	ubi_devices[ubi_num] = ubi;
+	ubi_enum_volumes(UBI_VOLUME_ADDED, ubi, NULL);
 	return ubi_num;
 
 out_uif:
@@ -921,14 +985,17 @@ int ubi_detach_mtd_dev(int ubi_num, int
 
 	spin_lock(&ubi_devices_lock);
 	ubi = ubi_devices[ubi_num];
-	if (!ubi) {
-		spin_unlock(&ubi_devices_lock);
+	spin_unlock(&ubi_devices_lock);
+
+	if (!ubi)
 		return -EINVAL;
-	}
+	ubi_enum_volumes(UBI_VOLUME_DELETED, ubi, NULL);
 
+	spin_lock(&ubi_devices_lock);
 	if (ubi->ref_count) {
 		if (!anyway) {
 			spin_unlock(&ubi_devices_lock);
+			ubi_enum_volumes(UBI_VOLUME_ADDED, ubi, NULL);
 			return -EBUSY;
 		}
 		/* This may only happen if there is a bug */
Index: linux-2.6/drivers/mtd/ubi/cdev.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/cdev.c
+++ linux-2.6/drivers/mtd/ubi/cdev.c
@@ -394,6 +394,8 @@ static ssize_t vol_cdev_write(struct fil
 		}
 		vol->checked = 1;
 		ubi_gluebi_updated(vol);
+		ubi_volume_notify(UBI_VOLUME_CHANGED,
+				ubi->ubi_num, vol->vol_id);
 		revoke_exclusive(desc, UBI_READWRITE);
 	}
 
Index: linux-2.6/drivers/mtd/ubi/kapi.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/kapi.c
+++ linux-2.6/drivers/mtd/ubi/kapi.c
@@ -656,3 +656,49 @@ int ubi_sync(int ubi_num)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ubi_sync);
+
+BLOCKING_NOTIFIER_HEAD(ubi_notifiers);
+
+/**
+ * ubi_register_volume_notifier - register the volume notification function.
+ * @nb: pointer to the filled struct &notifier_block
+ * @ignore_existing: boolean flag; if set to 1, UBI will not send notifications
+ * 		     about ADDing existing volumes
+ *
+ * The function @nb.notifier_call will be called when volume is added,
+ * removed, resized or renamed. Its first parameter is &enum
+ * ubi_volume_notification_type, and the second points to the structure
+ * that contains information about "changed" volume - ubi_num and
+ * volume_id. When the notifier is called, it is safe to use all UBI API.
+ *
+ * Returns %0 on success, error code otherwise.
+ */
+int ubi_register_volume_notifier(struct notifier_block *nb,
+				int ignore_existing)
+{
+	int err;
+
+	err = blocking_notifier_chain_register(&ubi_notifiers, nb);
+	if (err != 0)
+		return err;
+	if (ignore_existing)
+		return err;
+	down_read(&ubi_notifiers.rwsem);
+
+	ubi_enum_all_volumes(UBI_VOLUME_ADDED, nb);
+	up_read(&ubi_notifiers.rwsem);
+	return err;
+}
+EXPORT_SYMBOL_GPL(ubi_register_volume_notifier);
+
+/**
+ * ubi_unregister_volume_notifier - unregister the volume notifier.
+ * @nb: pointer to the filled struct &notifier_block
+ *
+ * Returns %0 on success, error code otherwise
+ */
+int ubi_unregister_volume_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&ubi_notifiers, nb);
+}
+EXPORT_SYMBOL_GPL(ubi_unregister_volume_notifier);
Index: linux-2.6/drivers/mtd/ubi/ubi.h
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/ubi.h
+++ linux-2.6/drivers/mtd/ubi/ubi.h
@@ -38,6 +38,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/ubi.h>
+#include <linux/notifier.h>
 
 #include "ubi-media.h"
 #include "scan.h"
@@ -457,6 +458,7 @@ extern const struct file_operations ubi_
 extern const struct file_operations ubi_vol_cdev_operations;
 extern struct class *ubi_class;
 extern struct mutex ubi_devices_mutex;
+extern struct blocking_notifier_head ubi_notifiers;
 
 /* vtbl.c */
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
@@ -550,6 +552,41 @@ void ubi_put_device(struct ubi_device *u
 struct ubi_device *ubi_get_by_major(int major);
 int ubi_major2num(int major);
 
+int ubi_enum_volumes(enum ubi_volume_notification_type t,
+		     struct ubi_device *ubi, struct notifier_block *nb);
+int ubi_enum_all_volumes(enum ubi_volume_notification_type t,
+			 struct notifier_block *nb);
+
+static inline char *ubi_notification(enum ubi_volume_notification_type t)
+{
+	static char *nstr[] = {
+	 [UBI_VOLUME_ADDED]	= "Added",
+	 [UBI_VOLUME_DELETED]	= "Deleted",
+	 [UBI_VOLUME_RENAMED]	= "Renamed",
+	 [UBI_VOLUME_CHANGED]	= "Changed",
+	};
+	return nstr[t];
+}
+/**
+ * ubi_volume_notify - notify all registered clients about volume changes.
+ * @t: notification type
+ * @ubi_num: device number
+ * @volume_name: name of created/removed/changed volume
+ */
+static inline int ubi_volume_notify(enum ubi_volume_notification_type t,
+				    int ubi_num, int volume_id)
+{
+       struct ubi_volume_notification nt;
+
+       nt.ubi_num = ubi_num;
+       nt.vol_id = volume_id;
+       dbg_gen("%s: %s volume id %d on device %d\n",
+		       __func__,
+		       ubi_notification(t),
+		       volume_id,
+		       ubi_num);
+       return blocking_notifier_call_chain(&ubi_notifiers, t, &nt);
+}
 /*
  * ubi_rb_for_each_entry - walk an RB-tree.
  * @rb: a pointer to type 'struct rb_node' to to use as a loop counter
Index: linux-2.6/drivers/mtd/ubi/vmt.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/vmt.c
+++ linux-2.6/drivers/mtd/ubi/vmt.c
@@ -358,6 +358,7 @@ int ubi_create_volume(struct ubi_device
 	ubi->vol_count += 1;
 	spin_unlock(&ubi->volumes_lock);
 
+	ubi_volume_notify(UBI_VOLUME_ADDED, ubi->ubi_num, vol->vol_id);
 	err = paranoid_check_volumes(ubi);
 	return err;
 
@@ -419,6 +420,8 @@ int ubi_remove_volume(struct ubi_volume_
 	if (ubi->ro_mode)
 		return -EROFS;
 
+	ubi_volume_notify(UBI_VOLUME_DELETED, ubi->ubi_num, vol_id);
+
 	spin_lock(&ubi->volumes_lock);
 	if (vol->ref_count > 1) {
 		/*
@@ -475,6 +478,7 @@ out_err:
 	ubi->volumes[vol_id] = vol;
 out_unlock:
 	spin_unlock(&ubi->volumes_lock);
+	ubi_volume_notify(UBI_VOLUME_ADDED, ubi->ubi_num, vol_id);
 	return err;
 }
 
@@ -587,6 +591,7 @@ int ubi_resize_volume(struct ubi_volume_
 			(long long)vol->used_ebs * vol->usable_leb_size;
 	}
 
+	ubi_volume_notify(UBI_VOLUME_CHANGED, ubi->ubi_num, vol->vol_id);
 	err = paranoid_check_volumes(ubi);
 	return err;
 
@@ -632,6 +637,8 @@ int ubi_rename_volumes(struct ubi_device
 			vol->name_len = re->new_name_len;
 			memcpy(vol->name, re->new_name, re->new_name_len + 1);
 			spin_unlock(&ubi->volumes_lock);
+			ubi_volume_notify(UBI_VOLUME_RENAMED,
+					  ubi->ubi_num, vol->vol_id);
 		}
 	}
 
Index: linux-2.6/include/linux/mtd/ubi.h
===================================================================
--- linux-2.6.orig/include/linux/mtd/ubi.h
+++ linux-2.6/include/linux/mtd/ubi.h
@@ -184,4 +184,40 @@ static inline int ubi_change(struct ubi_
 	return ubi_leb_change(desc, lnum, buf, len, UBI_UNKNOWN);
 }
 
+int ubi_register_volume_notifier(struct notifier_block *nb,
+				 int ignore_existing);
+int ubi_unregister_volume_notifier(struct notifier_block *nb);
+
+/**
+ * struct ubi_volume_notification - information about changed volume.
+ * @ubi_num: UBI device number where the changed volume persists
+ * @vol_id: changed volume id
+ *
+ * Each notification about changed volume takes two parameters - first one
+ * is of type &enum ubi_volume_notification_type and indicates the type of
+ * volume change, and the second parameter is a pointer to the &struct
+ * ubi_volume_notification and describes the subject of change.
+ */
+struct ubi_volume_notification {
+	int ubi_num;
+	int vol_id;
+};
+
+/**
+ * enum ubi_volume_notification_type - type of volume_change.
+ * @UBI_VOLUME_ADDED: volume has been added
+ * @UBI_VOLUME_DELETED: volume has been deleted
+ * @UBI_VOLUME_CHANGED: volume size has been changed
+ * @UBI_VOLUME_RENAMED: volume name has been changed
+ *
+ * Varialble of this type is passed as the first parameter to the notification
+ * function.
+ */
+enum ubi_volume_notification_type {
+	UBI_VOLUME_ADDED,
+	UBI_VOLUME_DELETED,
+	UBI_VOLUME_CHANGED,
+	UBI_VOLUME_RENAMED,
+};
+
 #endif /* !__LINUX_UBI_H__ */
