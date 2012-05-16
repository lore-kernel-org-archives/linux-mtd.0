Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUgZ4-00029b-Be
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 15:55:05 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/9] UBI: rename ubi_dbg_dump_mkvol_req
Date: Wed, 16 May 2012 18:55:56 +0300
Message-Id: <1337183760-24417-5-git-send-email-dedekind1@gmail.com>
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
which renames 'ubi_dbg_dump_mkvol_req()' to 'ubi_dump_mkvol_req()'.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/cdev.c  |    2 +-
 drivers/mtd/ubi/debug.c |    4 ++--
 drivers/mtd/ubi/debug.h |    4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index f406112..633ac82 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -644,7 +644,7 @@ static int verify_mkvol_req(const struct ubi_device *ubi,
 
 bad:
 	dbg_err("bad volume creation request");
-	ubi_dbg_dump_mkvol_req(req);
+	ubi_dump_mkvol_req(req);
 	return err;
 }
 
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index d33a283..bb7297e 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -207,10 +207,10 @@ void ubi_dump_seb(const struct ubi_scan_leb *seb, int type)
 }
 
 /**
- * ubi_dbg_dump_mkvol_req - dump a &struct ubi_mkvol_req object.
+ * ubi_dump_mkvol_req - dump a &struct ubi_mkvol_req object.
  * @req: the object to dump
  */
-void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req)
+void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req)
 {
 	char nm[17];
 
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index b897c4a..c98d2c8 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -64,7 +64,7 @@ void ubi_dump_vol_info(const struct ubi_volume *vol);
 void ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
 void ubi_dump_sv(const struct ubi_scan_volume *sv);
 void ubi_dump_seb(const struct ubi_scan_leb *seb, int type);
-void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req);
+void ubi_dump_mkvol_req(const struct ubi_mkvol_req *req);
 int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len);
 int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 			int offset, int len);
@@ -201,7 +201,7 @@ static inline void ubi_dump_sv(const struct ubi_scan_volume *sv)     { return; }
 static inline void ubi_dump_seb(const struct ubi_scan_leb *seb,
 				int type)                            { return; }
 static inline void
-ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req)              { return; }
+ubi_dump_mkvol_req(const struct ubi_mkvol_req *req)                  { return; }
 static inline void
 ubi_dbg_print_hex_dump(const char *l, const char *ps, int pt, int r,
 		       int g, const void *b, size_t len, bool a)     { return; }
-- 
1.7.10
