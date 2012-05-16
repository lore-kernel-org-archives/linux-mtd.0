Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUgZ8-00029b-5H
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 15:55:13 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 8/9] UBI: more of clean-up terminology for self-checks
Date: Wed, 16 May 2012 18:55:59 +0300
Message-Id: <1337183760-24417-8-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337183760-24417-1-git-send-email-dedekind1@gmail.com>
References: <1337183760-24417-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We have the "sefl-check" feature in UBI, but for historical reasons many
corresponding functions and commentaries in the code use term "paranoid check"
instead. Let's clean this up and use "self-check" everywhere.

This patch renames functions, amends messages and kills several redundant
debugging messages.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.c |    8 +++----
 drivers/mtd/ubi/vmt.c  |   31 +++++++++++++--------------
 drivers/mtd/ubi/vtbl.c |   10 ++++-----
 drivers/mtd/ubi/wl.c   |   54 +++++++++++++++++++++++-------------------------
 4 files changed, 49 insertions(+), 54 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index bcbfe49..17fc6e5 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -88,7 +88,7 @@
 #include <linux/random.h>
 #include "ubi.h"
 
-static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si);
+static int self_check_si(struct ubi_device *ubi, struct ubi_scan_info *si);
 
 /* Temporary variables used during scanning */
 static struct ubi_ec_hdr *ech;
@@ -1218,7 +1218,7 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 		if (seb->ec == UBI_SCAN_UNKNOWN_EC)
 			seb->ec = si->mean_ec;
 
-	err = paranoid_check_si(ubi, si);
+	err = self_check_si(ubi, si);
 	if (err)
 		goto out_vidh;
 
@@ -1326,14 +1326,14 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
 }
 
 /**
- * paranoid_check_si - check the scanning information.
+ * self_check_si - check the scanning information.
  * @ubi: UBI device description object
  * @si: scanning information
  *
  * This function returns zero if the scanning information is all right, and a
  * negative error code if not or if an error occurred.
  */
-static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
+static int self_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
 	int pnum, err, vols_found = 0;
 	struct rb_node *rb1, *rb2;
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index b38ab92..1bfd4b6 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -29,7 +29,7 @@
 #include <linux/export.h>
 #include "ubi.h"
 
-static int paranoid_check_volumes(struct ubi_device *ubi);
+static int self_check_volumes(struct ubi_device *ubi);
 
 static ssize_t vol_attribute_show(struct device *dev,
 				  struct device_attribute *attr, char *buf);
@@ -356,8 +356,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	spin_unlock(&ubi->volumes_lock);
 
 	ubi_volume_notify(ubi, vol, UBI_VOLUME_ADDED);
-	if (paranoid_check_volumes(ubi))
-		dbg_err("check failed while creating volume %d", vol_id);
+	self_check_volumes(ubi);
 	return err;
 
 out_sysfs:
@@ -457,8 +456,8 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 	spin_unlock(&ubi->volumes_lock);
 
 	ubi_volume_notify(ubi, vol, UBI_VOLUME_REMOVED);
-	if (!no_vtbl && paranoid_check_volumes(ubi))
-		dbg_err("check failed while removing volume %d", vol_id);
+	if (!no_vtbl)
+		self_check_volumes(ubi);
 
 	return err;
 
@@ -584,8 +583,7 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 	}
 
 	ubi_volume_notify(ubi, vol, UBI_VOLUME_RESIZED);
-	if (paranoid_check_volumes(ubi))
-		dbg_err("check failed while re-sizing volume %d", vol_id);
+	self_check_volumes(ubi);
 	return err;
 
 out_acc:
@@ -634,8 +632,8 @@ int ubi_rename_volumes(struct ubi_device *ubi, struct list_head *rename_list)
 		}
 	}
 
-	if (!err && paranoid_check_volumes(ubi))
-		;
+	if (!err)
+		self_check_volumes(ubi);
 	return err;
 }
 
@@ -682,8 +680,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 		return err;
 	}
 
-	if (paranoid_check_volumes(ubi))
-		dbg_err("check failed while adding volume %d", vol_id);
+	self_check_volumes(ubi);
 	return err;
 
 out_cdev:
@@ -709,13 +706,13 @@ void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 }
 
 /**
- * paranoid_check_volume - check volume information.
+ * self_check_volume - check volume information.
  * @ubi: UBI device description object
  * @vol_id: volume ID
  *
  * Returns zero if volume is all right and a a negative error code if not.
  */
-static int paranoid_check_volume(struct ubi_device *ubi, int vol_id)
+static int self_check_volume(struct ubi_device *ubi, int vol_id)
 {
 	int idx = vol_id2idx(ubi, vol_id);
 	int reserved_pebs, alignment, data_pad, vol_type, name_len, upd_marker;
@@ -847,7 +844,7 @@ static int paranoid_check_volume(struct ubi_device *ubi, int vol_id)
 	return 0;
 
 fail:
-	ubi_err("paranoid check failed for volume %d", vol_id);
+	ubi_err("self-check failed for volume %d", vol_id);
 	if (vol)
 		ubi_dump_vol_info(vol);
 	ubi_dump_vtbl_record(&ubi->vtbl[vol_id], vol_id);
@@ -857,12 +854,12 @@ fail:
 }
 
 /**
- * paranoid_check_volumes - check information about all volumes.
+ * self_check_volumes - check information about all volumes.
  * @ubi: UBI device description object
  *
  * Returns zero if volumes are all right and a a negative error code if not.
  */
-static int paranoid_check_volumes(struct ubi_device *ubi)
+static int self_check_volumes(struct ubi_device *ubi)
 {
 	int i, err = 0;
 
@@ -870,7 +867,7 @@ static int paranoid_check_volumes(struct ubi_device *ubi)
 		return 0;
 
 	for (i = 0; i < ubi->vtbl_slots; i++) {
-		err = paranoid_check_volume(ubi, i);
+		err = self_check_volume(ubi, i);
 		if (err)
 			break;
 	}
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 277f154..befe6f8 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -62,7 +62,7 @@
 #include <asm/div64.h>
 #include "ubi.h"
 
-static void paranoid_vtbl_check(const struct ubi_device *ubi);
+static void self_vtbl_check(const struct ubi_device *ubi);
 
 /* Empty volume table record */
 static struct ubi_vtbl_record empty_vtbl_record;
@@ -107,7 +107,7 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 			return err;
 	}
 
-	paranoid_vtbl_check(ubi);
+	self_vtbl_check(ubi);
 	return 0;
 }
 
@@ -855,16 +855,16 @@ out_free:
 }
 
 /**
- * paranoid_vtbl_check - check volume table.
+ * self_vtbl_check - check volume table.
  * @ubi: UBI device description object
  */
-static void paranoid_vtbl_check(const struct ubi_device *ubi)
+static void self_vtbl_check(const struct ubi_device *ubi)
 {
 	if (!ubi->dbg->chk_gen)
 		return;
 
 	if (vtbl_check(ubi, ubi->vtbl)) {
-		ubi_err("paranoid check failed");
+		ubi_err("self-check failed");
 		BUG();
 	}
 }
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index f99dbd0..75d2c1f 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -155,12 +155,11 @@ struct ubi_work {
 	int torture;
 };
 
-static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec);
-static int paranoid_check_in_wl_tree(const struct ubi_device *ubi,
-				     struct ubi_wl_entry *e,
-				     struct rb_root *root);
-static int paranoid_check_in_pq(const struct ubi_device *ubi,
-				struct ubi_wl_entry *e);
+static int self_check_ec(struct ubi_device *ubi, int pnum, int ec);
+static int self_check_in_wl_tree(const struct ubi_device *ubi,
+				 struct ubi_wl_entry *e, struct rb_root *root);
+static int self_check_in_pq(const struct ubi_device *ubi,
+			    struct ubi_wl_entry *e);
 
 /**
  * wl_tree_add - add a wear-leveling entry to a WL RB-tree.
@@ -404,7 +403,7 @@ retry:
 	else
 		e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2);
 
-	paranoid_check_in_wl_tree(ubi, e, &ubi->free);
+	self_check_in_wl_tree(ubi, e, &ubi->free);
 
 	/*
 	 * Move the physical eraseblock to the protection queue where it will
@@ -441,7 +440,7 @@ static int prot_queue_del(struct ubi_device *ubi, int pnum)
 	if (!e)
 		return -ENODEV;
 
-	if (paranoid_check_in_pq(ubi, e))
+	if (self_check_in_pq(ubi, e))
 		return -ENODEV;
 
 	list_del(&e->u.list);
@@ -467,7 +466,7 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 
 	dbg_wl("erase PEB %d, old EC %llu", e->pnum, ec);
 
-	err = paranoid_check_ec(ubi, e->pnum, e->ec);
+	err = self_check_ec(ubi, e->pnum, e->ec);
 	if (err)
 		return -EINVAL;
 
@@ -667,7 +666,7 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 			       e1->ec, e2->ec);
 			goto out_cancel;
 		}
-		paranoid_check_in_wl_tree(ubi, e1, &ubi->used);
+		self_check_in_wl_tree(ubi, e1, &ubi->used);
 		rb_erase(&e1->u.rb, &ubi->used);
 		dbg_wl("move PEB %d EC %d to PEB %d EC %d",
 		       e1->pnum, e1->ec, e2->pnum, e2->ec);
@@ -676,12 +675,12 @@ static int wear_leveling_worker(struct ubi_device *ubi, struct ubi_work *wrk,
 		scrubbing = 1;
 		e1 = rb_entry(rb_first(&ubi->scrub), struct ubi_wl_entry, u.rb);
 		e2 = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF);
-		paranoid_check_in_wl_tree(ubi, e1, &ubi->scrub);
+		self_check_in_wl_tree(ubi, e1, &ubi->scrub);
 		rb_erase(&e1->u.rb, &ubi->scrub);
 		dbg_wl("scrub PEB %d to PEB %d", e1->pnum, e2->pnum);
 	}
 
-	paranoid_check_in_wl_tree(ubi, e2, &ubi->free);
+	self_check_in_wl_tree(ubi, e2, &ubi->free);
 	rb_erase(&e2->u.rb, &ubi->free);
 	ubi->move_from = e1;
 	ubi->move_to = e2;
@@ -1128,13 +1127,13 @@ retry:
 		return 0;
 	} else {
 		if (in_wl_tree(e, &ubi->used)) {
-			paranoid_check_in_wl_tree(ubi, e, &ubi->used);
+			self_check_in_wl_tree(ubi, e, &ubi->used);
 			rb_erase(&e->u.rb, &ubi->used);
 		} else if (in_wl_tree(e, &ubi->scrub)) {
-			paranoid_check_in_wl_tree(ubi, e, &ubi->scrub);
+			self_check_in_wl_tree(ubi, e, &ubi->scrub);
 			rb_erase(&e->u.rb, &ubi->scrub);
 		} else if (in_wl_tree(e, &ubi->erroneous)) {
-			paranoid_check_in_wl_tree(ubi, e, &ubi->erroneous);
+			self_check_in_wl_tree(ubi, e, &ubi->erroneous);
 			rb_erase(&e->u.rb, &ubi->erroneous);
 			ubi->erroneous_peb_count -= 1;
 			ubi_assert(ubi->erroneous_peb_count >= 0);
@@ -1201,7 +1200,7 @@ retry:
 	}
 
 	if (in_wl_tree(e, &ubi->used)) {
-		paranoid_check_in_wl_tree(ubi, e, &ubi->used);
+		self_check_in_wl_tree(ubi, e, &ubi->used);
 		rb_erase(&e->u.rb, &ubi->used);
 	} else {
 		int err;
@@ -1521,7 +1520,7 @@ void ubi_wl_close(struct ubi_device *ubi)
 }
 
 /**
- * paranoid_check_ec - make sure that the erase counter of a PEB is correct.
+ * self_check_ec - make sure that the erase counter of a PEB is correct.
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock number to check
  * @ec: the erase counter to check
@@ -1530,7 +1529,7 @@ void ubi_wl_close(struct ubi_device *ubi)
  * is equivalent to @ec, and a negative error code if not or if an error
  * occurred.
  */
-static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec)
+static int self_check_ec(struct ubi_device *ubi, int pnum, int ec)
 {
 	int err;
 	long long read_ec;
@@ -1552,7 +1551,7 @@ static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec)
 
 	read_ec = be64_to_cpu(ec_hdr->ec);
 	if (ec != read_ec) {
-		ubi_err("paranoid check failed for PEB %d", pnum);
+		ubi_err("self-check failed for PEB %d", pnum);
 		ubi_err("read EC is %lld, should be %d", read_ec, ec);
 		dump_stack();
 		err = 1;
@@ -1565,7 +1564,7 @@ out_free:
 }
 
 /**
- * paranoid_check_in_wl_tree - check that wear-leveling entry is in WL RB-tree.
+ * self_check_in_wl_tree - check that wear-leveling entry is in WL RB-tree.
  * @ubi: UBI device description object
  * @e: the wear-leveling entry to check
  * @root: the root of the tree
@@ -1573,9 +1572,8 @@ out_free:
  * This function returns zero if @e is in the @root RB-tree and %-EINVAL if it
  * is not.
  */
-static int paranoid_check_in_wl_tree(const struct ubi_device *ubi,
-				     struct ubi_wl_entry *e,
-				     struct rb_root *root)
+static int self_check_in_wl_tree(const struct ubi_device *ubi,
+				 struct ubi_wl_entry *e, struct rb_root *root)
 {
 	if (!ubi->dbg->chk_gen)
 		return 0;
@@ -1583,22 +1581,22 @@ static int paranoid_check_in_wl_tree(const struct ubi_device *ubi,
 	if (in_wl_tree(e, root))
 		return 0;
 
-	ubi_err("paranoid check failed for PEB %d, EC %d, RB-tree %p ",
+	ubi_err("self-check failed for PEB %d, EC %d, RB-tree %p ",
 		e->pnum, e->ec, root);
 	dump_stack();
 	return -EINVAL;
 }
 
 /**
- * paranoid_check_in_pq - check if wear-leveling entry is in the protection
+ * self_check_in_pq - check if wear-leveling entry is in the protection
  *                        queue.
  * @ubi: UBI device description object
  * @e: the wear-leveling entry to check
  *
  * This function returns zero if @e is in @ubi->pq and %-EINVAL if it is not.
  */
-static int paranoid_check_in_pq(const struct ubi_device *ubi,
-				struct ubi_wl_entry *e)
+static int self_check_in_pq(const struct ubi_device *ubi,
+			    struct ubi_wl_entry *e)
 {
 	struct ubi_wl_entry *p;
 	int i;
@@ -1611,7 +1609,7 @@ static int paranoid_check_in_pq(const struct ubi_device *ubi,
 			if (p == e)
 				return 0;
 
-	ubi_err("paranoid check failed for PEB %d, EC %d, Protect queue",
+	ubi_err("self-check failed for PEB %d, EC %d, Protect queue",
 		e->pnum, e->ec);
 	dump_stack();
 	return -EINVAL;
-- 
1.7.10
