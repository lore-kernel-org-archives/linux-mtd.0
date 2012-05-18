Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxb-0005Vt-St
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:05 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/22] UBI: rename struct ubi_scan_leb
Date: Fri, 18 May 2012 14:03:44 +0300
Message-Id: <1337339045-8199-2-git-send-email-dedekind1@gmail.com>
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

Rename 'struct ubi_scan_leb' to 'struct ubi_ainf_leb'. This is part
of the code re-structuring I am trying to do in order to add fastmap
in a more logical way. Fastmap can share a lot with scanning, including
the attach-time data structures, which all now have "scan" word in the
name. Let's get rid of this word and use "ainf" instead which stands
for "attach information". It has the same length as "scan" so re-naming
is trivial.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |    2 +-
 drivers/mtd/ubi/debug.c |    4 ++--
 drivers/mtd/ubi/debug.h |    2 +-
 drivers/mtd/ubi/eba.c   |    2 +-
 drivers/mtd/ubi/scan.c  |   42 +++++++++++++++++++++---------------------
 drivers/mtd/ubi/scan.h  |   16 ++++++++--------
 drivers/mtd/ubi/vtbl.c  |    4 ++--
 drivers/mtd/ubi/wl.c    |    2 +-
 8 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 2d57282..3d55597 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -937,7 +937,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	spin_lock_init(&ubi->volumes_lock);
 
 	ubi_msg("attaching mtd%d to ubi%d", mtd->index, ubi_num);
-	dbg_msg("sizeof(struct ubi_scan_leb) %zu", sizeof(struct ubi_scan_leb));
+	dbg_msg("sizeof(struct ubi_ainf_peb) %zu", sizeof(struct ubi_ainf_peb));
 	dbg_msg("sizeof(struct ubi_wl_entry) %zu", sizeof(struct ubi_wl_entry));
 
 	err = io_init(ubi);
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index c6becde..a07ce2d 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -188,11 +188,11 @@ void ubi_dump_sv(const struct ubi_scan_volume *sv)
 }
 
 /**
- * ubi_dump_seb - dump a &struct ubi_scan_leb object.
+ * ubi_dump_seb - dump a &struct ubi_ainf_peb object.
  * @seb: the object to dump
  * @type: object type: 0 - not corrupted, 1 - corrupted
  */
-void ubi_dump_seb(const struct ubi_scan_leb *seb, int type)
+void ubi_dump_seb(const struct ubi_ainf_peb *seb, int type)
 {
 	printk(KERN_DEBUG "eraseblock scanning information dump:\n");
 	printk(KERN_DEBUG "\tec       %d\n", seb->ec);
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 4d0a4cd..c6729ff 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -60,7 +60,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 void ubi_dump_vol_info(const struct ubi_volume *vol);
 void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
 void ubi_dump_sv(const struct ubi_scan_volume *sv);
-void ubi_dump_seb(const struct ubi_scan_leb *seb, int type);
+void ubi_dump_seb(const struct ubi_ainf_peb *seb, int type);
 void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset,
 			  int len);
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index bd5fdbf..ac0e0ef 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1217,7 +1217,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 	int i, j, err, num_volumes;
 	struct ubi_scan_volume *sv;
 	struct ubi_volume *vol;
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 	struct rb_node *rb;
 
 	dbg_eba("initialize EBA sub-system");
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index dc7f9db..cddb60c 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -29,7 +29,7 @@
  * objects which are kept in volume RB-tree with root at the @volumes field.
  * The RB-tree is indexed by the volume ID.
  *
- * Scanned logical eraseblocks are represented by &struct ubi_scan_leb objects.
+ * Scanned logical eraseblocks are represented by &struct ubi_ainf_peb objects.
  * These objects are kept in per-volume RB-trees with the root at the
  * corresponding &struct ubi_scan_volume object. To put it differently, we keep
  * an RB-tree of per-volume objects and each of these objects is the root of
@@ -113,7 +113,7 @@ static struct ubi_vid_hdr *vidh;
 static int add_to_list(struct ubi_scan_info *si, int pnum, int ec, int to_head,
 		       struct list_head *list)
 {
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 
 	if (list == &si->free) {
 		dbg_bld("add to free: PEB %d, EC %d", pnum, ec);
@@ -150,7 +150,7 @@ static int add_to_list(struct ubi_scan_info *si, int pnum, int ec, int to_head,
  */
 static int add_corrupted(struct ubi_scan_info *si, int pnum, int ec)
 {
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 
 	dbg_bld("add to corrupted: PEB %d, EC %d", pnum, ec);
 
@@ -310,7 +310,7 @@ static struct ubi_scan_volume *add_volume(struct ubi_scan_info *si, int vol_id,
  *     o bit 2 is cleared: the older LEB is not corrupted;
  *     o bit 2 is set: the older LEB is corrupted.
  */
-static int compare_lebs(struct ubi_device *ubi, const struct ubi_scan_leb *seb,
+static int compare_lebs(struct ubi_device *ubi, const struct ubi_ainf_peb *seb,
 			int pnum, const struct ubi_vid_hdr *vid_hdr)
 {
 	void *buf;
@@ -447,7 +447,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 	int err, vol_id, lnum;
 	unsigned long long sqnum;
 	struct ubi_scan_volume *sv;
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 	struct rb_node **p, *parent = NULL;
 
 	vol_id = be32_to_cpu(vid_hdr->vol_id);
@@ -473,7 +473,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 		int cmp_res;
 
 		parent = *p;
-		seb = rb_entry(parent, struct ubi_scan_leb, u.rb);
+		seb = rb_entry(parent, struct ubi_ainf_peb, u.rb);
 		if (lnum != seb->lnum) {
 			if (lnum < seb->lnum)
 				p = &(*p)->rb_left;
@@ -622,14 +622,14 @@ struct ubi_scan_volume *ubi_scan_find_sv(const struct ubi_scan_info *si,
  * This function returns a pointer to the scanning logical eraseblock or %NULL
  * if there are no data about it in the scanning volume information.
  */
-struct ubi_scan_leb *ubi_scan_find_seb(const struct ubi_scan_volume *sv,
+struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_scan_volume *sv,
 				       int lnum)
 {
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 	struct rb_node *p = sv->root.rb_node;
 
 	while (p) {
-		seb = rb_entry(p, struct ubi_scan_leb, u.rb);
+		seb = rb_entry(p, struct ubi_ainf_peb, u.rb);
 
 		if (lnum == seb->lnum)
 			return seb;
@@ -651,12 +651,12 @@ struct ubi_scan_leb *ubi_scan_find_seb(const struct ubi_scan_volume *sv,
 void ubi_scan_rm_volume(struct ubi_scan_info *si, struct ubi_scan_volume *sv)
 {
 	struct rb_node *rb;
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 
 	dbg_bld("remove scanning information about volume %d", sv->vol_id);
 
 	while ((rb = rb_first(&sv->root))) {
-		seb = rb_entry(rb, struct ubi_scan_leb, u.rb);
+		seb = rb_entry(rb, struct ubi_ainf_peb, u.rb);
 		rb_erase(&seb->u.rb, &sv->root);
 		list_add_tail(&seb->u.list, &si->erase);
 	}
@@ -725,14 +725,14 @@ out_free:
  * This function returns scanning physical eraseblock information in case of
  * success and an error code in case of failure.
  */
-struct ubi_scan_leb *ubi_scan_get_free_peb(struct ubi_device *ubi,
+struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 					   struct ubi_scan_info *si)
 {
 	int err = 0;
-	struct ubi_scan_leb *seb, *tmp_seb;
+	struct ubi_ainf_peb *seb, *tmp_seb;
 
 	if (!list_empty(&si->free)) {
-		seb = list_entry(si->free.next, struct ubi_scan_leb, u.list);
+		seb = list_entry(si->free.next, struct ubi_ainf_peb, u.list);
 		list_del(&seb->u.list);
 		dbg_bld("return free PEB %d, EC %d", seb->pnum, seb->ec);
 		return seb;
@@ -1075,7 +1075,7 @@ adjust_mean_ec:
  */
 static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 	int max_corr, peb_count;
 
 	peb_count = ubi->peb_count - si->bad_peb_count - si->alien_peb_count;
@@ -1148,7 +1148,7 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 	int err, pnum;
 	struct rb_node *rb1, *rb2;
 	struct ubi_scan_volume *sv;
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 	struct ubi_scan_info *si;
 
 	si = kzalloc(sizeof(struct ubi_scan_info), GFP_KERNEL);
@@ -1163,7 +1163,7 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 
 	err = -ENOMEM;
 	si->scan_leb_slab = kmem_cache_create("ubi_scan_leb_slab",
-					      sizeof(struct ubi_scan_leb),
+					      sizeof(struct ubi_ainf_peb),
 					      0, 0, NULL);
 	if (!si->scan_leb_slab)
 		goto out_si;
@@ -1246,7 +1246,7 @@ out_si:
  */
 static void destroy_sv(struct ubi_scan_info *si, struct ubi_scan_volume *sv)
 {
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 	struct rb_node *this = sv->root.rb_node;
 
 	while (this) {
@@ -1255,7 +1255,7 @@ static void destroy_sv(struct ubi_scan_info *si, struct ubi_scan_volume *sv)
 		else if (this->rb_right)
 			this = this->rb_right;
 		else {
-			seb = rb_entry(this, struct ubi_scan_leb, u.rb);
+			seb = rb_entry(this, struct ubi_ainf_peb, u.rb);
 			this = rb_parent(this);
 			if (this) {
 				if (this->rb_left == &seb->u.rb)
@@ -1276,7 +1276,7 @@ static void destroy_sv(struct ubi_scan_info *si, struct ubi_scan_volume *sv)
  */
 void ubi_scan_destroy_si(struct ubi_scan_info *si)
 {
-	struct ubi_scan_leb *seb, *seb_tmp;
+	struct ubi_ainf_peb *seb, *seb_tmp;
 	struct ubi_scan_volume *sv;
 	struct rb_node *rb;
 
@@ -1338,7 +1338,7 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 	int pnum, err, vols_found = 0;
 	struct rb_node *rb1, *rb2;
 	struct ubi_scan_volume *sv;
-	struct ubi_scan_leb *seb, *last_seb;
+	struct ubi_ainf_peb *seb, *last_seb;
 	uint8_t *buf;
 
 	if (!ubi->dbg->chk_gen)
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index d48aef1..2cd6662 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -25,7 +25,7 @@
 #define UBI_SCAN_UNKNOWN_EC (-1)
 
 /**
- * struct ubi_scan_leb - scanning information about a physical eraseblock.
+ * struct ubi_ainf_peb - scanning information about a physical eraseblock.
  * @ec: erase counter (%UBI_SCAN_UNKNOWN_EC if it is unknown)
  * @pnum: physical eraseblock number
  * @lnum: logical eraseblock number
@@ -33,13 +33,13 @@
  * @copy_flag: this LEB is a copy (@copy_flag is set in VID header of this LEB)
  * @sqnum: sequence number
  * @u: unions RB-tree or @list links
- * @u.rb: link in the per-volume RB-tree of &struct ubi_scan_leb objects
+ * @u.rb: link in the per-volume RB-tree of &struct ubi_ainf_peb objects
  * @u.list: link in one of the eraseblock lists
  *
  * One object of this type is allocated for each physical eraseblock during
  * scanning.
  */
-struct ubi_scan_leb {
+struct ubi_ainf_peb {
 	int ec;
 	int pnum;
 	int lnum;
@@ -68,7 +68,7 @@ struct ubi_scan_leb {
  * @compat: compatibility flags of this volume
  * @rb: link in the volume RB-tree
  * @root: root of the RB-tree containing all the eraseblock belonging to this
- *        volume (&struct ubi_scan_leb objects)
+ *        volume (&struct ubi_ainf_peb objects)
  *
  * One object of this type is allocated for each volume during scanning.
  */
@@ -109,7 +109,7 @@ struct ubi_scan_volume {
  * @mean_ec: mean erase counter value
  * @ec_sum: a temporary variable used when calculating @mean_ec
  * @ec_count: a temporary variable used when calculating @mean_ec
- * @scan_leb_slab: slab cache for &struct ubi_scan_leb objects
+ * @scan_leb_slab: slab cache for &struct ubi_ainf_peb objects
  *
  * This data structure contains the result of scanning and may be used by other
  * UBI sub-systems to build final UBI data structures, further error-recovery
@@ -149,7 +149,7 @@ struct ubi_vid_hdr;
  * @list: the list to move to
  */
 static inline void ubi_scan_move_to_list(struct ubi_scan_volume *sv,
-					 struct ubi_scan_leb *seb,
+					 struct ubi_ainf_peb *seb,
 					 struct list_head *list)
 {
 		rb_erase(&seb->u.rb, &sv->root);
@@ -161,10 +161,10 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 		      int bitflips);
 struct ubi_scan_volume *ubi_scan_find_sv(const struct ubi_scan_info *si,
 					 int vol_id);
-struct ubi_scan_leb *ubi_scan_find_seb(const struct ubi_scan_volume *sv,
+struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_scan_volume *sv,
 				       int lnum);
 void ubi_scan_rm_volume(struct ubi_scan_info *si, struct ubi_scan_volume *sv);
-struct ubi_scan_leb *ubi_scan_get_free_peb(struct ubi_device *ubi,
+struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 					   struct ubi_scan_info *si);
 int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_scan_info *si,
 		       int pnum, int ec);
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index f3fbaa9..c9b828a 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -303,7 +303,7 @@ static int create_vtbl(struct ubi_device *ubi, struct ubi_scan_info *si,
 {
 	int err, tries = 0;
 	struct ubi_vid_hdr *vid_hdr;
-	struct ubi_scan_leb *new_seb;
+	struct ubi_ainf_peb *new_seb;
 
 	ubi_msg("create volume table (copy #%d)", copy + 1);
 
@@ -378,7 +378,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 {
 	int err;
 	struct rb_node *rb;
-	struct ubi_scan_leb *seb;
+	struct ubi_ainf_peb *seb;
 	struct ubi_vtbl_record *leb[UBI_LAYOUT_VOLUME_EBS] = { NULL, NULL };
 	int leb_corrupted[UBI_LAYOUT_VOLUME_EBS] = {1, 1};
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index b847f55..91869e8 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1385,7 +1385,7 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 	int err, i;
 	struct rb_node *rb1, *rb2;
 	struct ubi_scan_volume *sv;
-	struct ubi_scan_leb *seb, *tmp;
+	struct ubi_ainf_peb *seb, *tmp;
 	struct ubi_wl_entry *e;
 
 	ubi->used = ubi->erroneous = ubi->free = ubi->scrub = RB_ROOT;
-- 
1.7.10
