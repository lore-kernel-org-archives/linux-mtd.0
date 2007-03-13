Received: from mtagate5.de.ibm.com ([195.212.29.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HR8ew-00018G-NW
	for linux-mtd@lists.infradead.org; Tue, 13 Mar 2007 15:11:36 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate5.de.ibm.com (8.13.8/8.13.8) with ESMTP id l2DFASkB103086
	for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2007 15:10:28 GMT
Received: from d12av03.megacenter.de.ibm.com (d12av03.megacenter.de.ibm.com
	[9.149.165.213])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.3) with
	ESMTP id l2DFASaj1798186
	for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2007 16:10:28 +0100
Received: from d12av03.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av03.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l2DFARVr017660
	for <linux-mtd@lists.infradead.org>; Tue, 13 Mar 2007 16:10:28 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [RFC] [PATCH] UBI: rewrite of sysfs.c
Date: Tue, 13 Mar 2007 16:10:19 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703131610.20161.alexs@linux.vnet.ibm.com>
Cc: Artem.Bityutskiy@nokia.com, Thomas Gleixner <tglx@linutronix.de>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I rewrote the sysfs interface to use struct device instead of struct
class_device. This implies an interface change, as sysfs files are now
ordered in a different manner:

/sys/class/ubi/ubiX/ for device files
/sys/class/ubi/ubiX_Y/ for volumes

Before we had

/sys/class/ubi/ubiX/ for device files
/sys/class/ubi/ubiX/Y/ for volumes

Please let me know if you got any objections on this or if you have
proposals for a better implementation.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
 drivers/mtd/ubi/sysfs.c |  464 +++++++++++++++---------------------------------
 drivers/mtd/ubi/ubi.h   |    4 
 2 files changed, 152 insertions(+), 316 deletions(-)

--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/sysfs.c
+++ dedekind-ubi-2.6/drivers/mtd/ubi/sysfs.c
@@ -64,41 +64,33 @@ void ubi_sysfs_infr_close(void)
 	class_destroy(ubi_class);
 }
 
-static void dev_release(struct class_device *dev);
-static ssize_t dev_eraseblock_size_show(struct class_device *dev, char *buf);
-static ssize_t dev_avail_eraseblocks_show(struct class_device *dev, char *buf);
-static ssize_t dev_total_eraseblocks_show(struct class_device *dev, char *buf);
-static ssize_t dev_volumes_count_show(struct class_device *dev, char *buf);
-static ssize_t dev_max_ec_show(struct class_device *dev, char *buf);
-static ssize_t dev_reserved_for_bad_show(struct class_device *dev, char *buf);
-static ssize_t dev_bad_peb_count_show(struct class_device *dev, char *buf);
-static ssize_t dev_max_vol_count_show(struct class_device *dev, char *buf);
-static ssize_t dev_min_io_size_show(struct class_device *dev, char *buf);
-static ssize_t dev_bgt_enabled_show(struct class_device *dev, char *buf);
+static void dev_release(struct device *dev);
+static ssize_t dev_attribute_show(struct device *dev,
+		struct device_attribute *attr, char *buf);
 
 /*
  * Class device attributes corresponding to files in '/<sysfs>/class/ubi/ubiX'.
  */
-static struct class_device_attribute dev_eraseblock_size =
-	__ATTR(eraseblock_size, S_IRUGO, dev_eraseblock_size_show, NULL);
-static struct class_device_attribute dev_avail_eraseblocks =
-	__ATTR(avail_eraseblocks, S_IRUGO, dev_avail_eraseblocks_show, NULL);
-static struct class_device_attribute dev_total_eraseblocks =
-	__ATTR(total_eraseblocks, S_IRUGO, dev_total_eraseblocks_show, NULL);
-static struct class_device_attribute dev_volumes_count =
-	__ATTR(volumes_count, S_IRUGO, dev_volumes_count_show, NULL);
-static struct class_device_attribute dev_max_ec =
-	__ATTR(max_ec, S_IRUGO, dev_max_ec_show, NULL);
-static struct class_device_attribute dev_reserved_for_bad =
-	__ATTR(reserved_for_bad, S_IRUGO, dev_reserved_for_bad_show, NULL);
-static struct class_device_attribute dev_bad_peb_count =
-	__ATTR(bad_peb_count, S_IRUGO, dev_bad_peb_count_show, NULL);
-static struct class_device_attribute dev_max_vol_count =
-	__ATTR(max_vol_count, S_IRUGO, dev_max_vol_count_show, NULL);
-static struct class_device_attribute dev_min_io_size =
-	__ATTR(min_io_size, S_IRUGO, dev_min_io_size_show, NULL);
-static struct class_device_attribute dev_bgt_enabled =
-	__ATTR(bgt_enabled, S_IRUGO, dev_bgt_enabled_show, NULL);
+static struct device_attribute dev_eraseblock_size =
+	__ATTR(eraseblock_size, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_avail_eraseblocks =
+	__ATTR(avail_eraseblocks, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_total_eraseblocks =
+	__ATTR(total_eraseblocks, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_volumes_count =
+	__ATTR(volumes_count, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_max_ec =
+	__ATTR(max_ec, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_reserved_for_bad =
+	__ATTR(reserved_for_bad, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_bad_peb_count =
+	__ATTR(bad_peb_count, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_max_vol_count =
+	__ATTR(max_vol_count, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_min_io_size =
+	__ATTR(min_io_size, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_bgt_enabled =
+	__ATTR(bgt_enabled, S_IRUGO, dev_attribute_show, NULL);
 
 /**
  * ubi_sysfs_init - initialize sysfs for an UBI device.
@@ -115,64 +107,64 @@ int ubi_sysfs_init(struct ubi_info *ubi)
 	ubi->uif.dev.release = dev_release;
 	ubi->uif.dev.devt = MKDEV(ubi->uif.major, 0);
 	ubi->uif.dev.class = ubi_class;
-	sprintf(&ubi->uif.dev.class_id[0], UBI_STRING_NAME"%d", ubi->ubi_num);
-	err = class_device_register(&ubi->uif.dev);
+	sprintf(&ubi->uif.dev.bus_id[0], UBI_STRING_NAME"%d", ubi->ubi_num);
+	err = device_register(&ubi->uif.dev);
 	if (err)
 		goto out;
 
-	err = class_device_create_file(&ubi->uif.dev, &dev_eraseblock_size);
+	err = device_create_file(&ubi->uif.dev, &dev_eraseblock_size);
 	if (err)
 		goto out_unregister;
-	err = class_device_create_file(&ubi->uif.dev, &dev_avail_eraseblocks);
+	err = device_create_file(&ubi->uif.dev, &dev_avail_eraseblocks);
 	if (err)
 		goto out_eraseblock_size;
-	err = class_device_create_file(&ubi->uif.dev, &dev_total_eraseblocks);
+	err = device_create_file(&ubi->uif.dev, &dev_total_eraseblocks);
 	if (err)
 		goto out_avail_eraseblocks;
-	err = class_device_create_file(&ubi->uif.dev, &dev_volumes_count);
+	err = device_create_file(&ubi->uif.dev, &dev_volumes_count);
 	if (err)
 		goto out_total_eraseblocks;
-	err = class_device_create_file(&ubi->uif.dev, &dev_max_ec);
+	err = device_create_file(&ubi->uif.dev, &dev_max_ec);
 	if (err)
 		goto out_volumes_count;
-	err = class_device_create_file(&ubi->uif.dev, &dev_reserved_for_bad);
+	err = device_create_file(&ubi->uif.dev, &dev_reserved_for_bad);
 	if (err)
 		goto out_volumes_max_ec;
-	err = class_device_create_file(&ubi->uif.dev, &dev_bad_peb_count);
+	err = device_create_file(&ubi->uif.dev, &dev_bad_peb_count);
 	if (err)
 		goto out_reserved_for_bad;
-	err = class_device_create_file(&ubi->uif.dev, &dev_max_vol_count);
+	err = device_create_file(&ubi->uif.dev, &dev_max_vol_count);
 	if (err)
 		goto out_bad_peb_count;
-	err = class_device_create_file(&ubi->uif.dev, &dev_min_io_size);
+	err = device_create_file(&ubi->uif.dev, &dev_min_io_size);
 	if (err)
 		goto out_max_vol_count;
-	err = class_device_create_file(&ubi->uif.dev, &dev_bgt_enabled);
+	err = device_create_file(&ubi->uif.dev, &dev_bgt_enabled);
 	if (err)
 		goto out_min_io_size;
 
 	return 0;
 
 out_min_io_size:
-	class_device_remove_file(&ubi->uif.dev, &dev_min_io_size);
+	device_remove_file(&ubi->uif.dev, &dev_min_io_size);
 out_max_vol_count:
-	class_device_remove_file(&ubi->uif.dev, &dev_max_vol_count);
+	device_remove_file(&ubi->uif.dev, &dev_max_vol_count);
 out_bad_peb_count:
-	class_device_remove_file(&ubi->uif.dev, &dev_bad_peb_count);
+	device_remove_file(&ubi->uif.dev, &dev_bad_peb_count);
 out_reserved_for_bad:
-	class_device_remove_file(&ubi->uif.dev, &dev_reserved_for_bad);
+	device_remove_file(&ubi->uif.dev, &dev_reserved_for_bad);
 out_volumes_max_ec:
-	class_device_remove_file(&ubi->uif.dev, &dev_max_ec);
+	device_remove_file(&ubi->uif.dev, &dev_max_ec);
 out_volumes_count:
-	class_device_remove_file(&ubi->uif.dev, &dev_volumes_count);
+	device_remove_file(&ubi->uif.dev, &dev_volumes_count);
 out_total_eraseblocks:
-	class_device_remove_file(&ubi->uif.dev, &dev_total_eraseblocks);
+	device_remove_file(&ubi->uif.dev, &dev_total_eraseblocks);
 out_avail_eraseblocks:
-	class_device_remove_file(&ubi->uif.dev, &dev_avail_eraseblocks);
+	device_remove_file(&ubi->uif.dev, &dev_avail_eraseblocks);
 out_eraseblock_size:
-	class_device_remove_file(&ubi->uif.dev, &dev_eraseblock_size);
+	device_remove_file(&ubi->uif.dev, &dev_eraseblock_size);
 out_unregister:
-	class_device_unregister(&ubi->uif.dev);
+	device_unregister(&ubi->uif.dev);
 out:
 	ubi_err("failed to initialize sysfs for UBI device %d", ubi->ubi_num);
 	return err;
@@ -185,49 +177,43 @@ out:
  */
 void ubi_sysfs_close(struct ubi_info *ubi)
 {
-	class_device_remove_file(&ubi->uif.dev, &dev_bgt_enabled);
-	class_device_remove_file(&ubi->uif.dev, &dev_min_io_size);
-	class_device_remove_file(&ubi->uif.dev, &dev_max_vol_count);
-	class_device_remove_file(&ubi->uif.dev, &dev_bad_peb_count);
-	class_device_remove_file(&ubi->uif.dev, &dev_reserved_for_bad);
-	class_device_remove_file(&ubi->uif.dev, &dev_max_ec);
-	class_device_remove_file(&ubi->uif.dev, &dev_volumes_count);
-	class_device_remove_file(&ubi->uif.dev, &dev_total_eraseblocks);
-	class_device_remove_file(&ubi->uif.dev, &dev_avail_eraseblocks);
-	class_device_remove_file(&ubi->uif.dev, &dev_eraseblock_size);
-	class_device_unregister(&ubi->uif.dev);
-}
-
-static void vol_release(struct class_device *dev);
-static ssize_t vol_reserved_ebs_show(struct class_device *dev, char *buf);
-static ssize_t vol_type_show(struct class_device *dev, char *buf);
-static ssize_t vol_name_show(struct class_device *dev, char *buf);
-static ssize_t vol_corrupted_show(struct class_device *dev, char *buf);
-static ssize_t vol_alignment_show(struct class_device *dev, char *buf);
-static ssize_t vol_usable_eb_size_show(struct class_device *dev, char *buf);
-static ssize_t vol_data_bytes_show(struct class_device *dev, char *buf);
-static ssize_t vol_upd_marker_show(struct class_device *dev, char *buf);
+	device_remove_file(&ubi->uif.dev, &dev_bgt_enabled);
+	device_remove_file(&ubi->uif.dev, &dev_min_io_size);
+	device_remove_file(&ubi->uif.dev, &dev_max_vol_count);
+	device_remove_file(&ubi->uif.dev, &dev_bad_peb_count);
+	device_remove_file(&ubi->uif.dev, &dev_reserved_for_bad);
+	device_remove_file(&ubi->uif.dev, &dev_max_ec);
+	device_remove_file(&ubi->uif.dev, &dev_volumes_count);
+	device_remove_file(&ubi->uif.dev, &dev_total_eraseblocks);
+	device_remove_file(&ubi->uif.dev, &dev_avail_eraseblocks);
+	device_remove_file(&ubi->uif.dev, &dev_eraseblock_size);
+	device_unregister(&ubi->uif.dev);
+}
+
+static void vol_release(struct device *dev);
+static ssize_t vol_attribute_show(struct device *dev,
+	       struct device_attribute *attr, char *buf);
 
 /*
  * Class device attributes corresponding to files in
  * '/<sysfs>/class/ubi/ubiX/Y'.
  */
-static struct class_device_attribute vol_reserved_ebs =
-	__ATTR(reserved_ebs, S_IRUGO, vol_reserved_ebs_show, NULL);
-static struct class_device_attribute vol_type =
-	__ATTR(type, S_IRUGO, vol_type_show, NULL);
-static struct class_device_attribute vol_name =
-	__ATTR(name, S_IRUGO, vol_name_show, NULL);
-static struct class_device_attribute vol_corrupted =
-	__ATTR(corrupted, S_IRUGO, vol_corrupted_show, NULL);
-static struct class_device_attribute vol_alignment =
-	__ATTR(alignment, S_IRUGO, vol_alignment_show, NULL);
-static struct class_device_attribute vol_usable_eb_size =
-	__ATTR(usable_eb_size, S_IRUGO, vol_usable_eb_size_show, NULL);
-static struct class_device_attribute vol_data_bytes =
-	__ATTR(data_bytes, S_IRUGO, vol_data_bytes_show, NULL);
-static struct class_device_attribute vol_upd_marker =
-	__ATTR(upd_marker, S_IRUGO, vol_upd_marker_show, NULL);
+static struct device_attribute vol_reserved_ebs =
+	__ATTR(reserved_ebs, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute vol_type =
+	__ATTR(type, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute vol_name =
+	__ATTR(name, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute vol_corrupted =
+	__ATTR(corrupted, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute vol_alignment =
+	__ATTR(alignment, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute vol_usable_eb_size =
+	__ATTR(usable_eb_size, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute vol_data_bytes =
+	__ATTR(data_bytes, S_IRUGO, vol_attribute_show, NULL);
+static struct device_attribute vol_upd_marker =
+	__ATTR(upd_marker, S_IRUGO, vol_attribute_show, NULL);
 
 /**
  * ubi_sysfs_vol_init - initialize sysfs for an UBI volume.
@@ -250,33 +236,33 @@ int ubi_sysfs_vol_init(struct ubi_info *
 	vol->dev.parent = &ubi->uif.dev;
 	vol->dev.devt = MKDEV(ubi->uif.major, vol->vol_id + 1);
 	vol->dev.class = ubi_class;
-	sprintf(&vol->dev.class_id[0], "%d", vol->vol_id);
-	err = class_device_register(&vol->dev);
+	sprintf(&vol->dev.bus_id[0], "%s_%d", ubi->uif.ubi_name, vol->vol_id);
+	err = device_register(&vol->dev);
 	if (err)
 		return err;
 
-	err = class_device_create_file(&vol->dev, &vol_reserved_ebs);
+	err = device_create_file(&vol->dev, &vol_reserved_ebs);
 	if (err)
 		return err;
-	err = class_device_create_file(&vol->dev, &vol_type);
+	err = device_create_file(&vol->dev, &vol_type);
 	if (err)
 		return err;
-	err = class_device_create_file(&vol->dev, &vol_name);
+	err = device_create_file(&vol->dev, &vol_name);
 	if (err)
 		return err;
-	err = class_device_create_file(&vol->dev, &vol_corrupted);
+	err = device_create_file(&vol->dev, &vol_corrupted);
 	if (err)
 		return err;
-	err = class_device_create_file(&vol->dev, &vol_alignment);
+	err = device_create_file(&vol->dev, &vol_alignment);
 	if (err)
 		return err;
-	err = class_device_create_file(&vol->dev, &vol_usable_eb_size);
+	err = device_create_file(&vol->dev, &vol_usable_eb_size);
 	if (err)
 		return err;
-	err = class_device_create_file(&vol->dev, &vol_data_bytes);
+	err = device_create_file(&vol->dev, &vol_data_bytes);
 	if (err)
 		return err;
-	err = class_device_create_file(&vol->dev, &vol_upd_marker);
+	err = device_create_file(&vol->dev, &vol_upd_marker);
 	if (err)
 		return err;
 	return 0;
@@ -289,15 +275,15 @@ int ubi_sysfs_vol_init(struct ubi_info *
  */
 void ubi_sysfs_vol_close(struct ubi_uif_volume *vol)
 {
-	class_device_remove_file(&vol->dev, &vol_upd_marker);
-	class_device_remove_file(&vol->dev, &vol_data_bytes);
-	class_device_remove_file(&vol->dev, &vol_usable_eb_size);
-	class_device_remove_file(&vol->dev, &vol_alignment);
-	class_device_remove_file(&vol->dev, &vol_corrupted);
-	class_device_remove_file(&vol->dev, &vol_name);
-	class_device_remove_file(&vol->dev, &vol_type);
-	class_device_remove_file(&vol->dev, &vol_reserved_ebs);
-	class_device_unregister(&vol->dev);
+	device_remove_file(&vol->dev, &vol_upd_marker);
+	device_remove_file(&vol->dev, &vol_data_bytes);
+	device_remove_file(&vol->dev, &vol_usable_eb_size);
+	device_remove_file(&vol->dev, &vol_alignment);
+	device_remove_file(&vol->dev, &vol_corrupted);
+	device_remove_file(&vol->dev, &vol_name);
+	device_remove_file(&vol->dev, &vol_type);
+	device_remove_file(&vol->dev, &vol_reserved_ebs);
+	device_unregister(&vol->dev);
 }
 
 /**
@@ -308,7 +294,7 @@ void ubi_sysfs_vol_close(struct ubi_uif_
  *
  * This function returns a pointer to the UBI device description object.
  */
-static inline struct ubi_info *dev2ubi(struct class_device *dev)
+static inline struct ubi_info *dev2ubi(struct device *dev)
 {
 	return container_of(dev, struct ubi_info, uif.dev);
 }
@@ -320,86 +306,45 @@ static ssize_t ubi_version_show(struct c
 }
 
 /* "Release" method for UBI devices */
-static void dev_release(struct class_device *dev)
+static void dev_release(struct device *dev)
 {
 	return;
 }
 
 /* "Show" method for files in '/<sysfs>/class/ubi/ubiX/' */
-static ssize_t dev_eraseblock_size_show(struct class_device *dev, char *buf)
-{
-	const struct ubi_info *ubi = dev2ubi(dev);
-
-	return sprintf(buf, "%d\n", ubi->io.leb_size);
-}
-
-static ssize_t dev_avail_eraseblocks_show(struct class_device *dev, char *buf)
-{
-	const struct ubi_info *ubi = dev2ubi(dev);
-
-	return sprintf(buf, "%d\n", ubi->acc.avail_pebs);
-}
-
-static ssize_t dev_total_eraseblocks_show(struct class_device *dev, char *buf)
-{
-	const struct ubi_info *ubi = dev2ubi(dev);
-
-	return sprintf(buf, "%d\n", ubi->io.good_peb_count);
-}
-
-static ssize_t dev_volumes_count_show(struct class_device *dev, char *buf)
-{
-	const struct ubi_info *ubi = dev2ubi(dev);
-
-	return sprintf(buf, "%d\n", ubi->vtbl.vol_count);
-}
-
-static ssize_t dev_max_ec_show(struct class_device *dev, char *buf)
-{
-	const struct ubi_info *ubi = dev2ubi(dev);
-
-	return sprintf(buf, "%d\n", ubi->wl.max_ec);
-}
-
-static ssize_t dev_reserved_for_bad_show(struct class_device *dev, char *buf)
-{
-	const struct ubi_info *ubi = dev2ubi(dev);
-
-	return sprintf(buf, "%d\n", ubi->acc.beb_rsvd_pebs);
-}
-
-static ssize_t dev_bad_peb_count_show(struct class_device *dev, char *buf)
-{
-	const struct ubi_info *ubi = dev2ubi(dev);
-
-	return sprintf(buf, "%d\n", ubi->io.bad_peb_count);
-}
-
-static ssize_t dev_max_vol_count_show(struct class_device *dev, char *buf)
-{
-	const struct ubi_info *ubi = dev2ubi(dev);
-
-	return sprintf(buf, "%d\n", ubi->vtbl.vt_slots);
-}
-
-static ssize_t dev_min_io_size_show(struct class_device *dev, char *buf)
-{
-	const struct ubi_info *ubi = dev2ubi(dev);
-
-	return sprintf(buf, "%d\n", ubi->io.min_io_size);
-}
-
-static ssize_t dev_bgt_enabled_show(struct class_device *dev, char *buf)
+static ssize_t dev_attribute_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
 	const struct ubi_info *ubi = dev2ubi(dev);
 	int enabled;
 
-	if (DBG_DISABLE_BGT || ubi->io.ro_mode)
-		enabled = 0;
-	else
-		enabled = 1;
+	if (attr == &dev_eraseblock_size)
+		return sprintf(buf, "%d\n", ubi->io.leb_size);
+	else if (attr == &dev_avail_eraseblocks)
+		return sprintf(buf, "%d\n", ubi->acc.avail_pebs);
+	else if (attr == &dev_total_eraseblocks)
+		return sprintf(buf, "%d\n", ubi->io.good_peb_count);
+	else if (attr == &dev_volumes_count)
+		return sprintf(buf, "%d\n", ubi->vtbl.vol_count);
+	else if (attr == &dev_max_ec)
+		return sprintf(buf, "%d\n", ubi->wl.max_ec);
+	else if (attr == &dev_reserved_for_bad)
+		return sprintf(buf, "%d\n", ubi->acc.beb_rsvd_pebs);
+	else if (attr == &dev_bad_peb_count)
+		return sprintf(buf, "%d\n", ubi->io.bad_peb_count);
+	else if (attr == &dev_max_vol_count)
+		return sprintf(buf, "%d\n", ubi->vtbl.vt_slots);
+	else if (attr == &dev_min_io_size)
+		return sprintf(buf, "%d\n", ubi->io.min_io_size);
+	else if (attr == &dev_bgt_enabled) {
+		if (DBG_DISABLE_BGT || ubi->io.ro_mode)
+			enabled = 0;
+		else
+			enabled = 1;
+		return sprintf(buf, "%d\n", enabled);
+	}
 
-	return sprintf(buf, "%d\n", enabled);
+	return 0;
 }
 
 /**
@@ -410,13 +355,13 @@ static ssize_t dev_bgt_enabled_show(stru
  *
  * This function returns a pointer to the UBI volume description object.
  */
-static inline struct ubi_uif_volume *dev2vol(struct class_device *dev)
+static inline struct ubi_uif_volume *dev2vol(struct device *dev)
 {
 	return container_of(dev, struct ubi_uif_volume, dev);
 }
 
 /* Release method for volume devices */
-static void vol_release(struct class_device *dev)
+static void vol_release(struct device *dev)
 {
 	const struct ubi_uif_volume *vol = dev2vol(dev);
 
@@ -425,7 +370,7 @@ static void vol_release(struct class_dev
 }
 
 /*
- * "Show" methods for files in '/<sysfs>/class/ubi/ubiX/Y/'.
+ * "Show" method for files in '/<sysfs>/class/ubi/ubiX/Y/'.
  *
  * Consider a situation:
  * A. process 1 opens a sysfs file related to volume Y, say
@@ -438,29 +383,12 @@ static void vol_release(struct class_dev
  * the UBI UIF volume information structure.
  */
 
-static ssize_t vol_reserved_ebs_show(struct class_device *dev, char *buf)
+static ssize_t vol_attribute_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
 {
-	int ret;
+	int usable_eb_size, ret = 0;
 	const struct ubi_vtbl_vtr *vtr;
-	struct ubi_uif_volume *vol = dev2vol(dev);
-
-	spin_lock(&vol->vol_lock);
-	if (vol->removed) {
-		spin_unlock(&vol->vol_lock);
-		dbg_err("volume %d was removed", vol->vol_id);
-		return -EIO;
-	}
-	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
-	ret = sprintf(buf, "%d\n", vtr->reserved_pebs);
-	spin_unlock(&vol->vol_lock);
-	return ret;
-}
-
-static ssize_t vol_type_show(struct class_device *dev, char *buf)
-{
-	int ret;
 	const char *tp;
-	const struct ubi_vtbl_vtr *vtr;
 	struct ubi_uif_volume *vol = dev2vol(dev);
 
 	spin_lock(&vol->vol_lock);
@@ -470,117 +398,25 @@ static ssize_t vol_type_show(struct clas
 		return -EIO;
 	}
 	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
-	tp = vtr->vol_type == UBI_DYNAMIC_VOLUME ? "dynamic" : "static";
-	ret = sprintf(buf, "%s\n", tp);
+	if (attr == &vol_reserved_ebs)
+		ret = sprintf(buf, "%d\n", vtr->reserved_pebs);
+	else if (attr == &vol_type) {
+		tp = vtr->vol_type == UBI_DYNAMIC_VOLUME ? "dynamic" : "static";
+		ret = sprintf(buf, "%s\n", tp);
+	} else if (attr == &vol_name)
+		ret = sprintf(buf, "%s\n", vtr->name);
+	else if (attr == &vol_corrupted)
+		ret = sprintf(buf, "%d\n", vtr->corrupted);
+	else if (attr == &vol_alignment)
+		ret = sprintf(buf, "%d\n", vtr->alignment);
+	else if (attr == &vol_usable_eb_size) {
+		usable_eb_size = vol->ubi->io.leb_size - vtr->data_pad;
+		ret = sprintf(buf, "%d\n", usable_eb_size);
+	} else if (attr == &vol_data_bytes)
+		ret = sprintf(buf, "%lld\n", vtr->used_bytes);
+	else if (attr == &vol_upd_marker)
+		ret = sprintf(buf, "%d\n", vtr->upd_marker);
 	spin_unlock(&vol->vol_lock);
 	return ret;
 }
 
-static ssize_t vol_name_show(struct class_device *dev, char *buf)
-{
-	int ret;
-	const struct ubi_vtbl_vtr *vtr;
-	struct ubi_uif_volume *vol = dev2vol(dev);
-
-	spin_lock(&vol->vol_lock);
-	if (vol->removed) {
-		spin_unlock(&vol->vol_lock);
-		dbg_err("volume %d was removed", vol->vol_id);
-		return -EIO;
-	}
-	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
-	ret = sprintf(buf, "%s\n", vtr->name);
-	spin_unlock(&vol->vol_lock);
-	return ret;
-}
-
-static ssize_t vol_corrupted_show(struct class_device *dev, char *buf)
-{
-	int ret;
-	const struct ubi_vtbl_vtr *vtr;
-	struct ubi_uif_volume *vol = dev2vol(dev);
-
-	spin_lock(&vol->vol_lock);
-	if (vol->removed) {
-		spin_unlock(&vol->vol_lock);
-		dbg_err("volume %d was removed", vol->vol_id);
-		return -EIO;
-	}
-	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
-	ret = sprintf(buf, "%d\n", vtr->corrupted);
-	spin_unlock(&vol->vol_lock);
-	return ret;
-}
-
-static ssize_t vol_alignment_show(struct class_device *dev, char *buf)
-{
-	int ret;
-	const struct ubi_vtbl_vtr *vtr;
-	struct ubi_uif_volume *vol = dev2vol(dev);
-
-	spin_lock(&vol->vol_lock);
-	if (vol->removed) {
-		spin_unlock(&vol->vol_lock);
-		dbg_err("volume %d was removed", vol->vol_id);
-		return -EIO;
-	}
-	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
-	ret = sprintf(buf, "%d\n", vtr->alignment);
-	spin_unlock(&vol->vol_lock);
-	return ret;
-}
-
-static ssize_t vol_usable_eb_size_show(struct class_device *dev, char *buf)
-{
-	int ret, usable_eb_size;
-	const struct ubi_vtbl_vtr *vtr;
-	struct ubi_uif_volume *vol = dev2vol(dev);
-
-	spin_lock(&vol->vol_lock);
-	if (vol->removed) {
-		spin_unlock(&vol->vol_lock);
-		dbg_err("volume %d was removed", vol->vol_id);
-		return -EIO;
-	}
-	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
-	usable_eb_size = vol->ubi->io.leb_size - vtr->data_pad;
-	ret = sprintf(buf, "%d\n", usable_eb_size);
-	spin_unlock(&vol->vol_lock);
-	return ret;
-}
-
-static ssize_t vol_data_bytes_show(struct class_device *dev, char *buf)
-{
-	int ret;
-	const struct ubi_vtbl_vtr *vtr;
-	struct ubi_uif_volume *vol = dev2vol(dev);
-
-	spin_lock(&vol->vol_lock);
-	if (vol->removed) {
-		spin_unlock(&vol->vol_lock);
-		dbg_err("volume %d was removed", vol->vol_id);
-		return -EIO;
-	}
-	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
-	ret = sprintf(buf, "%lld\n", vtr->used_bytes);
-	spin_unlock(&vol->vol_lock);
-	return ret;
-}
-
-static ssize_t vol_upd_marker_show(struct class_device *dev, char *buf)
-{
-	int ret;
-	const struct ubi_vtbl_vtr *vtr;
-	struct ubi_uif_volume *vol = dev2vol(dev);
-
-	spin_lock(&vol->vol_lock);
-	if (vol->removed) {
-		spin_unlock(&vol->vol_lock);
-		dbg_err("volume %d was removed", vol->vol_id);
-		return -EIO;
-	}
-	vtr = ubi_vtbl_get_vtr(vol->ubi, vol->vol_id);
-	ret = sprintf(buf, "%d\n", vtr->upd_marker);
-	spin_unlock(&vol->vol_lock);
-	return ret;
-}
--- dedekind-ubi-2.6.orig/drivers/mtd/ubi/ubi.h
+++ dedekind-ubi-2.6/drivers/mtd/ubi/ubi.h
@@ -540,7 +540,7 @@ struct ubi_vol_desc;
  * @gluebi_mtd: MTD device description object of the gluebi MTD device
  */
 struct ubi_uif_volume {
-	struct class_device dev;
+	struct device dev;
 	struct cdev cdev;
 	struct ubi_info *ubi;
 	int vol_id;
@@ -603,7 +603,7 @@ struct ubi_vol_desc {
  */
 struct ubi_uif_info {
 	struct cdev cdev;
-	struct class_device dev;
+	struct device dev;
 	int major;
 	struct list_head volumes;
 	spinlock_t volumes_list_lock;
