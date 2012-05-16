Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUgZ1-00027j-9A
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 15:55:00 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/9] UBI: rename ubi_dbg_dump_vtbl_record
Date: Wed, 16 May 2012 18:55:53 +0300
Message-Id: <1337183760-24417-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337183760-24417-1-git-send-email-dedekind1@gmail.com>
References: <1337183760-24417-1-git-send-email-dedekind1@gmail.com>
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
which renames 'ubi_dbg_dump_vtbl_record()' to 'ubi_dump_vtbl_record()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.c |    4 ++--
 drivers/mtd/ubi/debug.h |    4 ++--
 drivers/mtd/ubi/vmt.c   |    2 +-
 drivers/mtd/ubi/vtbl.c  |    8 ++++----
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 2d3dc26..9b16bcc 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -139,11 +139,11 @@ void ubi_dump_vol_info(const struct ubi_volume *vol)
 }
 
 /**
- * ubi_dbg_dump_vtbl_record - dump a &struct ubi_vtbl_record object.
+ * ubi_dump_vtbl_record - dump a &struct ubi_vtbl_record object.
  * @r: the object to dump
  * @idx: volume table index
  */
-void ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)
+void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)
 {
 	int name_len = be16_to_cpu(r->name_len);
 
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index ca36f2d..9728da4 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -61,7 +61,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 #define dbg_bld(fmt, ...) ubi_dbg_msg("bld", fmt, ##__VA_ARGS__)
 
 void ubi_dump_vol_info(const struct ubi_volume *vol);
-void ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
+void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
 void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv);
 void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
 void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req);
@@ -196,7 +196,7 @@ static inline int ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
 static inline void
 ubi_dump_vol_info(const struct ubi_volume *vol)                      { return; }
 static inline void
-ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)   { return; }
+ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)       { return; }
 static inline void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv) { return; }
 static inline void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb,
 				    int type)                        { return; }
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 906f972..a4b4c30 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -856,7 +856,7 @@ fail:
 	ubi_err("paranoid check failed for volume %d", vol_id);
 	if (vol)
 		ubi_dump_vol_info(vol);
-	ubi_dbg_dump_vtbl_record(&ubi->vtbl[vol_id], vol_id);
+	ubi_dump_vtbl_record(&ubi->vtbl[vol_id], vol_id);
 	dump_stack();
 	spin_unlock(&ubi->volumes_lock);
 	return -EINVAL;
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 7ef3de0..897502f 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -197,7 +197,7 @@ static int vtbl_check(const struct ubi_device *ubi,
 		if (be32_to_cpu(vtbl[i].crc) != crc) {
 			ubi_err("bad CRC at record %u: %#08x, not %#08x",
 				 i, crc, be32_to_cpu(vtbl[i].crc));
-			ubi_dbg_dump_vtbl_record(&vtbl[i], i);
+			ubi_dump_vtbl_record(&vtbl[i], i);
 			return 1;
 		}
 
@@ -277,8 +277,8 @@ static int vtbl_check(const struct ubi_device *ubi,
 			    !strncmp(vtbl[i].name, vtbl[n].name, len1)) {
 				ubi_err("volumes %d and %d have the same name"
 					" \"%s\"", i, n, vtbl[i].name);
-				ubi_dbg_dump_vtbl_record(&vtbl[i], i);
-				ubi_dbg_dump_vtbl_record(&vtbl[n], n);
+				ubi_dump_vtbl_record(&vtbl[i], i);
+				ubi_dump_vtbl_record(&vtbl[n], n);
 				return -EINVAL;
 			}
 		}
@@ -288,7 +288,7 @@ static int vtbl_check(const struct ubi_device *ubi,
 
 bad:
 	ubi_err("volume table check failed: record %d, error %d", i, err);
-	ubi_dbg_dump_vtbl_record(&vtbl[i], i);
+	ubi_dump_vtbl_record(&vtbl[i], i);
 	return -EINVAL;
 }
 
-- 
1.7.10
