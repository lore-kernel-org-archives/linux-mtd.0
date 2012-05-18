Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxv-0005Xc-BY
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:28 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/22] UBI: rename ubi_scan_add_used
Date: Fri, 18 May 2012 14:03:53 +0300
Message-Id: <1337339045-8199-11-git-send-email-dedekind1@gmail.com>
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

The old name is not logical anymore - rename it to 'ubi_add_to_av()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.c |    9 ++++-----
 drivers/mtd/ubi/scan.h |    5 ++---
 drivers/mtd/ubi/vtbl.c |    7 +++----
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 06151fd..3665062 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -425,7 +425,7 @@ out_free_vidh:
 }
 
 /**
- * ubi_scan_add_used - add physical eraseblock to the attaching information.
+ * ubi_add_to_av - add physical eraseblock to the attaching information.
  * @ubi: UBI device description object
  * @ai: attaching information
  * @pnum: the physical eraseblock number
@@ -440,9 +440,8 @@ out_free_vidh:
  * to be picked, while the older one has to be dropped. This function returns
  * zero in case of success and a negative error code in case of failure.
  */
-int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
-		      int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
-		      int bitflips)
+int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
+		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips)
 {
 	int err, vol_id, lnum;
 	unsigned long long sqnum;
@@ -1016,7 +1015,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	if (ec_err)
 		ubi_warn("valid VID header but corrupted EC header at PEB %d",
 			 pnum);
-	err = ubi_scan_add_used(ubi, ai, pnum, ec, vidh, bitflips);
+	err = ubi_add_to_av(ubi, ai, pnum, ec, vidh, bitflips);
 	if (err)
 		return err;
 
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index ef6e903..5a9ecc0 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -157,9 +157,8 @@ static inline void ubi_scan_move_to_list(struct ubi_ainf_volume *av,
 		list_add_tail(&aeb->u.list, list);
 }
 
-int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_attach_info *ai,
-		      int pnum, int ec, const struct ubi_vid_hdr *vid_hdr,
-		      int bitflips);
+int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
+		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips);
 struct ubi_ainf_volume *ubi_scan_find_av(const struct ubi_attach_info *ai,
 					 int vol_id);
 void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 0ea105b..5decd58 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -338,10 +338,9 @@ retry:
 
 	/*
 	 * And add it to the attaching information. Don't delete the old version
-	 * of this LEB as it will be deleted and freed in 'ubi_scan_add_used()'.
+	 * of this LEB as it will be deleted and freed in 'ubi_add_to_av()'.
 	 */
-	err = ubi_scan_add_used(ubi, ai, new_aeb->pnum, new_aeb->ec,
-				vid_hdr, 0);
+	err = ubi_add_to_av(ubi, ai, new_aeb->pnum, new_aeb->ec, vid_hdr, 0);
 	kfree(new_aeb);
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
@@ -428,7 +427,7 @@ static struct ubi_vtbl_record *process_lvol(struct ubi_device *ubi,
 			 * aeb->scrub). If the data is not OK, the contents of
 			 * the PEB will be recovered from the second copy, and
 			 * aeb->scrub will be cleared in
-			 * 'ubi_scan_add_used()'.
+			 * 'ubi_add_to_av()'.
 			 */
 			aeb->scrub = 1;
 		else if (err)
-- 
1.7.10
