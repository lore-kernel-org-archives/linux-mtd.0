Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PzQ4n-0007US-8D
	for linux-mtd@lists.infradead.org; Tue, 15 Mar 2011 08:58:06 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2F8vwUc031816
	for <linux-mtd@lists.infradead.org>; Tue, 15 Mar 2011 10:57:59 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 7/7] UBI: make tests modes dynamic
Date: Tue, 15 Mar 2011 11:00:36 +0200
Message-Id: <1300179636-12183-8-git-send-email-dedekind1@gmail.com>
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

Similarly to the debugging checks and message, make the test modes
be dynamically selected via the "debug_tsts" module parameter or
via the "/sys/module/ubi/parameters/debug_tsts" sysfs file. This
is consistent with UBIFS as well.

And now, since all the Kconfig knobs became dynamic, we can remove
the Kconfig.debug file completely.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/ubi/Kconfig       |    8 ++++++-
 drivers/mtd/ubi/Kconfig.debug |   37 ---------------------------------
 drivers/mtd/ubi/build.c       |    3 +-
 drivers/mtd/ubi/debug.c       |    3 ++
 drivers/mtd/ubi/debug.h       |   46 +++++++++++++++++++++++++----------------
 drivers/mtd/ubi/wl.c          |    4 +-
 6 files changed, 41 insertions(+), 60 deletions(-)
 delete mode 100644 drivers/mtd/ubi/Kconfig.debug

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 3cf193f..6abeb4f 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -52,6 +52,12 @@ config MTD_UBI_GLUEBI
 	   work on top of UBI. Do not enable this unless you use legacy
 	   software.
 
-source "drivers/mtd/ubi/Kconfig.debug"
+config MTD_UBI_DEBUG
+	bool "UBI debugging"
+	depends on SYSFS
+	select DEBUG_FS
+	select KALLSYMS_ALL if KALLSYMS && DEBUG_KERNEL
+	help
+	  This option enables UBI debugging.
 
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/Kconfig.debug b/drivers/mtd/ubi/Kconfig.debug
deleted file mode 100644
index d8d33dd..0000000
--- a/drivers/mtd/ubi/Kconfig.debug
+++ /dev/null
@@ -1,37 +0,0 @@
-comment "UBI debugging options"
-
-config MTD_UBI_DEBUG
-	bool "UBI debugging"
-	depends on SYSFS
-	select DEBUG_FS
-	select KALLSYMS_ALL if KALLSYMS && DEBUG_KERNEL
-	help
-	  This option enables UBI debugging.
-
-if MTD_UBI_DEBUG
-
-config MTD_UBI_DEBUG_DISABLE_BGT
-	bool "Do not enable the UBI background thread"
-	help
-	  This option switches the background thread off by default. The thread
-	  may be also be enabled/disabled via UBI sysfs.
-
-config MTD_UBI_DEBUG_EMULATE_BITFLIPS
-	bool "Emulate flash bit-flips"
-	help
-	  This option emulates bit-flips with probability 1/50, which in turn
-	  causes scrubbing. Useful for debugging and stressing UBI.
-
-config MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES
-	bool "Emulate flash write failures"
-	help
-	  This option emulates write failures with probability 1/100. Useful for
-	  debugging and testing how UBI handlines errors.
-
-config MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES
-	bool "Emulate flash erase failures"
-	help
-	  This option emulates erase failures with probability 1/100. Useful for
-	  debugging and testing how UBI handlines errors.
-
-endif # MTD_UBI_DEBUG
diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 3a04719..a801ea6 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -986,8 +986,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num, int vid_hdr_offset)
 	 * checks @ubi->thread_enabled. Otherwise we may fail to wake it up.
 	 */
 	spin_lock(&ubi->wl_lock);
-	if (!DBG_DISABLE_BGT)
-		ubi->thread_enabled = 1;
+	ubi->thread_enabled = 1;
 	wake_up_process(ubi->bgt_thread);
 	spin_unlock(&ubi->wl_lock);
 
diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 4c7a3f6..d4d07e5 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -32,12 +32,15 @@
 
 unsigned int ubi_msg_flags;
 unsigned int ubi_chk_flags;
+unsigned int ubi_tst_flags;
 
 module_param_named(debug_msgs, ubi_msg_flags, uint, S_IRUGO | S_IWUSR);
 module_param_named(debug_chks, ubi_chk_flags, uint, S_IRUGO | S_IWUSR);
+module_param_named(debug_tsts, ubi_chk_flags, uint, S_IRUGO | S_IWUSR);
 
 MODULE_PARM_DESC(debug_msgs, "Debug message type flags");
 MODULE_PARM_DESC(debug_chks, "Debug check flags");
+MODULE_PARM_DESC(debug_tsts, "Debug special test flags");
 
 /**
  * ubi_dbg_dump_ec_hdr - dump an erase counter header.
diff --git a/drivers/mtd/ubi/debug.h b/drivers/mtd/ubi/debug.h
index 2511b58..c713f0b 100644
--- a/drivers/mtd/ubi/debug.h
+++ b/drivers/mtd/ubi/debug.h
@@ -116,13 +116,34 @@ int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int offset, int len);
 int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
 			int offset, int len);
 
-#ifdef CONFIG_MTD_UBI_DEBUG_DISABLE_BGT
-#define DBG_DISABLE_BGT 1
-#else
-#define DBG_DISABLE_BGT 0
-#endif
+extern unsigned int ubi_tst_flags;
+
+/*
+ * Special testing flags.
+ *
+ * UBIFS_TST_DISABLE_BGT: disable the background thread
+ * UBI_TST_EMULATE_BITFLIPS: emulate bit-flips
+ * UBI_TST_EMULATE_WRITE_FAILURES: emulate write failures
+ * UBI_TST_EMULATE_ERASE_FAILURES: emulate erase failures
+ */
+enum {
+	UBI_TST_DISABLE_BGT            = 0x1,
+	UBI_TST_EMULATE_BITFLIPS       = 0x2,
+	UBI_TST_EMULATE_WRITE_FAILURES = 0x4,
+	UBI_TST_EMULATE_ERASE_FAILURES = 0x8,
+};
+
+/**
+ * ubi_dbg_is_bgt_disabled - if the background thread is disabled.
+ *
+ * Returns non-zero if the UBI background thread is disabled for testing
+ * purposes.
+ */
+static inline int ubi_dbg_is_bgt_disabled(void)
+{
+	return ubi_tst_flags & UBI_TST_DISABLE_BGT;
+}
 
-#ifdef CONFIG_MTD_UBI_DEBUG_EMULATE_BITFLIPS
 /**
  * ubi_dbg_is_bitflip - if it is time to emulate a bit-flip.
  *
@@ -132,11 +153,7 @@ static inline int ubi_dbg_is_bitflip(void)
 {
 	return !(random32() % 200);
 }
-#else
-#define ubi_dbg_is_bitflip() 0
-#endif
 
-#ifdef CONFIG_MTD_UBI_DEBUG_EMULATE_WRITE_FAILURES
 /**
  * ubi_dbg_is_write_failure - if it is time to emulate a write failure.
  *
@@ -147,11 +164,7 @@ static inline int ubi_dbg_is_write_failure(void)
 {
 	return !(random32() % 500);
 }
-#else
-#define ubi_dbg_is_write_failure() 0
-#endif
 
-#ifdef CONFIG_MTD_UBI_DEBUG_EMULATE_ERASE_FAILURES
 /**
  * ubi_dbg_is_erase_failure - if its time to emulate an erase failure.
  *
@@ -162,9 +175,6 @@ static inline int ubi_dbg_is_erase_failure(void)
 {
 		return !(random32() % 400);
 }
-#else
-#define ubi_dbg_is_erase_failure() 0
-#endif
 
 #else
 
@@ -187,7 +197,7 @@ static inline int ubi_dbg_is_erase_failure(void)
 #define ubi_dbg_dump_flash(ubi, pnum, offset, len) ({})
 #define ubi_dbg_print_hex_dump(l, ps, pt, r, g, b, len, a)  ({})
 
-#define DBG_DISABLE_BGT            0
+#define ubi_dbg_is_bgt_disabled()  0
 #define ubi_dbg_is_bitflip()       0
 #define ubi_dbg_is_write_failure() 0
 #define ubi_dbg_is_erase_failure() 0
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 4e55290..b4cf57d 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -613,7 +613,7 @@ static void schedule_ubi_work(struct ubi_device *ubi, struct ubi_work *wrk)
 	list_add_tail(&wrk->list, &ubi->works);
 	ubi_assert(ubi->works_count >= 0);
 	ubi->works_count += 1;
-	if (ubi->thread_enabled)
+	if (ubi->thread_enabled && !ubi_dbg_is_bgt_disabled())
 		wake_up_process(ubi->bgt_thread);
 	spin_unlock(&ubi->wl_lock);
 }
@@ -1364,7 +1364,7 @@ int ubi_thread(void *u)
 
 		spin_lock(&ubi->wl_lock);
 		if (list_empty(&ubi->works) || ubi->ro_mode ||
-			       !ubi->thread_enabled) {
+		    !ubi->thread_enabled || ubi_dbg_is_bgt_disabled()) {
 			set_current_state(TASK_INTERRUPTIBLE);
 			spin_unlock(&ubi->wl_lock);
 			schedule();
-- 
1.7.2.3
