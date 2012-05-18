Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxk-0005YM-IE
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:33 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/22] UBI: rename sv to av
Date: Fri, 18 May 2012 14:03:50 +0300
Message-Id: <1337339045-8199-8-git-send-email-dedekind1@gmail.com>
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

After re-naming the 'struct ubi_scan_volume' we should adjust all variables
named 'sv' to something else, because 'sv' stands for "scanning volume".
Let's rename it to 'av' which stands for "attaching volume" which is
a bit more consistent and has the same length, which makes re-naming easy.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.c |   22 ++---
 drivers/mtd/ubi/debug.h |    2 +-
 drivers/mtd/ubi/eba.c   |   10 +-
 drivers/mtd/ubi/scan.c  |  240 +++++++++++++++++++++++------------------------
 drivers/mtd/ubi/scan.h  |   12 +--
 drivers/mtd/ubi/vtbl.c  |   72 +++++++-------
 drivers/mtd/ubi/wl.c    |    6 +-
 7 files changed, 182 insertions(+), 182 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 84362a8..9f957c2 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -171,20 +171,20 @@ void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)
 }
 
 /**
- * ubi_dump_sv - dump a &struct ubi_ainf_volume object.
- * @sv: the object to dump
+ * ubi_dump_av - dump a &struct ubi_ainf_volume object.
+ * @av: the object to dump
  */
-void ubi_dump_sv(const struct ubi_ainf_volume *sv)
+void ubi_dump_av(const struct ubi_ainf_volume *av)
 {
 	printk(KERN_DEBUG "Volume attaching information dump:\n");
-	printk(KERN_DEBUG "\tvol_id         %d\n", sv->vol_id);
-	printk(KERN_DEBUG "\thighest_lnum   %d\n", sv->highest_lnum);
-	printk(KERN_DEBUG "\tleb_count      %d\n", sv->leb_count);
-	printk(KERN_DEBUG "\tcompat         %d\n", sv->compat);
-	printk(KERN_DEBUG "\tvol_type       %d\n", sv->vol_type);
-	printk(KERN_DEBUG "\tused_ebs       %d\n", sv->used_ebs);
-	printk(KERN_DEBUG "\tlast_data_size %d\n", sv->last_data_size);
-	printk(KERN_DEBUG "\tdata_pad       %d\n", sv->data_pad);
+	printk(KERN_DEBUG "\tvol_id         %d\n", av->vol_id);
+	printk(KERN_DEBUG "\thighest_lnum   %d\n", av->highest_lnum);
+	printk(KERN_DEBUG "\tleb_count      %d\n", av->leb_count);
+	printk(KERN_DEBUG "\tcompat         %d\n", av->compat);
+	printk(KERN_DEBUG "\tvol_type       %d\n", av->vol_type);
+	printk(KERN_DEBUG "\tused_ebs       %d\n", av->used_ebs);
+	printk(KERN_DEBUG "\tlast_data_size %d\n", av->last_data_size);
+	printk(KERN_DEBUG "\tdata_pad       %d\n", av->data_pad);
 }
 
 /**
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index a0911c0..d5d2645 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -59,7 +59,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 
 void ubi_dump_vol_info(const struct ubi_volume *vol);
 void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
-void ubi_dump_sv(const struct ubi_ainf_volume *sv);
+void ubi_dump_av(const struct ubi_ainf_volume *av);
 void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type);
 void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset,
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 3203727..572281a 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1215,7 +1215,7 @@ static void print_rsvd_warning(struct ubi_device *ubi,
 int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int i, j, err, num_volumes;
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct ubi_volume *vol;
 	struct ubi_ainf_peb *aeb;
 	struct rb_node *rb;
@@ -1246,17 +1246,17 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		for (j = 0; j < vol->reserved_pebs; j++)
 			vol->eba_tbl[j] = UBI_LEB_UNMAPPED;
 
-		sv = ubi_scan_find_sv(ai, idx2vol_id(ubi, i));
-		if (!sv)
+		av = ubi_scan_find_av(ai, idx2vol_id(ubi, i));
+		if (!av)
 			continue;
 
-		ubi_rb_for_each_entry(rb, aeb, &sv->root, u.rb) {
+		ubi_rb_for_each_entry(rb, aeb, &av->root, u.rb) {
 			if (aeb->lnum >= vol->reserved_pebs)
 				/*
 				 * This may happen in case of an unclean reboot
 				 * during re-size.
 				 */
-				ubi_scan_move_to_list(sv, aeb, &ai->erase);
+				ubi_scan_move_to_list(av, aeb, &ai->erase);
 			vol->eba_tbl[aeb->lnum] = aeb->pnum;
 		}
 	}
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 4145a04..795d5ed 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -168,7 +168,7 @@ static int add_corrupted(struct ubi_attach_info *ai, int pnum, int ec)
 /**
  * validate_vid_hdr - check volume identifier header.
  * @vid_hdr: the volume identifier header to check
- * @sv: information about the volume this logical eraseblock belongs to
+ * @av: information about the volume this logical eraseblock belongs to
  * @pnum: physical eraseblock number the VID header came from
  *
  * This function checks that data stored in @vid_hdr is consistent. Returns
@@ -180,15 +180,15 @@ static int add_corrupted(struct ubi_attach_info *ai, int pnum, int ec)
  * headers of the same volume.
  */
 static int validate_vid_hdr(const struct ubi_vid_hdr *vid_hdr,
-			    const struct ubi_ainf_volume *sv, int pnum)
+			    const struct ubi_ainf_volume *av, int pnum)
 {
 	int vol_type = vid_hdr->vol_type;
 	int vol_id = be32_to_cpu(vid_hdr->vol_id);
 	int used_ebs = be32_to_cpu(vid_hdr->used_ebs);
 	int data_pad = be32_to_cpu(vid_hdr->data_pad);
 
-	if (sv->leb_count != 0) {
-		int sv_vol_type;
+	if (av->leb_count != 0) {
+		int av_vol_type;
 
 		/*
 		 * This is not the first logical eraseblock belonging to this
@@ -196,27 +196,27 @@ static int validate_vid_hdr(const struct ubi_vid_hdr *vid_hdr,
 		 * to the data in previous logical eraseblock headers.
 		 */
 
-		if (vol_id != sv->vol_id) {
+		if (vol_id != av->vol_id) {
 			ubi_err("inconsistent vol_id");
 			goto bad;
 		}
 
-		if (sv->vol_type == UBI_STATIC_VOLUME)
-			sv_vol_type = UBI_VID_STATIC;
+		if (av->vol_type == UBI_STATIC_VOLUME)
+			av_vol_type = UBI_VID_STATIC;
 		else
-			sv_vol_type = UBI_VID_DYNAMIC;
+			av_vol_type = UBI_VID_DYNAMIC;
 
-		if (vol_type != sv_vol_type) {
+		if (vol_type != av_vol_type) {
 			ubi_err("inconsistent vol_type");
 			goto bad;
 		}
 
-		if (used_ebs != sv->used_ebs) {
+		if (used_ebs != av->used_ebs) {
 			ubi_err("inconsistent used_ebs");
 			goto bad;
 		}
 
-		if (data_pad != sv->data_pad) {
+		if (data_pad != av->data_pad) {
 			ubi_err("inconsistent data_pad");
 			goto bad;
 		}
@@ -227,7 +227,7 @@ static int validate_vid_hdr(const struct ubi_vid_hdr *vid_hdr,
 bad:
 	ubi_err("inconsistent VID header at PEB %d", pnum);
 	ubi_dump_vid_hdr(vid_hdr);
-	ubi_dump_sv(sv);
+	ubi_dump_av(av);
 	return -EINVAL;
 }
 
@@ -248,7 +248,7 @@ static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *ai,
 					  int vol_id, int pnum,
 					  const struct ubi_vid_hdr *vid_hdr)
 {
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct rb_node **p = &ai->volumes.rb_node, *parent = NULL;
 
 	ubi_assert(vol_id == be32_to_cpu(vid_hdr->vol_id));
@@ -256,38 +256,38 @@ static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *ai,
 	/* Walk the volume RB-tree to look if this volume is already present */
 	while (*p) {
 		parent = *p;
-		sv = rb_entry(parent, struct ubi_ainf_volume, rb);
+		av = rb_entry(parent, struct ubi_ainf_volume, rb);
 
-		if (vol_id == sv->vol_id)
-			return sv;
+		if (vol_id == av->vol_id)
+			return av;
 
-		if (vol_id > sv->vol_id)
+		if (vol_id > av->vol_id)
 			p = &(*p)->rb_left;
 		else
 			p = &(*p)->rb_right;
 	}
 
 	/* The volume is absent - add it */
-	sv = kmalloc(sizeof(struct ubi_ainf_volume), GFP_KERNEL);
-	if (!sv)
+	av = kmalloc(sizeof(struct ubi_ainf_volume), GFP_KERNEL);
+	if (!av)
 		return ERR_PTR(-ENOMEM);
 
-	sv->highest_lnum = sv->leb_count = 0;
-	sv->vol_id = vol_id;
-	sv->root = RB_ROOT;
-	sv->used_ebs = be32_to_cpu(vid_hdr->used_ebs);
-	sv->data_pad = be32_to_cpu(vid_hdr->data_pad);
-	sv->compat = vid_hdr->compat;
-	sv->vol_type = vid_hdr->vol_type == UBI_VID_DYNAMIC ? UBI_DYNAMIC_VOLUME
+	av->highest_lnum = av->leb_count = 0;
+	av->vol_id = vol_id;
+	av->root = RB_ROOT;
+	av->used_ebs = be32_to_cpu(vid_hdr->used_ebs);
+	av->data_pad = be32_to_cpu(vid_hdr->data_pad);
+	av->compat = vid_hdr->compat;
+	av->vol_type = vid_hdr->vol_type == UBI_VID_DYNAMIC ? UBI_DYNAMIC_VOLUME
 							    : UBI_STATIC_VOLUME;
 	if (vol_id > ai->highest_vol_id)
 		ai->highest_vol_id = vol_id;
 
-	rb_link_node(&sv->rb, parent, p);
-	rb_insert_color(&sv->rb, &ai->volumes);
+	rb_link_node(&av->rb, parent, p);
+	rb_insert_color(&av->rb, &ai->volumes);
 	ai->vols_found += 1;
 	dbg_bld("added volume %d", vol_id);
-	return sv;
+	return av;
 }
 
 /**
@@ -446,7 +446,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 {
 	int err, vol_id, lnum;
 	unsigned long long sqnum;
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb;
 	struct rb_node **p, *parent = NULL;
 
@@ -457,9 +457,9 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	dbg_bld("PEB %d, LEB %d:%d, EC %d, sqnum %llu, bitflips %d",
 		pnum, vol_id, lnum, ec, sqnum, bitflips);
 
-	sv = add_volume(ai, vol_id, pnum, vid_hdr);
-	if (IS_ERR(sv))
-		return PTR_ERR(sv);
+	av = add_volume(ai, vol_id, pnum, vid_hdr);
+	if (IS_ERR(av))
+		return PTR_ERR(av);
 
 	if (ai->max_sqnum < sqnum)
 		ai->max_sqnum = sqnum;
@@ -468,7 +468,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	 * Walk the RB-tree of logical eraseblocks of volume @vol_id to look
 	 * if this is the first instance of this logical eraseblock or not.
 	 */
-	p = &sv->root.rb_node;
+	p = &av->root.rb_node;
 	while (*p) {
 		int cmp_res;
 
@@ -524,7 +524,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			 * This logical eraseblock is newer than the one
 			 * found earlier.
 			 */
-			err = validate_vid_hdr(vid_hdr, sv, pnum);
+			err = validate_vid_hdr(vid_hdr, av, pnum);
 			if (err)
 				return err;
 
@@ -539,8 +539,8 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			aeb->copy_flag = vid_hdr->copy_flag;
 			aeb->sqnum = sqnum;
 
-			if (sv->highest_lnum == lnum)
-				sv->last_data_size =
+			if (av->highest_lnum == lnum)
+				av->last_data_size =
 					be32_to_cpu(vid_hdr->data_size);
 
 			return 0;
@@ -559,7 +559,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	 * attaching information.
 	 */
 
-	err = validate_vid_hdr(vid_hdr, sv, pnum);
+	err = validate_vid_hdr(vid_hdr, av, pnum);
 	if (err)
 		return err;
 
@@ -574,38 +574,38 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	aeb->copy_flag = vid_hdr->copy_flag;
 	aeb->sqnum = sqnum;
 
-	if (sv->highest_lnum <= lnum) {
-		sv->highest_lnum = lnum;
-		sv->last_data_size = be32_to_cpu(vid_hdr->data_size);
+	if (av->highest_lnum <= lnum) {
+		av->highest_lnum = lnum;
+		av->last_data_size = be32_to_cpu(vid_hdr->data_size);
 	}
 
-	sv->leb_count += 1;
+	av->leb_count += 1;
 	rb_link_node(&aeb->u.rb, parent, p);
-	rb_insert_color(&aeb->u.rb, &sv->root);
+	rb_insert_color(&aeb->u.rb, &av->root);
 	return 0;
 }
 
 /**
- * ubi_scan_find_sv - find volume in the attaching information.
+ * ubi_scan_find_av - find volume in the attaching information.
  * @ai: attaching information
  * @vol_id: the requested volume ID
  *
  * This function returns a pointer to the volume description or %NULL if there
  * are no data about this volume in the attaching information.
  */
-struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *ai,
+struct ubi_ainf_volume *ubi_scan_find_av(const struct ubi_attach_info *ai,
 					 int vol_id)
 {
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct rb_node *p = ai->volumes.rb_node;
 
 	while (p) {
-		sv = rb_entry(p, struct ubi_ainf_volume, rb);
+		av = rb_entry(p, struct ubi_ainf_volume, rb);
 
-		if (vol_id == sv->vol_id)
-			return sv;
+		if (vol_id == av->vol_id)
+			return av;
 
-		if (vol_id > sv->vol_id)
+		if (vol_id > av->vol_id)
 			p = p->rb_left;
 		else
 			p = p->rb_right;
@@ -616,17 +616,17 @@ struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *ai,
 
 /**
  * ubi_scan_find_aeb - find LEB in the volume attaching information.
- * @sv: a pointer to the volume attaching information
+ * @av: a pointer to the volume attaching information
  * @lnum: the requested logical eraseblock
  *
  * This function returns a pointer to the scanning logical eraseblock or %NULL
  * if there are no data about it in the scanning volume information.
  */
-struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *sv,
+struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *av,
 				       int lnum)
 {
 	struct ubi_ainf_peb *aeb;
-	struct rb_node *p = sv->root.rb_node;
+	struct rb_node *p = av->root.rb_node;
 
 	while (p) {
 		aeb = rb_entry(p, struct ubi_ainf_peb, u.rb);
@@ -646,23 +646,23 @@ struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *sv,
 /**
  * ubi_scan_rm_volume - delete attaching information about a volume.
  * @ai: attaching information
- * @sv: the volume attaching information to delete
+ * @av: the volume attaching information to delete
  */
-void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *sv)
+void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 {
 	struct rb_node *rb;
 	struct ubi_ainf_peb *aeb;
 
-	dbg_bld("remove attaching information about volume %d", sv->vol_id);
+	dbg_bld("remove attaching information about volume %d", av->vol_id);
 
-	while ((rb = rb_first(&sv->root))) {
+	while ((rb = rb_first(&av->root))) {
 		aeb = rb_entry(rb, struct ubi_ainf_peb, u.rb);
-		rb_erase(&aeb->u.rb, &sv->root);
+		rb_erase(&aeb->u.rb, &av->root);
 		list_add_tail(&aeb->u.list, &ai->erase);
 	}
 
-	rb_erase(&sv->rb, &ai->volumes);
-	kfree(sv);
+	rb_erase(&av->rb, &ai->volumes);
+	kfree(av);
 	ai->vols_found -= 1;
 }
 
@@ -1148,7 +1148,7 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 {
 	int err, pnum;
 	struct rb_node *rb1, *rb2;
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb;
 	struct ubi_attach_info *ai;
 
@@ -1200,8 +1200,8 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 	 * In case of unknown erase counter we use the mean erase counter
 	 * value.
 	 */
-	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb) {
-		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb)
+	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
+		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb)
 			if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
 				aeb->ec = ai->mean_ec;
 	}
@@ -1238,17 +1238,17 @@ out_ai:
 }
 
 /**
- * destroy_sv - free the scanning volume information
- * @sv: scanning volume information
+ * destroy_av - free the scanning volume information
+ * @av: scanning volume information
  * @ai: attaching information
  *
- * This function destroys the volume RB-tree (@sv->root) and the scanning
+ * This function destroys the volume RB-tree (@av->root) and the scanning
  * volume information.
  */
-static void destroy_sv(struct ubi_attach_info *ai, struct ubi_ainf_volume *sv)
+static void destroy_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 {
 	struct ubi_ainf_peb *aeb;
-	struct rb_node *this = sv->root.rb_node;
+	struct rb_node *this = av->root.rb_node;
 
 	while (this) {
 		if (this->rb_left)
@@ -1268,7 +1268,7 @@ static void destroy_sv(struct ubi_attach_info *ai, struct ubi_ainf_volume *sv)
 			kmem_cache_free(ai->scan_leb_slab, aeb);
 		}
 	}
-	kfree(sv);
+	kfree(av);
 }
 
 /**
@@ -1278,7 +1278,7 @@ static void destroy_sv(struct ubi_attach_info *ai, struct ubi_ainf_volume *sv)
 void ubi_scan_destroy_ai(struct ubi_attach_info *ai)
 {
 	struct ubi_ainf_peb *aeb, *aeb_tmp;
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct rb_node *rb;
 
 	list_for_each_entry_safe(aeb, aeb_tmp, &ai->alien, u.list) {
@@ -1306,17 +1306,17 @@ void ubi_scan_destroy_ai(struct ubi_attach_info *ai)
 		else if (rb->rb_right)
 			rb = rb->rb_right;
 		else {
-			sv = rb_entry(rb, struct ubi_ainf_volume, rb);
+			av = rb_entry(rb, struct ubi_ainf_volume, rb);
 
 			rb = rb_parent(rb);
 			if (rb) {
-				if (rb->rb_left == &sv->rb)
+				if (rb->rb_left == &av->rb)
 					rb->rb_left = NULL;
 				else
 					rb->rb_right = NULL;
 			}
 
-			destroy_sv(ai, sv);
+			destroy_av(ai, av);
 		}
 	}
 
@@ -1338,7 +1338,7 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int pnum, err, vols_found = 0;
 	struct rb_node *rb1, *rb2;
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb, *last_aeb;
 	uint8_t *buf;
 
@@ -1348,7 +1348,7 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	/*
 	 * At first, check that attaching information is OK.
 	 */
-	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb) {
+	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
 		int leb_count = 0;
 
 		cond_resched();
@@ -1357,41 +1357,41 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 		if (ai->is_empty) {
 			ubi_err("bad is_empty flag");
-			goto bad_sv;
+			goto bad_av;
 		}
 
-		if (sv->vol_id < 0 || sv->highest_lnum < 0 ||
-		    sv->leb_count < 0 || sv->vol_type < 0 || sv->used_ebs < 0 ||
-		    sv->data_pad < 0 || sv->last_data_size < 0) {
+		if (av->vol_id < 0 || av->highest_lnum < 0 ||
+		    av->leb_count < 0 || av->vol_type < 0 || av->used_ebs < 0 ||
+		    av->data_pad < 0 || av->last_data_size < 0) {
 			ubi_err("negative values");
-			goto bad_sv;
+			goto bad_av;
 		}
 
-		if (sv->vol_id >= UBI_MAX_VOLUMES &&
-		    sv->vol_id < UBI_INTERNAL_VOL_START) {
+		if (av->vol_id >= UBI_MAX_VOLUMES &&
+		    av->vol_id < UBI_INTERNAL_VOL_START) {
 			ubi_err("bad vol_id");
-			goto bad_sv;
+			goto bad_av;
 		}
 
-		if (sv->vol_id > ai->highest_vol_id) {
+		if (av->vol_id > ai->highest_vol_id) {
 			ubi_err("highest_vol_id is %d, but vol_id %d is there",
-				ai->highest_vol_id, sv->vol_id);
+				ai->highest_vol_id, av->vol_id);
 			goto out;
 		}
 
-		if (sv->vol_type != UBI_DYNAMIC_VOLUME &&
-		    sv->vol_type != UBI_STATIC_VOLUME) {
+		if (av->vol_type != UBI_DYNAMIC_VOLUME &&
+		    av->vol_type != UBI_STATIC_VOLUME) {
 			ubi_err("bad vol_type");
-			goto bad_sv;
+			goto bad_av;
 		}
 
-		if (sv->data_pad > ubi->leb_size / 2) {
+		if (av->data_pad > ubi->leb_size / 2) {
 			ubi_err("bad data_pad");
-			goto bad_sv;
+			goto bad_av;
 		}
 
 		last_aeb = NULL;
-		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb) {
+		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb) {
 			cond_resched();
 
 			last_aeb = aeb;
@@ -1420,28 +1420,28 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 				goto bad_aeb;
 			}
 
-			if (sv->vol_type == UBI_STATIC_VOLUME) {
-				if (aeb->lnum >= sv->used_ebs) {
+			if (av->vol_type == UBI_STATIC_VOLUME) {
+				if (aeb->lnum >= av->used_ebs) {
 					ubi_err("bad lnum or used_ebs");
 					goto bad_aeb;
 				}
 			} else {
-				if (sv->used_ebs != 0) {
+				if (av->used_ebs != 0) {
 					ubi_err("non-zero used_ebs");
 					goto bad_aeb;
 				}
 			}
 
-			if (aeb->lnum > sv->highest_lnum) {
+			if (aeb->lnum > av->highest_lnum) {
 				ubi_err("incorrect highest_lnum or lnum");
 				goto bad_aeb;
 			}
 		}
 
-		if (sv->leb_count != leb_count) {
+		if (av->leb_count != leb_count) {
 			ubi_err("bad leb_count, %d objects in the tree",
 				leb_count);
-			goto bad_sv;
+			goto bad_av;
 		}
 
 		if (!last_aeb)
@@ -1449,7 +1449,7 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 		aeb = last_aeb;
 
-		if (aeb->lnum != sv->highest_lnum) {
+		if (aeb->lnum != av->highest_lnum) {
 			ubi_err("bad highest_lnum");
 			goto bad_aeb;
 		}
@@ -1462,9 +1462,9 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	}
 
 	/* Check that attaching information is correct */
-	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb) {
+	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
 		last_aeb = NULL;
-		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb) {
+		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb) {
 			int vol_type;
 
 			cond_resched();
@@ -1481,7 +1481,7 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 
 			vol_type = vidh->vol_type == UBI_VID_DYNAMIC ?
 				   UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
-			if (sv->vol_type != vol_type) {
+			if (av->vol_type != vol_type) {
 				ubi_err("bad vol_type");
 				goto bad_vid_hdr;
 			}
@@ -1491,12 +1491,12 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 				goto bad_vid_hdr;
 			}
 
-			if (sv->vol_id != be32_to_cpu(vidh->vol_id)) {
-				ubi_err("bad vol_id %d", sv->vol_id);
+			if (av->vol_id != be32_to_cpu(vidh->vol_id)) {
+				ubi_err("bad vol_id %d", av->vol_id);
 				goto bad_vid_hdr;
 			}
 
-			if (sv->compat != vidh->compat) {
+			if (av->compat != vidh->compat) {
 				ubi_err("bad compat %d", vidh->compat);
 				goto bad_vid_hdr;
 			}
@@ -1506,13 +1506,13 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 				goto bad_vid_hdr;
 			}
 
-			if (sv->used_ebs != be32_to_cpu(vidh->used_ebs)) {
-				ubi_err("bad used_ebs %d", sv->used_ebs);
+			if (av->used_ebs != be32_to_cpu(vidh->used_ebs)) {
+				ubi_err("bad used_ebs %d", av->used_ebs);
 				goto bad_vid_hdr;
 			}
 
-			if (sv->data_pad != be32_to_cpu(vidh->data_pad)) {
-				ubi_err("bad data_pad %d", sv->data_pad);
+			if (av->data_pad != be32_to_cpu(vidh->data_pad)) {
+				ubi_err("bad data_pad %d", av->data_pad);
 				goto bad_vid_hdr;
 			}
 		}
@@ -1520,13 +1520,13 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		if (!last_aeb)
 			continue;
 
-		if (sv->highest_lnum != be32_to_cpu(vidh->lnum)) {
-			ubi_err("bad highest_lnum %d", sv->highest_lnum);
+		if (av->highest_lnum != be32_to_cpu(vidh->lnum)) {
+			ubi_err("bad highest_lnum %d", av->highest_lnum);
 			goto bad_vid_hdr;
 		}
 
-		if (sv->last_data_size != be32_to_cpu(vidh->data_size)) {
-			ubi_err("bad last_data_size %d", sv->last_data_size);
+		if (av->last_data_size != be32_to_cpu(vidh->data_size)) {
+			ubi_err("bad last_data_size %d", av->last_data_size);
 			goto bad_vid_hdr;
 		}
 	}
@@ -1548,8 +1548,8 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			buf[pnum] = 1;
 	}
 
-	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb)
-		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb)
+	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb)
+		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb)
 			buf[aeb->pnum] = 1;
 
 	list_for_each_entry(aeb, &ai->free, u.list)
@@ -1579,17 +1579,17 @@ static int self_check_ai(struct ubi_device *ubi, struct ubi_attach_info *ai)
 bad_aeb:
 	ubi_err("bad attaching information about LEB %d", aeb->lnum);
 	ubi_dump_aeb(aeb, 0);
-	ubi_dump_sv(sv);
+	ubi_dump_av(av);
 	goto out;
 
-bad_sv:
-	ubi_err("bad attaching information about volume %d", sv->vol_id);
-	ubi_dump_sv(sv);
+bad_av:
+	ubi_err("bad attaching information about volume %d", av->vol_id);
+	ubi_dump_av(av);
 	goto out;
 
 bad_vid_hdr:
-	ubi_err("bad attaching information about volume %d", sv->vol_id);
-	ubi_dump_sv(sv);
+	ubi_err("bad attaching information about volume %d", av->vol_id);
+	ubi_dump_av(av);
 	ubi_dump_vid_hdr(vidh);
 
 out:
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 0f0725e..3e19cb6 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -145,26 +145,26 @@ struct ubi_vid_hdr;
 /*
  * ubi_scan_move_to_list - move a PEB from the volume tree to a list.
  *
- * @sv: volume attaching information
+ * @av: volume attaching information
  * @aeb: scanning eraseblock information
  * @list: the list to move to
  */
-static inline void ubi_scan_move_to_list(struct ubi_ainf_volume *sv,
+static inline void ubi_scan_move_to_list(struct ubi_ainf_volume *av,
 					 struct ubi_ainf_peb *aeb,
 					 struct list_head *list)
 {
-		rb_erase(&aeb->u.rb, &sv->root);
+		rb_erase(&aeb->u.rb, &av->root);
 		list_add_tail(&aeb->u.list, list);
 }
 
 int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
 		      int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
 		      int bitflips);
-struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *ai,
+struct ubi_ainf_volume *ubi_scan_find_av(const struct ubi_attach_info *ai,
 					 int vol_id);
-struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *sv,
+struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *av,
 				       int lnum);
-void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *sv);
+void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 					   struct ubi_attach_info *ai);
 int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_attach_info *ai,
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 3e5363c..0ea105b 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -366,7 +366,7 @@ out_free:
  * process_lvol - process the layout volume.
  * @ubi: UBI device description object
  * @ai: attaching information
- * @sv: layout volume attaching information
+ * @av: layout volume attaching information
  *
  * This function is responsible for reading the layout volume, ensuring it is
  * not corrupted, and recovering from corruptions if needed. Returns volume
@@ -374,7 +374,7 @@ out_free:
  */
 static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 					    struct ubi_attach_info *ai,
-					    struct ubi_ainf_volume *sv)
+					    struct ubi_ainf_volume *av)
 {
 	int err;
 	struct rb_node *rb;
@@ -410,7 +410,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 	dbg_gen("check layout volume");
 
 	/* Read both LEB 0 and LEB 1 into memory */
-	ubi_rb_for_each_entry(rb, aeb, &sv->root, u.rb) {
+	ubi_rb_for_each_entry(rb, aeb, &av->root, u.rb) {
 		leb[aeb->lnum] = vzalloc(ubi->vtbl_size);
 		if (!leb[aeb->lnum]) {
 			err = -ENOMEM;
@@ -536,7 +536,7 @@ static int init_volumes(struct ubi_device *ubi,
 			const struct ubi_vtbl_record *vtbl)
 {
 	int i, reserved_pebs = 0;
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct ubi_volume *vol;
 
 	for (i = 0; i < ubi->vtbl_slots; i++) {
@@ -592,8 +592,8 @@ static int init_volumes(struct ubi_device *ubi,
 		}
 
 		/* Static volumes only */
-		sv = ubi_scan_find_sv(ai, i);
-		if (!sv) {
+		av = ubi_scan_find_av(ai, i);
+		if (!av) {
 			/*
 			 * No eraseblocks belonging to this volume found. We
 			 * don't actually know whether this static volume is
@@ -605,22 +605,22 @@ static int init_volumes(struct ubi_device *ubi,
 			continue;
 		}
 
-		if (sv->leb_count != sv->used_ebs) {
+		if (av->leb_count != av->used_ebs) {
 			/*
 			 * We found a static volume which misses several
 			 * eraseblocks. Treat it as corrupted.
 			 */
 			ubi_warn("static volume %d misses %d LEBs - corrupted",
-				 sv->vol_id, sv->used_ebs - sv->leb_count);
+				 av->vol_id, av->used_ebs - av->leb_count);
 			vol->corrupted = 1;
 			continue;
 		}
 
-		vol->used_ebs = sv->used_ebs;
+		vol->used_ebs = av->used_ebs;
 		vol->used_bytes =
 			(long long)(vol->used_ebs - 1) * vol->usable_leb_size;
-		vol->used_bytes += sv->last_data_size;
-		vol->last_eb_bytes = sv->last_data_size;
+		vol->used_bytes += av->last_data_size;
+		vol->last_eb_bytes = av->last_data_size;
 	}
 
 	/* And add the layout volume */
@@ -661,35 +661,35 @@ static int init_volumes(struct ubi_device *ubi,
 }
 
 /**
- * check_sv - check volume attaching information.
+ * check_av - check volume attaching information.
  * @vol: UBI volume description object
- * @sv: volume attaching information
+ * @av: volume attaching information
  *
  * This function returns zero if the volume attaching information is consistent
  * to the data read from the volume tabla, and %-EINVAL if not.
  */
-static int check_sv(const struct ubi_volume *vol,
-		    const struct ubi_ainf_volume *sv)
+static int check_av(const struct ubi_volume *vol,
+		    const struct ubi_ainf_volume *av)
 {
 	int err;
 
-	if (sv->highest_lnum >= vol->reserved_pebs) {
+	if (av->highest_lnum >= vol->reserved_pebs) {
 		err = 1;
 		goto bad;
 	}
-	if (sv->leb_count > vol->reserved_pebs) {
+	if (av->leb_count > vol->reserved_pebs) {
 		err = 2;
 		goto bad;
 	}
-	if (sv->vol_type != vol->vol_type) {
+	if (av->vol_type != vol->vol_type) {
 		err = 3;
 		goto bad;
 	}
-	if (sv->used_ebs > vol->reserved_pebs) {
+	if (av->used_ebs > vol->reserved_pebs) {
 		err = 4;
 		goto bad;
 	}
-	if (sv->data_pad != vol->data_pad) {
+	if (av->data_pad != vol->data_pad) {
 		err = 5;
 		goto bad;
 	}
@@ -697,7 +697,7 @@ static int check_sv(const struct ubi_volume *vol,
 
 bad:
 	ubi_err("bad attaching information, error %d", err);
-	ubi_dump_sv(sv);
+	ubi_dump_av(av);
 	ubi_dump_vol_info(vol);
 	return -EINVAL;
 }
@@ -716,7 +716,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
 			       struct ubi_attach_info *ai)
 {
 	int err, i;
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct ubi_volume *vol;
 
 	if (ai->vols_found > UBI_INT_VOL_COUNT + ubi->vtbl_slots) {
@@ -735,18 +735,18 @@ static int check_scanning_info(const struct ubi_device *ubi,
 	for (i = 0; i < ubi->vtbl_slots + UBI_INT_VOL_COUNT; i++) {
 		cond_resched();
 
-		sv = ubi_scan_find_sv(ai, i);
+		av = ubi_scan_find_av(ai, i);
 		vol = ubi->volumes[i];
 		if (!vol) {
-			if (sv)
-				ubi_scan_rm_volume(ai, sv);
+			if (av)
+				ubi_scan_rm_volume(ai, av);
 			continue;
 		}
 
 		if (vol->reserved_pebs == 0) {
 			ubi_assert(i < ubi->vtbl_slots);
 
-			if (!sv)
+			if (!av)
 				continue;
 
 			/*
@@ -756,10 +756,10 @@ static int check_scanning_info(const struct ubi_device *ubi,
 			 * reboot while the volume was being removed. Discard
 			 * these eraseblocks.
 			 */
-			ubi_msg("finish volume %d removal", sv->vol_id);
-			ubi_scan_rm_volume(ai, sv);
-		} else if (sv) {
-			err = check_sv(vol, sv);
+			ubi_msg("finish volume %d removal", av->vol_id);
+			ubi_scan_rm_volume(ai, av);
+		} else if (av) {
+			err = check_av(vol, av);
 			if (err)
 				return err;
 		}
@@ -780,7 +780,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
 int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int i, err;
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 
 	empty_vtbl_record.crc = cpu_to_be32(0xf116c36b);
 
@@ -795,8 +795,8 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	ubi->vtbl_size = ubi->vtbl_slots * UBI_VTBL_RECORD_SIZE;
 	ubi->vtbl_size = ALIGN(ubi->vtbl_size, ubi->min_io_size);
 
-	sv = ubi_scan_find_sv(ai, UBI_LAYOUT_VOLUME_ID);
-	if (!sv) {
+	av = ubi_scan_find_av(ai, UBI_LAYOUT_VOLUME_ID);
+	if (!av) {
 		/*
 		 * No logical eraseblocks belonging to the layout volume were
 		 * found. This could mean that the flash is just empty. In
@@ -814,14 +814,14 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *ai)
 			return -EINVAL;
 		}
 	} else {
-		if (sv->leb_count > UBI_LAYOUT_VOLUME_EBS) {
+		if (av->leb_count > UBI_LAYOUT_VOLUME_EBS) {
 			/* This must not happen with proper UBI images */
 			ubi_err("too many LEBs (%d) in layout volume",
-				sv->leb_count);
+				av->leb_count);
 			return -EINVAL;
 		}
 
-		ubi->vtbl = process_lvol(ubi, ai, sv);
+		ubi->vtbl = process_lvol(ubi, ai, av);
 		if (IS_ERR(ubi->vtbl))
 			return PTR_ERR(ubi->vtbl);
 	}
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 992240d..72fbae1 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1384,7 +1384,7 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
 {
 	int err, i;
 	struct rb_node *rb1, *rb2;
-	struct ubi_ainf_volume *sv;
+	struct ubi_ainf_volume *av;
 	struct ubi_ainf_peb *aeb, *tmp;
 	struct ubi_wl_entry *e;
 
@@ -1436,8 +1436,8 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		ubi->lookuptbl[e->pnum] = e;
 	}
 
-	ubi_rb_for_each_entry(rb1, sv, &ai->volumes, rb) {
-		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb) {
+	ubi_rb_for_each_entry(rb1, av, &ai->volumes, rb) {
+		ubi_rb_for_each_entry(rb2, aeb, &av->root, u.rb) {
 			cond_resched();
 
 			e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
-- 
1.7.10
