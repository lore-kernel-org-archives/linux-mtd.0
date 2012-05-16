Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUgZ6-00028u-8z
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 15:55:11 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/9] UBI: remove Kconfig debugging option
Date: Wed, 16 May 2012 18:55:57 +0300
Message-Id: <1337183760-24417-6-git-send-email-dedekind1@gmail.com>
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

This patch kills the UBI debugging Kconfig option completely and makes all the
debugging stuff to be always compiled-in. It was pain in the neck to maintain
this useless option because all users I am aware of have debugging enabled
anyway - how else will you diagnose errors otherwise?

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/Kconfig |    8 ------
 drivers/mtd/ubi/debug.c |    4 ---
 drivers/mtd/ubi/debug.h |   63 -----------------------------------------------
 drivers/mtd/ubi/io.c    |   12 ---------
 drivers/mtd/ubi/scan.c  |    8 ------
 drivers/mtd/ubi/vmt.c   |    7 ------
 drivers/mtd/ubi/vtbl.c  |    8 ------
 drivers/mtd/ubi/wl.c    |   10 --------
 8 files changed, 120 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 4dcc752..738ee8d 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -52,12 +52,4 @@ config MTD_UBI_GLUEBI
 	   work on top of UBI. Do not enable this unless you use legacy
 	   software.
 
-config MTD_UBI_DEBUG
-	bool "UBI debugging"
-	depends on SYSFS
-	select DEBUG_FS
-	select KALLSYMS
-	help
-	  This option enables UBI debugging.
-
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index bb7297e..c6becde 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -106,8 +106,6 @@ void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr)
 		       vid_hdr, UBI_VID_HDR_SIZE, 1);
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG
-
 /**
  * ubi_dump_vol_info - dump volume information.
  * @vol: UBI volume description object
@@ -474,5 +472,3 @@ void ubi_debugfs_exit_dev(struct ubi_device *ubi)
 {
 	debugfs_remove_recursive(ubi->dbg->dfs_dir);
 }
-
-#endif /* CONFIG_MTD_UBI_DEBUG */
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index c98d2c8..3e5b60f 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -25,7 +25,6 @@ void ubi_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
 void ubi_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr);
 void ubi_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
 
-#ifdef CONFIG_MTD_UBI_DEBUG
 #include <linux/random.h>
 
 #define ubi_assert(expr)  do {                                               \
@@ -166,66 +165,4 @@ static inline int ubi_dbg_is_erase_failure(const struct ubi_device *ubi)
 	return 0;
 }
 
-#else
-
-/* Use "if (0)" to make compiler check arguments even if debugging is off */
-#define ubi_assert(expr)  do {                                               \
-	if (0) {                                                             \
-		printk(KERN_CRIT "UBI assert failed in %s at %u (pid %d)\n", \
-		       __func__, __LINE__, current->pid);                    \
-	}                                                                    \
-} while (0)
-
-#define dbg_err(fmt, ...) do {                                               \
-	if (0)                                                               \
-		ubi_err(fmt, ##__VA_ARGS__);                                 \
-} while (0)
-
-#define ubi_dbg_msg(fmt, ...) do {                                           \
-	if (0)                                                               \
-		printk(KERN_DEBUG fmt "\n", ##__VA_ARGS__);                  \
-} while (0)
-
-#define dbg_msg(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_gen(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_eba(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_wl(fmt, ...)   ubi_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_io(fmt, ...)   ubi_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_bld(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
-
-static inline void
-ubi_dump_vol_info(const struct ubi_volume *vol)                      { return; }
-static inline void
-ubi_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx)       { return; }
-static inline void ubi_dump_sv(const struct ubi_scan_volume *sv)     { return; }
-static inline void ubi_dump_seb(const struct ubi_scan_leb *seb,
-				int type)                            { return; }
-static inline void
-ubi_dump_mkvol_req(const struct ubi_mkvol_req *req)                  { return; }
-static inline void
-ubi_dbg_print_hex_dump(const char *l, const char *ps, int pt, int r,
-		       int g, const void *b, size_t len, bool a)     { return; }
-static inline int ubi_dbg_check_all_ff(struct ubi_device *ubi,
-				       int pnum, int offset,
-				       int len)                    { return 0; }
-static inline int ubi_dbg_check_write(struct ubi_device *ubi,
-				      const void *buf, int pnum,
-				      int offset, int len)         { return 0; }
-
-static inline int ubi_debugging_init_dev(struct ubi_device *ubi)   { return 0; }
-static inline void ubi_debugging_exit_dev(struct ubi_device *ubi)  { return; }
-static inline int ubi_debugfs_init(void)                           { return 0; }
-static inline void ubi_debugfs_exit(void)                          { return; }
-static inline int ubi_debugfs_init_dev(struct ubi_device *ubi)     { return 0; }
-static inline void ubi_debugfs_exit_dev(struct ubi_device *ubi)    { return; }
-
-static inline int
-ubi_dbg_is_bgt_disabled(const struct ubi_device *ubi)              { return 0; }
-static inline int ubi_dbg_is_bitflip(const struct ubi_device *ubi) { return 0; }
-static inline int
-ubi_dbg_is_write_failure(const struct ubi_device *ubi)             { return 0; }
-static inline int
-ubi_dbg_is_erase_failure(const struct ubi_device *ubi)             { return 0; }
-
-#endif /* !CONFIG_MTD_UBI_DEBUG */
 #endif /* !__UBI_DEBUG_H__ */
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 19ee1a8..c1628fc 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -91,7 +91,6 @@
 #include <linux/slab.h>
 #include "ubi.h"
 
-#ifdef CONFIG_MTD_UBI_DEBUG
 static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum);
 static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum);
 static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
@@ -99,13 +98,6 @@ static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
 static int paranoid_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum);
 static int paranoid_check_vid_hdr(const struct ubi_device *ubi, int pnum,
 				  const struct ubi_vid_hdr *vid_hdr);
-#else
-#define paranoid_check_not_bad(ubi, pnum) 0
-#define paranoid_check_peb_ec_hdr(ubi, pnum)  0
-#define paranoid_check_ec_hdr(ubi, pnum, ec_hdr)  0
-#define paranoid_check_peb_vid_hdr(ubi, pnum) 0
-#define paranoid_check_vid_hdr(ubi, pnum, vid_hdr) 0
-#endif
 
 /**
  * ubi_io_read - read data from a physical eraseblock.
@@ -1131,8 +1123,6 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 	return err;
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG
-
 /**
  * paranoid_check_not_bad - ensure that a physical eraseblock is not bad.
  * @ubi: UBI device description object
@@ -1447,5 +1437,3 @@ error:
 	vfree(buf);
 	return err;
 }
-
-#endif /* CONFIG_MTD_UBI_DEBUG */
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index b09c8fa..bcbfe49 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -88,11 +88,7 @@
 #include <linux/random.h>
 #include "ubi.h"
 
-#ifdef CONFIG_MTD_UBI_DEBUG
 static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si);
-#else
-#define paranoid_check_si(ubi, si) 0
-#endif
 
 /* Temporary variables used during scanning */
 static struct ubi_ec_hdr *ech;
@@ -1329,8 +1325,6 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
 	kfree(si);
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG
-
 /**
  * paranoid_check_si - check the scanning information.
  * @ubi: UBI device description object
@@ -1601,5 +1595,3 @@ out:
 	dump_stack();
 	return -EINVAL;
 }
-
-#endif /* CONFIG_MTD_UBI_DEBUG */
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index a4b4c30..b38ab92 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -29,11 +29,7 @@
 #include <linux/export.h>
 #include "ubi.h"
 
-#ifdef CONFIG_MTD_UBI_DEBUG
 static int paranoid_check_volumes(struct ubi_device *ubi);
-#else
-#define paranoid_check_volumes(ubi) 0
-#endif
 
 static ssize_t vol_attribute_show(struct device *dev,
 				  struct device_attribute *attr, char *buf);
@@ -712,8 +708,6 @@ void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 	volume_sysfs_close(vol);
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG
-
 /**
  * paranoid_check_volume - check volume information.
  * @ubi: UBI device description object
@@ -883,4 +877,3 @@ static int paranoid_check_volumes(struct ubi_device *ubi)
 
 	return err;
 }
-#endif
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index b37872c..277f154 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -62,11 +62,7 @@
 #include <asm/div64.h>
 #include "ubi.h"
 
-#ifdef CONFIG_MTD_UBI_DEBUG
 static void paranoid_vtbl_check(const struct ubi_device *ubi);
-#else
-#define paranoid_vtbl_check(ubi)
-#endif
 
 /* Empty volume table record */
 static struct ubi_vtbl_record empty_vtbl_record;
@@ -858,8 +854,6 @@ out_free:
 	return err;
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG
-
 /**
  * paranoid_vtbl_check - check volume table.
  * @ubi: UBI device description object
@@ -874,5 +868,3 @@ static void paranoid_vtbl_check(const struct ubi_device *ubi)
 		BUG();
 	}
 }
-
-#endif /* CONFIG_MTD_UBI_DEBUG */
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 64ce993..f99dbd0 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -155,18 +155,12 @@ struct ubi_work {
 	int torture;
 };
 
-#ifdef CONFIG_MTD_UBI_DEBUG
 static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec);
 static int paranoid_check_in_wl_tree(const struct ubi_device *ubi,
 				     struct ubi_wl_entry *e,
 				     struct rb_root *root);
 static int paranoid_check_in_pq(const struct ubi_device *ubi,
 				struct ubi_wl_entry *e);
-#else
-#define paranoid_check_ec(ubi, pnum, ec) 0
-#define paranoid_check_in_wl_tree(ubi, e, root)
-#define paranoid_check_in_pq(ubi, e) 0
-#endif
 
 /**
  * wl_tree_add - add a wear-leveling entry to a WL RB-tree.
@@ -1526,8 +1520,6 @@ void ubi_wl_close(struct ubi_device *ubi)
 	kfree(ubi->lookuptbl);
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG
-
 /**
  * paranoid_check_ec - make sure that the erase counter of a PEB is correct.
  * @ubi: UBI device description object
@@ -1624,5 +1616,3 @@ static int paranoid_check_in_pq(const struct ubi_device *ubi,
 	dump_stack();
 	return -EINVAL;
 }
-
-#endif /* CONFIG_MTD_UBI_DEBUG */
-- 
1.7.10
