Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKy0-0005Xc-JX
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:32 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 11/22] UBI: rename ubi_scan_find_av
Date: Fri, 18 May 2012 14:03:54 +0300
Message-Id: <1337339045-8199-12-git-send-email-dedekind1@gmail.com>
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

The old name is not logical anymore - rename it to 'ubi_find_av()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/eba.c  |    2 +-
 drivers/mtd/ubi/scan.c |    6 +++---
 drivers/mtd/ubi/scan.h |    4 ++--
 drivers/mtd/ubi/vtbl.c |    6 +++---
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 572281a..6f7f275 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1246,7 +1246,7 @@ int ubi_eba_init_scan(struct ubi_device *ubi, struct ubi_attach_info *ai)
 		for (j = 0; j < vol->reserved_pebs; j++)
 			vol->eba_tbl[j] = UBI_LEB_UNMAPPED;
 
-		av = ubi_scan_find_av(ai, idx2vol_id(ubi, i));
+		av = ubi_find_av(ai, idx2vol_id(ubi, i));
 		if (!av)
 			continue;
 
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 3665062..767b857 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -585,15 +585,15 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 }
 
 /**
- * ubi_scan_find_av - find volume in the attaching information.
+ * ubi_find_av - find volume in the attaching information.
  * @ai: attaching information
  * @vol_id: the requested volume ID
  *
  * This function returns a pointer to the volume description or %NULL if there
  * are no data about this volume in the attaching information.
  */
-struct ubi_ainf_volume *ubi_scan_find_av(const struct ubi_attach_info *ai,
-					 int vol_id)
+struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
+				    int vol_id)
 {
 	struct ubi_ainf_volume *av;
 	struct rb_node *p = ai->volumes.rb_node;
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index 5a9ecc0..b1eeb0b 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -159,8 +159,8 @@ static inline void ubi_scan_move_to_list(struct ubi_ainf_volume *av,
 
 int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips);
-struct ubi_ainf_volume *ubi_scan_find_av(const struct ubi_attach_info *ai,
-					 int vol_id);
+struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
+				    int vol_id);
 void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 					   struct ubi_attach_info *ai);
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 5decd58..0c8c172 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -591,7 +591,7 @@ static int init_volumes(struct ubi_device *ubi,
 		}
 
 		/* Static volumes only */
-		av = ubi_scan_find_av(ai, i);
+		av = ubi_find_av(ai, i);
 		if (!av) {
 			/*
 			 * No eraseblocks belonging to this volume found. We
@@ -734,7 +734,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
 	for (i = 0; i < ubi->vtbl_slots + UBI_INT_VOL_COUNT; i++) {
 		cond_resched();
 
-		av = ubi_scan_find_av(ai, i);
+		av = ubi_find_av(ai, i);
 		vol = ubi->volumes[i];
 		if (!vol) {
 			if (av)
@@ -794,7 +794,7 @@ int ubi_read_volume_table(struct ubi_device *ubi, struct ubi_attach_info *ai)
 	ubi->vtbl_size = ubi->vtbl_slots * UBI_VTBL_RECORD_SIZE;
 	ubi->vtbl_size = ALIGN(ubi->vtbl_size, ubi->min_io_size);
 
-	av = ubi_scan_find_av(ai, UBI_LAYOUT_VOLUME_ID);
+	av = ubi_find_av(ai, UBI_LAYOUT_VOLUME_ID);
 	if (!av) {
 		/*
 		 * No logical eraseblocks belonging to the layout volume were
-- 
1.7.10
