Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PxHjf-0001De-Pz
	for linux-mtd@lists.infradead.org; Wed, 09 Mar 2011 11:39:24 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p29BdH2t028902
	for <linux-mtd@lists.infradead.org>; Wed, 9 Mar 2011 13:39:18 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Subject: [PATCH] UBIFS: simplify UBIFS Kconfig menu
Date: Wed,  9 Mar 2011 13:42:06 +0200
Message-Id: <1299670926-7842-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Remove debug message level and debug checks Kconfig options as they
proved to be useless anyway. We have sysfs interface which we can
use for fine-grained debugging messages and checks selection, see
Documentation/filesystems/ubifs.txt for mode details.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/Kconfig |   23 ++++++++++-------------
 fs/ubifs/debug.c |    4 ++--
 fs/ubifs/debug.h |   22 ----------------------
 3 files changed, 12 insertions(+), 37 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index 830e3f7..1d1859d 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -44,23 +44,20 @@ config UBIFS_FS_ZLIB
 
 # Debugging-related stuff
 config UBIFS_FS_DEBUG
-	bool "Enable debugging"
+	bool "Enable debugging support"
 	depends on UBIFS_FS
 	select DEBUG_FS
 	select KALLSYMS_ALL
 	help
-	  This option enables UBIFS debugging.
-
-config UBIFS_FS_DEBUG_MSG_LVL
-	int "Default message level (0 = no extra messages, 3 = lots)"
-	depends on UBIFS_FS_DEBUG
-	default "0"
-	help
-	  This controls the amount of debugging messages produced by UBIFS.
-	  If reporting bugs, please try to have available a full dump of the
-	  messages at level 1 while the misbehaviour was occurring. Level 2
-	  may become necessary if level 1 messages were not enough to find the
-	  bug. Generally Level 3 should be avoided.
+	  This option enables UBIFS debugging support. It makes sure various
+	  assertions, self-checks, debugging messages and test modes are compiled
+	  in (this all is compiled out otherwise). Assertions are light-weight
+	  and this option also enables them. Self-checks, debugging messages and
+	  test modes are switched off by default. Thus, it is safe and actually
+	  recommended to have debugging support enabled, and it should not slow
+	  down UBIFS. You can then further enable / disable individual  debugging
+	  features using UBIFS module parameters and the corresponding sysfs
+	  interfaces.
 
 config UBIFS_FS_DEBUG_CHKS
 	bool "Enable extra checks"
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index bcb1acb..02c10dc 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -43,8 +43,8 @@ DEFINE_SPINLOCK(dbg_lock);
 static char dbg_key_buf0[128];
 static char dbg_key_buf1[128];
 
-unsigned int ubifs_msg_flags = UBIFS_MSG_FLAGS_DEFAULT;
-unsigned int ubifs_chk_flags = UBIFS_CHK_FLAGS_DEFAULT;
+unsigned int ubifs_msg_flags;
+unsigned int ubifs_chk_flags;
 unsigned int ubifs_tst_flags;
 
 module_param_named(debug_msgs, ubifs_msg_flags, uint, S_IRUGO | S_IWUSR);
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 69ebe47..10190c1 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -205,12 +205,6 @@ enum {
 	UBIFS_MSG_RCVRY = 0x1000,
 };
 
-/* Debugging message type flags for each default debug message level */
-#define UBIFS_MSG_LVL_0 0
-#define UBIFS_MSG_LVL_1 0x1
-#define UBIFS_MSG_LVL_2 0x7f
-#define UBIFS_MSG_LVL_3 0xffff
-
 /*
  * Debugging check flags (must match chk_names in debug.c).
  *
@@ -243,22 +237,6 @@ enum {
 	UBIFS_TST_RCVRY             = 0x4,
 };
 
-#if CONFIG_UBIFS_FS_DEBUG_MSG_LVL == 1
-#define UBIFS_MSG_FLAGS_DEFAULT UBIFS_MSG_LVL_1
-#elif CONFIG_UBIFS_FS_DEBUG_MSG_LVL == 2
-#define UBIFS_MSG_FLAGS_DEFAULT UBIFS_MSG_LVL_2
-#elif CONFIG_UBIFS_FS_DEBUG_MSG_LVL == 3
-#define UBIFS_MSG_FLAGS_DEFAULT UBIFS_MSG_LVL_3
-#else
-#define UBIFS_MSG_FLAGS_DEFAULT UBIFS_MSG_LVL_0
-#endif
-
-#ifdef CONFIG_UBIFS_FS_DEBUG_CHKS
-#define UBIFS_CHK_FLAGS_DEFAULT 0xffffffff
-#else
-#define UBIFS_CHK_FLAGS_DEFAULT 0
-#endif
-
 extern spinlock_t dbg_lock;
 
 extern unsigned int ubifs_msg_flags;
-- 
1.7.2.3
