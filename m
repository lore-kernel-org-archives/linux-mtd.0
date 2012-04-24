Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SMdjF-0006Nw-FJ
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2012 11:16:18 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: always dump flash contents in case of errors
Date: Tue, 24 Apr 2012 14:17:03 +0300
Message-Id: <1335266223-21517-1-git-send-email-dedekind1@gmail.com>
Cc: Mark <xiaoming1981.zhang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>

UBI (and UBIFS) are a bit over-engineered WRT debugging. The idea was to
link as few as possible when debugging is disabled, but the downside is
that most people produce bug reports which are difficult to understand.

Always dump the flash contents in case of errors, not only when debugging is
enabled.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.c |   32 --------------------------------
 drivers/mtd/ubi/debug.h |    3 ---
 drivers/mtd/ubi/io.c    |   36 ++++++++++++++++++++++++++++++++++--
 3 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 61af9bb..d7a47d5 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -200,38 +200,6 @@ void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req)
 }
 
 /**
- * ubi_dbg_dump_flash - dump a region of flash.
- * @ubi: UBI device description object
- * @pnum: the physical eraseblock number to dump
- * @offset: the starting offset within the physical eraseblock to dump
- * @len: the length of the region to dump
- */
-void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len)
-{
-	int err;
-	size_t read;
-	void *buf;
-	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
-
-	buf = vmalloc(len);
-	if (!buf)
-		return;
-	err = mtd_read(ubi->mtd, addr, len, &read, buf);
-	if (err && err != -EUCLEAN) {
-		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
-			"read %zd bytes", err, len, pnum, offset, read);
-		goto out;
-	}
-
-	dbg_msg("dumping %d bytes of data from PEB %d, offset %d",
-		len, pnum, offset);
-	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1, buf, len, 1);
-out:
-	vfree(buf);
-	return;
-}
-
-/**
  * ubi_debugging_init_dev - initialize debugging for an UBI device.
  * @ubi: UBI device description object
  *
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index aff6499..b21a90a 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -63,7 +63,6 @@ void ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
 void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv);
 void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
 void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req);
-void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
 int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len);
 int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 			int offset, int len);
@@ -205,8 +204,6 @@ static inline void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb,
 				    int type)                        { return; }
 static inline void
 ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req)              { return; }
-static inline void ubi_dbg_dump_flash(struct ubi_device *ubi,
-				      int pnum, int offset, int len) { return; }
 static inline void
 ubi_dbg_print_hex_dump(const char *l, const char *ps, int pt, int r,
 		       int g, const void *b, size_t len, bool a)     { return; }
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 507e0c6..d81d044 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -222,6 +222,38 @@ retry:
 }
 
 /**
+ * dump_flash - dump a region of flash.
+ * @ubi: UBI device description object
+ * @pnum: the physical eraseblock number to dump
+ * @offset: the starting offset within the physical eraseblock to dump
+ * @len: the length of the region to dump
+ */
+static void dump_flash(struct ubi_device *ubi, int pnum, int offset, int len)
+{
+	int err;
+	size_t read;
+	void *buf;
+	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
+
+	buf = vmalloc(len);
+	if (!buf)
+		return;
+	err = mtd_read(ubi->mtd, addr, len, &read, buf);
+	if (err && err != -EUCLEAN) {
+		ubi_err("error %d while reading %d bytes from PEB %d:%d, "
+			"read %zd bytes", err, len, pnum, offset, read);
+		goto out;
+	}
+
+	ubi_msg("dumping %d bytes of data from PEB %d, offset %d",
+		len, pnum, offset);
+	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1, buf, len, 1);
+out:
+	vfree(buf);
+	return;
+}
+
+/**
  * ubi_io_write - write data to a physical eraseblock.
  * @ubi: UBI device description object
  * @buf: buffer with the data to write
@@ -294,7 +326,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 		ubi_err("error %d while writing %d bytes to PEB %d:%d, written "
 			"%zd bytes", err, len, pnum, offset, written);
 		dump_stack();
-		ubi_dbg_dump_flash(ubi, pnum, offset, len);
+		ubi_dump_flash(ubi, pnum, offset, len);
 	} else
 		ubi_assert(written == len);
 
@@ -563,7 +595,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
 	 */
 	ubi_err("cannot invalidate PEB %d, write returned %d read returned %d",
 		pnum, err, err1);
-	ubi_dbg_dump_flash(ubi, pnum, 0, ubi->peb_size);
+	dump_flash(ubi, pnum, 0, ubi->peb_size);
 	return -EIO;
 }
 
-- 
1.7.7.6
