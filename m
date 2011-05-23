Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOOXC-00018y-Nu
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 06:22:36 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4N6MURk002377
	for <linux-mtd@lists.infradead.org>; Mon, 23 May 2011 09:22:33 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/3] UBI: switch to dynamic printks
Date: Mon, 23 May 2011 09:26:29 +0300
Message-Id: <1306131989-5391-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1306131989-5391-1-git-send-email-dedekind1@gmail.com>
References: <1306131989-5391-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Remove custom dynamic prints and the module parameter to toggle them and use
the generic kernel dynamic printk infrastructure.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/debug.c |    3 --
 drivers/mtd/ubi/debug.h |   83 ++++++++++++++++-------------------------------
 2 files changed, 28 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 0cd5bea..2224cbe 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -30,15 +30,12 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 
-unsigned int ubi_msg_flags;
 unsigned int ubi_chk_flags;
 unsigned int ubi_tst_flags;
 
-module_param_named(debug_msgs, ubi_msg_flags, uint, S_IRUGO | S_IWUSR);
 module_param_named(debug_chks, ubi_chk_flags, uint, S_IRUGO | S_IWUSR);
 module_param_named(debug_tsts, ubi_chk_flags, uint, S_IRUGO | S_IWUSR);
 
-MODULE_PARM_DESC(debug_msgs, "Debug message type flags");
 MODULE_PARM_DESC(debug_chks, "Debug check flags");
 MODULE_PARM_DESC(debug_tsts, "Debug special test flags");
 
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index b2dba2c..3f1a09c 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -32,8 +32,6 @@ struct ubi_mkvol_req;
 #ifdef CONFIG_MTD_UBI_DEBUG
 #include <linux/random.h>
 
-#define dbg_err(fmt, ...) ubi_err(fmt, ##__VA_ARGS__)
-
 #define ubi_assert(expr)  do {                                               \
 	if (unlikely(!(expr))) {                                             \
 		printk(KERN_CRIT "UBI assert failed in %s at %u (pid %d)\n", \
@@ -42,62 +40,37 @@ struct ubi_mkvol_req;
 	}                                                                    \
 } while (0)
 
-#define dbg_msg(fmt, ...)                                    \
-	printk(KERN_DEBUG "UBI DBG (pid %d): %s: " fmt "\n", \
-	       current->pid, __func__, ##__VA_ARGS__)
-
-#define dbg_do_msg(typ, fmt, ...) do {                       \
-	if (ubi_msg_flags & typ)                             \
-		dbg_msg(fmt, ##__VA_ARGS__);                 \
-} while (0)
+#define dbg_err(fmt, ...) ubi_err(fmt, ##__VA_ARGS__)
 
 #define ubi_dbg_dump_stack() dump_stack()
 
-void ubi_dbg_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr);
-void ubi_dbg_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
-void ubi_dbg_dump_vol_info(const struct ubi_volume *vol);
-void ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
-void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv);
-void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
-void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req);
-void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
-
-extern unsigned int ubi_msg_flags;
-
-/*
- * Debugging message type flags (must match msg_type_names in debug.c).
- *
- * UBI_MSG_GEN: general messages
- * UBI_MSG_EBA: journal messages
- * UBI_MSG_WL: mount messages
- * UBI_MSG_IO: commit messages
- * UBI_MSG_BLD: LEB find messages
- */
-enum {
-	UBI_MSG_GEN  = 0x1,
-	UBI_MSG_EBA  = 0x2,
-	UBI_MSG_WL   = 0x4,
-	UBI_MSG_IO   = 0x8,
-	UBI_MSG_BLD  = 0x10,
-};
-
 #define ubi_dbg_print_hex_dump(l, ps, pt, r, g, b, len, a)  \
 		print_hex_dump(l, ps, pt, r, g, b, len, a)
 
-/* General debugging messages */
-#define dbg_gen(fmt, ...) dbg_do_msg(UBI_MSG_GEN, fmt, ##__VA_ARGS__)
+#define ubi_dbg_msg(type, fmt, ...) \
+	pr_debug("UBI DBG " type ": " fmt "\n", ##__VA_ARGS__)
 
+/* Just a debugging messages not related to any specific UBI subsystem */
+#define dbg_msg(fmt, ...) ubi_dbg_msg("msg", fmt, ##__VA_ARGS__)
+/* General debugging messages */
+#define dbg_gen(fmt, ...) ubi_dbg_msg("gen", fmt, ##__VA_ARGS__)
 /* Messages from the eraseblock association sub-system */
-#define dbg_eba(fmt, ...) dbg_do_msg(UBI_MSG_EBA, fmt, ##__VA_ARGS__)
-
+#define dbg_eba(fmt, ...) ubi_dbg_msg("eba", fmt, ##__VA_ARGS__)
 /* Messages from the wear-leveling sub-system */
-#define dbg_wl(fmt, ...) dbg_do_msg(UBI_MSG_WL, fmt, ##__VA_ARGS__)
-
+#define dbg_wl(fmt, ...)  ubi_dbg_msg("wl", fmt, ##__VA_ARGS__)
 /* Messages from the input/output sub-system */
-#define dbg_io(fmt, ...) dbg_do_msg(UBI_MSG_IO, fmt, ##__VA_ARGS__)
-
+#define dbg_io(fmt, ...)  ubi_dbg_msg("io", fmt, ##__VA_ARGS__)
 /* Initialization and build messages */
-#define dbg_bld(fmt, ...) dbg_do_msg(UBI_MSG_BLD, fmt, ##__VA_ARGS__)
+#define dbg_bld(fmt, ...) ubi_dbg_msg("bld", fmt, ##__VA_ARGS__)
+
+void ubi_dbg_dump_ec_hdr(const struct ubi_ec_hdr *ec_hdr);
+void ubi_dbg_dump_vid_hdr(const struct ubi_vid_hdr *vid_hdr);
+void ubi_dbg_dump_vol_info(const struct ubi_volume *vol);
+void ubi_dbg_dump_vtbl_record(const struct ubi_vtbl_record *r, int idx);
+void ubi_dbg_dump_sv(const struct ubi_scan_volume *sv);
+void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
+void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req);
+void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
 
 extern unsigned int ubi_chk_flags;
 
@@ -197,17 +170,17 @@ static inline int ubi_dbg_is_erase_failure(void)
 		ubi_err(fmt, ##__VA_ARGS__);                                 \
 } while (0)
 
-#define dbg_msg(fmt, ...) do {                                               \
+#define ubi_dbg_msg(fmt, ...) do {                                           \
 	if (0)                                                               \
-		printk(KERN_DEBUG "UBI DBG (pid %d): %s: " fmt "\n",         \
-		       current->pid, __func__, ##__VA_ARGS__);               \
+		pr_debug(fmt "\n", ##__VA_ARGS__);                           \
 } while (0)
 
-#define dbg_gen(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_eba(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_wl(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_io(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_bld(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_msg(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_gen(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_eba(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_wl(fmt, ...)   ubi_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_io(fmt, ...)   ubi_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_bld(fmt, ...)  ubi_dbg_msg(fmt, ##__VA_ARGS__)
 
 static inline void ubi_dbg_dump_stack(void)                          { return; }
 static inline void
-- 
1.7.2.3
