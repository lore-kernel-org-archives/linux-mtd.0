Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M64lJ-0007Lm-4M
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 15:28:27 +0000
Subject: [PATCH] UBI: remove built-in gluebi
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@embeddedalley.com
In-Reply-To: <1242660375.3238.7.camel@localhost.localdomain>
References: <1241018978.20184.33.camel@hp.diimka.lan>
	<1242660138.3238.5.camel@localhost.localdomain>
	<1242660375.3238.7.camel@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 18 May 2009 18:28:14 +0300
Message-Id: <1242660494.3238.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

From: Dmitry Pervushin <dpervushin@embeddedalley.com>
Date: Wed, 29 Apr 2009 19:29:44 +0400
Subject: [PATCH] UBI: remove built-in gluebi

Remove built-in gluebi support. This is a preparation for a
standalone glubi module support

Signed-off-by: Dmitry Pervushin <dpervushin@embeddedalley.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/cdev.c |    1 -
 drivers/mtd/ubi/ubi.h  |   26 --------------------------
 drivers/mtd/ubi/vmt.c  |   26 ++------------------------
 3 files changed, 2 insertions(+), 51 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 6319836..f237ddb 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -395,7 +395,6 @@ static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
 			vol->corrupted = 1;
 		}
 		vol->checked = 1;
-		ubi_gluebi_updated(vol);
 		ubi_volume_notify(ubi, vol, UBI_VOLUME_UPDATED);
 		revoke_exclusive(desc, UBI_READWRITE);
 	}
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index b5441db..7847369 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
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
@@ -489,17 +474,6 @@ int ubi_calc_data_len(const struct ubi_device *ubi, const void *buf,
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
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index e151862..ab64cb5 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -317,10 +317,6 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 		goto out_mapping;
 	}
 
-	err = ubi_create_gluebi(ubi, vol);
-	if (err)
-		goto out_cdev;
-
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
@@ -330,7 +326,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	err = device_register(&vol->dev);
 	if (err) {
 		ubi_err("cannot register device");
-		goto out_gluebi;
+		goto out_cdev;
 	}
 
 	err = volume_sysfs_init(ubi, vol);
@@ -375,10 +371,6 @@ out_sysfs:
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
@@ -433,10 +425,6 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 	ubi->volumes[vol_id] = NULL;
 	spin_unlock(&ubi->volumes_lock);
 
-	err = ubi_destroy_gluebi(vol);
-	if (err)
-		goto out_err;
-
 	if (!no_vtbl) {
 		err = ubi_change_vtbl_record(ubi, vol_id, NULL);
 		if (err)
@@ -674,10 +662,6 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 		return err;
 	}
 
-	err = ubi_create_gluebi(ubi, vol);
-	if (err)
-		goto out_cdev;
-
 	vol->dev.release = vol_release;
 	vol->dev.parent = &ubi->dev;
 	vol->dev.devt = dev;
@@ -685,12 +669,11 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
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
@@ -699,8 +682,6 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 		dbg_err("check failed while adding volume %d", vol_id);
 	return err;
 
-out_gluebi:
-	err = ubi_destroy_gluebi(vol);
 out_cdev:
 	cdev_del(&vol->cdev);
 	return err;
@@ -716,12 +697,9 @@ out_cdev:
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
-- 
1.6.0.6
