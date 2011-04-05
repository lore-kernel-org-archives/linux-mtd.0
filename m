Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7649-00048f-45
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:13:09 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35DD2Fa026378
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 16:13:03 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBIFS: make force in-the-gaps to be a general self-check
Date: Tue,  5 Apr 2011 16:16:13 +0300
Message-Id: <1302009374-14299-1-git-send-email-dedekind1@gmail.com>
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

UBIFS can force itself to use the 'in-the-gaps' commit method - the last resort
method which is normally invoced very very rarely. Currently this "force
int-the-gaps" debugging feature is a separate test mode. But it is a bit saner
to make it to be the "general" self-test check instead.

This patch is just a clean-up which should make the debugging code look a bit
nicer and easier to use - we have way too many debugging options.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 Documentation/filesystems/ubifs.txt |    1 -
 fs/ubifs/debug.c                    |    9 +++------
 fs/ubifs/debug.h                    |   10 ++++------
 fs/ubifs/tnc_commit.c               |    4 ++--
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/Documentation/filesystems/ubifs.txt b/Documentation/filesystems/ubifs.txt
index d7b13b0..7d17e5b 100644
--- a/Documentation/filesystems/ubifs.txt
+++ b/Documentation/filesystems/ubifs.txt
@@ -154,7 +154,6 @@ debug_tsts	Selects a mode of testing, as follows:
 
 		Test mode				Flag value
 
-		Force in-the-gaps method		2
 		Failure mode for recovery testing	4
 
 For example, set debug_msgs to 5 to display General messages and Mount
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 546ad57..06d171c 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -34,7 +34,6 @@
 #include <linux/moduleparam.h>
 #include <linux/debugfs.h>
 #include <linux/math64.h>
-#include <linux/slab.h>
 
 #ifdef CONFIG_UBIFS_FS_DEBUG
 
@@ -2458,14 +2457,12 @@ error_dump:
 	return 0;
 }
 
-static int invocation_cnt;
-
 int dbg_force_in_the_gaps(void)
 {
-	if (!dbg_force_in_the_gaps_enabled)
+	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
 		return 0;
-	/* Force in-the-gaps every 8th commit */
-	return !((invocation_cnt++) & 0x7);
+
+	return !(random32() & 7);
 }
 
 /* Failure mode for recovery testing */
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 29748c2..28b996f 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -25,6 +25,8 @@
 
 #ifdef CONFIG_UBIFS_FS_DEBUG
 
+#include <linux/random.h>
+
 /**
  * ubifs_debug_info - per-FS debugging information.
  * @old_zroot: old index root - used by 'dbg_check_old_index()'
@@ -231,11 +233,9 @@ enum {
 /*
  * Special testing flags.
  *
- * UBIFS_TST_FORCE_IN_THE_GAPS: force the use of in-the-gaps method
  * UBIFS_TST_RCVRY: failure mode for recovery testing
  */
 enum {
-	UBIFS_TST_FORCE_IN_THE_GAPS = 0x2,
 	UBIFS_TST_RCVRY             = 0x4,
 };
 
@@ -309,9 +309,7 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head);
 
 /* Force the use of in-the-gaps method for testing */
 
-#define dbg_force_in_the_gaps_enabled \
-	(ubifs_tst_flags & UBIFS_TST_FORCE_IN_THE_GAPS)
-
+#define dbg_force_in_the_gaps_enabled() (ubifs_chk_flags & UBIFS_CHK_GEN)
 int dbg_force_in_the_gaps(void);
 
 /* Failure mode for recovery testing */
@@ -449,7 +447,7 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 #define dbg_check_inode_size(c, inode, size)       0
 #define dbg_check_data_nodes_order(c, head)        0
 #define dbg_check_nondata_nodes_order(c, head)     0
-#define dbg_force_in_the_gaps_enabled              0
+#define dbg_force_in_the_gaps_enabled()            0
 #define dbg_force_in_the_gaps()                    0
 #define dbg_failure_mode                           0
 
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index c471b06..41920f3 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -377,12 +377,12 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 				c->gap_lebs = NULL;
 				return err;
 			}
-			if (!dbg_force_in_the_gaps_enabled) {
+			if (dbg_force_in_the_gaps_enabled()) {
 				/*
 				 * Do not print scary warnings if the debugging
 				 * option which forces in-the-gaps is enabled.
 				 */
-				ubifs_err("out of space");
+				ubifs_warn("out of space");
 				dbg_dump_budg(c, &c->bi);
 				dbg_dump_lprops(c);
 			}
-- 
1.7.2.3
