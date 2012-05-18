Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKy4-0005Xc-Ty
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:35 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 12/22] UBI: rename ubi_scan_rm_volume
Date: Fri, 18 May 2012 14:03:55 +0300
Message-Id: <1337339045-8199-13-git-send-email-dedekind1@gmail.com>
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

The old name is not logical anymore - rename it to 'ubi_remove_av()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/scan.c |    4 ++--
 drivers/mtd/ubi/scan.h |    2 +-
 drivers/mtd/ubi/vtbl.c |    4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 767b857..ccf4630 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -614,11 +614,11 @@ struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
 }
 
 /**
- * ubi_scan_rm_volume - delete attaching information about a volume.
+ * ubi_remove_av - delete attaching information about a volume.
  * @ai: attaching information
  * @av: the volume attaching information to delete
  */
-void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
+void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av)
 {
 	struct rb_node *rb;
 	struct ubi_ainf_peb *aeb;
diff --git a/drivers/mtd/ubi/scan.h b/drivers/mtd/ubi/scan.h
index b1eeb0b..7d7e65f 100644
--- a/drivers/mtd/ubi/scan.h
+++ b/drivers/mtd/ubi/scan.h
@@ -161,7 +161,7 @@ int ubi_add_to_av(struct ubi_device *ubi, struct ubi_attach_info *ai, int pnum,
 		  int ec, const struct ubi_vid_hdr *vid_hdr, int bitflips);
 struct ubi_ainf_volume *ubi_find_av(const struct ubi_attach_info *ai,
 				    int vol_id);
-void ubi_scan_rm_volume(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
+void ubi_remove_av(struct ubi_attach_info *ai, struct ubi_ainf_volume *av);
 struct ubi_ainf_peb *ubi_scan_get_free_peb(struct ubi_device *ubi,
 					   struct ubi_attach_info *ai);
 struct ubi_attach_info *ubi_scan(struct ubi_device *ubi);
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 0c8c172..cfe3830 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -738,7 +738,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
 		vol = ubi->volumes[i];
 		if (!vol) {
 			if (av)
-				ubi_scan_rm_volume(ai, av);
+				ubi_remove_av(ai, av);
 			continue;
 		}
 
@@ -756,7 +756,7 @@ static int check_scanning_info(const struct ubi_device *ubi,
 			 * these eraseblocks.
 			 */
 			ubi_msg("finish volume %d removal", av->vol_id);
-			ubi_scan_rm_volume(ai, av);
+			ubi_remove_av(ai, av);
 		} else if (av) {
 			err = check_av(vol, av);
 			if (err)
-- 
1.7.10
