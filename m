Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxh-0005Xc-Gs
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:15 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/22] UBI: rename seb to aeb
Date: Fri, 18 May 2012 14:03:48 +0300
Message-Id: <1337339045-8199-6-git-send-email-dedekind1@gmail.com>
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

After re-naming the 'struct ubi_scan_leb' we should adjust all variables
named 'seb' to something else, because 'seb' stands for "scanning eraseblock".
Let's rename it to 'aeb' which stands for "attaching eraseblock" which is
a bit more consistend and has the same length.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.c |   16 +--
 drivers/mtd/ubi/debug.h |    2 +-
 drivers/mtd/ubi/eba.c   |   10 +-
 drivers/mtd/ubi/scan.c  |  296 +++++++++++++++++++++++------------------------
 drivers/mtd/ubi/scan.h  |   10 +-
 drivers/mtd/ubi/vtbl.c  |   36 +++---
 drivers/mtd/ubi/wl.c    |   22 ++--
 7 files changed, 196 insertions(+), 196 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 4885fd2..e73b1fe 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -188,19 +188,19 @@ void ubi_dump_sv(const struct ubi_ainf_volume *sv)
 }
 
 /**
- * ubi_dump_seb - dump a &struct ubi_ainf_peb object.
- * @seb: the object to dump
+ * ubi_dump_aeb - dump a &struct ubi_ainf_peb object.
+ * @aeb: the object to dump
  * @type: object type: 0 - not corrupted, 1 - corrupted
  */
-void ubi_dump_seb(const struct ubi_ainf_peb *seb, int type)
+void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type)
 {
 	printk(KERN_DEBUG "eraseblock scanning information dump:\n");
-	printk(KERN_DEBUG "\tec       %d\n", seb->ec);
-	printk(KERN_DEBUG "\tpnum     %d\n", seb->pnum);
+	printk(KERN_DEBUG "\tec       %d\n", aeb->ec);
+	printk(KERN_DEBUG "\tpnum     %d\n", aeb->pnum);
 	if (type == 0) {
-		printk(KERN_DEBUG "\tlnum     %d\n", seb->lnum);
-		printk(KERN_DEBUG "\tscrub    %d\n", seb->scrub);
-		printk(KERN_DEBUG "\tsqnum    %llu\n", seb->sqnum);
+		printk(KERN_DEBUG "\tlnum     %d\n", aeb->lnum);
+		printk(KERN_DEBUG "\tscrub    %d\n", aeb->scrub);
+		printk(KERN_DEBUG "\tsqnum    %llu\n", aeb->sqnum);
 	}
 }
 
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 041ee4d..a0911c0 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -60,7 +60,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 void ubi_dump_vol_info(const struct ubi_volume *vol);
 void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
 void ubi_dump_sv(const struct ubi_ainf_volume *sv);
-void ubi_dump_seb(const struct ubi_ainf_peb *seb, int type);
+void ubi_dump_aeb(const struct ubi_ainf_peb *aeb, int type);
 void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset,
 			  int len);
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 264482f..2509502 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1217,7 +1217,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 	int i, j, err, num_volumes;
 	struct ubi_ainf_volume *sv;
 	struct ubi_volume *vol;
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 	struct rb_node *rb;
 
 	dbg_eba("initialize EBA sub-system");
@@ -1250,14 +1250,14 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 		if (!sv)
 			continue;
 
-		ubi_rb_for_each_entry(rb, seb, &sv->root, u.rb) {
-			if (seb->lnum >= vol->reserved_pebs)
+		ubi_rb_for_each_entry(rb, aeb, &sv->root, u.rb) {
+			if (aeb->lnum >= vol->reserved_pebs)
 				/*
 				 * This may happen in case of an unclean reboot
 				 * during re-size.
 				 */
-				ubi_scan_move_to_list(sv, seb, &si->erase);
-			vol->eba_tbl[seb->lnum] = seb->pnum;
+				ubi_scan_move_to_list(sv, aeb, &si->erase);
+			vol->eba_tbl[aeb->lnum] = aeb->pnum;
 		}
 	}
 
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index c989177..c53ef5d 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -113,7 +113,7 @@ static struct ubi_vid_hdr *vidh;
 static int add_to_list(struct ubi_attach_info *si, int pnum, int ec,
 		       int to_head, struct list_head *list)
 {
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 
 	if (list == &si->free) {
 		dbg_bld("add to free: PEB %d, EC %d", pnum, ec);
@@ -125,16 +125,16 @@ static int add_to_list(struct ubi_attach_info *si, int pnum, int ec,
 	} else
 		BUG();
 
-	seb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
-	if (!seb)
+	aeb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
+	if (!aeb)
 		return -ENOMEM;
 
-	seb->pnum = pnum;
-	seb->ec = ec;
+	aeb->pnum = pnum;
+	aeb->ec = ec;
 	if (to_head)
-		list_add(&seb->u.list, list);
+		list_add(&aeb->u.list, list);
 	else
-		list_add_tail(&seb->u.list, list);
+		list_add_tail(&aeb->u.list, list);
 	return 0;
 }
 
@@ -150,18 +150,18 @@ static int add_to_list(struct ubi_attach_info *si, int pnum, int ec,
  */
 static int add_corrupted(struct ubi_attach_info *si, int pnum, int ec)
 {
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 
 	dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
 
-	seb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
-	if (!seb)
+	aeb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
+	if (!aeb)
 		return -ENOMEM;
 
 	si->corr_peb_count += 1;
-	seb->pnum = pnum;
-	seb->ec = ec;
-	list_add(&seb->u.list, &si->corr);
+	aeb->pnum = pnum;
+	aeb->ec = ec;
+	list_add(&aeb->u.list, &si->corr);
 	return 0;
 }
 
@@ -293,7 +293,7 @@ static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *si,
 /**
  * compare_lebs - find out which logical eraseblock is newer.
  * @ubi: UBI device description object
- * @seb: first logical eraseblock to compare
+ * @aeb: first logical eraseblock to compare
  * @pnum: physical eraseblock number of the second logical eraseblock to
  * compare
  * @vid_hdr: volume identifier header of the second logical eraseblock
@@ -302,7 +302,7 @@ static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *si,
  * case of success this function returns a positive value, in case of failure, a
  * negative error code is returned. The success return codes use the following
  * bits:
- *     o bit 0 is cleared: the first PEB (described by @seb) is newer than the
+ *     o bit 0 is cleared: the first PEB (described by @aeb) is newer than the
  *       second PEB (described by @pnum and @vid_hdr);
  *     o bit 0 is set: the second PEB is newer;
  *     o bit 1 is cleared: no bit-flips were detected in the newer LEB;
@@ -310,7 +310,7 @@ static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *si,
  *     o bit 2 is cleared: the older LEB is not corrupted;
  *     o bit 2 is set: the older LEB is corrupted.
  */
-static int compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *seb,
+static int compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *aeb,
 			int pnum, const struct ubi_vid_hdr *vid_hdr)
 {
 	void *buf;
@@ -319,7 +319,7 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *seb,
 	struct ubi_vid_hdr *vh = NULL;
 	unsigned long long sqnum2 = be64_to_cpu(vid_hdr->sqnum);
 
-	if (sqnum2 == seb->sqnum) {
+	if (sqnum2 == aeb->sqnum) {
 		/*
 		 * This must be a really ancient UBI image which has been
 		 * created before sequence numbers support has been added. At
@@ -333,7 +333,7 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *seb,
 	}
 
 	/* Obviously the LEB with lower sequence counter is older */
-	second_is_newer = (sqnum2 > seb->sqnum);
+	second_is_newer = (sqnum2 > aeb->sqnum);
 
 	/*
 	 * Now we know which copy is newer. If the copy flag of the PEB with
@@ -352,7 +352,7 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *seb,
 			return 1;
 		}
 	} else {
-		if (!seb->copy_flag) {
+		if (!aeb->copy_flag) {
 			/* It is not a copy, so it is newer */
 			dbg_bld("first PEB %d is newer, copy_flag is unset",
 				pnum);
@@ -363,7 +363,7 @@ static int compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *seb,
 		if (!vh)
 			return -ENOMEM;
 
-		pnum = seb->pnum;
+		pnum = aeb->pnum;
 		err = ubi_io_read_vid_hdr(ubi, pnum, vh, 0);
 		if (err) {
 			if (err == UBI_IO_BITFLIPS)
@@ -447,7 +447,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 	int err, vol_id, lnum;
 	unsigned long long sqnum;
 	struct ubi_ainf_volume *sv;
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 	struct rb_node **p, *parent = NULL;
 
 	vol_id = be32_to_cpu(vid_hdr->vol_id);
@@ -473,9 +473,9 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 		int cmp_res;
 
 		parent = *p;
-		seb = rb_entry(parent, struct ubi_ainf_peb, u.rb);
-		if (lnum != seb->lnum) {
-			if (lnum < seb->lnum)
+		aeb = rb_entry(parent, struct ubi_ainf_peb, u.rb);
+		if (lnum != aeb->lnum) {
+			if (lnum < aeb->lnum)
 				p = &(*p)->rb_left;
 			else
 				p = &(*p)->rb_right;
@@ -487,8 +487,8 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 		 * logical eraseblock present.
 		 */
 
-		dbg_bld("this LEB already exists: PEB %d, sqnum %llu, "
-			"EC %d", seb->pnum, seb->sqnum, seb->ec);
+		dbg_bld("this LEB already exists: PEB %d, sqnum %llu, EC %d",
+			aeb->pnum, aeb->sqnum, aeb->ec);
 
 		/*
 		 * Make sure that the logical eraseblocks have different
@@ -503,10 +503,10 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 		 * images, but refuse attaching old images with duplicated
 		 * logical eraseblocks because there was an unclean reboot.
 		 */
-		if (seb->sqnum == sqnum && sqnum != 0) {
+		if (aeb->sqnum == sqnum && sqnum != 0) {
 			ubi_err("two LEBs with same sequence number %llu",
 				sqnum);
-			ubi_dump_seb(seb, 0);
+			ubi_dump_aeb(aeb, 0);
 			ubi_dump_vid_hdr(vid_hdr);
 			return -EINVAL;
 		}
@@ -515,7 +515,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 		 * Now we have to drop the older one and preserve the newer
 		 * one.
 		 */
-		cmp_res = compare_lebs(ubi, seb, pnum, vid_hdr);
+		cmp_res = compare_lebs(ubi, aeb, pnum, vid_hdr);
 		if (cmp_res < 0)
 			return cmp_res;
 
@@ -528,16 +528,16 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 			if (err)
 				return err;
 
-			err = add_to_list(si, seb->pnum, seb->ec, cmp_res & 4,
+			err = add_to_list(si, aeb->pnum, aeb->ec, cmp_res & 4,
 					  &si->erase);
 			if (err)
 				return err;
 
-			seb->ec = ec;
-			seb->pnum = pnum;
-			seb->scrub = ((cmp_res & 2) || bitflips);
-			seb->copy_flag = vid_hdr->copy_flag;
-			seb->sqnum = sqnum;
+			aeb->ec = ec;
+			aeb->pnum = pnum;
+			aeb->scrub = ((cmp_res & 2) || bitflips);
+			aeb->copy_flag = vid_hdr->copy_flag;
+			aeb->sqnum = sqnum;
 
 			if (sv->highest_lnum == lnum)
 				sv->last_data_size =
@@ -563,16 +563,16 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 	if (err)
 		return err;
 
-	seb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
-	if (!seb)
+	aeb = kmem_cache_alloc(si->scan_leb_slab, GFP_KERNEL);
+	if (!aeb)
 		return -ENOMEM;
 
-	seb->ec = ec;
-	seb->pnum = pnum;
-	seb->lnum = lnum;
-	seb->scrub = bitflips;
-	seb->copy_flag = vid_hdr->copy_flag;
-	seb->sqnum = sqnum;
+	aeb->ec = ec;
+	aeb->pnum = pnum;
+	aeb->lnum = lnum;
+	aeb->scrub = bitflips;
+	aeb->copy_flag = vid_hdr->copy_flag;
+	aeb->sqnum = sqnum;
 
 	if (sv->highest_lnum <= lnum) {
 		sv->highest_lnum = lnum;
@@ -580,8 +580,8 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 	}
 
 	sv->leb_count += 1;
-	rb_link_node(&seb->u.rb, parent, p);
-	rb_insert_color(&seb->u.rb, &sv->root);
+	rb_link_node(&aeb->u.rb, parent, p);
+	rb_insert_color(&aeb->u.rb, &sv->root);
 	return 0;
 }
 
@@ -615,26 +615,26 @@ struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *si,
 }
 
 /**
- * ubi_scan_find_seb - find LEB in the volume scanning information.
+ * ubi_scan_find_aeb - find LEB in the volume scanning information.
  * @sv: a pointer to the volume scanning information
  * @lnum: the requested logical eraseblock
  *
  * This function returns a pointer to the scanning logical eraseblock or %NULL
  * if there are no data about it in the scanning volume information.
  */
-struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_ainf_volume *sv,
+struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *sv,
 				       int lnum)
 {
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 	struct rb_node *p = sv->root.rb_node;
 
 	while (p) {
-		seb = rb_entry(p, struct ubi_ainf_peb, u.rb);
+		aeb = rb_entry(p, struct ubi_ainf_peb, u.rb);
 
-		if (lnum == seb->lnum)
-			return seb;
+		if (lnum == aeb->lnum)
+			return aeb;
 
-		if (lnum > seb->lnum)
+		if (lnum > aeb->lnum)
 			p = p->rb_left;
 		else
 			p = p->rb_right;
@@ -651,14 +651,14 @@ struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_ainf_volume *sv,
 void ubi_scan_rm_volume(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
 {
 	struct rb_node *rb;
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 
 	dbg_bld("remove scanning information about volume %d", sv->vol_id);
 
 	while ((rb = rb_first(&sv->root))) {
-		seb = rb_entry(rb, struct ubi_ainf_peb, u.rb);
-		rb_erase(&seb->u.rb, &sv->root);
-		list_add_tail(&seb->u.list, &si->erase);
+		aeb = rb_entry(rb, struct ubi_ainf_peb, u.rb);
+		rb_erase(&aeb->u.rb, &sv->root);
+		list_add_tail(&aeb->u.list, &si->erase);
 	}
 
 	rb_erase(&sv->rb, &si->volumes);
@@ -729,13 +729,13 @@ struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 					   struct ubi_attach_info *si)
 {
 	int err = 0;
-	struct ubi_ainf_peb *seb, *tmp_seb;
+	struct ubi_ainf_peb *aeb, *tmp_aeb;
 
 	if (!list_empty(&si->free)) {
-		seb = list_entry(si->free.next, struct ubi_ainf_peb, u.list);
-		list_del(&seb->u.list);
-		dbg_bld("return free PEB %d, EC %d", seb->pnum, seb->ec);
-		return seb;
+		aeb = list_entry(si->free.next, struct ubi_ainf_peb, u.list);
+		list_del(&aeb->u.list);
+		dbg_bld("return free PEB %d, EC %d", aeb->pnum, aeb->ec);
+		return aeb;
 	}
 
 	/*
@@ -744,18 +744,18 @@ struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 	 * so forth. We don't want to take care about bad eraseblocks here -
 	 * they'll be handled later.
 	 */
-	list_for_each_entry_safe(seb, tmp_seb, &si->erase, u.list) {
-		if (seb->ec == UBI_SCAN_UNKNOWN_EC)
-			seb->ec = si->mean_ec;
+	list_for_each_entry_safe(aeb, tmp_aeb, &si->erase, u.list) {
+		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+			aeb->ec = si->mean_ec;
 
-		err = ubi_scan_erase_peb(ubi, si, seb->pnum, seb->ec+1);
+		err = ubi_scan_erase_peb(ubi, si, aeb->pnum, aeb->ec+1);
 		if (err)
 			continue;
 
-		seb->ec += 1;
-		list_del(&seb->u.list);
-		dbg_bld("return PEB %d, EC %d", seb->pnum, seb->ec);
-		return seb;
+		aeb->ec += 1;
+		list_del(&aeb->u.list);
+		dbg_bld("return PEB %d, EC %d", aeb->pnum, aeb->ec);
+		return aeb;
 	}
 
 	ubi_err("no free eraseblocks");
@@ -1076,7 +1076,7 @@ adjust_mean_ec:
 static int check_what_we_have(struct ubi_device *ubi,
 			      struct ubi_attach_info *si)
 {
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 	int max_corr, peb_count;
 
 	peb_count = ubi->peb_count - si->bad_peb_count - si->alien_peb_count;
@@ -1091,8 +1091,8 @@ static int check_what_we_have(struct ubi_device *ubi,
 		ubi_err("%d PEBs are corrupted and preserved",
 			si->corr_peb_count);
 		printk(KERN_ERR "Corrupted PEBs are:");
-		list_for_each_entry(seb, &si->corr, u.list)
-			printk(KERN_CONT " %d", seb->pnum);
+		list_for_each_entry(aeb, &si->corr, u.list)
+			printk(KERN_CONT " %d", aeb->pnum);
 		printk(KERN_CONT "\n");
 
 		/*
@@ -1149,7 +1149,7 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 	int err, pnum;
 	struct rb_node *rb1, *rb2;
 	struct ubi_ainf_volume *sv;
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 	struct ubi_attach_info *si;
 
 	si = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
@@ -1201,23 +1201,23 @@ struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 	 * value.
 	 */
 	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb) {
-		ubi_rb_for_each_entry(rb2, seb, &sv->root, u.rb)
-			if (seb->ec == UBI_SCAN_UNKNOWN_EC)
-				seb->ec = si->mean_ec;
+		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb)
+			if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+				aeb->ec = si->mean_ec;
 	}
 
-	list_for_each_entry(seb, &si->free, u.list) {
-		if (seb->ec == UBI_SCAN_UNKNOWN_EC)
-			seb->ec = si->mean_ec;
+	list_for_each_entry(aeb, &si->free, u.list) {
+		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+			aeb->ec = si->mean_ec;
 	}
 
-	list_for_each_entry(seb, &si->corr, u.list)
-		if (seb->ec == UBI_SCAN_UNKNOWN_EC)
-			seb->ec = si->mean_ec;
+	list_for_each_entry(aeb, &si->corr, u.list)
+		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+			aeb->ec = si->mean_ec;
 
-	list_for_each_entry(seb, &si->erase, u.list)
-		if (seb->ec == UBI_SCAN_UNKNOWN_EC)
-			seb->ec = si->mean_ec;
+	list_for_each_entry(aeb, &si->erase, u.list)
+		if (aeb->ec == UBI_SCAN_UNKNOWN_EC)
+			aeb->ec = si->mean_ec;
 
 	err = self_check_si(ubi, si);
 	if (err)
@@ -1247,7 +1247,7 @@ out_si:
  */
 static void destroy_sv(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
 {
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 	struct rb_node *this = sv->root.rb_node;
 
 	while (this) {
@@ -1256,16 +1256,16 @@ static void destroy_sv(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
 		else if (this->rb_right)
 			this = this->rb_right;
 		else {
-			seb = rb_entry(this, struct ubi_ainf_peb, u.rb);
+			aeb = rb_entry(this, struct ubi_ainf_peb, u.rb);
 			this = rb_parent(this);
 			if (this) {
-				if (this->rb_left == &seb->u.rb)
+				if (this->rb_left == &aeb->u.rb)
 					this->rb_left = NULL;
 				else
 					this->rb_right = NULL;
 			}
 
-			kmem_cache_free(si->scan_leb_slab, seb);
+			kmem_cache_free(si->scan_leb_slab, aeb);
 		}
 	}
 	kfree(sv);
@@ -1277,25 +1277,25 @@ static void destroy_sv(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
  */
 void ubi_scan_destroy_si(struct ubi_attach_info *si)
 {
-	struct ubi_ainf_peb *seb, *seb_tmp;
+	struct ubi_ainf_peb *aeb, *aeb_tmp;
 	struct ubi_ainf_volume *sv;
 	struct rb_node *rb;
 
-	list_for_each_entry_safe(seb, seb_tmp, &si->alien, u.list) {
-		list_del(&seb->u.list);
-		kmem_cache_free(si->scan_leb_slab, seb);
+	list_for_each_entry_safe(aeb, aeb_tmp, &si->alien, u.list) {
+		list_del(&aeb->u.list);
+		kmem_cache_free(si->scan_leb_slab, aeb);
 	}
-	list_for_each_entry_safe(seb, seb_tmp, &si->erase, u.list) {
-		list_del(&seb->u.list);
-		kmem_cache_free(si->scan_leb_slab, seb);
+	list_for_each_entry_safe(aeb, aeb_tmp, &si->erase, u.list) {
+		list_del(&aeb->u.list);
+		kmem_cache_free(si->scan_leb_slab, aeb);
 	}
-	list_for_each_entry_safe(seb, seb_tmp, &si->corr, u.list) {
-		list_del(&seb->u.list);
-		kmem_cache_free(si->scan_leb_slab, seb);
+	list_for_each_entry_safe(aeb, aeb_tmp, &si->corr, u.list) {
+		list_del(&aeb->u.list);
+		kmem_cache_free(si->scan_leb_slab, aeb);
 	}
-	list_for_each_entry_safe(seb, seb_tmp, &si->free, u.list) {
-		list_del(&seb->u.list);
-		kmem_cache_free(si->scan_leb_slab, seb);
+	list_for_each_entry_safe(aeb, aeb_tmp, &si->free, u.list) {
+		list_del(&aeb->u.list);
+		kmem_cache_free(si->scan_leb_slab, aeb);
 	}
 
 	/* Destroy the volume RB-tree */
@@ -1339,7 +1339,7 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 	int pnum, err, vols_found = 0;
 	struct rb_node *rb1, *rb2;
 	struct ubi_ainf_volume *sv;
-	struct ubi_ainf_peb *seb, *last_seb;
+	struct ubi_ainf_peb *aeb, *last_aeb;
 	uint8_t *buf;
 
 	if (!ubi->dbg->chk_gen)
@@ -1390,51 +1390,51 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 			goto bad_sv;
 		}
 
-		last_seb = NULL;
-		ubi_rb_for_each_entry(rb2, seb, &sv->root, u.rb) {
+		last_aeb = NULL;
+		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb) {
 			cond_resched();
 
-			last_seb = seb;
+			last_aeb = aeb;
 			leb_count += 1;
 
-			if (seb->pnum < 0 || seb->ec < 0) {
+			if (aeb->pnum < 0 || aeb->ec < 0) {
 				ubi_err("negative values");
-				goto bad_seb;
+				goto bad_aeb;
 			}
 
-			if (seb->ec < si->min_ec) {
+			if (aeb->ec < si->min_ec) {
 				ubi_err("bad si->min_ec (%d), %d found",
-					si->min_ec, seb->ec);
-				goto bad_seb;
+					si->min_ec, aeb->ec);
+				goto bad_aeb;
 			}
 
-			if (seb->ec > si->max_ec) {
+			if (aeb->ec > si->max_ec) {
 				ubi_err("bad si->max_ec (%d), %d found",
-					si->max_ec, seb->ec);
-				goto bad_seb;
+					si->max_ec, aeb->ec);
+				goto bad_aeb;
 			}
 
-			if (seb->pnum >= ubi->peb_count) {
+			if (aeb->pnum >= ubi->peb_count) {
 				ubi_err("too high PEB number %d, total PEBs %d",
-					seb->pnum, ubi->peb_count);
-				goto bad_seb;
+					aeb->pnum, ubi->peb_count);
+				goto bad_aeb;
 			}
 
 			if (sv->vol_type == UBI_STATIC_VOLUME) {
-				if (seb->lnum >= sv->used_ebs) {
+				if (aeb->lnum >= sv->used_ebs) {
 					ubi_err("bad lnum or used_ebs");
-					goto bad_seb;
+					goto bad_aeb;
 				}
 			} else {
 				if (sv->used_ebs != 0) {
 					ubi_err("non-zero used_ebs");
-					goto bad_seb;
+					goto bad_aeb;
 				}
 			}
 
-			if (seb->lnum > sv->highest_lnum) {
+			if (aeb->lnum > sv->highest_lnum) {
 				ubi_err("incorrect highest_lnum or lnum");
-				goto bad_seb;
+				goto bad_aeb;
 			}
 		}
 
@@ -1444,14 +1444,14 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 			goto bad_sv;
 		}
 
-		if (!last_seb)
+		if (!last_aeb)
 			continue;
 
-		seb = last_seb;
+		aeb = last_aeb;
 
-		if (seb->lnum != sv->highest_lnum) {
+		if (aeb->lnum != sv->highest_lnum) {
 			ubi_err("bad highest_lnum");
-			goto bad_seb;
+			goto bad_aeb;
 		}
 	}
 
@@ -1463,15 +1463,15 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 
 	/* Check that scanning information is correct */
 	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb) {
-		last_seb = NULL;
-		ubi_rb_for_each_entry(rb2, seb, &sv->root, u.rb) {
+		last_aeb = NULL;
+		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb) {
 			int vol_type;
 
 			cond_resched();
 
-			last_seb = seb;
+			last_aeb = aeb;
 
-			err = ubi_io_read_vid_hdr(ubi, seb->pnum, vidh, 1);
+			err = ubi_io_read_vid_hdr(ubi, aeb->pnum, vidh, 1);
 			if (err && err != UBI_IO_BITFLIPS) {
 				ubi_err("VID header is not OK (%d)", err);
 				if (err > 0)
@@ -1486,8 +1486,8 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 				goto bad_vid_hdr;
 			}
 
-			if (seb->sqnum != be64_to_cpu(vidh->sqnum)) {
-				ubi_err("bad sqnum %llu", seb->sqnum);
+			if (aeb->sqnum != be64_to_cpu(vidh->sqnum)) {
+				ubi_err("bad sqnum %llu", aeb->sqnum);
 				goto bad_vid_hdr;
 			}
 
@@ -1501,8 +1501,8 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 				goto bad_vid_hdr;
 			}
 
-			if (seb->lnum != be32_to_cpu(vidh->lnum)) {
-				ubi_err("bad lnum %d", seb->lnum);
+			if (aeb->lnum != be32_to_cpu(vidh->lnum)) {
+				ubi_err("bad lnum %d", aeb->lnum);
 				goto bad_vid_hdr;
 			}
 
@@ -1517,7 +1517,7 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 			}
 		}
 
-		if (!last_seb)
+		if (!last_aeb)
 			continue;
 
 		if (sv->highest_lnum != be32_to_cpu(vidh->lnum)) {
@@ -1549,20 +1549,20 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 	}
 
 	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb)
-		ubi_rb_for_each_entry(rb2, seb, &sv->root, u.rb)
-			buf[seb->pnum] = 1;
+		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb)
+			buf[aeb->pnum] = 1;
 
-	list_for_each_entry(seb, &si->free, u.list)
-		buf[seb->pnum] = 1;
+	list_for_each_entry(aeb, &si->free, u.list)
+		buf[aeb->pnum] = 1;
 
-	list_for_each_entry(seb, &si->corr, u.list)
-		buf[seb->pnum] = 1;
+	list_for_each_entry(aeb, &si->corr, u.list)
+		buf[aeb->pnum] = 1;
 
-	list_for_each_entry(seb, &si->erase, u.list)
-		buf[seb->pnum] = 1;
+	list_for_each_entry(aeb, &si->erase, u.list)
+		buf[aeb->pnum] = 1;
 
-	list_for_each_entry(seb, &si->alien, u.list)
-		buf[seb->pnum] = 1;
+	list_for_each_entry(aeb, &si->alien, u.list)
+		buf[aeb->pnum] = 1;
 
 	err = 0;
 	for (pnum = 0; pnum < ubi->peb_count; pnum++)
@@ -1576,9 +1576,9 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 		goto out;
 	return 0;
 
-bad_seb:
-	ubi_err("bad scanning information about LEB %d", seb->lnum);
-	ubi_dump_seb(seb, 0);
+bad_aeb:
+	ubi_err("bad scanning information about LEB %d", aeb->lnum);
+	ubi_dump_aeb(aeb, 0);
 	ubi_dump_sv(sv);
 	goto out;
 
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 9ba00c8..7e20a85 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -146,15 +146,15 @@ struct ubi_vid_hdr;
  * ubi_scan_move_to_list - move a PEB from the volume tree to a list.
  *
  * @sv: volume scanning information
- * @seb: scanning eraseblock information
+ * @aeb: scanning eraseblock information
  * @list: the list to move to
  */
 static inline void ubi_scan_move_to_list(struct ubi_ainf_volume *sv,
-					 struct ubi_ainf_peb *seb,
+					 struct ubi_ainf_peb *aeb,
 					 struct list_head *list)
 {
-		rb_erase(&seb->u.rb, &sv->root);
-		list_add_tail(&seb->u.list, list);
+		rb_erase(&aeb->u.rb, &sv->root);
+		list_add_tail(&aeb->u.list, list);
 }
 
 int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
@@ -162,7 +162,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 		      int bitflips);
 struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *si,
 					 int vol_id);
-struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_ainf_volume *sv,
+struct ubi_ainf_peb *ubi_scan_find_aeb(const struct ubi_ainf_volume *sv,
 				       int lnum);
 void ubi_scan_rm_volume(struct ubi_attach_info *si, struct ubi_ainf_volume *sv);
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index fbe2d7f..800958d 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -303,7 +303,7 @@ static int create_vtbl(struct ubi_device *ubi, struct ubi_attach_info *si,
 {
 	int err, tries = 0;
 	struct ubi_vid_hdr *vid_hdr;
-	struct ubi_ainf_peb *new_seb;
+	struct ubi_ainf_peb *new_aeb;
 
 	ubi_msg("create volume table (copy #%d)", copy + 1);
 
@@ -312,9 +312,9 @@ static int create_vtbl(struct ubi_device *ubi, struct ubi_attach_info *si,
 		return -ENOMEM;
 
 retry:
-	new_seb = ubi_scan_get_free_peb(ubi, si);
-	if (IS_ERR(new_seb)) {
-		err = PTR_ERR(new_seb);
+	new_aeb = ubi_scan_get_free_peb(ubi, si);
+	if (IS_ERR(new_aeb)) {
+		err = PTR_ERR(new_aeb);
 		goto out_free;
 	}
 
@@ -327,12 +327,12 @@ retry:
 	vid_hdr->sqnum = cpu_to_be64(++si->max_sqnum);
 
 	/* The EC header is already there, write the VID header */
-	err = ubi_io_write_vid_hdr(ubi, new_seb->pnum, vid_hdr);
+	err = ubi_io_write_vid_hdr(ubi, new_aeb->pnum, vid_hdr);
 	if (err)
 		goto write_error;
 
 	/* Write the layout volume contents */
-	err = ubi_io_write_data(ubi, vtbl, new_seb->pnum, 0, ubi->vtbl_size);
+	err = ubi_io_write_data(ubi, vtbl, new_aeb->pnum, 0, ubi->vtbl_size);
 	if (err)
 		goto write_error;
 
@@ -340,9 +340,9 @@ retry:
 	 * And add it to the scanning information. Don't delete the old version
 	 * of this LEB as it will be deleted and freed in 'ubi_scan_add_used()'.
 	 */
-	err = ubi_scan_add_used(ubi, si, new_seb->pnum, new_seb->ec,
+	err = ubi_scan_add_used(ubi, si, new_aeb->pnum, new_aeb->ec,
 				vid_hdr, 0);
-	kfree(new_seb);
+	kfree(new_aeb);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
 
@@ -352,10 +352,10 @@ write_error:
 		 * Probably this physical eraseblock went bad, try to pick
 		 * another one.
 		 */
-		list_add(&new_seb->u.list, &si->erase);
+		list_add(&new_aeb->u.list, &si->erase);
 		goto retry;
 	}
-	kfree(new_seb);
+	kfree(new_aeb);
 out_free:
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
@@ -378,7 +378,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 {
 	int err;
 	struct rb_node *rb;
-	struct ubi_ainf_peb *seb;
+	struct ubi_ainf_peb *aeb;
 	struct ubi_vtbl_record *leb[UBI_LAYOUT_VOLUME_EBS] = { NULL, NULL };
 	int leb_corrupted[UBI_LAYOUT_VOLUME_EBS] = {1, 1};
 
@@ -410,14 +410,14 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 	dbg_gen("check layout volume");
 
 	/* Read both LEB 0 and LEB 1 into memory */
-	ubi_rb_for_each_entry(rb, seb, &sv->root, u.rb) {
-		leb[seb->lnum] = vzalloc(ubi->vtbl_size);
-		if (!leb[seb->lnum]) {
+	ubi_rb_for_each_entry(rb, aeb, &sv->root, u.rb) {
+		leb[aeb->lnum] = vzalloc(ubi->vtbl_size);
+		if (!leb[aeb->lnum]) {
 			err = -ENOMEM;
 			goto out_free;
 		}
 
-		err = ubi_io_read_data(ubi, leb[seb->lnum], seb->pnum, 0,
+		err = ubi_io_read_data(ubi, leb[aeb->lnum], aeb->pnum, 0,
 				       ubi->vtbl_size);
 		if (err == UBI_IO_BITFLIPS || mtd_is_eccerr(err))
 			/*
@@ -425,12 +425,12 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 			 * uncorrectable ECC error, but we have our own CRC and
 			 * the data will be checked later. If the data is OK,
 			 * the PEB will be scrubbed (because we set
-			 * seb->scrub). If the data is not OK, the contents of
+			 * aeb->scrub). If the data is not OK, the contents of
 			 * the PEB will be recovered from the second copy, and
-			 * seb->scrub will be cleared in
+			 * aeb->scrub will be cleared in
 			 * 'ubi_scan_add_used()'.
 			 */
-			seb->scrub = 1;
+			aeb->scrub = 1;
 		else if (err)
 			goto out_free;
 	}
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 12a85d5..fb870f4 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1385,7 +1385,7 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 	int err, i;
 	struct rb_node *rb1, *rb2;
 	struct ubi_ainf_volume *sv;
-	struct ubi_ainf_peb *seb, *tmp;
+	struct ubi_ainf_peb *aeb, *tmp;
 	struct ubi_wl_entry *e;
 
 	ubi->used = ubi->erroneous = ubi->free = ubi->scrub = RB_ROOT;
@@ -1406,15 +1406,15 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 		INIT_LIST_HEAD(&ubi->pq[i]);
 	ubi->pq_head = 0;
 
-	list_for_each_entry_safe(seb, tmp, &si->erase, u.list) {
+	list_for_each_entry_safe(aeb, tmp, &si->erase, u.list) {
 		cond_resched();
 
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
 		if (!e)
 			goto out_free;
 
-		e->pnum = seb->pnum;
-		e->ec = seb->ec;
+		e->pnum = aeb->pnum;
+		e->ec = aeb->ec;
 		ubi->lookuptbl[e->pnum] = e;
 		if (schedule_erase(ubi, e, 0)) {
 			kmem_cache_free(ubi_wl_entry_slab, e);
@@ -1422,32 +1422,32 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 		}
 	}
 
-	list_for_each_entry(seb, &si->free, u.list) {
+	list_for_each_entry(aeb, &si->free, u.list) {
 		cond_resched();
 
 		e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
 		if (!e)
 			goto out_free;
 
-		e->pnum = seb->pnum;
-		e->ec = seb->ec;
+		e->pnum = aeb->pnum;
+		e->ec = aeb->ec;
 		ubi_assert(e->ec >= 0);
 		wl_tree_add(e, &ubi->free);
 		ubi->lookuptbl[e->pnum] = e;
 	}
 
 	ubi_rb_for_each_entry(rb1, sv, &si->volumes, rb) {
-		ubi_rb_for_each_entry(rb2, seb, &sv->root, u.rb) {
+		ubi_rb_for_each_entry(rb2, aeb, &sv->root, u.rb) {
 			cond_resched();
 
 			e = kmem_cache_alloc(ubi_wl_entry_slab, GFP_KERNEL);
 			if (!e)
 				goto out_free;
 
-			e->pnum = seb->pnum;
-			e->ec = seb->ec;
+			e->pnum = aeb->pnum;
+			e->ec = aeb->ec;
 			ubi->lookuptbl[e->pnum] = e;
-			if (!seb->scrub) {
+			if (!aeb->scrub) {
 				dbg_wl("add PEB %d EC %d to the used tree",
 				       e->pnum, e->ec);
 				wl_tree_add(e, &ubi->used);
-- 
1.7.10
