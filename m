Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKyB-0005YM-Su
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 19/22] UBI: move and rename attach_by_scanning
Date: Fri, 18 May 2012 14:04:02 +0300
Message-Id: <1337339045-8199-20-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
References: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Rename the 'attach_by_scanning()' function to 'ubi_attach()' and move it to
scan.c. Richard will plug his fastmap stuff there.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |   65 +++++------------------------------------------
 drivers/mtd/ubi/scan.c  |   52 +++++++++++++++++++++++++++++++++++--
 drivers/mtd/ubi/scan.h  |    2 +-
 drivers/mtd/ubi/ubi.h   |    1 +
 4 files changed, 58 insertions(+), 62 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ecedd75..2c5ed5c 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -550,10 +550,10 @@ static void uif_close(struct ubi_device *ubi)
 }
 
 /**
- * free_internal_volumes - free internal volumes.
+ * ubi_free_internal_volumes - free internal volumes.
  * @ubi: UBI device description object
  */
-static void free_internal_volumes(struct ubi_device *ubi)
+void ubi_free_internal_volumes(struct ubi_device *ubi)
 {
 	int i;
 
@@ -565,59 +565,6 @@ static void free_internal_volumes(struct ubi_device *ubi)
 }
 
 /**
- * attach_by_scanning - attach an MTD device using scanning method.
- * @ubi: UBI device descriptor
- *
- * This function returns zero in case of success and a negative error code in
- * case of failure.
- *
- * Note, currently this is the only method to attach UBI devices. Hopefully in
- * the future we'll have more scalable attaching methods and avoid full media
- * scanning. But even in this case scanning will be needed as a fall-back
- * attaching method if there are some on-flash table corruptions.
- */
-static int attach_by_scanning(struct ubi_device *ubi)
-{
-	int err;
-	struct ubi_attach_info *ai;
-
-	ai = ubi_scan(ubi);
-	if (IS_ERR(ai))
-		return PTR_ERR(ai);
-
-	ubi->bad_peb_count = ai->bad_peb_count;
-	ubi->good_peb_count = ubi->peb_count - ubi->bad_peb_count;
-	ubi->corr_peb_count = ai->corr_peb_count;
-	ubi->max_ec = ai->max_ec;
-	ubi->mean_ec = ai->mean_ec;
-	ubi_msg("max. sequence number:       %llu", ai->max_sqnum);
-
-	err = ubi_read_volume_table(ubi, ai);
-	if (err)
-		goto out_ai;
-
-	err = ubi_wl_init(ubi, ai);
-	if (err)
-		goto out_vtbl;
-
-	err = ubi_eba_init(ubi, ai);
-	if (err)
-		goto out_wl;
-
-	ubi_destroy_ai(ai);
-	return 0;
-
-out_wl:
-	ubi_wl_close(ubi);
-out_vtbl:
-	free_internal_volumes(ubi);
-	vfree(ubi->vtbl);
-out_ai:
-	ubi_destroy_ai(ai);
-	return err;
-}
-
-/**
  * io_init - initialize I/O sub-system for a given UBI device.
  * @ubi: UBI device description object
  *
@@ -949,9 +896,9 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	if (err)
 		goto out_free;
 
-	err = attach_by_scanning(ubi);
+	err = ubi_attach(ubi);
 	if (err) {
-		ubi_err("failed to attach by scanning, error %d", err);
+		ubi_err("failed to attach mtd%d, error %d", mtd->index, err);
 		goto out_debugging;
 	}
 
@@ -1016,7 +963,7 @@ out_uif:
 	uif_close(ubi);
 out_detach:
 	ubi_wl_close(ubi);
-	free_internal_volumes(ubi);
+	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
 out_debugging:
 	ubi_debugging_exit_dev(ubi);
@@ -1088,7 +1035,7 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	ubi_debugfs_exit_dev(ubi);
 	uif_close(ubi);
 	ubi_wl_close(ubi);
-	free_internal_volumes(ubi);
+	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
 	put_mtd_device(ubi->mtd);
 	ubi_debugging_exit_dev(ubi);
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 93257f3..aecd8cf 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -1107,14 +1107,14 @@ static int late_analysis(struct ubi_device *ubi, struct ubi_attach_info *ai)
 }
 
 /**
- * ubi_scan - scan an MTD device.
+ * scan_all - scan entire MTD device.
  * @ubi: UBI device description object
  *
  * This function does full scanning of an MTD device and returns complete
  * information about it in form of a "struct ubi_attach_info" object. In case
  * of failure, an error code is returned.
  */
-struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
+static struct ubi_attach_info *scan_all(struct ubi_device *ubi)
 {
 	int err, pnum;
 	struct rb_node *rb1, *rb2;
@@ -1208,6 +1208,54 @@ out_ai:
 }
 
 /**
+ * ubi_attach - attach an MTD device.
+ * @ubi: UBI device descriptor
+ *
+ * This function returns zero in case of success and a negative error code in
+ * case of failure.
+ */
+int ubi_attach(struct ubi_device *ubi)
+{
+	int err;
+	struct ubi_attach_info *ai;
+
+	ai = scan_all(ubi);
+	if (IS_ERR(ai))
+		return PTR_ERR(ai);
+
+	ubi->bad_peb_count = ai->bad_peb_count;
+	ubi->good_peb_count = ubi->peb_count - ubi->bad_peb_count;
+	ubi->corr_peb_count = ai->corr_peb_count;
+	ubi->max_ec = ai->max_ec;
+	ubi->mean_ec = ai->mean_ec;
+	ubi_msg("max. sequence number:       %llu", ai->max_sqnum);
+
+	err = ubi_read_volume_table(ubi, ai);
+	if (err)
+		goto out_ai;
+
+	err = ubi_wl_init(ubi, ai);
+	if (err)
+		goto out_vtbl;
+
+	err = ubi_eba_init(ubi, ai);
+	if (err)
+		goto out_wl;
+
+	ubi_destroy_ai(ai);
+	return 0;
+
+out_wl:
+	ubi_wl_close(ubi);
+out_vtbl:
+	ubi_free_internal_volumes(ubi);
+	vfree(ubi->vtbl);
+out_ai:
+	ubi_destroy_ai(ai);
+	return err;
+}
+
+/**
  * destroy_av - free volume attaching information.
  * @av: volume attaching information
  * @ai: attaching information
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index a794577..3e0c4f4 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -164,7 +164,7 @@ struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
 void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
 struct ubi_ainf_peb *ubi_early_get_peb(struct ubi_device *ubi,
 				       struct ubi_attach_info *ai);
-struct ubi_attach_info *ubi_scan(struct ubi_device *ubi);
+int ubi_attach(struct ubi_device *ubi);
 void ubi_destroy_ai(struct ubi_attach_info *ai);
 
 #endif /* !__UBI_SCAN_H__ */
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 9563e1b..e09e558 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -569,6 +569,7 @@ int ubi_volume_notify(struct ubi_device *ubi, struct ubi_volume *vol,
 int ubi_notify_all(struct ubi_device *ubi, int ntype,
 		   struct notifier_block *nb);
 int ubi_enumerate_volumes(struct notifier_block *nb);
+void ubi_free_internal_volumes(struct ubi_device *ubi);
 
 /* kapi.c */
 void ubi_do_get_device_info(struct ubi_device *ubi, struct ubi_device_info *di);
-- 
1.7.10
