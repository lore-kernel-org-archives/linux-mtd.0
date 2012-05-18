Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxc-0005Vd-SR
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 02/22] UBI: rename struct ubi_scan_volume
Date: Fri, 18 May 2012 14:03:45 +0300
Message-Id: <1337339045-8199-3-git-send-email-dedekind1@gmail.com>
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

Rename 'struct ubi_scan_volume' to 'struct ubi_ainf_volume'. This is part
of the code re-structuring I am trying to do in order to add fastmap
in a more logical way. Fastmap can share a lot with scanning, including
the attach-time data structures, which all now have "scan" word in the
name. Let's get rid of this word and use "ainf" instead which stands
for "attach information". It has the same length as "scan" so re-naming
is trivial.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.c |    4 ++--
 drivers/mtd/ubi/debug.h |    2 +-
 drivers/mtd/ubi/eba.c   |    2 +-
 drivers/mtd/ubi/scan.c  |   36 ++++++++++++++++++------------------
 drivers/mtd/ubi/scan.h  |   12 ++++++------
 drivers/mtd/ubi/vtbl.c  |   10 +++++-----
 drivers/mtd/ubi/wl.c    |    2 +-
 7 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index a07ce2d..4885fd2 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -171,10 +171,10 @@ void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)
 }
 
 /**
- * ubi_dump_sv - dump a &struct ubi_scan_volume object.
+ * ubi_dump_sv - dump a &struct ubi_ainf_volume object.
  * @sv: the object to dump
  */
-void ubi_dump_sv(const struct ubi_scan_volume *sv)
+void ubi_dump_sv(const struct ubi_ainf_volume *sv)
 {
 	printk(KERN_DEBUG "Volume scanning information dump:\n");
 	printk(KERN_DEBUG "\tvol_id         %d\n", sv->vol_id);
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index c6729ff..041ee4d 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -59,7 +59,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 
 void ubi_dump_vol_info(const struct ubi_volume *vol);
 void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
-void ubi_dump_sv(const struct ubi_scan_volume *sv);
+void ubi_dump_sv(const struct ubi_ainf_volume *sv);
 void ubi_dump_seb(const struct ubi_ainf_peb *seb, int type);
 void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_self_check_all_ff(struct ubi_device *ubi, int pnum, int offset,
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index ac0e0ef..c8500cb 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1215,7 +1215,7 @@ static void print_rsvd_warning(struct ubi_device *ubi,
 int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
 	int i, j, err, num_volumes;
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct ubi_volume *vol;
 	struct ubi_ainf_peb *seb;
 	struct rb_node *rb;
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index cddb60c..5a2a017 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -25,13 +25,13 @@
  * headers and providing complete information about the UBI flash image.
  *
  * The scanning information is represented by a &struct ubi_scan_info' object.
- * Information about found volumes is represented by &struct ubi_scan_volume
+ * Information about found volumes is represented by &struct ubi_ainf_volume
  * objects which are kept in volume RB-tree with root at the @volumes field.
  * The RB-tree is indexed by the volume ID.
  *
  * Scanned logical eraseblocks are represented by &struct ubi_ainf_peb objects.
  * These objects are kept in per-volume RB-trees with the root at the
- * corresponding &struct ubi_scan_volume object. To put it differently, we keep
+ * corresponding &struct ubi_ainf_volume object. To put it differently, we keep
  * an RB-tree of per-volume objects and each of these objects is the root of
  * RB-tree of per-eraseblock objects.
  *
@@ -180,7 +180,7 @@ static int add_corrupted(struct ubi_scan_info *si, int pnum, int ec)
  * headers of the same volume.
  */
 static int validate_vid_hdr(const struct ubi_vid_hdr *vid_hdr,
-			    const struct ubi_scan_volume *sv, int pnum)
+			    const struct ubi_ainf_volume *sv, int pnum)
 {
 	int vol_type = vid_hdr->vol_type;
 	int vol_id = be32_to_cpu(vid_hdr->vol_id);
@@ -244,11 +244,11 @@ bad:
  * to the scanning volume object in case of success and a negative error code
  * in case of failure.
  */
-static struct ubi_scan_volume *add_volume(struct ubi_scan_info *si, int vol_id,
+static struct ubi_ainf_volume *add_volume(struct ubi_scan_info *si, int vol_id,
 					  int pnum,
 					  const struct ubi_vid_hdr *vid_hdr)
 {
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct rb_node **p = &si->volumes.rb_node, *parent = NULL;
 
 	ubi_assert(vol_id == be32_to_cpu(vid_hdr->vol_id));
@@ -256,7 +256,7 @@ static struct ubi_scan_volume *add_volume(struct ubi_scan_info *si, int vol_id,
 	/* Walk the volume RB-tree to look if this volume is already present */
 	while (*p) {
 		parent = *p;
-		sv = rb_entry(parent, struct ubi_scan_volume, rb);
+		sv = rb_entry(parent, struct ubi_ainf_volume, rb);
 
 		if (vol_id == sv->vol_id)
 			return sv;
@@ -268,7 +268,7 @@ static struct ubi_scan_volume *add_volume(struct ubi_scan_info *si, int vol_id,
 	}
 
 	/* The volume is absent - add it */
-	sv = kmalloc(sizeof(struct ubi_scan_volume), GFP_KERNEL);
+	sv = kmalloc(sizeof(struct ubi_ainf_volume), GFP_KERNEL);
 	if (!sv)
 		return ERR_PTR(-ENOMEM);
 
@@ -446,7 +446,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 {
 	int err, vol_id, lnum;
 	unsigned long long sqnum;
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct ubi_ainf_peb *seb;
 	struct rb_node **p, *parent = NULL;
 
@@ -593,14 +593,14 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
  * This function returns a pointer to the volume description or %NULL if there
  * are no data about this volume in the scanning information.
  */
-struct ubi_scan_volume *ubi_scan_find_sv(const struct ubi_scan_info *si,
+struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_scan_info *si,
 					 int vol_id)
 {
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct rb_node *p = si->volumes.rb_node;
 
 	while (p) {
-		sv = rb_entry(p, struct ubi_scan_volume, rb);
+		sv = rb_entry(p, struct ubi_ainf_volume, rb);
 
 		if (vol_id == sv->vol_id)
 			return sv;
@@ -622,7 +622,7 @@ struct ubi_scan_volume *ubi_scan_find_sv(const struct ubi_scan_info *si,
  * This function returns a pointer to the scanning logical eraseblock or %NULL
  * if there are no data about it in the scanning volume information.
  */
-struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_scan_volume *sv,
+struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_ainf_volume *sv,
 				       int lnum)
 {
 	struct ubi_ainf_peb *seb;
@@ -648,7 +648,7 @@ struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_scan_volume *sv,
  * @si: scanning information
  * @sv: the volume scanning information to delete
  */
-void ubi_scan_rm_volume(struct ubi_scan_info *si, struct ubi_scan_volume *sv)
+void ubi_scan_rm_volume(struct ubi_scan_info *si, struct ubi_ainf_volume *sv)
 {
 	struct rb_node *rb;
 	struct ubi_ainf_peb *seb;
@@ -1147,7 +1147,7 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
 {
 	int err, pnum;
 	struct rb_node *rb1, *rb2;
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct ubi_ainf_peb *seb;
 	struct ubi_scan_info *si;
 
@@ -1244,7 +1244,7 @@ out_si:
  * This function destroys the volume RB-tree (@sv->root) and the scanning
  * volume information.
  */
-static void destroy_sv(struct ubi_scan_info *si, struct ubi_scan_volume *sv)
+static void destroy_sv(struct ubi_scan_info *si, struct ubi_ainf_volume *sv)
 {
 	struct ubi_ainf_peb *seb;
 	struct rb_node *this = sv->root.rb_node;
@@ -1277,7 +1277,7 @@ static void destroy_sv(struct ubi_scan_info *si, struct ubi_scan_volume *sv)
 void ubi_scan_destroy_si(struct ubi_scan_info *si)
 {
 	struct ubi_ainf_peb *seb, *seb_tmp;
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct rb_node *rb;
 
 	list_for_each_entry_safe(seb, seb_tmp, &si->alien, u.list) {
@@ -1305,7 +1305,7 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
 		else if (rb->rb_right)
 			rb = rb->rb_right;
 		else {
-			sv = rb_entry(rb, struct ubi_scan_volume, rb);
+			sv = rb_entry(rb, struct ubi_ainf_volume, rb);
 
 			rb = rb_parent(rb);
 			if (rb) {
@@ -1337,7 +1337,7 @@ static int self_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
 	int pnum, err, vols_found = 0;
 	struct rb_node *rb1, *rb2;
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct ubi_ainf_peb *seb, *last_seb;
 	uint8_t *buf;
 
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 2cd6662..5523f0b 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -53,7 +53,7 @@ struct ubi_ainf_peb {
 };
 
 /**
- * struct ubi_scan_volume - scanning information about a volume.
+ * struct ubi_ainf_volume - scanning information about a volume.
  * @vol_id: volume ID
  * @highest_lnum: highest logical eraseblock number in this volume
  * @leb_count: number of logical eraseblocks in this volume
@@ -72,7 +72,7 @@ struct ubi_ainf_peb {
  *
  * One object of this type is allocated for each volume during scanning.
  */
-struct ubi_scan_volume {
+struct ubi_ainf_volume {
 	int vol_id;
 	int highest_lnum;
 	int leb_count;
@@ -148,7 +148,7 @@ struct ubi_vid_hdr;
  * @seb: scanning eraseblock information
  * @list: the list to move to
  */
-static inline void ubi_scan_move_to_list(struct ubi_scan_volume *sv,
+static inline void ubi_scan_move_to_list(struct ubi_ainf_volume *sv,
 					 struct ubi_ainf_peb *seb,
 					 struct list_head *list)
 {
@@ -159,11 +159,11 @@ static inline void ubi_scan_move_to_list(struct ubi_scan_volume *sv,
 int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 		      int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
 		      int bitflips);
-struct ubi_scan_volume *ubi_scan_find_sv(const struct ubi_scan_info *si,
+struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_scan_info *si,
 					 int vol_id);
-struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_scan_volume *sv,
+struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_ainf_volume *sv,
 				       int lnum);
-void ubi_scan_rm_volume(struct ubi_scan_info *si, struct ubi_scan_volume *sv);
+void ubi_scan_rm_volume(struct ubi_scan_info *si, struct ubi_ainf_volume *sv);
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 					   struct ubi_scan_info *si);
 int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_scan_info *si,
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index c9b828a..379f620 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -374,7 +374,7 @@ out_free:
  */
 static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 					    struct ubi_scan_info *si,
-					    struct ubi_scan_volume *sv)
+					    struct ubi_ainf_volume *sv)
 {
 	int err;
 	struct rb_node *rb;
@@ -535,7 +535,7 @@ static int init_volumes(struct ubi_device *ubi, const struct ubi_scan_info *si,
 			const struct ubi_vtbl_record *vtbl)
 {
 	int i, reserved_pebs = 0;
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct ubi_volume *vol;
 
 	for (i = 0; i < ubi->vtbl_slots; i++) {
@@ -668,7 +668,7 @@ static int init_volumes(struct ubi_device *ubi, const struct ubi_scan_info *si,
  * to the data read from the volume tabla, and %-EINVAL if not.
  */
 static int check_sv(const struct ubi_volume *vol,
-		    const struct ubi_scan_volume *sv)
+		    const struct ubi_ainf_volume *sv)
 {
 	int err;
 
@@ -715,7 +715,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
 			       struct ubi_scan_info *si)
 {
 	int err, i;
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct ubi_volume *vol;
 
 	if (si->vols_found > UBI_INT_VOL_COUNT + ubi->vtbl_slots) {
@@ -779,7 +779,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
 int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
 	int i, err;
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 
 	empty_vtbl_record.crc = cpu_to_be32(0xf116c36b);
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 91869e8..53ef24b 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1384,7 +1384,7 @@ int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
 {
 	int err, i;
 	struct rb_node *rb1, *rb2;
-	struct ubi_scan_volume *sv;
+	struct ubi_ainf_volume *sv;
 	struct ubi_ainf_peb *seb, *tmp;
 	struct ubi_wl_entry *e;
 
-- 
1.7.10
