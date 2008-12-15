Received: from mail-ew0-f13.google.com ([209.85.219.13])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCBP7-0003Q3-Lu
	for linux-mtd@lists.infradead.org; Mon, 15 Dec 2008 11:14:26 +0000
Received: by mail-ew0-f13.google.com with SMTP id 6so3075767ewy.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 15 Dec 2008 03:14:25 -0800 (PST)
Subject: [PATCH] [UBI] 2/5 - remove "old" gluebi layer
From: dmitry pervushin <dpervushin@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 15 Dec 2008 14:14:17 +0300
Message-Id: <1229339657.7900.22.camel@hp.diimka.lan>
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

This patch removes current gluebi calls; they will be replaced by
notifications in next patch

Signed-off-by: dmitry pervushin <dimka@embeddedalley.com>

---
 drivers/mtd/ubi/cdev.c |    1 -
 drivers/mtd/ubi/ubi.h  |   26 --------------------------
 drivers/mtd/ubi/vmt.c  |   26 ++------------------------
 3 files changed, 2 insertions(+), 51 deletions(-)

Index: ubifs-2.6/drivers/mtd/ubi/cdev.c
===================================================================
--- ubifs-2.6.orig/drivers/mtd/ubi/cdev.c
+++ ubifs-2.6/drivers/mtd/ubi/cdev.c
@@ -395,7 +395,6 @@ static ssize_t vol_cdev_write(struct fil
 			vol->corrupted = 1;
 		}
 		vol->checked = 1;
-		ubi_gluebi_updated(vol);
 		ubi_volume_notify(UBI_VOLUME_CHANGED,
 				ubi->ubi_num, vol->vol_id);
 		revoke_exclusive(desc, UBI_READWRITE);
Index: ubifs-2.6/drivers/mtd/ubi/ubi.h
===================================================================
--- ubifs-2.6.orig/drivers/mtd/ubi/ubi.h
+++ ubifs-2.6/drivers/mtd/ubi/ubi.h
@@ -197,10 +197,6 @@ struct ubi_volume_desc;
  * @updating: %1 if the volume is being updated
  * @changing_leb: %1 if the atomic LEB change ioctl command is in
progress
  *
- * @gluebi_desc: gluebi UBI volume descriptor
- * @gluebi_refcount: reference count of the gluebi MTD device
- * @gluebi_mtd: MTD device description object of the gluebi MTD device
- *
  * The @corrupted field indicates that the volume's contents is
corrupted.
  * Since UBI protects only static volumes, this field is not relevant
to
  * dynamic volumes - it is user's responsibility to assure their data
@@ -243,17 +239,6 @@ struct ubi_volume {
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
@@ -481,17 +466,6 @@ int ubi_calc_data_len(const struct ubi_d
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
Index: ubifs-2.6/drivers/mtd/ubi/vmt.c
===================================================================
--- ubifs-2.6.orig/drivers/mtd/ubi/vmt.c
+++ ubifs-2.6/drivers/mtd/ubi/vmt.c
@@ -320,10 +320,6 @@ int ubi_create_volume(struct ubi_device
 		goto out_mapping;
 	}
 
-	err = ubi_create_gluebi(ubi, vol);
-	if (err)
-		goto out_cdev;
-
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
@@ -333,7 +329,7 @@ int ubi_create_volume(struct ubi_device
 	err = device_register(&vol->dev);
 	if (err) {
 		ubi_err("cannot register device");
-		goto out_gluebi;
+		goto out_cdev;
 	}
 
 	err = volume_sysfs_init(ubi, vol);
@@ -377,10 +373,6 @@ out_sysfs:
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
@@ -436,10 +428,6 @@ int ubi_remove_volume(struct ubi_volume_
 	ubi->volumes[vol_id] = NULL;
 	spin_unlock(&ubi->volumes_lock);
 
-	err = ubi_destroy_gluebi(vol);
-	if (err)
-		goto out_err;
-
 	if (!no_vtbl) {
 		err = ubi_change_vtbl_record(ubi, vol_id, NULL);
 		if (err)
@@ -676,10 +664,6 @@ int ubi_add_volume(struct ubi_device *ub
 		return err;
 	}
 
-	err = ubi_create_gluebi(ubi, vol);
-	if (err)
-		goto out_cdev;
-
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
@@ -687,12 +671,11 @@ int ubi_add_volume(struct ubi_device *ub
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
@@ -700,8 +683,6 @@ int ubi_add_volume(struct ubi_device *ub
 	err = paranoid_check_volumes(ubi);
 	return err;
 
-out_gluebi:
-	err = ubi_destroy_gluebi(vol);
 out_cdev:
 	cdev_del(&vol->cdev);
 	return err;
@@ -717,12 +698,9 @@ out_cdev:
  */
 void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 {
-	int err;
-
 	dbg_gen("free volume %d", vol->vol_id);
 
 	ubi->volumes[vol->vol_id] = NULL;
-	err = ubi_destroy_gluebi(vol);
 	cdev_del(&vol->cdev);
 	volume_sysfs_close(vol);
 }
