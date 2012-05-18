Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxe-0005Vt-7N
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:10 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/22] UBI: rename struct ubi_scan_info
Date: Fri, 18 May 2012 14:03:46 +0300
Message-Id: <1337339045-8199-4-git-send-email-dedekind1@gmail.com>
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

Rename 'struct ubi_scan_info' to 'struct ubi_attach_info'. This is part
of the code re-structuring I am trying to do in order to add fastmap
in a more logical way. Fastmap can share a lot with scanning, including
the attach-time data structures, which all now have "scan" word in the
name. Let's get rid of this word.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |    2 +-
 drivers/mtd/ubi/eba.c   |    4 ++--
 drivers/mtd/ubi/scan.c  |   41 +++++++++++++++++++++--------------------
 drivers/mtd/ubi/scan.h  |   18 +++++++++---------
 drivers/mtd/ubi/ubi.h   |    6 +++---
 drivers/mtd/ubi/vtbl.c  |   13 +++++++------
 drivers/mtd/ubi/wl.c    |    2 +-
 7 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 3d55597..4e715df 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -583,7 +583,7 @@ static void free_internal_volumes(struct ubi_device *ubi)
 static int attach_by_scanning(struct ubi_device *ubi)
 {
 	int err;
-	struct ubi_scan_info *si;
+	struct ubi_attach_info *si;
 
 	si = ubi_scan(ubi);
 	if (IS_ERR(si))
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index c8500cb..264482f 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1182,7 +1182,7 @@ out_unlock_leb:
  * reported by real users.
  */
 static void print_rsvd_warning(struct ubi_device *ubi,
-			       struct ubi_scan_info *si)
+			       struct ubi_attach_info *si)
 {
 	/*
 	 * The 1 << 18 (256KiB) number is picked randomly, just a reasonably
@@ -1212,7 +1212,7 @@ static void print_rsvd_warning(struct ubi_device *ubi,
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
+int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 {
 	int i, j, err, num_volumes;
 	struct ubi_ainf_volume *sv;
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 5a2a017..c989177 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -24,7 +24,7 @@
  * This sub-system is responsible for scanning the flash media, checking UBI
  * headers and providing complete information about the UBI flash image.
  *
- * The scanning information is represented by a &struct ubi_scan_info' object.
+ * The scanning information is represented by a &struct ubi_attach_info' object.
  * Information about found volumes is represented by &struct ubi_ainf_volume
  * objects which are kept in volume RB-tree with root at the @volumes field.
  * The RB-tree is indexed by the volume ID.
@@ -88,7 +88,7 @@
 #include <linux/random.h>
 #include "ubi.h"
 
-static int self_check_si(struct ubi_device *ubi, struct ubi_scan_info *si);
+static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si);
 
 /* Temporary variables used during scanning */
 static struct ubi_ec_hdr *ech;
@@ -110,8 +110,8 @@ static struct ubi_vid_hdr *vidh;
  * returns zero in case of success and a negative error code in case of
  * failure.
  */
-static int add_to_list(struct ubi_scan_info *si, int pnum, int ec, int to_head,
-		       struct list_head *list)
+static int add_to_list(struct ubi_attach_info *si, int pnum, int ec,
+		       int to_head, struct list_head *list)
 {
 	struct ubi_ainf_peb *seb;
 
@@ -148,7 +148,7 @@ static int add_to_list(struct ubi_scan_info *si, int pnum, int ec, int to_head,
  * The corruption was presumably not caused by a power cut. Returns zero in
  * case of success and a negative error code in case of failure.
  */
-static int add_corrupted(struct ubi_scan_info *si, int pnum, int ec)
+static int add_corrupted(struct ubi_attach_info *si, int pnum, int ec)
 {
 	struct ubi_ainf_peb *seb;
 
@@ -244,8 +244,8 @@ bad:
  * to the scanning volume object in case of success and a negative error code
  * in case of failure.
  */
-static struct ubi_ainf_volume *add_volume(struct ubi_scan_info *si, int vol_id,
-					  int pnum,
+static struct ubi_ainf_volume *add_volume(struct ubi_attach_info *si,
+					  int vol_id, int pnum,
 					  const struct ubi_vid_hdr *vid_hdr)
 {
 	struct ubi_ainf_volume *sv;
@@ -440,7 +440,7 @@ out_free_vidh:
  * to be picked, while the older one has to be dropped. This function returns
  * zero in case of success and a negative error code in case of failure.
  */
-int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
+int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 		      int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
 		      int bitflips)
 {
@@ -593,7 +593,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
  * This function returns a pointer to the volume description or %NULL if there
  * are no data about this volume in the scanning information.
  */
-struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_scan_info *si,
+struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *si,
 					 int vol_id)
 {
 	struct ubi_ainf_volume *sv;
@@ -648,7 +648,7 @@ struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_ainf_volume *sv,
  * @si: scanning information
  * @sv: the volume scanning information to delete
  */
-void ubi_scan_rm_volume(struct ubi_scan_info *si, struct ubi_ainf_volume *sv)
+void ubi_scan_rm_volume(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
 {
 	struct rb_node *rb;
 	struct ubi_ainf_peb *seb;
@@ -679,7 +679,7 @@ void ubi_scan_rm_volume(struct ubi_scan_info *si, struct ubi_ainf_volume *sv)
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_scan_info *si,
+int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_attach_info *si,
 		       int pnum, int ec)
 {
 	int err;
@@ -726,7 +726,7 @@ out_free:
  * success and an error code in case of failure.
  */
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
-					   struct ubi_scan_info *si)
+					   struct ubi_attach_info *si)
 {
 	int err = 0;
 	struct ubi_ainf_peb *seb, *tmp_seb;
@@ -831,7 +831,7 @@ out_unlock:
  * This function returns a zero if the physical eraseblock was successfully
  * handled and a negative error code in case of failure.
  */
-static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
+static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *si,
 		      int pnum)
 {
 	long long uninitialized_var(ec);
@@ -1073,7 +1073,8 @@ adjust_mean_ec:
  * MTD device. Returns zero if we should proceed with attaching the MTD device,
  * and %-EINVAL if we should not.
  */
-static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
+static int check_what_we_have(struct ubi_device *ubi,
+			      struct ubi_attach_info *si)
 {
 	struct ubi_ainf_peb *seb;
 	int max_corr, peb_count;
@@ -1143,15 +1144,15 @@ static int check_what_we_have(struct ubi_device *ubi, struct ubi_scan_info *si)
  * This function does full scanning of an MTD device and returns complete
  * information about it. In case of failure, an error code is returned.
  */
-struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
+struct ubi_attach_info *ubi_scan(struct ubi_device *ubi)
 {
 	int err, pnum;
 	struct rb_node *rb1, *rb2;
 	struct ubi_ainf_volume *sv;
 	struct ubi_ainf_peb *seb;
-	struct ubi_scan_info *si;
+	struct ubi_attach_info *si;
 
-	si = kzalloc(sizeof(struct ubi_scan_info), GFP_KERNEL);
+	si = kzalloc(sizeof(struct ubi_attach_info), GFP_KERNEL);
 	if (!si)
 		return ERR_PTR(-ENOMEM);
 
@@ -1244,7 +1245,7 @@ out_si:
  * This function destroys the volume RB-tree (@sv->root) and the scanning
  * volume information.
  */
-static void destroy_sv(struct ubi_scan_info *si, struct ubi_ainf_volume *sv)
+static void destroy_sv(struct ubi_attach_info *si, struct ubi_ainf_volume *sv)
 {
 	struct ubi_ainf_peb *seb;
 	struct rb_node *this = sv->root.rb_node;
@@ -1274,7 +1275,7 @@ static void destroy_sv(struct ubi_scan_info *si, struct ubi_ainf_volume *sv)
  * ubi_scan_destroy_si - destroy scanning information.
  * @si: scanning information
  */
-void ubi_scan_destroy_si(struct ubi_scan_info *si)
+void ubi_scan_destroy_si(struct ubi_attach_info *si)
 {
 	struct ubi_ainf_peb *seb, *seb_tmp;
 	struct ubi_ainf_volume *sv;
@@ -1333,7 +1334,7 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
  * This function returns zero if the scanning information is all right, and a
  * negative error code if not or if an error occurred.
  */
-static int self_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
+static int self_check_si(struct ubi_device *ubi, struct ubi_attach_info *si)
 {
 	int pnum, err, vols_found = 0;
 	struct rb_node *rb1, *rb2;
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 5523f0b..d32f183 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -86,7 +86,7 @@ struct ubi_ainf_volume {
 };
 
 /**
- * struct ubi_scan_info - UBI scanning information.
+ * struct ubi_attach_info - UBI scanning information.
  * @volumes: root of the volume RB-tree
  * @corr: list of corrupted physical eraseblocks
  * @free: list of free physical eraseblocks
@@ -115,7 +115,7 @@ struct ubi_ainf_volume {
  * UBI sub-systems to build final UBI data structures, further error-recovery
  * and so on.
  */
-struct ubi_scan_info {
+struct ubi_attach_info {
 	struct rb_root volumes;
 	struct list_head corr;
 	struct list_head free;
@@ -156,19 +156,19 @@ static inline void ubi_scan_move_to_list(struct ubi_ainf_volume *sv,
 		list_add_tail(&seb->u.list, list);
 }
 
-int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
+int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *si,
 		      int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
 		      int bitflips);
-struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_scan_info *si,
+struct ubi_ainf_volume *ubi_scan_find_sv(const struct ubi_attach_info *si,
 					 int vol_id);
 struct ubi_ainf_peb *ubi_scan_find_seb(const struct ubi_ainf_volume *sv,
 				       int lnum);
-void ubi_scan_rm_volume(struct ubi_scan_info *si, struct ubi_ainf_volume *sv);
+void ubi_scan_rm_volume(struct ubi_attach_info *si, struct ubi_ainf_volume *sv);
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
-					   struct ubi_scan_info *si);
-int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_scan_info *si,
+					   struct ubi_attach_info *si);
+int ubi_scan_erase_peb(struct ubi_device *ubi, const struct ubi_attach_info *si,
 		       int pnum, int ec);
-struct ubi_scan_info *ubi_scan(struct ubi_device *ubi);
-void ubi_scan_destroy_si(struct ubi_scan_info *si);
+struct ubi_attach_info *ubi_scan(struct ubi_device *ubi);
+void ubi_scan_destroy_si(struct ubi_attach_info *si);
 
 #endif /* !__UBI_SCAN_H__ */
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 75b9f1c..0f20651 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -489,7 +489,7 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 			   struct ubi_vtbl_record *vtbl_rec);
 int ubi_vtbl_rename_volumes(struct ubi_device *ubi,
 			    struct list_head *rename_list);
-int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_scan_info *si);
+int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *si);
 
 /* vmt.c */
 int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req);
@@ -529,14 +529,14 @@ int ubi_eba_atomic_leb_change(struct ubi_device *ubi, struct ubi_volume *vol,
 			      int lnum, const void *buf, int len);
 int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 		     struct ubi_vid_hdr *vid_hdr);
-int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si);
+int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si);
 
 /* wl.c */
 int ubi_wl_get_peb(struct ubi_device *ubi);
 int ubi_wl_put_peb(struct ubi_device *ubi, int pnum, int torture);
 int ubi_wl_flush(struct ubi_device *ubi);
 int ubi_wl_scrub_peb(struct ubi_device *ubi, int pnum);
-int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si);
+int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si);
 void ubi_wl_close(struct ubi_device *ubi);
 int ubi_thread(void *u);
 
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 379f620..fbe2d7f 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -298,7 +298,7 @@ bad:
  * This function returns zero in case of success and a negative error code in
  * case of failure.
  */
-static int create_vtbl(struct ubi_device *ubi, struct ubi_scan_info *si,
+static int create_vtbl(struct ubi_device *ubi, struct ubi_attach_info *si,
 		       int copy, void *vtbl)
 {
 	int err, tries = 0;
@@ -373,7 +373,7 @@ out_free:
  * table in case of success and a negative error code in case of failure.
  */
 static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
-					    struct ubi_scan_info *si,
+					    struct ubi_attach_info *si,
 					    struct ubi_ainf_volume *sv)
 {
 	int err;
@@ -496,7 +496,7 @@ out_free:
  * negative error code in case of failure.
  */
 static struct ubi_vtbl_record *create_empty_lvol(struct ubi_device *ubi,
-						 struct ubi_scan_info *si)
+						 struct ubi_attach_info *si)
 {
 	int i;
 	struct ubi_vtbl_record *vtbl;
@@ -531,7 +531,8 @@ static struct ubi_vtbl_record *create_empty_lvol(struct ubi_device *ubi,
  * Returns zero in case of success and a negative error code in case of
  * failure.
  */
-static int init_volumes(struct ubi_device *ubi, const struct ubi_scan_info *si,
+static int init_volumes(struct ubi_device *ubi,
+			const struct ubi_attach_info *si,
 			const struct ubi_vtbl_record *vtbl)
 {
 	int i, reserved_pebs = 0;
@@ -712,7 +713,7 @@ bad:
  * information is OK and %-EINVAL if it is not.
  */
 static int check_scanning_info(const struct ubi_device *ubi,
-			       struct ubi_scan_info *si)
+			       struct ubi_attach_info *si)
 {
 	int err, i;
 	struct ubi_ainf_volume *sv;
@@ -776,7 +777,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
  * or creates it if needed. Returns zero in case of success and a negative
  * error code in case of failure.
  */
-int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_scan_info *si)
+int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *si)
 {
 	int i, err;
 	struct ubi_ainf_volume *sv;
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 53ef24b..12a85d5 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1380,7 +1380,7 @@ static void cancel_pending(struct ubi_device *ubi)
  * This function returns zero in case of success, and a negative error code in
  * case of failure.
  */
-int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_scan_info *si)
+int ubi_wl_init_scan(struct ubi_device *ubi, struct ubi_attach_info *si)
 {
 	int err, i;
 	struct rb_node *rb1, *rb2;
-- 
1.7.10
