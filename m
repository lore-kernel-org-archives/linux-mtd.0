Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SMdZH-000644-Cr
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2012 11:06:00 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: always dump the stack on error
Date: Tue, 24 Apr 2012 14:06:45 +0300
Message-Id: <1335265605-20586-1-git-send-email-dedekind1@gmail.com>
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

This patch weeds out the 'ubi_dbg_dump_stack()' function and turns it
into 'dump_stack()' - it is always useful to have stack dump in case of
an error.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.h |    5 +----
 drivers/mtd/ubi/io.c    |   28 ++++++++++++++--------------
 drivers/mtd/ubi/scan.c  |    2 +-
 drivers/mtd/ubi/ubi.h   |    2 +-
 drivers/mtd/ubi/wl.c    |    6 +++---
 5 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index ead2cd1..aff6499 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -28,14 +28,12 @@
 	if (unlikely(!(expr))) {                                             \
 		printk(KERN_CRIT "UBI assert failed in %s at %u (pid %d)\n", \
 		       __func__, __LINE__, current->pid);                    \
-		ubi_dbg_dump_stack();                                        \
+		dump_stack();                                                \
 	}                                                                    \
 } while (0)
 
 #define dbg_err(fmt, ...) ubi_err(fmt, ##__VA_ARGS__)
 
-#define ubi_dbg_dump_stack() dump_stack()
-
 #define ubi_dbg_print_hex_dump(l, ps, pt, r, g, b, len, a)  \
 		print_hex_dump(l, ps, pt, r, g, b, len, a)
 
@@ -194,7 +192,6 @@ static inline int ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
 #define dbg_io(fmt, ...)   ubi_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_bld(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
 
-static inline void ubi_dbg_dump_stack(void)                          { return; }
 static inline void
 ubi_dbg_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr)                 { return; }
 static inline void
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 43f1a00..507e0c6 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -198,7 +198,7 @@ retry:
 
 		ubi_err("error %d%s while reading %d bytes from PEB %d:%d, "
 			"read %zd bytes", err, errstr, len, pnum, offset, read);
-		ubi_dbg_dump_stack();
+		dump_stack();
 
 		/*
 		 * The driver should never return -EBADMSG if it failed to read
@@ -284,7 +284,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	if (ubi_dbg_is_write_failure(ubi)) {
 		dbg_err("cannot write %d bytes to PEB %d:%d "
 			"(emulated)", len, pnum, offset);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		return -EIO;
 	}
 
@@ -293,7 +293,7 @@ int ubi_io_write(struct ubi_device *ubi, const void *buf, int pnum, int offset,
 	if (err) {
 		ubi_err("error %d while writing %d bytes to PEB %d:%d, written "
 			"%zd bytes", err, len, pnum, offset, written);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		ubi_dbg_dump_flash(ubi, pnum, offset, len);
 	} else
 		ubi_assert(written == len);
@@ -370,7 +370,7 @@ retry:
 			goto retry;
 		}
 		ubi_err("cannot erase PEB %d, error %d", pnum, err);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		return err;
 	}
 
@@ -388,7 +388,7 @@ retry:
 			goto retry;
 		}
 		ubi_err("cannot erase PEB %d", pnum);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		return -EIO;
 	}
 
@@ -722,7 +722,7 @@ static int validate_ec_hdr(const struct ubi_device *ubi,
 bad:
 	ubi_err("bad EC header");
 	ubi_dbg_dump_ec_hdr(ec_hdr);
-	ubi_dbg_dump_stack();
+	dump_stack();
 	return 1;
 }
 
@@ -998,7 +998,7 @@ static int validate_vid_hdr(const struct ubi_device *ubi,
 bad:
 	ubi_err("bad VID header");
 	ubi_dbg_dump_vid_hdr(vid_hdr);
-	ubi_dbg_dump_stack();
+	dump_stack();
 	return 1;
 }
 
@@ -1153,7 +1153,7 @@ static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum)
 		return err;
 
 	ubi_err("paranoid check failed for PEB %d", pnum);
-	ubi_dbg_dump_stack();
+	dump_stack();
 	return err > 0 ? -EINVAL : err;
 }
 
@@ -1192,7 +1192,7 @@ static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
 
 fail:
 	ubi_dbg_dump_ec_hdr(ec_hdr);
-	ubi_dbg_dump_stack();
+	dump_stack();
 	return -EINVAL;
 }
 
@@ -1227,7 +1227,7 @@ static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
 		ubi_err("bad CRC, calculated %#08x, read %#08x", crc, hdr_crc);
 		ubi_err("paranoid check failed for PEB %d", pnum);
 		ubi_dbg_dump_ec_hdr(ec_hdr);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		err = -EINVAL;
 		goto exit;
 	}
@@ -1275,7 +1275,7 @@ static int paranoid_check_vid_hdr(const struct ubi_device *ubi, int pnum,
 fail:
 	ubi_err("paranoid check failed for PEB %d", pnum);
 	ubi_dbg_dump_vid_hdr(vid_hdr);
-	ubi_dbg_dump_stack();
+	dump_stack();
 	return -EINVAL;
 
 }
@@ -1315,7 +1315,7 @@ static int paranoid_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 			"read %#08x", pnum, crc, hdr_crc);
 		ubi_err("paranoid check failed for PEB %d", pnum);
 		ubi_dbg_dump_vid_hdr(vid_hdr);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		err = -EINVAL;
 		goto exit;
 	}
@@ -1380,7 +1380,7 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 			i, i + dump_len);
 		print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
 			       buf1 + i, dump_len, 1);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		err = -EINVAL;
 		goto out_free;
 	}
@@ -1443,7 +1443,7 @@ fail:
 	print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1, buf, len, 1);
 	err = -EINVAL;
 error:
-	ubi_dbg_dump_stack();
+	dump_stack();
 	vfree(buf);
 	return err;
 }
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 12c43b4..75c23a9 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -1598,7 +1598,7 @@ bad_vid_hdr:
 	ubi_dbg_dump_vid_hdr(vidh);
 
 out:
-	ubi_dbg_dump_stack();
+	dump_stack();
 	return -EINVAL;
 }
 
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index b162790..4f5c9f1 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -667,7 +667,7 @@ static inline void ubi_ro_mode(struct ubi_device *ubi)
 	if (!ubi->ro_mode) {
 		ubi->ro_mode = 1;
 		ubi_warn("switch to read-only mode");
-		ubi_dbg_dump_stack();
+		dump_stack();
 	}
 }
 
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 7c1a9bf..b0a6d53 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1603,7 +1603,7 @@ static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec)
 	if (ec != read_ec) {
 		ubi_err("paranoid check failed for PEB %d", pnum);
 		ubi_err("read EC is %lld, should be %d", read_ec, ec);
-		ubi_dbg_dump_stack();
+		dump_stack();
 		err = 1;
 	} else
 		err = 0;
@@ -1634,7 +1634,7 @@ static int paranoid_check_in_wl_tree(const struct ubi_device *ubi,
 
 	ubi_err("paranoid check failed for PEB %d, EC %d, RB-tree %p ",
 		e->pnum, e->ec, root);
-	ubi_dbg_dump_stack();
+	dump_stack();
 	return -EINVAL;
 }
 
@@ -1662,7 +1662,7 @@ static int paranoid_check_in_pq(const struct ubi_device *ubi,
 
 	ubi_err("paranoid check failed for PEB %d, EC %d, Protect queue",
 		e->pnum, e->ec);
-	ubi_dbg_dump_stack();
+	dump_stack();
 	return -EINVAL;
 }
 
-- 
1.7.7.6
