Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LxcPb-0006xk-Rw
	for linux-mtd@lists.infradead.org; Sat, 25 Apr 2009 07:35:07 +0000
Subject: Re: [PATCH, UBI] ubi notifications
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@embeddedalley.com
In-Reply-To: <1240609183.32546.19.camel@hp.diimka.lan>
References: <1240609183.32546.19.camel@hp.diimka.lan>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 25 Apr 2009 10:34:44 +0300
Message-Id: <1240644884.22645.90.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-04-25 at 01:39 +0400, dmitry pervushin wrote:
> Hi all,
> 
> UBI volume notifications is intended to create the API to get clients
> notified about volume creation/deletion, renaming and changing(actually,
> resizing). A client can subscribe to these notifications using
> ubi_volume_register and cancel the subsription using
> ubi_volume_unregister. When UBI volume change occurs, the atomic
> notifier will be called. Client also can request "added" event on all
> volumes that existed before client subscribed to the notifications.
> 
> Using notifications instead of calling functions ubi_gluebi_xxx allows
> MTD emulation layer to be more flexible; say, now is it possible to
> build it as a module and load/unload it on demand.
> 
> Thanks Artem Bityutskiy for reviewing the patch and many very valuable
> comments.
> 
> Signed-off-by: dmitry pervushin <dpervushin@embeddedalley.com>

Hi,

thanks for the patch. Is it possible to submit it together
with a user? E.g., AFAIR you separated out gluebi, could
this be also submitted? I would be much happier to see a
new interface functions + a user, not just the interface
functions alone.

I've inlined a slightly midified version of your patch
for you, because I found it easier to fix minor things
rather than request you about this.

I've changed the following:

1. Moved definitions in include/linux/mtd/ubi.h to different
   positions.
2. Removed '/**' for enums, because last time I tried kerneldoc
   it did not accept enums.
3. Made your ubi_volume_notification_type enums anonymous, because named
   enums make few sense in C - there is no strict type checking for them
   anyway, and they just hurt readability.
4. Renamed "t" to "ntype".
5. Removed:
       dbg_gen("%s: %s volume id %d on device %d\n",
                i       __func__,
                       ubi_notification(t),
                       volume_id,
                       ubi_num);
   If you want it, look how dbg_gen() is defined, and add proper print.

6. Since the print was the only user of 'ubi_notification()', I killed
   that too. I did not like it because it is inline, with static
   local variable as well. If you want it, please re-add it. Make it
   non-inline, make it debug-only, because it is used only from
   gen_dbg().

Some other minor changes in comments.

Anyway, I am going to be unavailable next week. Please, try to send
both API add and the user. Also, there is a note below.

> ---
>  drivers/mtd/ubi/build.c |   73 ++++++++++++++++++++++++++++++++++++++++++++++--
>  drivers/mtd/ubi/cdev.c  |    2 +
>  drivers/mtd/ubi/kapi.c  |   46 ++++++++++++++++++++++++++++++
>  drivers/mtd/ubi/ubi.h   |   37 ++++++++++++++++++++++++
>  drivers/mtd/ubi/vmt.c   |    7 ++++
>  include/linux/mtd/ubi.h |   36 +++++++++++++++++++++++
>  6 files changed, 198 insertions(+), 3 deletions(-)
> 
> Index: linux-2.6/drivers/mtd/ubi/build.c
> ===================================================================
> --- linux-2.6.orig/drivers/mtd/ubi/build.c
> +++ linux-2.6/drivers/mtd/ubi/build.c
> @@ -122,6 +122,69 @@ static struct device_attribute dev_mtd_n
>  	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
>  
>  /**
> + * ubi_enum_volumes - enumerate volumes on device and send notification.
> + * @t: notification type to send
> + * @ubi: UBI device
> + * @nb: notifier to be called, or %NULL to send to system-wide notification
> + *
> + * Walk on the list of volumes that are created on device @ubi and send the
> + * notification specified by @t.
> + *
> + * Returns number of volumes processed.
> + */
> +int ubi_enum_volumes(enum ubi_volume_notification_type t,
> +		     struct ubi_device *ubi, struct notifier_block *nb)
> +{
> +	int i, count = 0;
> +	struct ubi_volume_notification nt;
> +
> +	nt.ubi_num = ubi->ubi_num;
> +
> +	spin_lock(&ubi->volumes_lock);
> +	for (i = 0; i < ubi->vtbl_slots; i++) {
> +		if (!ubi->volumes[i])
> +			continue;
> +		nt.vol_id = ubi->volumes[i]->vol_id;
> +		spin_unlock(&ubi->volumes_lock);

What prevents the volume to be removed at this point? Shouldn't
you get a volume reference? Like in 'ubi_open_volume()'? Or
like in 'vol_attribute_show()' ?

        get_device(&vol->dev);
        vol->ref_count += 1;

> +		if (nb)
> +			nb->notifier_call(nb, t, &nt);
> +		else
> +			blocking_notifier_call_chain(&ubi_notifiers,
> +						     t, &nt);
> +		count++;
And of course then release the reference here...
> +		spin_lock(&ubi->volumes_lock);
> +	}
> +	spin_unlock(&ubi->volumes_lock);
> +	return count;
> +}

> +int ubi_enum_all_volumes(enum ubi_volume_notification_type t,
> +			 struct notifier_block *nb)
> +{
> +	int n;
> +	struct ubi_device *ubi;
> +	int count = 0;
> +
> +	spin_lock(&ubi_devices_lock);
> +	for (n = 0; n < UBI_MAX_DEVICES; n++) {
> +		ubi = ubi_devices[n];
> +		spin_unlock(&ubi_devices_lock);
You got the pointer. You dropped the lock. Now you are
preempted and whole UBI device is removed (e.g., by
'ubi_detach_mtd_dev()' ioctl). Then what happens?

Shouldn't you take a reference to the device before releasing
the lock? Something similar to what 'ubi_get_device()' does:

ubi->ref_count += 1;
get_device(&ubi->dev);

> +		if (ubi)
> +			count += ubi_enum_volumes(t, ubi, nb);
> +		spin_lock(&ubi_devices_lock);
And release the reference here...

> +	}
> +	spin_unlock(&ubi_devices_lock);
> +	return count;
> +}

Your patch with my nicifications. I did not have time to look
nicify everything, though, just some stuff.

From: Dmitry Pervushin <dpervushin@embeddedalley.com>
Subject: [PATCH] UBI: add notifiers notifications

UBI volume notifications are intended to create the API to get clients
notified about volume creation/deletion, renaming and changing(actually,
resizing). A client can subscribe to these notifications using
ubi_volume_register and cancel the subscription using
ubi_volume_unregister. When UBI volume change occurs, the atomic
notifier will be called. Client also can request "added" event on all
volumes that existed before client subscribed to the notifications.

Using notifications instead of calling functions ubi_gluebi_xxx allows
MTD emulation layer to be more flexible; say, now is it possible to
build it as a module and load/unload it on demand.

Thanks Artem Bityutskiy for reviewing the patch and many very valuable
comments.

Signed-off-by: Dmitry Pervushin <dpervushin@embeddedalley.com>
---
 drivers/mtd/ubi/build.c |   71 +++++++++++++++++++++++++++++++++++++++++++++--
 drivers/mtd/ubi/cdev.c  |    2 +
 drivers/mtd/ubi/kapi.c  |   46 ++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h   |   24 ++++++++++++++++
 drivers/mtd/ubi/vmt.c   |    7 ++++
 include/linux/mtd/ubi.h |   36 ++++++++++++++++++++++++
 6 files changed, 183 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 4048db8..6607204 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -122,6 +122,67 @@ static struct device_attribute dev_mtd_num =
 	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
 
 /**
+ * ubi_enum_volumes - "enumerate" volumes.
+ * @ntype: notification type to send (%UBI_VOLUME_ADDED, etc)
+ * @ubi: UBI device description object
+ * @nb: notifier to be called or %NULL to send to system-wide notification
+ *
+ * This function walks all volumes of UBI device @ubi and sends the
+ * notification specified by @ntype. Returns number of sent notifications.
+ */
+int ubi_enum_volumes(int ntype, struct ubi_device *ubi,
+		     struct notifier_block *nb)
+{
+	struct ubi_volume_notification nt;
+	int i, count = 0;
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
+			nb->notifier_call(nb, ntype, &nt);
+		else
+			blocking_notifier_call_chain(&ubi_notifiers,
+						     ntype, &nt);
+		count++;
+		spin_lock(&ubi->volumes_lock);
+	}
+	spin_unlock(&ubi->volumes_lock);
+
+	return count;
+}
+
+/**
+ * ubi_enum_all_volumes - enumerate all existing volumes and send notification.
+ * @ntype: notification type to send (%UBI_VOLUME_ADDED, etc)
+ * @nb: notifier to be called, or %NULL to send to system-wide notification
+ *
+ * This function walks all UBI devices and all volumes on the device, and sends
+ * the notification specified by @ntype. Returns number of sent notifications.
+ */
+int ubi_enum_all_volumes(int ntype, struct notifier_block *nb)
+{
+	struct ubi_device *ubi;
+	int i, count = 0;
+
+	spin_lock(&ubi_devices_lock);
+	for (i = 0; i < UBI_MAX_DEVICES; i++) {
+		ubi = ubi_devices[i];
+		spin_unlock(&ubi_devices_lock);
+		if (ubi)
+			count += ubi_enum_volumes(ntype, ubi, nb);
+		spin_lock(&ubi_devices_lock);
+	}
+	spin_unlock(&ubi_devices_lock);
+	return count;
+}
+
+/**
  * ubi_get_device - get UBI device.
  * @ubi_num: UBI device number
  *
@@ -877,6 +938,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	wake_up_process(ubi->bgt_thread);
 
 	ubi_devices[ubi_num] = ubi;
+	ubi_enum_volumes(UBI_VOLUME_ADDED, ubi, NULL);
 	return ubi_num;
 
 out_uif:
@@ -921,14 +983,17 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 
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
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f8e0f68..b7541f6 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -394,6 +394,8 @@ static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
 		}
 		vol->checked = 1;
 		ubi_gluebi_updated(vol);
+		ubi_volume_notify(UBI_VOLUME_CHANGED,
+				ubi->ubi_num, vol->vol_id);
 		revoke_exclusive(desc, UBI_READWRITE);
 	}
 
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index 4abbe57..db247e7 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
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
+				 int ignore_existing)
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
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index c055511..983bee1 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -38,6 +38,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/ubi.h>
+#include <linux/notifier.h>
 
 #include "ubi-media.h"
 #include "scan.h"
@@ -457,6 +458,7 @@ extern const struct file_operations ubi_cdev_operations;
 extern const struct file_operations ubi_vol_cdev_operations;
 extern struct class *ubi_class;
 extern struct mutex ubi_devices_mutex;
+extern struct blocking_notifier_head ubi_notifiers;
 
 /* vtbl.c */
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
@@ -549,6 +551,9 @@ struct ubi_device *ubi_get_device(int ubi_num);
 void ubi_put_device(struct ubi_device *ubi);
 struct ubi_device *ubi_get_by_major(int major);
 int ubi_major2num(int major);
+int ubi_enum_volumes(int ntype, struct ubi_device *ubi,
+		     struct notifier_block *nb);
+int ubi_enum_all_volumes(int ntype, struct notifier_block *nb);
 
 /*
  * ubi_rb_for_each_entry - walk an RB-tree.
@@ -564,6 +569,25 @@ int ubi_major2num(int major);
 	     rb = rb_next(rb), pos = container_of(rb, typeof(*pos), member))
 
 /**
+ * ubi_volume_notify - notify all registered clients about volume changes.
+ * @ntype: notification type to send (%UBI_VOLUME_ADDED, etc)
+ * @ubi_num: UBI device number
+ * @vol_id: ID of the created/removed/changed volume
+ *
+ * This is a helper function which notifies all subscribers about a volume
+ * change event. Returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+static inline int ubi_volume_notify(int ntype, int ubi_num, int vol_id)
+{
+       struct ubi_volume_notification nt;
+
+       nt.ubi_num = ubi_num;
+       nt.vol_id = vol_id;
+       return blocking_notifier_call_chain(&ubi_notifiers, ntype, &nt);
+}
+
+/**
  * ubi_zalloc_vid_hdr - allocate a volume identifier header object.
  * @ubi: UBI device description object
  * @gfp_flags: GFP flags to allocate with
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index df54835..faf8d09 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -358,6 +358,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	ubi->vol_count += 1;
 	spin_unlock(&ubi->volumes_lock);
 
+	ubi_volume_notify(UBI_VOLUME_ADDED, ubi->ubi_num, vol->vol_id);
 	err = paranoid_check_volumes(ubi);
 	return err;
 
@@ -419,6 +420,8 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
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
 
@@ -587,6 +591,7 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 			(long long)vol->used_ebs * vol->usable_leb_size;
 	}
 
+	ubi_volume_notify(UBI_VOLUME_CHANGED, ubi->ubi_num, vol->vol_id);
 	err = paranoid_check_volumes(ubi);
 	return err;
 
@@ -632,6 +637,8 @@ int ubi_rename_volumes(struct ubi_device *ubi, struct list_head *rename_list)
 			vol->name_len = re->new_name_len;
 			memcpy(vol->name, re->new_name, re->new_name_len + 1);
 			spin_unlock(&ubi->volumes_lock);
+			ubi_volume_notify(UBI_VOLUME_RENAMED,
+					  ubi->ubi_num, vol->vol_id);
 		}
 	}
 
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 6316faf..83e1eef 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -132,6 +132,38 @@ struct ubi_device_info {
 	dev_t cdev;
 };
 
+/*
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
+/*
+ * enum - type of volume_change.
+ * @UBI_VOLUME_ADDED: volume has been added
+ * @UBI_VOLUME_DELETED: volume has been deleted
+ * @UBI_VOLUME_CHANGED: volume size has been changed
+ * @UBI_VOLUME_RENAMED: volume name has been changed
+ *
+ * Variable of this type is passed as the first parameter to the notification
+ * function.
+ */
+enum {
+	UBI_VOLUME_ADDED,
+	UBI_VOLUME_DELETED,
+	UBI_VOLUME_CHANGED,
+	UBI_VOLUME_RENAMED,
+};
+
 /* UBI descriptor given to users when they open UBI volumes */
 struct ubi_volume_desc;
 
@@ -141,6 +173,10 @@ void ubi_get_volume_info(struct ubi_volume_desc *desc,
 struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode);
 struct ubi_volume_desc *ubi_open_volume_nm(int ubi_num, const char *name,
 					   int mode);
+int ubi_register_volume_notifier(struct notifier_block *nb,
+				 int ignore_existing);
+int ubi_unregister_volume_notifier(struct notifier_block *nb);
+
 void ubi_close_volume(struct ubi_volume_desc *desc);
 int ubi_leb_read(struct ubi_volume_desc *desc, int lnum, char *buf, int offset,
 		 int len, int check);
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
