Received: from mail-ew0-f13.google.com ([209.85.219.13])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCBOm-0003Q3-3k
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 11:14:06 +0000
Received: by mail-ew0-f13.google.com with SMTP id 6so3075767ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Dec 2008 03:14:03 -0800 (PST)
Subject: [PATCH] [UBI] 1/5 - UBI notifications, take two
From: dmitry pervushin <dpervushin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 15 Dec 2008 14:13:55 +0300
Message-Id: <1229339635.7900.21.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: dpervushin@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Implement notifications about UBI volume changes

Signed-off-by: dmitry pervushin <dimka@embeddedalley.com>

---
 drivers/mtd/ubi/build.c |   39 +++++++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/cdev.c  |    2 ++
 drivers/mtd/ubi/kapi.c  |   25 +++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h   |   35 +++++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/vmt.c   |    8 ++++++++
 include/linux/mtd/ubi.h |   16 ++++++++++++++++
 6 files changed, 125 insertions(+)

Index: ubifs-2.6/drivers/mtd/ubi/build.c
===================================================================
--- ubifs-2.6.orig/drivers/mtd/ubi/build.c
+++ ubifs-2.6/drivers/mtd/ubi/build.c
@@ -122,6 +122,51 @@ static struct device_attribute dev_mtd_n
 	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
 
 /**
+ * ubi_enum_volumes - enumerate all existing volumes and send notification
+ *
+ * @t: notification type to send
+ * @ubi: UBI device number
+ * @nb: notifier to be called
+ *
+ * Walk on volume list that are created on device @ubi, or if @ubi < 0, on all
+ * available UBI devices. For each volume, send the notification - either
+ * system-wide if @nb is NULL, or only to the registered @nb
+ *
+ * Returns number of volumes processed
+ */
+int ubi_enum_volumes(enum ubi_volume_notification_type t, int ubi,
+		struct notifier_block *nb)
+{
+	int ubi_num, i, count = 0;
+	struct ubi_device *ubi_dev;
+	struct ubi_volume_notification nt;
+
+	ubi_num = ubi < 0 ? 0 : ubi;
+	spin_lock(&ubi_devices_lock);
+	do {
+		nt.ubi_num = ubi_num++;
+		ubi_dev = ubi_devices[nt.ubi_num];
+		if (!ubi_dev)
+			continue;
+		spin_lock(&ubi_dev->volumes_lock);
+		for (i = 0; i < ubi_dev->vtbl_slots; i++) {
+			if (!ubi_dev->volumes[i])
+				continue;
+			nt.vol_id = ubi_dev->volumes[i]->vol_id;
+			if (nb)
+				nb->notifier_call(nb, t, &nt);
+			else
+				blocking_notifier_call_chain(&ubi_notifiers,
+					t, &nt);
+			count++;
+		}
+		spin_unlock(&ubi_dev->volumes_lock);
+	} while (ubi < 0 && ubi_num < UBI_MAX_DEVICES);
+	spin_unlock(&ubi_devices_lock);
+	return count;
+}
+
+/**
  * ubi_get_device - get UBI device.
  * @ubi_num: UBI device number
  *
@@ -876,6 +921,7 @@ int ubi_attach_mtd_dev(struct mtd_info *
 	wake_up_process(ubi->bgt_thread);
 
 	ubi_devices[ubi_num] = ubi;
+	ubi_enum_volumes(UBI_VOLUME_ADDED, ubi_num, NULL);
 	return ubi_num;
 
 out_uif:
@@ -937,6 +983,8 @@ int ubi_detach_mtd_dev(int ubi_num, int
 	ubi_devices[ubi_num] = NULL;
 	spin_unlock(&ubi_devices_lock);
 
+	ubi_enum_volumes(UBI_VOLUME_DELETED, ubi_num, NULL);
+
 	ubi_assert(ubi_num == ubi->ubi_num);
 	dbg_msg("detaching mtd%d from ubi%d", ubi->mtd->index, ubi_num);
 
Index: ubifs-2.6/drivers/mtd/ubi/cdev.c
===================================================================
--- ubifs-2.6.orig/drivers/mtd/ubi/cdev.c
+++ ubifs-2.6/drivers/mtd/ubi/cdev.c
@@ -396,6 +396,8 @@ static ssize_t vol_cdev_write(struct fil
 		}
 		vol->checked = 1;
 		ubi_gluebi_updated(vol);
+		ubi_volume_notify(UBI_VOLUME_CHANGED,
+				ubi->ubi_num, vol->vol_id);
 		revoke_exclusive(desc, UBI_READWRITE);
 	}
 
Index: ubifs-2.6/drivers/mtd/ubi/kapi.c
===================================================================
--- ubifs-2.6.orig/drivers/mtd/ubi/kapi.c
+++ ubifs-2.6/drivers/mtd/ubi/kapi.c
@@ -656,3 +656,52 @@ int ubi_sync(int ubi_num)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ubi_sync);
+
+BLOCKING_NOTIFIER_HEAD(ubi_notifiers);
+
+/**
+ * ubi_register_volume_notifier - register the volume notification function
+ *
+ * @nb: pointer to the filled struct &notifier_block
+ * @ignore_existing: boolean flag; if set to 1, UBI will not send
+ * 	notifications about ADDing existing volumes
+ *
+ * The function @nb.notifier_call will be called when volume is added,
+ * removed, resized or renamed. Its first parameter is &enum
+ * ubi_volume_notification_type, and the second points to the structure
+ * that contains information about "changed" volume - ubi_device_num and
+ * volume_id. When the notifier is called, it is safe to use all UBI API.
+ *
+ * Returns %0 on success, error code otherwise
+ */
+int ubi_register_volume_notifier(struct notifier_block *nb,
+				int ignore_existing)
+{
+	int r;
+
+	r = blocking_notifier_chain_register(&ubi_notifiers, nb);
+	if (!r)
+		goto out;
+	if (ignore_existing)
+		goto out;
+	down_read(&ubi_notifiers.rwsem);
+	ubi_enum_volumes(UBI_VOLUME_ADDED, -1, nb);
+	up_read(&ubi_notifiers.rwsem);
+out:
+	return r;
+}
+EXPORT_SYMBOL_GPL(ubi_register_volume_notifier);
+
+/**
+ * ubi_unregister_volume_notifier - unregister the volume notifier registered
+ * by ubi_register_volume_notifier
+ *
+ * @nb: pointer to the filled struct &notifier_block
+ *
+ * Returns %0 on success, error code otherwise
+ */
+int ubi_unregister_volume_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&ubi_notifiers, nb);
+}
+EXPORT_SYMBOL_GPL(ubi_unregister_volume_notifier);
Index: ubifs-2.6/drivers/mtd/ubi/ubi.h
===================================================================
--- ubifs-2.6.orig/drivers/mtd/ubi/ubi.h
+++ ubifs-2.6/drivers/mtd/ubi/ubi.h
@@ -38,6 +38,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/ubi.h>
+#include <linux/notifier.h>
 
 #include "ubi-media.h"
 #include "scan.h"
@@ -447,6 +448,7 @@ extern struct file_operations ubi_cdev_o
 extern struct file_operations ubi_vol_cdev_operations;
 extern struct class *ubi_class;
 extern struct mutex ubi_devices_mutex;
+extern struct blocking_notifier_head ubi_notifiers;
 
 /* vtbl.c */
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
@@ -539,7 +541,40 @@ struct ubi_device *ubi_get_device(int ub
 void ubi_put_device(struct ubi_device *ubi);
 struct ubi_device *ubi_get_by_major(int major);
 int ubi_major2num(int major);
+int ubi_enum_volumes(enum ubi_volume_notification_type t,
+		int ubi_num, struct notifier_block *nb);
 
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
+ * ubi_volume_notify - notify all registered clients about volume changes
+ *
+ * @t: notification type
+ * @ubi_device: device number
+ * @volume_name: name of created/removed/changed volume
+ */
+static inline int ubi_volume_notify(enum ubi_volume_notification_type t,
+		int ubi_num, int volume_id)
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
Index: ubifs-2.6/drivers/mtd/ubi/vmt.c
===================================================================
--- ubifs-2.6.orig/drivers/mtd/ubi/vmt.c
+++ ubifs-2.6/drivers/mtd/ubi/vmt.c
@@ -361,6 +361,7 @@ int ubi_create_volume(struct ubi_device
 	ubi->vol_count += 1;
 	spin_unlock(&ubi->volumes_lock);
 
+	ubi_volume_notify(UBI_VOLUME_ADDED, ubi->ubi_num, vol->vol_id);
 	err = paranoid_check_volumes(ubi);
 	return err;
 
@@ -431,6 +432,7 @@ int ubi_remove_volume(struct ubi_volume_
 		err = -EBUSY;
 		goto out_unlock;
 	}
+	ubi_volume_notify(UBI_VOLUME_DELETED, ubi->ubi_num, vol->vol_id);
 	ubi->volumes[vol_id] = NULL;
 	spin_unlock(&ubi->volumes_lock);
 
@@ -473,6 +475,7 @@ int ubi_remove_volume(struct ubi_volume_
 	return err;
 
 out_err:
+	ubi_volume_notify(UBI_VOLUME_ADDED, ubi->ubi_num, vol->vol_id);
 	ubi_err("cannot remove volume %d, error %d", vol_id, err);
 	spin_lock(&ubi->volumes_lock);
 	ubi->volumes[vol_id] = vol;
@@ -590,6 +593,7 @@ int ubi_resize_volume(struct ubi_volume_
 			(long long)vol->used_ebs * vol->usable_leb_size;
 	}
 
+	ubi_volume_notify(UBI_VOLUME_CHANGED, ubi->ubi_num, vol->vol_id);
 	err = paranoid_check_volumes(ubi);
 	return err;
 
@@ -635,6 +639,8 @@ int ubi_rename_volumes(struct ubi_device
 			vol->name_len = re->new_name_len;
 			memcpy(vol->name, re->new_name, re->new_name_len + 1);
 			spin_unlock(&ubi->volumes_lock);
+			ubi_volume_notify(UBI_VOLUME_RENAMED,
+				ubi->ubi_num, vol->vol_id);
 		}
 	}
 
Index: ubifs-2.6/include/linux/mtd/ubi.h
===================================================================
--- ubifs-2.6.orig/include/linux/mtd/ubi.h
+++ ubifs-2.6/include/linux/mtd/ubi.h
@@ -184,4 +184,20 @@ static inline int ubi_change(struct ubi_
 	return ubi_leb_change(desc, lnum, buf, len, UBI_UNKNOWN);
 }
 
+int ubi_register_volume_notifier(struct notifier_block *nb,
+		int ignore_existing);
+int ubi_unregister_volume_notifier(struct notifier_block *nb);
+
+struct ubi_volume_notification {
+	int ubi_num;
+	int vol_id;
+};
+
+enum ubi_volume_notification_type {
+	UBI_VOLUME_ADDED,
+	UBI_VOLUME_DELETED,
+	UBI_VOLUME_CHANGED,
+	UBI_VOLUME_RENAMED,
+};
+
 #endif /* !__LINUX_UBI_H__ */
