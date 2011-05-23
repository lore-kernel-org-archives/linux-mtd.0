Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOOWT-00016n-WD
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 06:21:52 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4N6LkPq001506
	for <linux-mtd@lists.infradead.org>; Mon, 23 May 2011 09:21:48 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBIFS: switch to dynamic printks
Date: Mon, 23 May 2011 09:25:45 +0300
Message-Id: <1306131945-5187-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1306131945-5187-1-git-send-email-dedekind1@gmail.com>
References: <1306131945-5187-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Switch to debugging using dynamic printk (pr_debug()). There is no good reason
to carry custom debugging prints if there is so cool and powerful generic
dynamic printk infrastructure, see Documentation/dynamic-debug-howto.txt. With
dynamic printks we can switch on/of individual prints, per-file, per-function
and per format messages. This means that instead of doing old-fashioned

echo 1 > /sys/module/ubifs/parameters/debug_msgs

to enable general messages, we can do:

echo 'format "UBIFS DBG gen" +ptlf' > control

to enable general messages and additionally ask the dynamic printk
infrastructure to print process ID, line number and function name. So there is
no reason to keep UBIFS-specific crud if there is more powerful generic thing.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 Documentation/filesystems/ubifs.txt |   25 +------
 fs/ubifs/debug.c                    |    3 -
 fs/ubifs/debug.h                    |  132 +++++++++++------------------------
 3 files changed, 43 insertions(+), 117 deletions(-)

diff --git a/Documentation/filesystems/ubifs.txt b/Documentation/filesystems/ubifs.txt
index 7d17e5b..8e4fab6 100644
--- a/Documentation/filesystems/ubifs.txt
+++ b/Documentation/filesystems/ubifs.txt
@@ -115,28 +115,8 @@ ubi.mtd=0 root=ubi0:rootfs rootfstype=ubifs
 Module Parameters for Debugging
 ===============================
 
-When UBIFS has been compiled with debugging enabled, there are 3 module
+When UBIFS has been compiled with debugging enabled, there are 2 module
 parameters that are available to control aspects of testing and debugging.
-The parameters are unsigned integers where each bit controls an option.
-The parameters are:
-
-debug_msgs	Selects which debug messages to display, as follows:
-
-		Message Type				Flag value
-
-		General messages			1
-		Journal messages			2
-		Mount messages				4
-		Commit messages				8
-		LEB search messages			16
-		Budgeting messages			32
-		Garbage collection messages		64
-		Tree Node Cache (TNC) messages		128
-		LEB properties (lprops) messages	256
-		Input/output messages			512
-		Log messages				1024
-		Scan messages				2048
-		Recovery messages			4096
 
 debug_chks	Selects extra checks that UBIFS can do while running:
 
@@ -156,8 +136,7 @@ debug_tsts	Selects a mode of testing, as follows:
 
 		Failure mode for recovery testing	4
 
-For example, set debug_msgs to 5 to display General messages and Mount
-messages.
+For example, set debug_chks to 3 to enable general and TNC checks.
 
 
 References
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index f46d77e..0bb2bce 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -42,15 +42,12 @@ DEFINE_SPINLOCK(dbg_lock);
 static char dbg_key_buf0[128];
 static char dbg_key_buf1[128];
 
-unsigned int ubifs_msg_flags;
 unsigned int ubifs_chk_flags;
 unsigned int ubifs_tst_flags;
 
-module_param_named(debug_msgs, ubifs_msg_flags, uint, S_IRUGO | S_IWUSR);
 module_param_named(debug_chks, ubifs_chk_flags, uint, S_IRUGO | S_IWUSR);
 module_param_named(debug_tsts, ubifs_tst_flags, uint, S_IRUGO | S_IWUSR);
 
-MODULE_PARM_DESC(debug_msgs, "Debug message type flags");
 MODULE_PARM_DESC(debug_chks, "Debug check flags");
 MODULE_PARM_DESC(debug_tsts, "Debug special test flags");
 
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 7538bf2..a811ac4 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -109,19 +109,6 @@ struct ubifs_debug_info {
 
 #define dbg_dump_stack() dump_stack()
 
-/* Generic debugging messages */
-#define dbg_msg(fmt, ...) do {                                                 \
-	spin_lock(&dbg_lock);                                                  \
-	printk(KERN_DEBUG "UBIFS DBG (pid %d): %s: " fmt "\n", current->pid,   \
-	       __func__, ##__VA_ARGS__);                                       \
-	spin_unlock(&dbg_lock);                                                \
-} while (0)
-
-#define dbg_do_msg(typ, fmt, ...) do {                                         \
-	if (ubifs_msg_flags & typ)                                             \
-		dbg_msg(fmt, ##__VA_ARGS__);                                   \
-} while (0)
-
 #define dbg_err(fmt, ...) do {                                                 \
 	spin_lock(&dbg_lock);                                                  \
 	ubifs_err(fmt, ##__VA_ARGS__);                                         \
@@ -140,77 +127,40 @@ const char *dbg_key_str1(const struct ubifs_info *c,
 #define DBGKEY(key) dbg_key_str0(c, (key))
 #define DBGKEY1(key) dbg_key_str1(c, (key))
 
-/* General messages */
-#define dbg_gen(fmt, ...)   dbg_do_msg(UBIFS_MSG_GEN, fmt, ##__VA_ARGS__)
+#define ubifs_dbg_msg(type, fmt, ...) do {                        \
+	spin_lock(&dbg_lock);                                     \
+	pr_debug("UBIFS DBG " type ": " fmt "\n", ##__VA_ARGS__); \
+	spin_unlock(&dbg_lock);                                   \
+} while (0)
 
+/* Just a debugging messages not related to any specific UBIFS subsystem */
+#define dbg_msg(fmt, ...)   ubifs_dbg_msg("msg", fmt, ##__VA_ARGS__)
+/* General messages */
+#define dbg_gen(fmt, ...)   ubifs_dbg_msg("gen", fmt, ##__VA_ARGS__)
 /* Additional journal messages */
-#define dbg_jnl(fmt, ...)   dbg_do_msg(UBIFS_MSG_JNL, fmt, ##__VA_ARGS__)
-
+#define dbg_jnl(fmt, ...)   ubifs_dbg_msg("jnl", fmt, ##__VA_ARGS__)
 /* Additional TNC messages */
-#define dbg_tnc(fmt, ...)   dbg_do_msg(UBIFS_MSG_TNC, fmt, ##__VA_ARGS__)
-
+#define dbg_tnc(fmt, ...)   ubifs_dbg_msg("tnc", fmt, ##__VA_ARGS__)
 /* Additional lprops messages */
-#define dbg_lp(fmt, ...)    dbg_do_msg(UBIFS_MSG_LP, fmt, ##__VA_ARGS__)
-
+#define dbg_lp(fmt, ...)    ubifs_dbg_msg("lp", fmt, ##__VA_ARGS__)
 /* Additional LEB find messages */
-#define dbg_find(fmt, ...)  dbg_do_msg(UBIFS_MSG_FIND, fmt, ##__VA_ARGS__)
-
+#define dbg_find(fmt, ...)  ubifs_dbg_msg("find", fmt, ##__VA_ARGS__)
 /* Additional mount messages */
-#define dbg_mnt(fmt, ...)   dbg_do_msg(UBIFS_MSG_MNT, fmt, ##__VA_ARGS__)
-
+#define dbg_mnt(fmt, ...)   ubifs_dbg_msg("mnt", fmt, ##__VA_ARGS__)
 /* Additional I/O messages */
-#define dbg_io(fmt, ...)    dbg_do_msg(UBIFS_MSG_IO, fmt, ##__VA_ARGS__)
-
+#define dbg_io(fmt, ...)    ubifs_dbg_msg("io", fmt, ##__VA_ARGS__)
 /* Additional commit messages */
-#define dbg_cmt(fmt, ...)   dbg_do_msg(UBIFS_MSG_CMT, fmt, ##__VA_ARGS__)
-
+#define dbg_cmt(fmt, ...)   ubifs_dbg_msg("cmt", fmt, ##__VA_ARGS__)
 /* Additional budgeting messages */
-#define dbg_budg(fmt, ...)  dbg_do_msg(UBIFS_MSG_BUDG, fmt, ##__VA_ARGS__)
-
+#define dbg_budg(fmt, ...)  ubifs_dbg_msg("budg", fmt, ##__VA_ARGS__)
 /* Additional log messages */
-#define dbg_log(fmt, ...)   dbg_do_msg(UBIFS_MSG_LOG, fmt, ##__VA_ARGS__)
-
+#define dbg_log(fmt, ...)   ubifs_dbg_msg("log", fmt, ##__VA_ARGS__)
 /* Additional gc messages */
-#define dbg_gc(fmt, ...)    dbg_do_msg(UBIFS_MSG_GC, fmt, ##__VA_ARGS__)
-
+#define dbg_gc(fmt, ...)    ubifs_dbg_msg("gc", fmt, ##__VA_ARGS__)
 /* Additional scan messages */
-#define dbg_scan(fmt, ...)  dbg_do_msg(UBIFS_MSG_SCAN, fmt, ##__VA_ARGS__)
-
+#define dbg_scan(fmt, ...)  ubifs_dbg_msg("scan", fmt, ##__VA_ARGS__)
 /* Additional recovery messages */
-#define dbg_rcvry(fmt, ...) dbg_do_msg(UBIFS_MSG_RCVRY, fmt, ##__VA_ARGS__)
-
-/*
- * Debugging message type flags.
- *
- * UBIFS_MSG_GEN: general messages
- * UBIFS_MSG_JNL: journal messages
- * UBIFS_MSG_MNT: mount messages
- * UBIFS_MSG_CMT: commit messages
- * UBIFS_MSG_FIND: LEB find messages
- * UBIFS_MSG_BUDG: budgeting messages
- * UBIFS_MSG_GC: garbage collection messages
- * UBIFS_MSG_TNC: TNC messages
- * UBIFS_MSG_LP: lprops messages
- * UBIFS_MSG_IO: I/O messages
- * UBIFS_MSG_LOG: log messages
- * UBIFS_MSG_SCAN: scan messages
- * UBIFS_MSG_RCVRY: recovery messages
- */
-enum {
-	UBIFS_MSG_GEN   = 0x1,
-	UBIFS_MSG_JNL   = 0x2,
-	UBIFS_MSG_MNT   = 0x4,
-	UBIFS_MSG_CMT   = 0x8,
-	UBIFS_MSG_FIND  = 0x10,
-	UBIFS_MSG_BUDG  = 0x20,
-	UBIFS_MSG_GC    = 0x40,
-	UBIFS_MSG_TNC   = 0x80,
-	UBIFS_MSG_LP    = 0x100,
-	UBIFS_MSG_IO    = 0x200,
-	UBIFS_MSG_LOG   = 0x400,
-	UBIFS_MSG_SCAN  = 0x800,
-	UBIFS_MSG_RCVRY = 0x1000,
-};
+#define dbg_rcvry(fmt, ...) ubifs_dbg_msg("rcvry", fmt, ##__VA_ARGS__)
 
 /*
  * Debugging check flags.
@@ -368,33 +318,33 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 		       __func__, __LINE__, current->pid);                      \
 } while (0)
 
-#define dbg_err(fmt, ...)   do {                                               \
-	if (0)                                                                 \
-		ubifs_err(fmt, ##__VA_ARGS__);                                 \
+#define dbg_err(fmt, ...)   do {                   \
+	if (0)                                     \
+		ubifs_err(fmt, ##__VA_ARGS__);     \
 } while (0)
 
-#define dbg_msg(fmt, ...) do {                                                 \
-	if (0)                                                                 \
-		printk(KERN_DEBUG "UBIFS DBG (pid %d): %s: " fmt "\n",         \
-		       current->pid, __func__, ##__VA_ARGS__);                 \
+#define ubifs_dbg_msg(fmt, ...) do {               \
+	if (0)                                     \
+		pr_debug(fmt "\n", ##__VA_ARGS__); \
 } while (0)
 
 #define dbg_dump_stack()
 #define ubifs_assert_cmt_locked(c)
 
-#define dbg_gen(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_jnl(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_tnc(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_lp(fmt, ...)    dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_find(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_mnt(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_io(fmt, ...)    dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_cmt(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_budg(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_log(fmt, ...)   dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_gc(fmt, ...)    dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_scan(fmt, ...)  dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_rcvry(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_msg(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_gen(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_jnl(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_tnc(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_lp(fmt, ...)    ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_find(fmt, ...)  ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_mnt(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_io(fmt, ...)    ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_cmt(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_budg(fmt, ...)  ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_log(fmt, ...)   ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_gc(fmt, ...)    ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_scan(fmt, ...)  ubifs_dbg_msg(fmt, ##__VA_ARGS__)
+#define dbg_rcvry(fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 
 #define DBGKEY(key)  ((char *)(key))
 #define DBGKEY1(key) ((char *)(key))
-- 
1.7.2.3
