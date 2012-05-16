Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUgZ3-00028u-8h
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 15:55:03 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/9] UBI: rename ubi_dbg_dump_seb
Date: Wed, 16 May 2012 18:55:55 +0300
Message-Id: <1337183760-24417-4-git-send-email-dedekind1@gmail.com>
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
which renames 'ubi_dbg_dump_seb()' to 'ubi_dump_seb()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.c |    4 ++--
 drivers/mtd/ubi/debug.h |    6 +++---
 drivers/mtd/ubi/scan.c  |    4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 9ae8fff..d33a283 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -190,11 +190,11 @@ void ubi_dump_sv(const struct ubi_scan_volume *sv)
 }
 
 /**
- * ubi_dbg_dump_seb - dump a &struct ubi_scan_leb object.
+ * ubi_dump_seb - dump a &struct ubi_scan_leb object.
  * @seb: the object to dump
  * @type: object type: 0 - not corrupted, 1 - corrupted
  */
-void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type)
+void ubi_dump_seb(const struct ubi_scan_leb *seb, int type)
 {
 	printk(KERN_DEBUG "eraseblock scanning information dump:\n");
 	printk(KERN_DEBUG "\tec       %d\n", seb->ec);
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 5e3d4e8..b897c4a 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -63,7 +63,7 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 void ubi_dump_vol_info(const struct ubi_volume *vol);
 void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
 void ubi_dump_sv(const struct ubi_scan_volume *sv);
-void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
+void ubi_dump_seb(const struct ubi_scan_leb *seb, int type);
 void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len);
 int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
@@ -198,8 +198,8 @@ ubi_dump_vol_info(const struct ubi_volume *vol)                      { return; }
 static inline void
 ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)       { return; }
 static inline void ubi_dump_sv(const struct ubi_scan_volume *sv)     { return; }
-static inline void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb,
-				    int type)                        { return; }
+static inline void ubi_dump_seb(const struct ubi_scan_leb *seb,
+				int type)                            { return; }
 static inline void
 ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req)              { return; }
 static inline void
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 23f7ad2..b09c8fa 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -510,7 +510,7 @@ int ubi_scan_add_used(struct ubi_device *ubi, struct ubi_scan_info *si,
 		if (seb->sqnum == sqnum && sqnum != 0) {
 			ubi_err("two LEBs with same sequence number %llu",
 				sqnum);
-			ubi_dbg_dump_seb(seb, 0);
+			ubi_dump_seb(seb, 0);
 			ubi_dump_vid_hdr(vid_hdr);
 			return -EINVAL;
 		}
@@ -1583,7 +1583,7 @@ static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 
 bad_seb:
 	ubi_err("bad scanning information about LEB %d", seb->lnum);
-	ubi_dbg_dump_seb(seb, 0);
+	ubi_dump_seb(seb, 0);
 	ubi_dump_sv(sv);
 	goto out;
 
-- 
1.7.10
