Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzQ4n-0007UQ-7C
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:58:07 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2F8vwuj031809
	for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2011 10:57:59 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/7] UBI: make self-checks dynamic
Date: Tue, 15 Mar 2011 11:00:35 +0200
Message-Id: <1300179636-12183-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300179636-12183-1-git-send-email-dedekind1@gmail.com>
References: <1300179636-12183-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This patch adds a possibility to dynamically switch UBI self-checks
on and off, instead of toggling them compile-time from the configuration
menu. This is much more flexible, and consistent with UBIFS, and this
also simplifies UBI Kconfig menu and the code.

This patch introduces two levels of self-checks - general, which
includes all self-checks which are relatively fast, and I/O, which
includes write-verify checks and erase-verify checks, which are
relatively slow and involve flash I/O.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/Kconfig.debug |    6 ------
 drivers/mtd/ubi/debug.c       |    3 +++
 drivers/mtd/ubi/debug.h       |   18 +++++++++++++-----
 drivers/mtd/ubi/io.c          |   27 ++++++++++++++++++++++++---
 drivers/mtd/ubi/scan.c        |    9 ++++++---
 drivers/mtd/ubi/vmt.c         |    7 +++++--
 drivers/mtd/ubi/vtbl.c        |    9 ++++++---
 drivers/mtd/ubi/wl.c          |   16 +++++++++++++---
 8 files changed, 70 insertions(+), 25 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig.debug b/drivers/mtd/ubi/Kconfig.debug
index d40134e..d8d33dd 100644
--- a/drivers/mtd/ubi/Kconfig.debug
+++ b/drivers/mtd/ubi/Kconfig.debug
@@ -10,12 +10,6 @@ config MTD_UBI_DEBUG
 
 if MTD_UBI_DEBUG
 
-config MTD_UBI_DEBUG_PARANOID
-	bool "Extra self-checks"
-	help
-	  This option enables extra checks in UBI code. Note this slows UBI down
-	  significantly.
-
 config MTD_UBI_DEBUG_DISABLE_BGT
 	bool "Do not enable the UBI background thread"
 	help
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 8ae0bc7..4c7a3f6 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -31,10 +31,13 @@
 #include <linux/moduleparam.h>
 
 unsigned int ubi_msg_flags;
+unsigned int ubi_chk_flags;
 
 module_param_named(debug_msgs, ubi_msg_flags, uint, S_IRUGO | S_IWUSR);
+module_param_named(debug_chks, ubi_chk_flags, uint, S_IRUGO | S_IWUSR);
 
 MODULE_PARM_DESC(debug_msgs, "Debug message type flags");
+MODULE_PARM_DESC(debug_chks, "Debug check flags");
 
 /**
  * ubi_dbg_dump_ec_hdr - dump an erase counter header.
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index bee6fa1..2511b58 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -99,14 +99,22 @@ enum {
 /* Initialization and build messages */
 #define dbg_bld(fmt, ...) dbg_do_msg(UBI_MSG_BLD, fmt, ##__VA_ARGS__)
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+extern unsigned int ubi_chk_flags;
+
+/*
+ * Debugging check flags.
+ *
+ * UBI_CHK_GEN: general checks
+ * UBI_CHK_IO: check writes and erases
+ */
+enum {
+	UBI_CHK_GEN = 0x1,
+	UBI_CHK_IO  = 0x2,
+};
+
 int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len);
 int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 			int offset, int len);
-#else
-#define ubi_dbg_check_all_ff(ubi, pnum, offset, len) 0
-#define ubi_dbg_check_write(ubi, buf, pnum, offset, len) 0
-#endif
 
 #ifdef CONFIG_MTD_UBI_DEBUG_DISABLE_BGT
 #define DBG_DISABLE_BGT 1
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index b1ad1ec..aaa6e1e 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -91,7 +91,7 @@
 #include <linux/slab.h>
 #include "ubi.h"
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum);
 static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum);
 static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
@@ -1126,7 +1126,7 @@ int ubi_io_write_vid_hdr(struct ubi_device *ubi, int pnum,
 	return err;
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 
 /**
  * paranoid_check_not_bad - ensure that a physical eraseblock is not bad.
@@ -1140,6 +1140,9 @@ static int paranoid_check_not_bad(const struct ubi_device *ubi, int pnum)
 {
 	int err;
 
+	if (!(ubi_chk_flags & UBI_CHK_IO))
+		return 0;
+
 	err = ubi_io_is_bad(ubi, pnum);
 	if (!err)
 		return err;
@@ -1164,6 +1167,9 @@ static int paranoid_check_ec_hdr(const struct ubi_device *ubi, int pnum,
 	int err;
 	uint32_t magic;
 
+	if (!(ubi_chk_flags & UBI_CHK_IO))
+		return 0;
+
 	magic = be32_to_cpu(ec_hdr->magic);
 	if (magic != UBI_EC_HDR_MAGIC) {
 		ubi_err("bad magic %#08x, must be %#08x",
@@ -1199,6 +1205,9 @@ static int paranoid_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
 	uint32_t crc, hdr_crc;
 	struct ubi_ec_hdr *ec_hdr;
 
+	if (!(ubi_chk_flags & UBI_CHK_IO))
+		return 0;
+
 	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
 	if (!ec_hdr)
 		return -ENOMEM;
@@ -1240,6 +1249,9 @@ static int paranoid_check_vid_hdr(const struct ubi_device *ubi, int pnum,
 	int err;
 	uint32_t magic;
 
+	if (!(ubi_chk_flags & UBI_CHK_IO))
+		return 0;
+
 	magic = be32_to_cpu(vid_hdr->magic);
 	if (magic != UBI_VID_HDR_MAGIC) {
 		ubi_err("bad VID header magic %#08x at PEB %d, must be %#08x",
@@ -1278,6 +1290,9 @@ static int paranoid_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 	struct ubi_vid_hdr *vid_hdr;
 	void *p;
 
+	if (!(ubi_chk_flags & UBI_CHK_IO))
+		return 0;
+
 	vid_hdr = ubi_zalloc_vid_hdr(ubi, GFP_NOFS);
 	if (!vid_hdr)
 		return -ENOMEM;
@@ -1327,6 +1342,9 @@ int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 	void *buf1;
 	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
+	if (!(ubi_chk_flags & UBI_CHK_IO))
+		return 0;
+
 	buf1 = __vmalloc(len, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
 	if (!buf1) {
 		ubi_err("cannot allocate memory to check writes");
@@ -1388,6 +1406,9 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len)
 	void *buf;
 	loff_t addr = (loff_t)pnum * ubi->peb_size + offset;
 
+	if (!(ubi_chk_flags & UBI_CHK_IO))
+		return 0;
+
 	buf = __vmalloc(len, GFP_KERNEL | GFP_NOFS, PAGE_KERNEL);
 	if (!buf) {
 		ubi_err("cannot allocate memory to check for 0xFFs");
@@ -1422,4 +1443,4 @@ error:
 	return err;
 }
 
-#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID */
+#endif /* CONFIG_MTD_UBI_DEBUG */
diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 39a8e9c..f0ab14b 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -157,7 +157,7 @@
 #include <linux/random.h>
 #include "ubi.h"
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si);
 #else
 #define paranoid_check_si(ubi, si) 0
@@ -1398,7 +1398,7 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
 	kfree(si);
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 
 /**
  * paranoid_check_si - check the scanning information.
@@ -1416,6 +1416,9 @@ static int paranoid_check_si(struct ubi_device *ubi, struct ubi_scan_info *si)
 	struct ubi_scan_leb *seb, *last_seb;
 	uint8_t *buf;
 
+	if (!(ubi_chk_flags & UBI_CHK_GEN))
+		return 0;
+
 	/*
 	 * At first, check that scanning information is OK.
 	 */
@@ -1668,4 +1671,4 @@ out:
 	return -EINVAL;
 }
 
-#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID */
+#endif /* CONFIG_MTD_UBI_DEBUG */
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index c47620d..b79e0de 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -28,7 +28,7 @@
 #include <linux/slab.h>
 #include "ubi.h"
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 static int paranoid_check_volumes(struct ubi_device *ubi);
 #else
 #define paranoid_check_volumes(ubi) 0
@@ -711,7 +711,7 @@ void ubi_free_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 	volume_sysfs_close(vol);
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 
 /**
  * paranoid_check_volume - check volume information.
@@ -876,6 +876,9 @@ static int paranoid_check_volumes(struct ubi_device *ubi)
 {
 	int i, err = 0;
 
+	if (!(ubi_chk_flags & UBI_CHK_GEN))
+		return 0;
+
 	for (i = 0; i < ubi->vtbl_slots; i++) {
 		err = paranoid_check_volume(ubi, i);
 		if (err)
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index fcdb7f6..0b81c55 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -62,7 +62,7 @@
 #include <asm/div64.h>
 #include "ubi.h"
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 static void paranoid_vtbl_check(const struct ubi_device *ubi);
 #else
 #define paranoid_vtbl_check(ubi)
@@ -870,7 +870,7 @@ out_free:
 	return err;
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 
 /**
  * paranoid_vtbl_check - check volume table.
@@ -878,10 +878,13 @@ out_free:
  */
 static void paranoid_vtbl_check(const struct ubi_device *ubi)
 {
+	if (!(ubi_chk_flags & UBI_CHK_GEN))
+		return;
+
 	if (vtbl_check(ubi, ubi->vtbl)) {
 		ubi_err("paranoid check failed");
 		BUG();
 	}
 }
 
-#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID */
+#endif /* CONFIG_MTD_UBI_DEBUG */
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 655bbbe..4e55290 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -161,7 +161,7 @@ struct ubi_work {
 	int torture;
 };
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec);
 static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
 				     struct rb_root *root);
@@ -1561,7 +1561,7 @@ void ubi_wl_close(struct ubi_device *ubi)
 	kfree(ubi->lookuptbl);
 }
 
-#ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
+#ifdef CONFIG_MTD_UBI_DEBUG
 
 /**
  * paranoid_check_ec - make sure that the erase counter of a PEB is correct.
@@ -1578,6 +1578,9 @@ static int paranoid_check_ec(struct ubi_device *ubi, int pnum, int ec)
 	long long read_ec;
 	struct ubi_ec_hdr *ec_hdr;
 
+	if (!(ubi_chk_flags & UBI_CHK_GEN))
+		return 0;
+
 	ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_NOFS);
 	if (!ec_hdr)
 		return -ENOMEM;
@@ -1614,6 +1617,9 @@ out_free:
 static int paranoid_check_in_wl_tree(struct ubi_wl_entry *e,
 				     struct rb_root *root)
 {
+	if (!(ubi_chk_flags & UBI_CHK_GEN))
+		return 0;
+
 	if (in_wl_tree(e, root))
 		return 0;
 
@@ -1636,6 +1642,9 @@ static int paranoid_check_in_pq(struct ubi_device *ubi, struct ubi_wl_entry *e)
 	struct ubi_wl_entry *p;
 	int i;
 
+	if (!(ubi_chk_flags & UBI_CHK_GEN))
+		return 0;
+
 	for (i = 0; i < UBI_PROT_QUEUE_LEN; ++i)
 		list_for_each_entry(p, &ubi->pq[i], u.list)
 			if (p == e)
@@ -1646,4 +1655,5 @@ static int paranoid_check_in_pq(struct ubi_device *ubi, struct ubi_wl_entry *e)
 	ubi_dbg_dump_stack();
 	return -EINVAL;
 }
-#endif /* CONFIG_MTD_UBI_DEBUG_PARANOID */
+
+#endif /* CONFIG_MTD_UBI_DEBUG */
-- 
1.7.2.3
