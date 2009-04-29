Received: from easi.embeddedalley.com ([71.6.201.124])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LzBk8-0002bz-HP
	for linux-mtd@lists.infradead.org; Wed, 29 Apr 2009 15:31:01 +0000
Subject: [PATCH] [UBI] [2/3] remove explicit calls to gluebi functions
From: dmitry pervushin <dpervushin@embeddedalley.com>
To: dedekind@infradead.org
Content-Type: text/plain
Date: Wed, 29 Apr 2009 19:29:44 +0400
Message-Id: <1241018984.20184.36.camel@hp.diimka.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dpervushin@embeddedalley.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: dmitry pervushin <dpervushin@embeddedalley.com>

---
 drivers/mtd/ubi/cdev.c |    1 -
 drivers/mtd/ubi/ubi.h  |   26 --------------------------
 drivers/mtd/ubi/vmt.c  |   26 ++------------------------
 3 files changed, 2 insertions(+), 51 deletions(-)

Index: linux-2.6/drivers/mtd/ubi/cdev.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/cdev.c
+++ linux-2.6/drivers/mtd/ubi/cdev.c
@@ -393,7 +393,6 @@ static ssize_t vol_cdev_write(struct fil
 			vol->corrupted = 1;
 		}
 		vol->checked = 1;
-		ubi_gluebi_updated(vol);
 		ubi_volume_notify(UBI_VOLUME_CHANGED,
 				ubi->ubi_num, vol->vol_id);
 		revoke_exclusive(desc, UBI_READWRITE);
Index: linux-2.6/drivers/mtd/ubi/vmt.c
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/vmt.c
+++ linux-2.6/drivers/mtd/ubi/vmt.c
@@ -317,10 +317,6 @@ int ubi_create_volume(struct ubi_device
 		goto out_mapping;
 	}
 
-	err = ubi_create_gluebi(ubi, vol);
-	if (err)
-		goto out_cdev;
-
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
@@ -330,7 +326,7 @@ int ubi_create_volume(struct ubi_device
 	err = device_register(&vol->dev);
 	if (err) {
 		ubi_err("cannot register device");
-		goto out_gluebi;
+		goto out_cdev;
 	}
 
 	err = volume_sysfs_init(ubi, vol);
@@ -374,10 +370,6 @@ out_sysfs:
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
@@ -434,10 +426,6 @@ int ubi_remove_volume(struct ubi_volume_
 	ubi->volumes[vol_id] = NULL;
 	spin_unlock(&ubi->volumes_lock);
 
-	err = ubi_destroy_gluebi(vol);
-	if (err)
-		goto out_err;
-
 	if (!no_vtbl) {
 		err = ubi_change_vtbl_record(ubi, vol_id, NULL);
 		if (err)
@@ -674,10 +662,6 @@ int ubi_add_volume(struct ubi_device *ub
 		return err;
 	}
 
-	err = ubi_create_gluebi(ubi, vol);
-	if (err)
-		goto out_cdev;
-
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
@@ -685,12 +669,11 @@ int ubi_add_volume(struct ubi_device *ub
 	dev_set_name(&vol->dev, "%s_%d", ubi->ubi_name, vol->vol_id);
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
@@ -698,8 +681,6 @@ int ubi_add_volume(struct ubi_device *ub
 	err = paranoid_check_volumes(ubi);
 	return err;
 
-out_gluebi:
-	err = ubi_destroy_gluebi(vol);
 out_cdev:
 	cdev_del(&vol->cdev);
 	return err;
@@ -715,12 +696,9 @@ out_cdev:
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
Index: linux-2.6/drivers/mtd/ubi/ubi.h
===================================================================
--- linux-2.6.orig/drivers/mtd/ubi/ubi.h
+++ linux-2.6/drivers/mtd/ubi/ubi.h
@@ -209,10 +209,6 @@ struct ubi_volume_desc;
  * @changing_leb: %1 if the atomic LEB change ioctl command is in progress
  * @direct_writes: %1 if direct writes are enabled for this volume
  *
- * @gluebi_desc: gluebi UBI volume descriptor
- * @gluebi_refcount: reference count of the gluebi MTD device
- * @gluebi_mtd: MTD device description object of the gluebi MTD device
- *
  * The @corrupted field indicates that the volume's contents is corrupted.
  * Since UBI protects only static volumes, this field is not relevant to
  * dynamic volumes - it is user's responsibility to assure their data
@@ -256,17 +252,6 @@ struct ubi_volume {
 	unsigned int updating:1;
 	unsigned int changing_leb:1;
 	unsigned int direct_writes:1;
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
@@ -491,17 +476,6 @@ int ubi_calc_data_len(const struct ubi_d
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
