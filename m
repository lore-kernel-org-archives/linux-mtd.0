Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJ0Mk-0007Dm-Vb
 for linux-mtd@lists.infradead.org; Wed, 04 Feb 2015 13:51:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] UBI: Use static class and attribute groups
Date: Wed,  4 Feb 2015 14:51:11 +0100
Message-Id: <1423057871-9928-1-git-send-email-tiwai@suse.de>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch cleans up the manual device_create_file() or
class_create_file() calls by replacing with static attribute groups.
It simplifies the code and also avoids the possible races between the
device/class registration and sysfs creations.

For the simplification, also make ubi_class a static instance with
initializers, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/mtd/ubi/build.c | 103 +++++++++++++++++-------------------------------
 drivers/mtd/ubi/ubi.h   |   2 +-
 drivers/mtd/ubi/vmt.c   |  95 ++++++++++----------------------------------
 3 files changed, 59 insertions(+), 141 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 3405be46ebe9..006f9aee292b 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -83,7 +83,7 @@ static struct mtd_dev_param __initdata mtd_dev_param[UBI_MAX_DEVICES];
 static bool fm_autoconvert;
 #endif
 /* Root UBI "class" object (corresponds to '/<sysfs>/class/ubi/') */
-struct class *ubi_class;
+struct class ubi_class;
 
 /* Slab cache for wear-leveling entries */
 struct kmem_cache *ubi_wl_entry_slab;
@@ -112,8 +112,10 @@ static ssize_t ubi_version_show(struct class *class,
 }
 
 /* UBI version attribute ('/<sysfs>/class/ubi/version') */
-static struct class_attribute ubi_version =
-	__ATTR(version, S_IRUGO, ubi_version_show, NULL);
+static struct class_attribute ubi_class_attrs[] = {
+	__ATTR(version, S_IRUGO, ubi_version_show, NULL),
+	{}
+};
 
 static ssize_t dev_attribute_show(struct device *dev,
 				  struct device_attribute *attr, char *buf);
@@ -385,6 +387,23 @@ static ssize_t dev_attribute_show(struct device *dev,
 	return ret;
 }
 
+static struct attribute *ubi_dev_attrs[] = {
+	&dev_eraseblock_size.attr,
+	&dev_avail_eraseblocks.attr,
+	&dev_total_eraseblocks.attr,
+	&dev_volumes_count.attr,
+	&dev_max_ec.attr,
+	&dev_reserved_for_bad.attr,
+	&dev_bad_peb_count.attr,
+	&dev_max_vol_count.attr,
+	&dev_min_io_size.attr,
+	&dev_bgt_enabled.attr,
+	&dev_mtd_num.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(ubi_dev);
+
 static void dev_release(struct device *dev)
 {
 	struct ubi_device *ubi = container_of(dev, struct ubi_device, dev);
@@ -407,45 +426,15 @@ static int ubi_sysfs_init(struct ubi_device *ubi, int *ref)
 
 	ubi->dev.release = dev_release;
 	ubi->dev.devt = ubi->cdev.dev;
-	ubi->dev.class = ubi_class;
+	ubi->dev.class = &ubi_class;
+	ubi->dev.groups = ubi_dev_groups,
 	dev_set_name(&ubi->dev, UBI_NAME_STR"%d", ubi->ubi_num);
 	err = device_register(&ubi->dev);
 	if (err)
 		return err;
 
 	*ref = 1;
-	err = device_create_file(&ubi->dev, &dev_eraseblock_size);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_avail_eraseblocks);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_total_eraseblocks);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_volumes_count);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_max_ec);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_reserved_for_bad);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_bad_peb_count);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_max_vol_count);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_min_io_size);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_bgt_enabled);
-	if (err)
-		return err;
-	err = device_create_file(&ubi->dev, &dev_mtd_num);
-	return err;
+	return 0;
 }
 
 /**
@@ -454,17 +443,6 @@ static int ubi_sysfs_init(struct ubi_device *ubi, int *ref)
  */
 static void ubi_sysfs_close(struct ubi_device *ubi)
 {
-	device_remove_file(&ubi->dev, &dev_mtd_num);
-	device_remove_file(&ubi->dev, &dev_bgt_enabled);
-	device_remove_file(&ubi->dev, &dev_min_io_size);
-	device_remove_file(&ubi->dev, &dev_max_vol_count);
-	device_remove_file(&ubi->dev, &dev_bad_peb_count);
-	device_remove_file(&ubi->dev, &dev_reserved_for_bad);
-	device_remove_file(&ubi->dev, &dev_max_ec);
-	device_remove_file(&ubi->dev, &dev_volumes_count);
-	device_remove_file(&ubi->dev, &dev_total_eraseblocks);
-	device_remove_file(&ubi->dev, &dev_avail_eraseblocks);
-	device_remove_file(&ubi->dev, &dev_eraseblock_size);
 	device_unregister(&ubi->dev);
 }
 
@@ -1213,6 +1191,12 @@ static struct mtd_info * __init open_mtd_device(const char *mtd_dev)
 	return mtd;
 }
 
+struct class ubi_class = {
+	.name = UBI_NAME_STR,
+	.owner = THIS_MODULE,
+	.class_attrs = ubi_class_attrs,
+};
+
 static int __init ubi_init(void)
 {
 	int err, i, k;
@@ -1228,23 +1212,14 @@ static int __init ubi_init(void)
 	}
 
 	/* Create base sysfs directory and sysfs files */
-	ubi_class = class_create(THIS_MODULE, UBI_NAME_STR);
-	if (IS_ERR(ubi_class)) {
-		err = PTR_ERR(ubi_class);
-		pr_err("UBI error: cannot create UBI class");
-		goto out;
-	}
-
-	err = class_create_file(ubi_class, &ubi_version);
-	if (err) {
-		pr_err("UBI error: cannot create sysfs file");
-		goto out_class;
-	}
+	err = class_register(&ubi_class);
+	if (err < 0)
+		return err;
 
 	err = misc_register(&ubi_ctrl_cdev);
 	if (err) {
 		pr_err("UBI error: cannot register device");
-		goto out_version;
+		goto out;
 	}
 
 	ubi_wl_entry_slab = kmem_cache_create("ubi_wl_entry_slab",
@@ -1328,11 +1303,8 @@ out_slab:
 	kmem_cache_destroy(ubi_wl_entry_slab);
 out_dev_unreg:
 	misc_deregister(&ubi_ctrl_cdev);
-out_version:
-	class_remove_file(ubi_class, &ubi_version);
-out_class:
-	class_destroy(ubi_class);
 out:
+	class_unregister(&ubi_class);
 	pr_err("UBI error: cannot initialize UBI, error %d", err);
 	return err;
 }
@@ -1353,8 +1325,7 @@ static void __exit ubi_exit(void)
 	ubi_debugfs_exit();
 	kmem_cache_destroy(ubi_wl_entry_slab);
 	misc_deregister(&ubi_ctrl_cdev);
-	class_remove_file(ubi_class, &ubi_version);
-	class_destroy(ubi_class);
+	class_unregister(&ubi_class);
 }
 module_exit(ubi_exit);
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index f80ffaba9058..59c673c60f85 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -738,7 +738,7 @@ extern struct kmem_cache *ubi_wl_entry_slab;
 extern const struct file_operations ubi_ctrl_cdev_operations;
 extern const struct file_operations ubi_cdev_operations;
 extern const struct file_operations ubi_vol_cdev_operations;
-extern struct class *ubi_class;
+extern struct class ubi_class;
 extern struct mutex ubi_devices_mutex;
 extern struct blocking_notifier_head ubi_notifiers;
 
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index ff4d97848d1c..7df0e26d1a90 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -120,6 +120,20 @@ static ssize_t vol_attribute_show(struct device *dev,
 	return ret;
 }
 
+static struct attribute *volume_dev_attrs[] = {
+	&attr_vol_reserved_ebs.attr,
+	&attr_vol_type.attr,
+	&attr_vol_name.attr,
+	&attr_vol_corrupted.attr,
+	&attr_vol_alignment.attr,
+	&attr_vol_usable_eb_size.attr,
+	&attr_vol_data_bytes.attr,
+	&attr_vol_upd_marker.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(volume_dev);
+
 /* Release method for volume devices */
 static void vol_release(struct device *dev)
 {
@@ -130,64 +144,6 @@ static void vol_release(struct device *dev)
 }
 
 /**
- * volume_sysfs_init - initialize sysfs for new volume.
- * @ubi: UBI device description object
- * @vol: volume description object
- *
- * This function returns zero in case of success and a negative error code in
- * case of failure.
- *
- * Note, this function does not free allocated resources in case of failure -
- * the caller does it. This is because this would cause release() here and the
- * caller would oops.
- */
-static int volume_sysfs_init(struct ubi_device *ubi, struct ubi_volume *vol)
-{
-	int err;
-
-	err = device_create_file(&vol->dev, &attr_vol_reserved_ebs);
-	if (err)
-		return err;
-	err = device_create_file(&vol->dev, &attr_vol_type);
-	if (err)
-		return err;
-	err = device_create_file(&vol->dev, &attr_vol_name);
-	if (err)
-		return err;
-	err = device_create_file(&vol->dev, &attr_vol_corrupted);
-	if (err)
-		return err;
-	err = device_create_file(&vol->dev, &attr_vol_alignment);
-	if (err)
-		return err;
-	err = device_create_file(&vol->dev, &attr_vol_usable_eb_size);
-	if (err)
-		return err;
-	err = device_create_file(&vol->dev, &attr_vol_data_bytes);
-	if (err)
-		return err;
-	err = device_create_file(&vol->dev, &attr_vol_upd_marker);
-	return err;
-}
-
-/**
- * volume_sysfs_close - close sysfs for a volume.
- * @vol: volume description object
- */
-static void volume_sysfs_close(struct ubi_volume *vol)
-{
-	device_remove_file(&vol->dev, &attr_vol_upd_marker);
-	device_remove_file(&vol->dev, &attr_vol_data_bytes);
-	device_remove_file(&vol->dev, &attr_vol_usable_eb_size);
-	device_remove_file(&vol->dev, &attr_vol_alignment);
-	device_remove_file(&vol->dev, &attr_vol_corrupted);
-	device_remove_file(&vol->dev, &attr_vol_name);
-	device_remove_file(&vol->dev, &attr_vol_type);
-	device_remove_file(&vol->dev, &attr_vol_reserved_ebs);
-	device_unregister(&vol->dev);
-}
-
-/**
  * ubi_create_volume - create volume.
  * @ubi: UBI device description object
  * @req: volume creation request
@@ -323,7 +279,8 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
-	vol->dev.class = ubi_class;
+	vol->dev.class = &ubi_class;
+	vol->dev.groups = volume_dev_groups;
 
 	dev_set_name(&vol->dev, "%s_%d", ubi->ubi_name, vol->vol_id);
 	err = device_register(&vol->dev);
@@ -332,10 +289,6 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 		goto out_cdev;
 	}
 
-	err = volume_sysfs_init(ubi, vol);
-	if (err)
-		goto out_sysfs;
-
 	/* Fill volume table record */
 	memset(&vtbl_rec, 0, sizeof(struct ubi_vtbl_record));
 	vtbl_rec.reserved_pebs = cpu_to_be32(vol->reserved_pebs);
@@ -372,7 +325,7 @@ out_sysfs:
 	 */
 	do_free = 0;
 	get_device(&vol->dev);
-	volume_sysfs_close(vol);
+	device_unregister(&vol->dev);
 out_cdev:
 	cdev_del(&vol->cdev);
 out_mapping:
@@ -440,7 +393,7 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 	}
 
 	cdev_del(&vol->cdev);
-	volume_sysfs_close(vol);
+	device_unregister(&vol->dev);
 
 	spin_lock(&ubi->volumes_lock);
 	ubi->rsvd_pebs -= reserved_pebs;
@@ -653,19 +606,13 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
-	vol->dev.class = ubi_class;
+	vol->dev.class = &ubi_class;
+	vol->dev.groups = volume_dev_groups;
 	dev_set_name(&vol->dev, "%s_%d", ubi->ubi_name, vol->vol_id);
 	err = device_register(&vol->dev);
 	if (err)
 		goto out_cdev;
 
-	err = volume_sysfs_init(ubi, vol);
-	if (err) {
-		cdev_del(&vol->cdev);
-		volume_sysfs_close(vol);
-		return err;
-	}
-
 	self_check_volumes(ubi);
 	return err;
 
@@ -688,7 +635,7 @@ void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 
 	ubi->volumes[vol->vol_id] = NULL;
 	cdev_del(&vol->cdev);
-	volume_sysfs_close(vol);
+	device_unregister(&vol->dev);
 }
 
 /**
-- 
2.2.2
