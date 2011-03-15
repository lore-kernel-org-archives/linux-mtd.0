Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzQ4n-0007UR-7f
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:58:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2F8vvpS031804
	for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2011 10:57:59 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/7] UBI: make debugging messages dynamic
Date: Tue, 15 Mar 2011 11:00:34 +0200
Message-Id: <1300179636-12183-6-git-send-email-dedekind1@gmail.com>
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

This patch adds a possibility to dynamically select UBI debugging
messages, instead of selecting them compile-time from the configuration
menu. This is much more flexible, and consistent with UBIFS, and this
also simplifies UBI Kconfig menu and the code.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/Kconfig.debug |   30 ----------------------
 drivers/mtd/ubi/debug.c       |    8 ++++++
 drivers/mtd/ubi/debug.h       |   54 ++++++++++++++++++++++-------------------
 3 files changed, 37 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig.debug b/drivers/mtd/ubi/Kconfig.debug
index fad4adc..d40134e 100644
--- a/drivers/mtd/ubi/Kconfig.debug
+++ b/drivers/mtd/ubi/Kconfig.debug
@@ -10,11 +10,6 @@ config MTD_UBI_DEBUG
 
 if MTD_UBI_DEBUG
 
-config MTD_UBI_DEBUG_MSG
-	bool "UBI debugging messages"
-	help
-	  This option enables UBI debugging messages.
-
 config MTD_UBI_DEBUG_PARANOID
 	bool "Extra self-checks"
 	help
@@ -45,29 +40,4 @@ config MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES
 	  This option emulates erase failures with probability 1/100. Useful for
 	  debugging and testing how UBI handlines errors.
 
-comment "Additional UBI debugging messages"
-
-config MTD_UBI_DEBUG_MSG_BLD
-	bool "Additional UBI initialization and build messages"
-	help
-	  This option enables detailed UBI initialization and device build
-	  debugging messages.
-
-config MTD_UBI_DEBUG_MSG_EBA
-	bool "Eraseblock association unit messages"
-	help
-	  This option enables debugging messages from the UBI eraseblock
-	  association unit.
-
-config MTD_UBI_DEBUG_MSG_WL
-	bool "Wear-leveling unit messages"
-	help
-	  This option enables debugging messages from the UBI wear-leveling
-	  unit.
-
-config MTD_UBI_DEBUG_MSG_IO
-	bool "Input/output unit messages"
-	help
-	  This option enables debugging messages from the UBI input/output unit.
-
 endif # MTD_UBI_DEBUG
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 4876977..8ae0bc7 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -27,6 +27,14 @@
 #ifdef CONFIG_MTD_UBI_DEBUG
 
 #include "ubi.h"
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+
+unsigned int ubi_msg_flags;
+
+module_param_named(debug_msgs, ubi_msg_flags, uint, S_IRUGO | S_IWUSR);
+
+MODULE_PARM_DESC(debug_msgs, "Debug message type flags");
 
 /**
  * ubi_dbg_dump_ec_hdr - dump an erase counter header.
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 8bd1d17..bee6fa1 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -38,6 +38,11 @@
 	printk(KERN_DEBUG "UBI DBG (pid %d): %s: " fmt "\n", \
 	       current->pid, __func__, ##__VA_ARGS__)
 
+#define dbg_do_msg(typ, fmt, ...) do {                       \
+	if (ubi_msg_flags & typ)                             \
+		dbg_msg(fmt, ##__VA_ARGS__);                 \
+} while (0)
+
 #define ubi_dbg_dump_stack() dump_stack()
 
 struct ubi_ec_hdr;
@@ -57,43 +62,42 @@ void ubi_dbg_dump_seb(const struct ubi_scan_leb *seb, int type);
 void ubi_dbg_dump_mkvol_req(const struct ubi_mkvol_req *req);
 void ubi_dbg_dump_flash(struct ubi_device *ubi, int pnum, int offset, int len);
 
+extern unsigned int ubi_msg_flags;
+
+/*
+ * Debugging message type flags (must match msg_type_names in debug.c).
+ *
+ * UBI_MSG_GEN: general messages
+ * UBI_MSG_EBA: journal messages
+ * UBI_MSG_WL: mount messages
+ * UBI_MSG_IO: commit messages
+ * UBI_MSG_BLD: LEB find messages
+ */
+enum {
+	UBI_MSG_GEN  = 0x1,
+	UBI_MSG_EBA  = 0x2,
+	UBI_MSG_WL   = 0x4,
+	UBI_MSG_IO   = 0x8,
+	UBI_MSG_BLD  = 0x10,
+};
+
 #define ubi_dbg_print_hex_dump(l, ps, pt, r, g, b, len, a)  \
 		print_hex_dump(l, ps, pt, r, g, b, len, a)
 
-#ifdef CONFIG_MTD_UBI_DEBUG_MSG
 /* General debugging messages */
-#define dbg_gen(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
-#else
-#define dbg_gen(fmt, ...) ({})
-#endif
+#define dbg_gen(fmt, ...) dbg_do_msg(UBI_MSG_GEN, fmt, ##__VA_ARGS__)
 
-#ifdef CONFIG_MTD_UBI_DEBUG_MSG_EBA
 /* Messages from the eraseblock association sub-system */
-#define dbg_eba(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
-#else
-#define dbg_eba(fmt, ...) ({})
-#endif
+#define dbg_eba(fmt, ...) dbg_do_msg(UBI_MSG_EBA, fmt, ##__VA_ARGS__)
 
-#ifdef CONFIG_MTD_UBI_DEBUG_MSG_WL
 /* Messages from the wear-leveling sub-system */
-#define dbg_wl(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
-#else
-#define dbg_wl(fmt, ...) ({})
-#endif
+#define dbg_wl(fmt, ...) dbg_do_msg(UBI_MSG_WL, fmt, ##__VA_ARGS__)
 
-#ifdef CONFIG_MTD_UBI_DEBUG_MSG_IO
 /* Messages from the input/output sub-system */
-#define dbg_io(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
-#else
-#define dbg_io(fmt, ...) ({})
-#endif
+#define dbg_io(fmt, ...) dbg_do_msg(UBI_MSG_IO, fmt, ##__VA_ARGS__)
 
-#ifdef CONFIG_MTD_UBI_DEBUG_MSG_BLD
 /* Initialization and build messages */
-#define dbg_bld(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
-#else
-#define dbg_bld(fmt, ...) ({})
-#endif
+#define dbg_bld(fmt, ...) dbg_do_msg(UBI_MSG_BLD, fmt, ##__VA_ARGS__)
 
 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
 int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len);
-- 
1.7.2.3
