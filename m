Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUgZ2-00028P-6B
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 15:55:03 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/9] UBI: rename ubi_dbg_dump_sv
Date: Wed, 16 May 2012 18:55:54 +0300
Message-Id: <1337183760-24417-3-git-send-email-dedekind1@gmail.com>
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
which renames 'ubi_dbg_dump_sv()' to 'ubi_dump_sv()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.c |    4 ++--
 drivers/mtd/ubi/debug.h |    4 ++--
 drivers/mtd/ubi/scan.c  |    8 ++++----
 drivers/mtd/ubi/vtbl.c  |    2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 9b16bcc..9ae8fff 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -173,10 +173,10 @@ void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)
 }
 
 /**
- * ubi_dbg_dump_sv - dump a &struct ubi_scan_volume object.
+ * ubi_dump_sv - dump a &struct ubi_scan_volume object.
  * @sv: the object to dump
  */
-void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv)
+void ubi_dump_sv(const struct ubi_scan_volume *sv)
 {
 	printk(KERN_DEBUG "Volume scanning information dump:\n");
 	printk(KERN_DEBUG "\tvol_id         %d\n", sv->vol_id);
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 9728da4..5e3d4e8 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -62,7 +62,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 
 void ubi_dump_vol_info(const struct ubi_volume *vol);
 void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
-void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv);
+void ubi_dump_sv(const struct ubi_scan_volume *sv);
 void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
 void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len);
@@ -197,7 +197,7 @@ static inline void
 ubi_dump_vol_info(const struct ubi_volume *vol)                      { return; }
 static inline void
 ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)       { return; }
-static inline void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv) { return; }
+static inline void ubi_dump_sv(const struct ubi_scan_volume *sv)     { return; }
 static inline void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb,
 				    int type)                        { return; }
 static inline void
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index c26b1ad..23f7ad2 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -231,7 +231,7 @@ static int validate_vid_hdr(const struct ubi_vid_hdr *vid_hdr,
 bad:
 	ubi_err("inconsistent VID header at PEB %d", pnum);
 	ubi_dump_vid_hdr(vid_hdr);
-	ubi_dbg_dump_sv(sv);
+	ubi_dump_sv(sv);
 	return -EINVAL;
 }
 
@@ -1584,17 +1584,17 @@ static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 bad_seb:
 	ubi_err("bad scanning information about LEB %d", seb->lnum);
 	ubi_dbg_dump_seb(seb, 0);
-	ubi_dbg_dump_sv(sv);
+	ubi_dump_sv(sv);
 	goto out;
 
 bad_sv:
 	ubi_err("bad scanning information about volume %d", sv->vol_id);
-	ubi_dbg_dump_sv(sv);
+	ubi_dump_sv(sv);
 	goto out;
 
 bad_vid_hdr:
 	ubi_err("bad scanning information about volume %d", sv->vol_id);
-	ubi_dbg_dump_sv(sv);
+	ubi_dump_sv(sv);
 	ubi_dump_vid_hdr(vidh);
 
 out:
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 897502f..b37872c 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -700,7 +700,7 @@ static int check_sv(const struct ubi_volume *vol,
 
 bad:
 	ubi_err("bad scanning information, error %d", err);
-	ubi_dbg_dump_sv(sv);
+	ubi_dump_sv(sv);
 	ubi_dump_vol_info(vol);
 	return -EINVAL;
 }
-- 
1.7.10
