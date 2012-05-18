Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxj-0005YL-Dw
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:35 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/22] UBI: rename si to ai
Date: Fri, 18 May 2012 14:03:49 +0300
Message-Id: <1337339045-8199-7-git-send-email-dedekind1@gmail.com>
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

From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>

After re-naming the 'struct ubi_scan_info' we should adjust all variables
named 'si' to something else, because 'si' stands for "scanning info".
Let's rename it to 'ai' which stands for "attaching info" which is
a bit more consistent and has the same length, which makes re-naming easy.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |   32 ++---
 drivers/mtd/ubi/debug.c |    4 +-
 drivers/mtd/ubi/eba.c   |   18 +--
 drivers/mtd/ubi/scan.c  |  346 +++++++++++++++++++++++------------------------
 drivers/mtd/ubi/scan.h  |   14 +-
 drivers/mtd/ubi/ubi.h   |    6 +-
 drivers/mtd/ubi/vtbl.c  |   86 ++++++------
 drivers/mtd/ubi/wl.c    |   14 +-
 8 files changed, 260 insertions(+), 260 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 4e715df..1ae3cfa 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -583,32 +583,32 @@ static void free_internal_volumes(struct ubi_device *ubi)
 static int attach_by_scanning(struct ubi_device *ubi)
 {
 	int err;
-	struct ubi_attach_info *si;
+	struct ubi_attach_info *ai;
 
-	si = ubi_scan(ubi);
-	if (IS_ERR(si))
-		return PTR_ERR(si);
+	ai = ubi_scan(ubi);
+	if (IS_ERR(ai))
+		return PTR_ERR(ai);
 
-	ubi->bad_peb_count = si->bad_peb_count;
+	ubi->bad_peb_count = ai->bad_peb_count;
 	ubi->good_peb_count = ubi->peb_count - ubi->bad_peb_count;
-	ubi->corr_peb_count = si->corr_peb_count;
-	ubi->max_ec = si->max_ec;
-	ubi->mean_ec = si->mean_ec;
-	ubi_msg("max. sequence number:       %llu", si->max_sqnum);
+	ubi->corr_peb_count = ai->corr_peb_count;
+	ubi->max_ec = ai->max_ec;
+	ubi->mean_ec = ai->mean_ec;
+	ubi_msg("max. sequence number:       %llu", ai->max_sqnum);
 
-	err = ubi_read_volume_table(ubi, si);
+	err = ubi_read_volume_table(ubi, ai);
 	if (err)
-		goto out_si;
+		goto out_ai;
 
-	err = ubi_wl_init_scan(ubi, si);
+	err = ubi_wl_init_scan(ubi, ai);
 	if (err)
 		goto out_vtbl;
 
-	err = ubi_eba_init_scan(ubi, si);
+	err = ubi_eba_init_scan(ubi, ai);
 	if (err)
 		goto out_wl;
 
-	ubi_scan_destroy_si(si);
+	ubi_scan_destroy_ai(ai);
 	return 0;
 
 out_wl:
@@ -616,8 +616,8 @@ out_wl:
 out_vtbl:
 	free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
-out_si:
-	ubi_scan_destroy_si(si);
+out_ai:
+	ubi_scan_destroy_ai(ai);
 	return err;
 }
 
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index e73b1fe..84362a8 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -176,7 +176,7 @@ void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)
  */
 void ubi_dump_sv(const struct ubi_ainf_volume *sv)
 {
-	printk(KERN_DEBUG "Volume scanning information dump:\n");
+	printk(KERN_DEBUG "Volume attaching information dump:\n");
 	printk(KERN_DEBUG "\tvol_id         %d\n", sv->vol_id);
 	printk(KERN_DEBUG "\thighest_lnum   %d\n", sv->highest_lnum);
 	printk(KERN_DEBUG "\tleb_count      %d\n", sv->leb_count);
@@ -194,7 +194,7 @@ void ubi_dump_sv(const struct ubi_ainf_volume *sv)
  */
 void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type)
 {
-	printk(KERN_DEBUG "eraseblock scanning information dump:\n");
+	printk(KERN_DEBUG "eraseblock attaching information dump:\n");
 	printk(KERN_DEBUG "\tec       %d\n", aeb->ec);
 	printk(KERN_DEBUG "\tpnum     %d\n", aeb->pnum);
 	if (type == 0) {
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 2509502..3203727 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1182,13 +1182,13 @@ out_unlock_leb:
  * reported by real users.
  */
 static void print_rsvd_warning(struct ubi_device *ubi,
-			       struct ubi_attach_info *si)
+			       struct ubi_attach_info *ai)
 {
 	/*
 	 * The 1 << 18 (256KiB) number is picked randomly, just a reasonably
 	 * large number to distinguish between newly flashed and used images.
 	 */
-	if (si->max_sqnum > (1 << 18)) {
+	if (ai->max_sqnum > (1 << 18)) {
 		int min = ubi->beb_rsvd_level / 10;
 
 		if (!min)
@@ -1205,14 +1205,14 @@ static void print_rsvd_warning(struct ubi_device *ubi,
 }
 
 /**
- * ubi_eba_init_scan - initialize the EBA sub-system using scanning information.
+ * ubi_eba_init_scan - initialize the EBA sub-system using attaching information.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  *
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
+int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int i, j, err, num_volumes;
 	struct ubi_ainf_volume *sv;
@@ -1226,7 +1226,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 	mutex_init(&ubi->alc_mutex);
 	ubi->ltree = RB_ROOT;
 
-	ubi->global_sqnum = si->max_sqnum + 1;
+	ubi->global_sqnum = ai->max_sqnum + 1;
 	num_volumes = ubi->vtbl_slots + UBI_INT_VOL_COUNT;
 
 	for (i = 0; i < num_volumes; i++) {
@@ -1246,7 +1246,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 		for (j = 0; j < vol->reserved_pebs; j++)
 			vol->eba_tbl[j] = UBI_LEB_UNMAPPED;
 
-		sv = ubi_scan_find_sv(si, idx2vol_id(ubi, i));
+		sv = ubi_scan_find_sv(ai, idx2vol_id(ubi, i));
 		if (!sv)
 			continue;
 
@@ -1256,7 +1256,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 				 * This may happen in case of an unclean reboot
 				 * during re-size.
 				 */
-				ubi_scan_move_to_list(sv, aeb, &si->erase);
+				ubi_scan_move_to_list(sv, aeb, &ai->erase);
 			vol->eba_tbl[aeb->lnum] = aeb->pnum;
 		}
 	}
@@ -1279,7 +1279,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 		if (ubi->avail_pebs < ubi->beb_rsvd_level) {
 			/* No enough free physical eraseblocks */
 			ubi->beb_rsvd_pebs = ubi->avail_pebs;
-			print_rsvd_warning(ubi, si);
+			print_rsvd_warning(ubi, ai);
 		} else
 			ubi->beb_rsvd_pebs = ubi->beb_rsvd_level;
 
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index c53ef5d..4145a04 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -24,10 +24,10 @@
  * This sub-system is responsible for scanning the flash media, checking UBI
  * headers and providing complete information about the UBI flash image.
  *
- * The scanning information is represented by a &struct ubi_attach_info' object.
- * Information about found volumes is represented by &struct ubi_ainf_volume
- * objects which are kept in volume RB-tree with root at the @volumes field.
- * The RB-tree is indexed by the volume ID.
+ * The attaching information is represented by a &struct ubi_attach_info'
+ * object. Information about found volumes is represented by
+ * &struct ubi_ainf_volume objects which are kept in volume RB-tree with root
+ * at the @volumes field. The RB-tree is indexed by the volume ID.
  *
  * Scanned logical eraseblocks are represented by &struct ubi_ainf_peb objects.
  * These objects are kept in per-volume RB-trees with the root at the
@@ -88,7 +88,7 @@
 #include <linux/random.h>
 #include "ubi.h"
 
-static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si);
+static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai);
 
 /* Temporary variables used during scanning */
 static struct ubi_ec_hdr *ech;
@@ -96,7 +96,7 @@ static struct ubi_vid_hdr *vidh;
 
 /**
  * add_to_list - add physical eraseblock to a list.
- * @si: scanning information
+ * @ai: attaching information
  * @pnum: physical eraseblock number to add
  * @ec: erase counter of the physical eraseblock
  * @to_head: if not zero, add to the head of the list
@@ -110,22 +110,22 @@ static struct ubi_vid_hdr *vidh;
  * returns zero in case of success and a negative error code in case of
  * failure.
  */
-static int add_to_list(struct ubi_attach_info *si, int pnum, int ec,
+static int add_to_list(struct ubi_attach_info *ai, int pnum, int ec,
 		       int to_head, struct list_head *list)
 {
 	struct ubi_ainf_peb *aeb;
 
-	if (list == &si->free) {
+	if (list == &ai->free) {
 		dbg_bld("add to free: PEB %d, EC %d", pnum, ec);
-	} else if (list == &si->erase) {
+	} else if (list == &ai->erase) {
 		dbg_bld("add to erase: PEB %d, EC %d", pnum, ec);
-	} else if (list == &si->alien) {
+	} else if (list == &ai->alien) {
 		dbg_bld("add to alien: PEB %d, EC %d", pnum, ec);
-		si->alien_peb_count += 1;
+		ai->alien_peb_count += 1;
 	} else
 		BUG();
 
-	aeb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
+	aeb = kmem_cache_alloc(ai->scan_leb_slab, GFP_KERNEL);
 	if (!aeb)
 		return -ENOMEM;
 
@@ -140,7 +140,7 @@ static int add_to_list(struct ubi_attach_info *si, int pnum, int ec,
 
 /**
  * add_corrupted - add a corrupted physical eraseblock.
- * @si: scanning information
+ * @ai: attaching information
  * @pnum: physical eraseblock number to add
  * @ec: erase counter of the physical eraseblock
  *
@@ -148,20 +148,20 @@ static int add_to_list(struct ubi_attach_info *si, int pnum, int ec,
  * The corruption was presumably not caused by a power cut. Returns zero in
  * case of success and a negative error code in case of failure.
  */
-static int add_corrupted(struct ubi_attach_info *si, int pnum, int ec)
+static int add_corrupted(struct ubi_attach_info *ai, int pnum, int ec)
 {
 	struct ubi_ainf_peb *aeb;
 
 	dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
 
-	aeb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
+	aeb = kmem_cache_alloc(ai->scan_leb_slab, GFP_KERNEL);
 	if (!aeb)
 		return -ENOMEM;
 
-	si->corr_peb_count += 1;
+	ai->corr_peb_count += 1;
 	aeb->pnum = pnum;
 	aeb->ec = ec;
-	list_add(&aeb->u.list, &si->corr);
+	list_add(&aeb->u.list, &ai->corr);
 	return 0;
 }
 
@@ -232,24 +232,24 @@ bad:
 }
 
 /**
- * add_volume - add volume to the scanning information.
- * @si: scanning information
+ * add_volume - add volume to the attaching information.
+ * @ai: attaching information
  * @vol_id: ID of the volume to add
  * @pnum: physical eraseblock number
  * @vid_hdr: volume identifier header
  *
  * If the volume corresponding to the @vid_hdr logical eraseblock is already
- * present in the scanning information, this function does nothing. Otherwise
- * it adds corresponding volume to the scanning information. Returns a pointer
+ * present in the attaching information, this function does nothing. Otherwise
+ * it adds corresponding volume to the attaching information. Returns a pointer
  * to the scanning volume object in case of success and a negative error code
  * in case of failure.
  */
-static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *si,
+static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *ai,
 					  int vol_id, int pnum,
 					  const struct ubi_vid_hdr *vid_hdr)
 {
 	struct ubi_ainf_volume *sv;
-	struct rb_node **p = &si->volumes.rb_node, *parent = NULL;
+	struct rb_node **p = &ai->volumes.rb_node, *parent = NULL;
 
 	ubi_assert(vol_id == be32_to_cpu(vid_hdr->vol_id));
 
@@ -280,12 +280,12 @@ static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *si,
 	sv->compat = vid_hdr->compat;
 	sv->vol_type = vid_hdr->vol_type == UBI_VID_DYNAMIC ? UBI_DYNAMIC_VOLUME
 							    : UBI_STATIC_VOLUME;
-	if (vol_id > si->highest_vol_id)
-		si->highest_vol_id = vol_id;
+	if (vol_id > ai->highest_vol_id)
+		ai->highest_vol_id = vol_id;
 
 	rb_link_node(&sv->rb, parent, p);
-	rb_insert_color(&sv->rb, &si->volumes);
-	si->vols_found += 1;
+	rb_insert_color(&sv->rb, &ai->volumes);
+	ai->vols_found += 1;
 	dbg_bld("added volume %d", vol_id);
 	return sv;
 }
@@ -425,9 +425,9 @@ out_free_vidh:
 }
 
 /**
- * ubi_scan_add_used - add physical eraseblock to the scanning information.
+ * ubi_scan_add_used - add physical eraseblock to the attaching information.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  * @pnum: the physical eraseblock number
  * @ec: erase counter
  * @vid_hdr: the volume identifier header
@@ -440,7 +440,7 @@ out_free_vidh:
  * to be picked, while the older one has to be dropped. This function returns
  * zero in case of success and a negative error code in case of failure.
  */
-int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
+int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		      int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
 		      int bitflips)
 {
@@ -457,12 +457,12 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 	dbg_bld("PEB %d, LEB %d:%d, EC %d, sqnum %llu, bitflips %d",
 		pnum, vol_id, lnum, ec, sqnum, bitflips);
 
-	sv = add_volume(si, vol_id, pnum, vid_hdr);
+	sv = add_volume(ai, vol_id, pnum, vid_hdr);
 	if (IS_ERR(sv))
 		return PTR_ERR(sv);
 
-	if (si->max_sqnum < sqnum)
-		si->max_sqnum = sqnum;
+	if (ai->max_sqnum < sqnum)
+		ai->max_sqnum = sqnum;
 
 	/*
 	 * Walk the RB-tree of logical eraseblocks of volume @vol_id to look
@@ -528,8 +528,8 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 			if (err)
 				return err;
 
-			err = add_to_list(si, aeb->pnum, aeb->ec, cmp_res & 4,
-					  &si->erase);
+			err = add_to_list(ai, aeb->pnum, aeb->ec, cmp_res & 4,
+					  &ai->erase);
 			if (err)
 				return err;
 
@@ -549,21 +549,21 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 			 * This logical eraseblock is older than the one found
 			 * previously.
 			 */
-			return add_to_list(si, pnum, ec, cmp_res & 4,
-					   &si->erase);
+			return add_to_list(ai, pnum, ec, cmp_res & 4,
+					   &ai->erase);
 		}
 	}
 
 	/*
 	 * We've met this logical eraseblock for the first time, add it to the
-	 * scanning information.
+	 * attaching information.
 	 */
 
 	err = validate_vid_hdr(vid_hdr, sv, pnum);
 	if (err)
 		return err;
 
-	aeb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
+	aeb = kmem_cache_alloc(ai->scan_leb_slab, GFP_KERNEL);
 	if (!aeb)
 		return -ENOMEM;
 
@@ -586,18 +586,18 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 }
 
 /**
- * ubi_scan_find_sv - find volume in the scanning information.
- * @si: scanning information
+ * ubi_scan_find_sv - find volume in the attaching information.
+ * @ai: attaching information
  * @vol_id: the requested volume ID
  *
  * This function returns a pointer to the volume description or %NULL if there
- * are no data about this volume in the scanning information.
+ * are no data about this volume in the attaching information.
  */
-struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *si,
+struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *ai,
 					 int vol_id)
 {
 	struct ubi_ainf_volume *sv;
-	struct rb_node *p = si->volumes.rb_node;
+	struct rb_node *p = ai->volumes.rb_node;
 
 	while (p) {
 		sv = rb_entry(p, struct ubi_ainf_volume, rb);
@@ -615,8 +615,8 @@ struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *si,
 }
 
 /**
- * ubi_scan_find_aeb - find LEB in the volume scanning information.
- * @sv: a pointer to the volume scanning information
+ * ubi_scan_find_aeb - find LEB in the volume attaching information.
+ * @sv: a pointer to the volume attaching information
  * @lnum: the requested logical eraseblock
  *
  * This function returns a pointer to the scanning logical eraseblock or %NULL
@@ -644,32 +644,32 @@ struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *sv,
 }
 
 /**
- * ubi_scan_rm_volume - delete scanning information about a volume.
- * @si: scanning information
- * @sv: the volume scanning information to delete
+ * ubi_scan_rm_volume - delete attaching information about a volume.
+ * @ai: attaching information
+ * @sv: the volume attaching information to delete
  */
-void ubi_scan_rm_volume(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
+void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *sv)
 {
 	struct rb_node *rb;
 	struct ubi_ainf_peb *aeb;
 
-	dbg_bld("remove scanning information about volume %d", sv->vol_id);
+	dbg_bld("remove attaching information about volume %d", sv->vol_id);
 
 	while ((rb = rb_first(&sv->root))) {
 		aeb = rb_entry(rb, struct ubi_ainf_peb, u.rb);
 		rb_erase(&aeb->u.rb, &sv->root);
-		list_add_tail(&aeb->u.list, &si->erase);
+		list_add_tail(&aeb->u.list, &ai->erase);
 	}
 
-	rb_erase(&sv->rb, &si->volumes);
+	rb_erase(&sv->rb, &ai->volumes);
 	kfree(sv);
-	si->vols_found -= 1;
+	ai->vols_found -= 1;
 }
 
 /**
  * ubi_scan_erase_peb - erase a physical eraseblock.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  * @pnum: physical eraseblock number to erase;
  * @ec: erase counter value to write (%UBI_SCAN_UNKNOWN_EC if it is unknown)
  *
@@ -679,7 +679,7 @@ void ubi_scan_rm_volume(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_attach_info *si,
+int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_attach_info *ai,
 		       int pnum, int ec)
 {
 	int err;
@@ -714,7 +714,7 @@ out_free:
 /**
  * ubi_scan_get_free_peb - get a free physical eraseblock.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  *
  * This function returns a free physical eraseblock. It is supposed to be
  * called on the UBI initialization stages when the wear-leveling sub-system is
@@ -726,13 +726,13 @@ out_free:
  * success and an error code in case of failure.
  */
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
-					   struct ubi_attach_info *si)
+					   struct ubi_attach_info *ai)
 {
 	int err = 0;
 	struct ubi_ainf_peb *aeb, *tmp_aeb;
 
-	if (!list_empty(&si->free)) {
-		aeb = list_entry(si->free.next, struct ubi_ainf_peb, u.list);
+	if (!list_empty(&ai->free)) {
+		aeb = list_entry(ai->free.next, struct ubi_ainf_peb, u.list);
 		list_del(&aeb->u.list);
 		dbg_bld("return free PEB %d, EC %d", aeb->pnum, aeb->ec);
 		return aeb;
@@ -744,11 +744,11 @@ struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 	 * so forth. We don't want to take care about bad eraseblocks here -
 	 * they'll be handled later.
 	 */
-	list_for_each_entry_safe(aeb, tmp_aeb, &si->erase, u.list) {
+	list_for_each_entry_safe(aeb, tmp_aeb, &ai->erase, u.list) {
 		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
-			aeb->ec = si->mean_ec;
+			aeb->ec = ai->mean_ec;
 
-		err = ubi_scan_erase_peb(ubi, si, aeb->pnum, aeb->ec+1);
+		err = ubi_scan_erase_peb(ubi, ai, aeb->pnum, aeb->ec+1);
 		if (err)
 			continue;
 
@@ -823,15 +823,15 @@ out_unlock:
 }
 
 /**
- * process_eb - read, check UBI headers, and add them to scanning information.
+ * process_eb - read, check UBI headers, and add them to attaching information.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  * @pnum: the physical eraseblock number
  *
  * This function returns a zero if the physical eraseblock was successfully
  * handled and a negative error code in case of failure.
  */
-static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *si,
+static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		      int pnum)
 {
 	long long uninitialized_var(ec);
@@ -849,7 +849,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *si,
 		 * initialize this, but MTD does not provide enough
 		 * information.
 		 */
-		si->bad_peb_count += 1;
+		ai->bad_peb_count += 1;
 		return 0;
 	}
 
@@ -863,13 +863,13 @@ static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *si,
 		bitflips = 1;
 		break;
 	case UBI_IO_FF:
-		si->empty_peb_count += 1;
-		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, 0,
-				   &si->erase);
+		ai->empty_peb_count += 1;
+		return add_to_list(ai, pnum, UBI_SCAN_UNKNOWN_EC, 0,
+				   &ai->erase);
 	case UBI_IO_FF_BITFLIPS:
-		si->empty_peb_count += 1;
-		return add_to_list(si, pnum, UBI_SCAN_UNKNOWN_EC, 1,
-				   &si->erase);
+		ai->empty_peb_count += 1;
+		return add_to_list(ai, pnum, UBI_SCAN_UNKNOWN_EC, 1,
+				   &ai->erase);
 	case UBI_IO_BAD_HDR_EBADMSG:
 	case UBI_IO_BAD_HDR:
 		/*
@@ -953,7 +953,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *si,
 			 * PEB, bit it is not marked as bad yet. This may also
 			 * be a result of power cut during erasure.
 			 */
-			si->maybe_bad_peb_count += 1;
+			ai->maybe_bad_peb_count += 1;
 	case UBI_IO_BAD_HDR:
 		if (ec_err)
 			/*
@@ -980,23 +980,23 @@ static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *si,
 			return err;
 		else if (!err)
 			/* This corruption is caused by a power cut */
-			err = add_to_list(si, pnum, ec, 1, &si->erase);
+			err = add_to_list(ai, pnum, ec, 1, &ai->erase);
 		else
 			/* This is an unexpected corruption */
-			err = add_corrupted(si, pnum, ec);
+			err = add_corrupted(ai, pnum, ec);
 		if (err)
 			return err;
 		goto adjust_mean_ec;
 	case UBI_IO_FF_BITFLIPS:
-		err = add_to_list(si, pnum, ec, 1, &si->erase);
+		err = add_to_list(ai, pnum, ec, 1, &ai->erase);
 		if (err)
 			return err;
 		goto adjust_mean_ec;
 	case UBI_IO_FF:
 		if (ec_err)
-			err = add_to_list(si, pnum, ec, 1, &si->erase);
+			err = add_to_list(ai, pnum, ec, 1, &ai->erase);
 		else
-			err = add_to_list(si, pnum, ec, 0, &si->free);
+			err = add_to_list(ai, pnum, ec, 0, &ai->free);
 		if (err)
 			return err;
 		goto adjust_mean_ec;
@@ -1015,7 +1015,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *si,
 		case UBI_COMPAT_DELETE:
 			ubi_msg("\"delete\" compatible internal volume %d:%d"
 				" found, will remove it", vol_id, lnum);
-			err = add_to_list(si, pnum, ec, 1, &si->erase);
+			err = add_to_list(ai, pnum, ec, 1, &ai->erase);
 			if (err)
 				return err;
 			return 0;
@@ -1030,7 +1030,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *si,
 		case UBI_COMPAT_PRESERVE:
 			ubi_msg("\"preserve\" compatible internal volume %d:%d"
 				" found", vol_id, lnum);
-			err = add_to_list(si, pnum, ec, 0, &si->alien);
+			err = add_to_list(ai, pnum, ec, 0, &ai->alien);
 			if (err)
 				return err;
 			return 0;
@@ -1045,18 +1045,18 @@ static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *si,
 	if (ec_err)
 		ubi_warn("valid VID header but corrupted EC header at PEB %d",
 			 pnum);
-	err = ubi_scan_add_used(ubi, si, pnum, ec, vidh, bitflips);
+	err = ubi_scan_add_used(ubi, ai, pnum, ec, vidh, bitflips);
 	if (err)
 		return err;
 
 adjust_mean_ec:
 	if (!ec_err) {
-		si->ec_sum += ec;
-		si->ec_count += 1;
-		if (ec > si->max_ec)
-			si->max_ec = ec;
-		if (ec < si->min_ec)
-			si->min_ec = ec;
+		ai->ec_sum += ec;
+		ai->ec_count += 1;
+		if (ec > ai->max_ec)
+			ai->max_ec = ec;
+		if (ec < ai->min_ec)
+			ai->min_ec = ec;
 	}
 
 	return 0;
@@ -1065,7 +1065,7 @@ adjust_mean_ec:
 /**
  * check_what_we_have - check what PEB were found by scanning.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  *
  * This is a helper function which takes a look what PEBs were found by
  * scanning, and decides whether the flash is empty and should be formatted and
@@ -1074,12 +1074,12 @@ adjust_mean_ec:
  * and %-EINVAL if we should not.
  */
 static int check_what_we_have(struct ubi_device *ubi,
-			      struct ubi_attach_info *si)
+			      struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb;
 	int max_corr, peb_count;
 
-	peb_count = ubi->peb_count - si->bad_peb_count - si->alien_peb_count;
+	peb_count = ubi->peb_count - ai->bad_peb_count - ai->alien_peb_count;
 	max_corr = peb_count / 20 ?: 8;
 
 	/*
@@ -1087,11 +1087,11 @@ static int check_what_we_have(struct ubi_device *ubi,
 	 * unclean reboots. However, many of them may indicate some problems
 	 * with the flash HW or driver.
 	 */
-	if (si->corr_peb_count) {
+	if (ai->corr_peb_count) {
 		ubi_err("%d PEBs are corrupted and preserved",
-			si->corr_peb_count);
+			ai->corr_peb_count);
 		printk(KERN_ERR "Corrupted PEBs are:");
-		list_for_each_entry(aeb, &si->corr, u.list)
+		list_for_each_entry(aeb, &ai->corr, u.list)
 			printk(KERN_CONT " %d", aeb->pnum);
 		printk(KERN_CONT "\n");
 
@@ -1099,13 +1099,13 @@ static int check_what_we_have(struct ubi_device *ubi,
 		 * If too many PEBs are corrupted, we refuse attaching,
 		 * otherwise, only print a warning.
 		 */
-		if (si->corr_peb_count >= max_corr) {
+		if (ai->corr_peb_count >= max_corr) {
 			ubi_err("too many corrupted PEBs, refusing");
 			return -EINVAL;
 		}
 	}
 
-	if (si->empty_peb_count + si->maybe_bad_peb_count == peb_count) {
+	if (ai->empty_peb_count + ai->maybe_bad_peb_count == peb_count) {
 		/*
 		 * All PEBs are empty, or almost all - a couple PEBs look like
 		 * they may be bad PEBs which were not marked as bad yet.
@@ -1121,8 +1121,8 @@ static int check_what_we_have(struct ubi_device *ubi,
 		 * 2. Flash contains non-UBI data and we do not want to format
 		 *    it and destroy possibly important information.
 		 */
-		if (si->maybe_bad_peb_count <= 2) {
-			si->is_empty = 1;
+		if (ai->maybe_bad_peb_count <= 2) {
+			ai->is_empty = 1;
 			ubi_msg("empty MTD device detected");
 			get_random_bytes(&ubi->image_seq,
 					 sizeof(ubi->image_seq));
@@ -1150,28 +1150,28 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 	struct rb_node *rb1, *rb2;
 	struct ubi_ainf_volume *sv;
 	struct ubi_ainf_peb *aeb;
-	struct ubi_attach_info *si;
+	struct ubi_attach_info *ai;
 
-	si = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
-	if (!si)
+	ai = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
+	if (!ai)
 		return ERR_PTR(-ENOMEM);
 
-	INIT_LIST_HEAD(&si->corr);
-	INIT_LIST_HEAD(&si->free);
-	INIT_LIST_HEAD(&si->erase);
-	INIT_LIST_HEAD(&si->alien);
-	si->volumes = RB_ROOT;
+	INIT_LIST_HEAD(&ai->corr);
+	INIT_LIST_HEAD(&ai->free);
+	INIT_LIST_HEAD(&ai->erase);
+	INIT_LIST_HEAD(&ai->alien);
+	ai->volumes = RB_ROOT;
 
 	err = -ENOMEM;
-	si->scan_leb_slab = kmem_cache_create("ubi_scan_leb_slab",
+	ai->scan_leb_slab = kmem_cache_create("ubi_scan_leb_slab",
 					      sizeof(struct ubi_ainf_peb),
 					      0, 0, NULL);
-	if (!si->scan_leb_slab)
-		goto out_si;
+	if (!ai->scan_leb_slab)
+		goto out_ai;
 
 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
 	if (!ech)
-		goto out_si;
+		goto out_ai;
 
 	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
 	if (!vidh)
@@ -1181,7 +1181,7 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 		cond_resched();
 
 		dbg_gen("process PEB %d", pnum);
-		err = process_eb(ubi, si, pnum);
+		err = process_eb(ubi, ai, pnum);
 		if (err < 0)
 			goto out_vidh;
 	}
@@ -1189,10 +1189,10 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 	dbg_msg("scanning is finished");
 
 	/* Calculate mean erase counter */
-	if (si->ec_count)
-		si->mean_ec = div_u64(si->ec_sum, si->ec_count);
+	if (ai->ec_count)
+		ai->mean_ec = div_u64(ai->ec_sum, ai->ec_count);
 
-	err = check_what_we_have(ubi, si);
+	err = check_what_we_have(ubi, ai);
 	if (err)
 		goto out_vidh;
 
@@ -1200,52 +1200,52 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 	 * In case of unknown erase counter we use the mean erase counter
 	 * value.
 	 */
-	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb) {
+	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb) {
 		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb)
 			if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
-				aeb->ec = si->mean_ec;
+				aeb->ec = ai->mean_ec;
 	}
 
-	list_for_each_entry(aeb, &si->free, u.list) {
+	list_for_each_entry(aeb, &ai->free, u.list) {
 		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
-			aeb->ec = si->mean_ec;
+			aeb->ec = ai->mean_ec;
 	}
 
-	list_for_each_entry(aeb, &si->corr, u.list)
+	list_for_each_entry(aeb, &ai->corr, u.list)
 		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
-			aeb->ec = si->mean_ec;
+			aeb->ec = ai->mean_ec;
 
-	list_for_each_entry(aeb, &si->erase, u.list)
+	list_for_each_entry(aeb, &ai->erase, u.list)
 		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
-			aeb->ec = si->mean_ec;
+			aeb->ec = ai->mean_ec;
 
-	err = self_check_si(ubi, si);
+	err = self_check_ai(ubi, ai);
 	if (err)
 		goto out_vidh;
 
 	ubi_free_vid_hdr(ubi, vidh);
 	kfree(ech);
 
-	return si;
+	return ai;
 
 out_vidh:
 	ubi_free_vid_hdr(ubi, vidh);
 out_ech:
 	kfree(ech);
-out_si:
-	ubi_scan_destroy_si(si);
+out_ai:
+	ubi_scan_destroy_ai(ai);
 	return ERR_PTR(err);
 }
 
 /**
  * destroy_sv - free the scanning volume information
  * @sv: scanning volume information
- * @si: scanning information
+ * @ai: attaching information
  *
  * This function destroys the volume RB-tree (@sv->root) and the scanning
  * volume information.
  */
-static void destroy_sv(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
+static void destroy_sv(struct ubi_attach_info *ai, struct ubi_ainf_volume *sv)
 {
 	struct ubi_ainf_peb *aeb;
 	struct rb_node *this = sv->root.rb_node;
@@ -1265,41 +1265,41 @@ static void destroy_sv(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
 					this->rb_right = NULL;
 			}
 
-			kmem_cache_free(si->scan_leb_slab, aeb);
+			kmem_cache_free(ai->scan_leb_slab, aeb);
 		}
 	}
 	kfree(sv);
 }
 
 /**
- * ubi_scan_destroy_si - destroy scanning information.
- * @si: scanning information
+ * ubi_scan_destroy_ai - destroy attaching information.
+ * @ai: attaching information
  */
-void ubi_scan_destroy_si(struct ubi_attach_info *si)
+void ubi_scan_destroy_ai(struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb, *aeb_tmp;
 	struct ubi_ainf_volume *sv;
 	struct rb_node *rb;
 
-	list_for_each_entry_safe(aeb, aeb_tmp, &si->alien, u.list) {
+	list_for_each_entry_safe(aeb, aeb_tmp, &ai->alien, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(si->scan_leb_slab, aeb);
+		kmem_cache_free(ai->scan_leb_slab, aeb);
 	}
-	list_for_each_entry_safe(aeb, aeb_tmp, &si->erase, u.list) {
+	list_for_each_entry_safe(aeb, aeb_tmp, &ai->erase, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(si->scan_leb_slab, aeb);
+		kmem_cache_free(ai->scan_leb_slab, aeb);
 	}
-	list_for_each_entry_safe(aeb, aeb_tmp, &si->corr, u.list) {
+	list_for_each_entry_safe(aeb, aeb_tmp, &ai->corr, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(si->scan_leb_slab, aeb);
+		kmem_cache_free(ai->scan_leb_slab, aeb);
 	}
-	list_for_each_entry_safe(aeb, aeb_tmp, &si->free, u.list) {
+	list_for_each_entry_safe(aeb, aeb_tmp, &ai->free, u.list) {
 		list_del(&aeb->u.list);
-		kmem_cache_free(si->scan_leb_slab, aeb);
+		kmem_cache_free(ai->scan_leb_slab, aeb);
 	}
 
 	/* Destroy the volume RB-tree */
-	rb = si->volumes.rb_node;
+	rb = ai->volumes.rb_node;
 	while (rb) {
 		if (rb->rb_left)
 			rb = rb->rb_left;
@@ -1316,25 +1316,25 @@ void ubi_scan_destroy_si(struct ubi_attach_info *si)
 					rb->rb_right = NULL;
 			}
 
-			destroy_sv(si, sv);
+			destroy_sv(ai, sv);
 		}
 	}
 
-	if (si->scan_leb_slab)
-		kmem_cache_destroy(si->scan_leb_slab);
+	if (ai->scan_leb_slab)
+		kmem_cache_destroy(ai->scan_leb_slab);
 
-	kfree(si);
+	kfree(ai);
 }
 
 /**
- * self_check_si - check the scanning information.
+ * self_check_ai - check the attaching information.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  *
- * This function returns zero if the scanning information is all right, and a
+ * This function returns zero if the attaching information is all right, and a
  * negative error code if not or if an error occurred.
  */
-static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
+static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int pnum, err, vols_found = 0;
 	struct rb_node *rb1, *rb2;
@@ -1346,16 +1346,16 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 		return 0;
 
 	/*
-	 * At first, check that scanning information is OK.
+	 * At first, check that attaching information is OK.
 	 */
-	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb) {
+	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb) {
 		int leb_count = 0;
 
 		cond_resched();
 
 		vols_found += 1;
 
-		if (si->is_empty) {
+		if (ai->is_empty) {
 			ubi_err("bad is_empty flag");
 			goto bad_sv;
 		}
@@ -1373,9 +1373,9 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 			goto bad_sv;
 		}
 
-		if (sv->vol_id > si->highest_vol_id) {
+		if (sv->vol_id > ai->highest_vol_id) {
 			ubi_err("highest_vol_id is %d, but vol_id %d is there",
-				si->highest_vol_id, sv->vol_id);
+				ai->highest_vol_id, sv->vol_id);
 			goto out;
 		}
 
@@ -1402,15 +1402,15 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 				goto bad_aeb;
 			}
 
-			if (aeb->ec < si->min_ec) {
-				ubi_err("bad si->min_ec (%d), %d found",
-					si->min_ec, aeb->ec);
+			if (aeb->ec < ai->min_ec) {
+				ubi_err("bad ai->min_ec (%d), %d found",
+					ai->min_ec, aeb->ec);
 				goto bad_aeb;
 			}
 
-			if (aeb->ec > si->max_ec) {
-				ubi_err("bad si->max_ec (%d), %d found",
-					si->max_ec, aeb->ec);
+			if (aeb->ec > ai->max_ec) {
+				ubi_err("bad ai->max_ec (%d), %d found",
+					ai->max_ec, aeb->ec);
 				goto bad_aeb;
 			}
 
@@ -1455,14 +1455,14 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 		}
 	}
 
-	if (vols_found != si->vols_found) {
-		ubi_err("bad si->vols_found %d, should be %d",
-			si->vols_found, vols_found);
+	if (vols_found != ai->vols_found) {
+		ubi_err("bad ai->vols_found %d, should be %d",
+			ai->vols_found, vols_found);
 		goto out;
 	}
 
-	/* Check that scanning information is correct */
-	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb) {
+	/* Check that attaching information is correct */
+	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb) {
 		last_aeb = NULL;
 		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb) {
 			int vol_type;
@@ -1548,20 +1548,20 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 			buf[pnum] = 1;
 	}
 
-	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb)
+	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb)
 		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb)
 			buf[aeb->pnum] = 1;
 
-	list_for_each_entry(aeb, &si->free, u.list)
+	list_for_each_entry(aeb, &ai->free, u.list)
 		buf[aeb->pnum] = 1;
 
-	list_for_each_entry(aeb, &si->corr, u.list)
+	list_for_each_entry(aeb, &ai->corr, u.list)
 		buf[aeb->pnum] = 1;
 
-	list_for_each_entry(aeb, &si->erase, u.list)
+	list_for_each_entry(aeb, &ai->erase, u.list)
 		buf[aeb->pnum] = 1;
 
-	list_for_each_entry(aeb, &si->alien, u.list)
+	list_for_each_entry(aeb, &ai->alien, u.list)
 		buf[aeb->pnum] = 1;
 
 	err = 0;
@@ -1577,18 +1577,18 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 	return 0;
 
 bad_aeb:
-	ubi_err("bad scanning information about LEB %d", aeb->lnum);
+	ubi_err("bad attaching information about LEB %d", aeb->lnum);
 	ubi_dump_aeb(aeb, 0);
 	ubi_dump_sv(sv);
 	goto out;
 
 bad_sv:
-	ubi_err("bad scanning information about volume %d", sv->vol_id);
+	ubi_err("bad attaching information about volume %d", sv->vol_id);
 	ubi_dump_sv(sv);
 	goto out;
 
 bad_vid_hdr:
-	ubi_err("bad scanning information about volume %d", sv->vol_id);
+	ubi_err("bad attaching information about volume %d", sv->vol_id);
 	ubi_dump_sv(sv);
 	ubi_dump_vid_hdr(vidh);
 
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 7e20a85..0f0725e 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -145,7 +145,7 @@ struct ubi_vid_hdr;
 /*
  * ubi_scan_move_to_list - move a PEB from the volume tree to a list.
  *
- * @sv: volume scanning information
+ * @sv: volume attaching information
  * @aeb: scanning eraseblock information
  * @list: the list to move to
  */
@@ -157,19 +157,19 @@ static inline void ubi_scan_move_to_list(struct ubi_ainf_volume *sv,
 		list_add_tail(&aeb->u.list, list);
 }
 
-int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
+int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		      int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
 		      int bitflips);
-struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *si,
+struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *ai,
 					 int vol_id);
 struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *sv,
 				       int lnum);
-void ubi_scan_rm_volume(struct ubi_attach_info *si, struct ubi_ainf_volume *sv);
+void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *sv);
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
-					   struct ubi_attach_info *si);
-int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_attach_info *si,
+					   struct ubi_attach_info *ai);
+int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_attach_info *ai,
 		       int pnum, int ec);
 struct ubi_attach_info *ubi_scan(struct ubi_device *ubi);
-void ubi_scan_destroy_si(struct ubi_attach_info *si);
+void ubi_scan_destroy_ai(struct ubi_attach_info *ai);
 
 #endif /* !__UBI_SCAN_H__ */
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 0f20651..faaf729 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -489,7 +489,7 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 			   struct ubi_vtbl_record *vtbl_rec);
 int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
 			    struct list_head *rename_list);
-int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *si);
+int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *ai);
 
 /* vmt.c */
 int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req);
@@ -529,14 +529,14 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 			      int lnum, const void *buf, int len);
 int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		     struct ubi_vid_hdr *vid_hdr);
-int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si);
+int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai);
 
 /* wl.c */
 int ubi_wl_get_peb(struct ubi_device *ubi);
 int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture);
 int ubi_wl_flush(struct ubi_device *ubi);
 int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
-int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si);
+int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai);
 void ubi_wl_close(struct ubi_device *ubi);
 int ubi_thread(void *u);
 
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 800958d..3e5363c 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -291,14 +291,14 @@ bad:
 /**
  * create_vtbl - create a copy of volume table.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  * @copy: number of the volume table copy
  * @vtbl: contents of the volume table
  *
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-static int create_vtbl(struct ubi_device *ubi, struct ubi_attach_info *si,
+static int create_vtbl(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		       int copy, void *vtbl)
 {
 	int err, tries = 0;
@@ -312,7 +312,7 @@ static int create_vtbl(struct ubi_device *ubi, struct ubi_attach_info *si,
 		return -ENOMEM;
 
 retry:
-	new_aeb = ubi_scan_get_free_peb(ubi, si);
+	new_aeb = ubi_scan_get_free_peb(ubi, ai);
 	if (IS_ERR(new_aeb)) {
 		err = PTR_ERR(new_aeb);
 		goto out_free;
@@ -324,7 +324,7 @@ retry:
 	vid_hdr->data_size = vid_hdr->used_ebs =
 			     vid_hdr->data_pad = cpu_to_be32(0);
 	vid_hdr->lnum = cpu_to_be32(copy);
-	vid_hdr->sqnum = cpu_to_be64(++si->max_sqnum);
+	vid_hdr->sqnum = cpu_to_be64(++ai->max_sqnum);
 
 	/* The EC header is already there, write the VID header */
 	err = ubi_io_write_vid_hdr(ubi, new_aeb->pnum, vid_hdr);
@@ -337,10 +337,10 @@ retry:
 		goto write_error;
 
 	/*
-	 * And add it to the scanning information. Don't delete the old version
+	 * And add it to the attaching information. Don't delete the old version
 	 * of this LEB as it will be deleted and freed in 'ubi_scan_add_used()'.
 	 */
-	err = ubi_scan_add_used(ubi, si, new_aeb->pnum, new_aeb->ec,
+	err = ubi_scan_add_used(ubi, ai, new_aeb->pnum, new_aeb->ec,
 				vid_hdr, 0);
 	kfree(new_aeb);
 	ubi_free_vid_hdr(ubi, vid_hdr);
@@ -352,7 +352,7 @@ write_error:
 		 * Probably this physical eraseblock went bad, try to pick
 		 * another one.
 		 */
-		list_add(&new_aeb->u.list, &si->erase);
+		list_add(&new_aeb->u.list, &ai->erase);
 		goto retry;
 	}
 	kfree(new_aeb);
@@ -365,15 +365,15 @@ out_free:
 /**
  * process_lvol - process the layout volume.
  * @ubi: UBI device description object
- * @si: scanning information
- * @sv: layout volume scanning information
+ * @ai: attaching information
+ * @sv: layout volume attaching information
  *
  * This function is responsible for reading the layout volume, ensuring it is
  * not corrupted, and recovering from corruptions if needed. Returns volume
  * table in case of success and a negative error code in case of failure.
  */
 static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
-					    struct ubi_attach_info *si,
+					    struct ubi_attach_info *ai,
 					    struct ubi_ainf_volume *sv)
 {
 	int err;
@@ -449,7 +449,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 						  ubi->vtbl_size);
 		if (leb_corrupted[1]) {
 			ubi_warn("volume table copy #2 is corrupted");
-			err = create_vtbl(ubi, si, 1, leb[0]);
+			err = create_vtbl(ubi, ai, 1, leb[0]);
 			if (err)
 				goto out_free;
 			ubi_msg("volume table was restored");
@@ -472,7 +472,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 		}
 
 		ubi_warn("volume table copy #1 is corrupted");
-		err = create_vtbl(ubi, si, 0, leb[1]);
+		err = create_vtbl(ubi, ai, 0, leb[1]);
 		if (err)
 			goto out_free;
 		ubi_msg("volume table was restored");
@@ -490,13 +490,13 @@ out_free:
 /**
  * create_empty_lvol - create empty layout volume.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  *
  * This function returns volume table contents in case of success and a
  * negative error code in case of failure.
  */
 static struct ubi_vtbl_record *create_empty_lvol(struct ubi_device *ubi,
-						 struct ubi_attach_info *si)
+						 struct ubi_attach_info *ai)
 {
 	int i;
 	struct ubi_vtbl_record *vtbl;
@@ -511,7 +511,7 @@ static struct ubi_vtbl_record *create_empty_lvol(struct ubi_device *ubi,
 	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
 		int err;
 
-		err = create_vtbl(ubi, si, i, vtbl);
+		err = create_vtbl(ubi, ai, i, vtbl);
 		if (err) {
 			vfree(vtbl);
 			return ERR_PTR(err);
@@ -524,7 +524,7 @@ static struct ubi_vtbl_record *create_empty_lvol(struct ubi_device *ubi,
 /**
  * init_volumes - initialize volume information for existing volumes.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: scanning information
  * @vtbl: volume table
  *
  * This function allocates volume description objects for existing volumes.
@@ -532,7 +532,7 @@ static struct ubi_vtbl_record *create_empty_lvol(struct ubi_device *ubi,
  * failure.
  */
 static int init_volumes(struct ubi_device *ubi,
-			const struct ubi_attach_info *si,
+			const struct ubi_attach_info *ai,
 			const struct ubi_vtbl_record *vtbl)
 {
 	int i, reserved_pebs = 0;
@@ -592,7 +592,7 @@ static int init_volumes(struct ubi_device *ubi,
 		}
 
 		/* Static volumes only */
-		sv = ubi_scan_find_sv(si, i);
+		sv = ubi_scan_find_sv(ai, i);
 		if (!sv) {
 			/*
 			 * No eraseblocks belonging to this volume found. We
@@ -661,11 +661,11 @@ static int init_volumes(struct ubi_device *ubi,
 }
 
 /**
- * check_sv - check volume scanning information.
+ * check_sv - check volume attaching information.
  * @vol: UBI volume description object
- * @sv: volume scanning information
+ * @sv: volume attaching information
  *
- * This function returns zero if the volume scanning information is consistent
+ * This function returns zero if the volume attaching information is consistent
  * to the data read from the volume tabla, and %-EINVAL if not.
  */
 static int check_sv(const struct ubi_volume *vol,
@@ -696,50 +696,50 @@ static int check_sv(const struct ubi_volume *vol,
 	return 0;
 
 bad:
-	ubi_err("bad scanning information, error %d", err);
+	ubi_err("bad attaching information, error %d", err);
 	ubi_dump_sv(sv);
 	ubi_dump_vol_info(vol);
 	return -EINVAL;
 }
 
 /**
- * check_scanning_info - check that scanning information.
+ * check_scanning_info - check that attaching information.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  *
  * Even though we protect on-flash data by CRC checksums, we still don't trust
- * the media. This function ensures that scanning information is consistent to
+ * the media. This function ensures that attaching information is consistent to
  * the information read from the volume table. Returns zero if the scanning
  * information is OK and %-EINVAL if it is not.
  */
 static int check_scanning_info(const struct ubi_device *ubi,
-			       struct ubi_attach_info *si)
+			       struct ubi_attach_info *ai)
 {
 	int err, i;
 	struct ubi_ainf_volume *sv;
 	struct ubi_volume *vol;
 
-	if (si->vols_found > UBI_INT_VOL_COUNT + ubi->vtbl_slots) {
+	if (ai->vols_found > UBI_INT_VOL_COUNT + ubi->vtbl_slots) {
 		ubi_err("scanning found %d volumes, maximum is %d + %d",
-			si->vols_found, UBI_INT_VOL_COUNT, ubi->vtbl_slots);
+			ai->vols_found, UBI_INT_VOL_COUNT, ubi->vtbl_slots);
 		return -EINVAL;
 	}
 
-	if (si->highest_vol_id >= ubi->vtbl_slots + UBI_INT_VOL_COUNT &&
-	    si->highest_vol_id < UBI_INTERNAL_VOL_START) {
+	if (ai->highest_vol_id >= ubi->vtbl_slots + UBI_INT_VOL_COUNT &&
+	    ai->highest_vol_id < UBI_INTERNAL_VOL_START) {
 		ubi_err("too large volume ID %d found by scanning",
-			si->highest_vol_id);
+			ai->highest_vol_id);
 		return -EINVAL;
 	}
 
 	for (i = 0; i < ubi->vtbl_slots + UBI_INT_VOL_COUNT; i++) {
 		cond_resched();
 
-		sv = ubi_scan_find_sv(si, i);
+		sv = ubi_scan_find_sv(ai, i);
 		vol = ubi->volumes[i];
 		if (!vol) {
 			if (sv)
-				ubi_scan_rm_volume(si, sv);
+				ubi_scan_rm_volume(ai, sv);
 			continue;
 		}
 
@@ -757,7 +757,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
 			 * these eraseblocks.
 			 */
 			ubi_msg("finish volume %d removal", sv->vol_id);
-			ubi_scan_rm_volume(si, sv);
+			ubi_scan_rm_volume(ai, sv);
 		} else if (sv) {
 			err = check_sv(vol, sv);
 			if (err)
@@ -771,13 +771,13 @@ static int check_scanning_info(const struct ubi_device *ubi,
 /**
  * ubi_read_volume_table - read the volume table.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  *
  * This function reads volume table, checks it, recover from errors if needed,
  * or creates it if needed. Returns zero in case of success and a negative
  * error code in case of failure.
  */
-int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *si)
+int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int i, err;
 	struct ubi_ainf_volume *sv;
@@ -795,7 +795,7 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *si)
 	ubi->vtbl_size = ubi->vtbl_slots * UBI_VTBL_RECORD_SIZE;
 	ubi->vtbl_size = ALIGN(ubi->vtbl_size, ubi->min_io_size);
 
-	sv = ubi_scan_find_sv(si, UBI_LAYOUT_VOLUME_ID);
+	sv = ubi_scan_find_sv(ai, UBI_LAYOUT_VOLUME_ID);
 	if (!sv) {
 		/*
 		 * No logical eraseblocks belonging to the layout volume were
@@ -805,8 +805,8 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *si)
 		 * But if flash is not empty this must be a corruption or the
 		 * MTD device just contains garbage.
 		 */
-		if (si->is_empty) {
-			ubi->vtbl = create_empty_lvol(ubi, si);
+		if (ai->is_empty) {
+			ubi->vtbl = create_empty_lvol(ubi, ai);
 			if (IS_ERR(ubi->vtbl))
 				return PTR_ERR(ubi->vtbl);
 		} else {
@@ -821,7 +821,7 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *si)
 			return -EINVAL;
 		}
 
-		ubi->vtbl = process_lvol(ubi, si, sv);
+		ubi->vtbl = process_lvol(ubi, ai, sv);
 		if (IS_ERR(ubi->vtbl))
 			return PTR_ERR(ubi->vtbl);
 	}
@@ -832,15 +832,15 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *si)
 	 * The layout volume is OK, initialize the corresponding in-RAM data
 	 * structures.
 	 */
-	err = init_volumes(ubi, si, ubi->vtbl);
+	err = init_volumes(ubi, ai, ubi->vtbl);
 	if (err)
 		goto out_free;
 
 	/*
-	 * Make sure that the scanning information is consistent to the
+	 * Make sure that the attaching information is consistent to the
 	 * information stored in the volume table.
 	 */
-	err = check_scanning_info(ubi, si);
+	err = check_scanning_info(ubi, ai);
 	if (err)
 		goto out_free;
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index fb870f4..992240d 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1373,14 +1373,14 @@ static void cancel_pending(struct ubi_device *ubi)
 }
 
 /**
- * ubi_wl_init_scan - initialize the WL sub-system using scanning information.
+ * ubi_wl_init_scan - initialize the WL sub-system using attaching information.
  * @ubi: UBI device description object
- * @si: scanning information
+ * @ai: attaching information
  *
  * This function returns zero in case of success, and a negative error code in
  * case of failure.
  */
-int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
+int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int err, i;
 	struct rb_node *rb1, *rb2;
@@ -1392,7 +1392,7 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 	spin_lock_init(&ubi->wl_lock);
 	mutex_init(&ubi->move_mutex);
 	init_rwsem(&ubi->work_sem);
-	ubi->max_ec = si->max_ec;
+	ubi->max_ec = ai->max_ec;
 	INIT_LIST_HEAD(&ubi->works);
 
 	sprintf(ubi->bgt_name, UBI_BGT_NAME_PATTERN, ubi->ubi_num);
@@ -1406,7 +1406,7 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 		INIT_LIST_HEAD(&ubi->pq[i]);
 	ubi->pq_head = 0;
 
-	list_for_each_entry_safe(aeb, tmp, &si->erase, u.list) {
+	list_for_each_entry_safe(aeb, tmp, &ai->erase, u.list) {
 		cond_resched();
 
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
@@ -1422,7 +1422,7 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 		}
 	}
 
-	list_for_each_entry(aeb, &si->free, u.list) {
+	list_for_each_entry(aeb, &ai->free, u.list) {
 		cond_resched();
 
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
@@ -1436,7 +1436,7 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 		ubi->lookuptbl[e->pnum] = e;
 	}
 
-	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb) {
+	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb) {
 		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb) {
 			cond_resched();
 
-- 
1.7.10
