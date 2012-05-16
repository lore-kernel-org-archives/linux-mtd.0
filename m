Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUgZ0-00027D-S2
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 15:54:59 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/9] UBI: rename ubi_dbg_dump_vol_info
Date: Wed, 16 May 2012 18:55:52 +0300
Message-Id: <1337183760-24417-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

I am going to remove the "UBI debugging" compilation option and make the
debugging stuff to be always compiled it. This patch is a preparation
which renames 'ubi_dbg_dump_vol_info()' to 'ubi_dump_vol_info()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.c |    4 ++--
 drivers/mtd/ubi/debug.h |    4 ++--
 drivers/mtd/ubi/vmt.c   |    2 +-
 drivers/mtd/ubi/vtbl.c  |    2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index dce463d..2d3dc26 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -109,10 +109,10 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr)
 #ifdef CONFIG_MTD_UBI_DEBUG
 
 /**
- * ubi_dbg_dump_vol_info- dump volume information.
+ * ubi_dump_vol_info - dump volume information.
  * @vol: UBI volume description object
  */
-void ubi_dbg_dump_vol_info(const struct ubi_volume *vol)
+void ubi_dump_vol_info(const struct ubi_volume *vol)
 {
 	printk(KERN_DEBUG "Volume information dump:\n");
 	printk(KERN_DEBUG "\tvol_id          %d\n", vol->vol_id);
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index b8672c9..ca36f2d 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -60,7 +60,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 /* Initialization and build messages */
 #define dbg_bld(fmt, ...) ubi_dbg_msg("bld", fmt, ##__VA_ARGS__)
 
-void ubi_dbg_dump_vol_info(const struct ubi_volume *vol);
+void ubi_dump_vol_info(const struct ubi_volume *vol);
 void ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
 void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv);
 void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
@@ -194,7 +194,7 @@ static inline int ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
 #define dbg_bld(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
 
 static inline void
-ubi_dbg_dump_vol_info(const struct ubi_volume *vol)                  { return; }
+ubi_dump_vol_info(const struct ubi_volume *vol)                      { return; }
 static inline void
 ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)   { return; }
 static inline void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv) { return; }
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 863835f..906f972 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -855,7 +855,7 @@ static int paranoid_check_volume(struct ubi_device *ubi, int vol_id)
 fail:
 	ubi_err("paranoid check failed for volume %d", vol_id);
 	if (vol)
-		ubi_dbg_dump_vol_info(vol);
+		ubi_dump_vol_info(vol);
 	ubi_dbg_dump_vtbl_record(&ubi->vtbl[vol_id], vol_id);
 	dump_stack();
 	spin_unlock(&ubi->volumes_lock);
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index a6f4b13..7ef3de0 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -701,7 +701,7 @@ static int check_sv(const struct ubi_volume *vol,
 bad:
 	ubi_err("bad scanning information, error %d", err);
 	ubi_dbg_dump_sv(sv);
-	ubi_dbg_dump_vol_info(vol);
+	ubi_dump_vol_info(vol);
 	return -EINVAL;
 }
 
-- 
1.7.10
