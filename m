Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6w-0002U7-85
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:18 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEF028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:04 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/30] UBIFS: lessen amount of debugging check types
Date: Thu,  9 Jun 2011 12:04:55 +0300
Message-Id: <1307610310-28691-16-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
References: <1307610310-28691-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

We have too many different debugging checks - lessen the amount by merging all
index-related checks into one. At the same time, move the "force in-the-gap"
test to the "index checks" class, because it is too heavy for the "general"
class.

This patch merges TNC, Old index, and Index size check and calles this just
"index checks".

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 Documentation/filesystems/ubifs.txt |    4 +---
 fs/ubifs/commit.c                   |    2 +-
 fs/ubifs/debug.c                    |    4 ++--
 fs/ubifs/debug.h                    |   24 +++++-------------------
 fs/ubifs/lpt_commit.c               |    1 +
 fs/ubifs/tnc_commit.c               |    6 +++---
 6 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/Documentation/filesystems/ubifs.txt b/Documentation/filesystems/ubifs.txt
index 8e4fab6..91ef076 100644
--- a/Documentation/filesystems/ubifs.txt
+++ b/Documentation/filesystems/ubifs.txt
@@ -123,10 +123,8 @@ debug_chks	Selects extra checks that UBIFS can do while running:
 		Check					Flag value
 
 		General checks				1
-		Check Tree Node Cache (TNC)		2
-		Check indexing tree size		4
+		Check the index				2
 		Check orphan area			8
-		Check old indexing tree			16
 		Check LEB properties (lprops)		32
 		Check leaf nodes and inodes		64
 
diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 63c4e44..fb3b5c8 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -576,7 +576,7 @@ int dbg_check_old_index(struct ubifs_info *c, struct ubifs_zbranch *zroot)
 	struct idx_node *i;
 	size_t sz;
 
-	if (!dbg_is_chk_old_idx(c))
+	if (!dbg_is_chk_index(c))
 		return 0;
 
 	INIT_LIST_HEAD(&list);
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 79d8924..a967d68 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -1544,7 +1544,7 @@ int dbg_check_tnc(struct ubifs_info *c, int extra)
 	long clean_cnt = 0, dirty_cnt = 0;
 	int err, last;
 
-	if (!dbg_is_chk_tnc(c))
+	if (!dbg_is_chk_index(c))
 		return 0;
 
 	ubifs_assert(mutex_is_locked(&c->tnc_mutex));
@@ -1791,7 +1791,7 @@ int dbg_check_idx_size(struct ubifs_info *c, long long idx_size)
 	int err;
 	long long calc = 0;
 
-	if (!dbg_is_chk_idx_sz(c))
+	if (!dbg_is_chk_index(c))
 		return 0;
 
 	err = dbg_walk_index(c, NULL, add_size, &calc);
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index c3d1ffd..44265a3 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -173,19 +173,15 @@ extern spinlock_t dbg_lock;
  * Debugging check flags.
  *
  * UBIFS_CHK_GEN: general checks
- * UBIFS_CHK_TNC: check TNC
- * UBIFS_CHK_IDX_SZ: check index size
+ * UBIFS_CHK_INDEX: check the index
  * UBIFS_CHK_ORPH: check orphans
- * UBIFS_CHK_OLD_IDX: check the old index
  * UBIFS_CHK_LPROPS: check lprops
  * UBIFS_CHK_FS: check the file-system
  */
 enum {
 	UBIFS_CHK_GEN     = 0x1,
-	UBIFS_CHK_TNC     = 0x2,
-	UBIFS_CHK_IDX_SZ  = 0x4,
+	UBIFS_CHK_INDEX   = 0x2,
 	UBIFS_CHK_ORPH    = 0x8,
-	UBIFS_CHK_OLD_IDX = 0x10,
 	UBIFS_CHK_LPROPS  = 0x20,
 	UBIFS_CHK_FS      = 0x40,
 };
@@ -207,22 +203,14 @@ static inline int dbg_is_chk_gen(const struct ubifs_info *c)
 {
 	return !!(ubifs_chk_flags & UBIFS_CHK_GEN);
 }
-static inline int dbg_is_chk_tnc(const struct ubifs_info *c)
+static inline int dbg_is_chk_index(const struct ubifs_info *c)
 {
-	return !!(ubifs_chk_flags & UBIFS_CHK_TNC);
-}
-static inline int dbg_is_chk_idx_sz(const struct ubifs_info *c)
-{
-	return !!(ubifs_chk_flags & UBIFS_CHK_IDX_SZ);
+	return !!(ubifs_chk_flags & UBIFS_CHK_INDEX);
 }
 static inline int dbg_is_chk_orph(const struct ubifs_info *c)
 {
 	return !!(ubifs_chk_flags & UBIFS_CHK_ORPH);
 }
-static inline int dbg_is_chk_old_idx(const struct ubifs_info *c)
-{
-	return !!(ubifs_chk_flags & UBIFS_CHK_OLD_IDX);
-}
 static inline int dbg_is_chk_lprops(const struct ubifs_info *c)
 {
 	return !!(ubifs_chk_flags & UBIFS_CHK_LPROPS);
@@ -462,10 +450,8 @@ dbg_check_nondata_nodes_order(struct ubifs_info *c,
 			      struct list_head *head)             { return 0; }
 
 static inline int dbg_is_chk_gen(const struct ubifs_info *c)      { return 0; }
-static inline int dbg_is_chk_tnc(const struct ubifs_info *c)      { return 0; }
-static inline int dbg_is_chk_idx_sz(const struct ubifs_info *c)   { return 0; }
+static inline int dbg_is_chk_index(const struct ubifs_info *c)    { return 0; }
 static inline int dbg_is_chk_orph(const struct ubifs_info *c)     { return 0; }
-static inline int dbg_is_chk_old_idx(const struct ubifs_info *c)  { return 0; }
 static inline int dbg_is_chk_lprops(const struct ubifs_info *c)   { return 0; }
 static inline int dbg_is_chk_fs(const struct ubifs_info *c)       { return 0; }
 static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)    { return 0; }
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index f8e286b..f13addf 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -27,6 +27,7 @@
 
 #include <linux/crc16.h>
 #include <linux/slab.h>
+#include <linux/random.h>
 #include "ubifs.h"
 
 #ifdef CONFIG_UBIFS_FS_DEBUG
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index 8959c72..4c15f07 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -22,8 +22,8 @@
 
 /* This file implements TNC functions for committing */
 
-#include "ubifs.h"
 #include <linux/random.h>
+#include "ubifs.h"
 
 /**
  * make_idx_node - make an index node for fill-the-gaps method of TNC commit.
@@ -382,7 +382,7 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 				c->gap_lebs = NULL;
 				return err;
 			}
-			if (!dbg_is_chk_gen(c)) {
+			if (!dbg_is_chk_index(c)) {
 				/*
 				 * Do not print scary warnings if the debugging
 				 * option which forces in-the-gaps is enabled.
@@ -690,7 +690,7 @@ static int alloc_idx_lebs(struct ubifs_info *c, int cnt)
 		c->ilebs[c->ileb_cnt++] = lnum;
 		dbg_cmt("LEB %d", lnum);
 	}
-	if (dbg_is_chk_gen(c) && !(random32() & 7))
+	if (dbg_is_chk_index(c) && !(random32() & 7))
 		return -ENOSPC;
 	return 0;
 }
-- 
1.7.2.3
