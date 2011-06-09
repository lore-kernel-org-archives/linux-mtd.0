Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUb6v-0002T7-UP
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 09:01:22 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p5990wEE028399
	for <linux-mtd@lists.infradead.org>; Thu, 9 Jun 2011 12:01:04 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/30] UBIFS: introduce helper functions for debugging checks
	and tests
Date: Thu,  9 Jun 2011 12:04:54 +0300
Message-Id: <1307610310-28691-15-git-send-email-dedekind1@gmail.com>
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

This patch introduces helper functions for all debugging checks, so instead of
doing

if (!(ubifs_chk_flags & UBIFS_CHK_GEN))

we now do

if (!dbg_is_chk_gen(c))

This is a preparation to further changes where the flags will go away, and
we'll need to only change the helper functions, but the code which utilizes
them won't be touched.

At the same time this patch removes 'dbg_force_in_the_gaps()',
'dbg_force_in_the_gaps_enabled()', and dbg_failure_mode helpers for
consistency.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/commit.c     |    2 +-
 fs/ubifs/debug.c      |   30 ++++++++--------------
 fs/ubifs/debug.h      |   66 ++++++++++++++++++++++++++++++++++---------------
 fs/ubifs/dir.c        |    2 +-
 fs/ubifs/log.c        |    2 +-
 fs/ubifs/lprops.c     |    6 ++--
 fs/ubifs/lpt.c        |    2 +-
 fs/ubifs/lpt_commit.c |   10 +++---
 fs/ubifs/orphan.c     |    2 +-
 fs/ubifs/scan.c       |    2 +-
 fs/ubifs/tnc.c        |    2 +-
 fs/ubifs/tnc_commit.c |    5 ++-
 12 files changed, 75 insertions(+), 56 deletions(-)

diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 637e076..63c4e44 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -576,7 +576,7 @@ int dbg_check_old_index(struct ubifs_info *c, struct ubifs_zbranch *zroot)
 	struct idx_node *i;
 	size_t sz;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_OLD_IDX))
+	if (!dbg_is_chk_old_idx(c))
 		return 0;
 
 	INIT_LIST_HEAD(&list);
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 7adf9fe..79d8924 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -330,7 +330,7 @@ void dbg_dump_node(const struct ubifs_info *c, const void *node)
 	union ubifs_key key;
 	const struct ubifs_ch *ch = node;
 
-	if (dbg_failure_mode)
+	if (dbg_is_tst_rcvry(c))
 		return;
 
 	/* If the magic is incorrect, just hexdump the first bytes */
@@ -886,7 +886,7 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 	struct ubifs_scan_node *snod;
 	void *buf;
 
-	if (dbg_failure_mode)
+	if (dbg_is_tst_rcvry(c))
 		return;
 
 	printk(KERN_DEBUG "(pid %d) start dumping LEB %d\n",
@@ -1145,7 +1145,7 @@ int dbg_check_synced_i_size(const struct ubifs_info *c, struct inode *inode)
 	int err = 0;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+	if (!dbg_is_chk_gen(c))
 		return 0;
 	if (!S_ISREG(inode->i_mode))
 		return 0;
@@ -1186,7 +1186,7 @@ int dbg_check_dir(struct ubifs_info *c, const struct inode *dir)
 	struct qstr nm = { .name = NULL };
 	loff_t size = UBIFS_INO_NODE_SZ;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+	if (!dbg_is_chk_gen(c))
 		return 0;
 
 	if (!S_ISDIR(dir->i_mode))
@@ -1544,7 +1544,7 @@ int dbg_check_tnc(struct ubifs_info *c, int extra)
 	long clean_cnt = 0, dirty_cnt = 0;
 	int err, last;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_TNC))
+	if (!dbg_is_chk_tnc(c))
 		return 0;
 
 	ubifs_assert(mutex_is_locked(&c->tnc_mutex));
@@ -1791,7 +1791,7 @@ int dbg_check_idx_size(struct ubifs_info *c, long long idx_size)
 	int err;
 	long long calc = 0;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_IDX_SZ))
+	if (!dbg_is_chk_idx_sz(c))
 		return 0;
 
 	err = dbg_walk_index(c, NULL, add_size, &calc);
@@ -2367,7 +2367,7 @@ int dbg_check_filesystem(struct ubifs_info *c)
 	int err;
 	struct fsck_data fsckd;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_FS))
+	if (!dbg_is_chk_fs(c))
 		return 0;
 
 	fsckd.inodes = RB_ROOT;
@@ -2402,7 +2402,7 @@ int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head)
 	struct list_head *cur;
 	struct ubifs_scan_node *sa, *sb;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+	if (!dbg_is_chk_gen(c))
 		return 0;
 
 	for (cur = head->next; cur->next != head; cur = cur->next) {
@@ -2469,7 +2469,7 @@ int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head)
 	struct list_head *cur;
 	struct ubifs_scan_node *sa, *sb;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+	if (!dbg_is_chk_gen(c))
 		return 0;
 
 	for (cur = head->next; cur->next != head; cur = cur->next) {
@@ -2546,14 +2546,6 @@ error_dump:
 	return 0;
 }
 
-int dbg_force_in_the_gaps(void)
-{
-	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
-		return 0;
-
-	return !(random32() & 7);
-}
-
 /* Failure mode for recovery testing */
 
 #define chance(n, d) (simple_rand() <= (n) * 32768LL / (d))
@@ -2624,7 +2616,7 @@ static int in_failure_mode(struct ubi_volume_desc *desc)
 {
 	struct ubifs_info *c = dbg_find_info(desc);
 
-	if (c && dbg_failure_mode)
+	if (c && dbg_is_tst_rcvry(c))
 		return c->dbg->failure_mode;
 	return 0;
 }
@@ -2634,7 +2626,7 @@ static int do_fail(struct ubi_volume_desc *desc, int lnum, int write)
 	struct ubifs_info *c = dbg_find_info(desc);
 	struct ubifs_debug_info *d;
 
-	if (!c || !dbg_failure_mode)
+	if (!c || !dbg_is_tst_rcvry(c))
 		return 0;
 	d = c->dbg;
 	if (d->failure_mode)
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 90805bd..c3d1ffd 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -31,8 +31,6 @@ typedef int (*dbg_znode_callback)(struct ubifs_info *c,
 
 #ifdef CONFIG_UBIFS_FS_DEBUG
 
-#include <linux/random.h>
-
 /*
  * The UBIFS debugfs directory name pattern and maximum name length (3 for "ubi"
  * + 1 for "_" and plus 2x2 for 2 UBI numbers and 1 for the trailing zero byte.
@@ -169,6 +167,8 @@ const char *dbg_key_str1(const struct ubifs_info *c,
 /* Additional recovery messages */
 #define dbg_rcvry(fmt, ...) ubifs_dbg_msg("rcvry", fmt, ##__VA_ARGS__)
 
+extern spinlock_t dbg_lock;
+
 /*
  * Debugging check flags.
  *
@@ -199,12 +199,43 @@ enum {
 	UBIFS_TST_RCVRY             = 0x4,
 };
 
-extern spinlock_t dbg_lock;
-
 extern unsigned int ubifs_msg_flags;
 extern unsigned int ubifs_chk_flags;
 extern unsigned int ubifs_tst_flags;
 
+static inline int dbg_is_chk_gen(const struct ubifs_info *c)
+{
+	return !!(ubifs_chk_flags & UBIFS_CHK_GEN);
+}
+static inline int dbg_is_chk_tnc(const struct ubifs_info *c)
+{
+	return !!(ubifs_chk_flags & UBIFS_CHK_TNC);
+}
+static inline int dbg_is_chk_idx_sz(const struct ubifs_info *c)
+{
+	return !!(ubifs_chk_flags & UBIFS_CHK_IDX_SZ);
+}
+static inline int dbg_is_chk_orph(const struct ubifs_info *c)
+{
+	return !!(ubifs_chk_flags & UBIFS_CHK_ORPH);
+}
+static inline int dbg_is_chk_old_idx(const struct ubifs_info *c)
+{
+	return !!(ubifs_chk_flags & UBIFS_CHK_OLD_IDX);
+}
+static inline int dbg_is_chk_lprops(const struct ubifs_info *c)
+{
+	return !!(ubifs_chk_flags & UBIFS_CHK_LPROPS);
+}
+static inline int dbg_is_chk_fs(const struct ubifs_info *c)
+{
+	return !!(ubifs_chk_flags & UBIFS_CHK_FS);
+}
+static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)
+{
+	return !!(ubifs_tst_flags & UBIFS_TST_RCVRY);
+}
+
 int ubifs_debugging_init(struct ubifs_info *c);
 void ubifs_debugging_exit(struct ubifs_info *c);
 
@@ -261,16 +292,6 @@ int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
 int dbg_check_data_nodes_order(struct ubifs_info *c, struct list_head *head);
 int dbg_check_nondata_nodes_order(struct ubifs_info *c, struct list_head *head);
 
-/* Force the use of in-the-gaps method for testing */
-static inline int dbg_force_in_the_gaps_enabled(void)
-{
-	return ubifs_chk_flags & UBIFS_CHK_GEN;
-}
-int dbg_force_in_the_gaps(void);
-
-/* Failure mode for recovery testing */
-#define dbg_failure_mode (ubifs_tst_flags & UBIFS_TST_RCVRY)
-
 #ifndef UBIFS_DBG_PRESERVE_UBI
 #define ubi_leb_read   dbg_leb_read
 #define ubi_leb_write  dbg_leb_write
@@ -330,6 +351,9 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 		ubifs_err(fmt, ##__VA_ARGS__);     \
 } while (0)
 
+#define DBGKEY(key)  ((char *)(key))
+#define DBGKEY1(key) ((char *)(key))
+
 #define ubifs_dbg_msg(fmt, ...) do {               \
 	if (0)                                     \
 		pr_debug(fmt "\n", ##__VA_ARGS__); \
@@ -353,9 +377,6 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 #define dbg_scan(fmt, ...)  ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 #define dbg_rcvry(fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
 
-#define DBGKEY(key)  ((char *)(key))
-#define DBGKEY1(key) ((char *)(key))
-
 static inline int ubifs_debugging_init(struct ubifs_info *c)      { return 0; }
 static inline void ubifs_debugging_exit(struct ubifs_info *c)     { return; }
 static inline const char *dbg_ntype(int type)                     { return ""; }
@@ -440,9 +461,14 @@ static inline int
 dbg_check_nondata_nodes_order(struct ubifs_info *c,
 			      struct list_head *head)             { return 0; }
 
-static inline int dbg_force_in_the_gaps(void)                     { return 0; }
-#define dbg_force_in_the_gaps_enabled() 0
-#define dbg_failure_mode                0
+static inline int dbg_is_chk_gen(const struct ubifs_info *c)      { return 0; }
+static inline int dbg_is_chk_tnc(const struct ubifs_info *c)      { return 0; }
+static inline int dbg_is_chk_idx_sz(const struct ubifs_info *c)   { return 0; }
+static inline int dbg_is_chk_orph(const struct ubifs_info *c)     { return 0; }
+static inline int dbg_is_chk_old_idx(const struct ubifs_info *c)  { return 0; }
+static inline int dbg_is_chk_lprops(const struct ubifs_info *c)   { return 0; }
+static inline int dbg_is_chk_fs(const struct ubifs_info *c)       { return 0; }
+static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)    { return 0; }
 
 static inline int dbg_debugfs_init(void)                          { return 0; }
 static inline void dbg_debugfs_exit(void)                         { return; }
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 98014bf..6834920 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -176,7 +176,7 @@ static int dbg_check_name(const struct ubifs_info *c,
 			  const struct ubifs_dent_node *dent,
 			  const struct qstr *nm)
 {
-	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+	if (!dbg_is_chk_gen(c))
 		return 0;
 	if (le16_to_cpu(dent->nlen) != nm->len)
 		return -EINVAL;
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index affea94..fabfb53 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -752,7 +752,7 @@ static int dbg_check_bud_bytes(struct ubifs_info *c)
 	struct ubifs_bud *bud;
 	long long bud_bytes = 0;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+	if (!dbg_is_chk_gen(c))
 		return 0;
 
 	spin_lock(&c->buds_lock);
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 98b8e73..f8a181e 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -860,7 +860,7 @@ int dbg_check_cats(struct ubifs_info *c)
 	struct list_head *pos;
 	int i, cat;
 
-	if (!(ubifs_chk_flags & (UBIFS_CHK_GEN | UBIFS_CHK_LPROPS)))
+	if (!dbg_is_chk_gen(c) && !dbg_is_chk_lprops(c))
 		return 0;
 
 	list_for_each_entry(lprops, &c->empty_list, list) {
@@ -958,7 +958,7 @@ void dbg_check_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat,
 {
 	int i = 0, j, err = 0;
 
-	if (!(ubifs_chk_flags & (UBIFS_CHK_GEN | UBIFS_CHK_LPROPS)))
+	if (!dbg_is_chk_gen(c) && !dbg_is_chk_lprops(c))
 		return;
 
 	for (i = 0; i < heap->cnt; i++) {
@@ -1262,7 +1262,7 @@ int dbg_check_lprops(struct ubifs_info *c)
 	int i, err;
 	struct ubifs_lp_stats lst;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_LPROPS))
+	if (!dbg_is_chk_lprops(c))
 		return 0;
 
 	/*
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index 04713cd..ab91ca6 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -2226,7 +2226,7 @@ int dbg_check_lpt_nodes(struct ubifs_info *c, struct ubifs_cnode *cnode,
 	struct ubifs_cnode *cn;
 	int num, iip = 0, err;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_LPROPS))
+	if (!dbg_is_chk_lprops(c))
 		return 0;
 
 	while (cnode) {
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 254e8d3..f8e286b 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1640,7 +1640,7 @@ static int dbg_check_ltab_lnum(struct ubifs_info *c, int lnum)
 	int ret;
 	void *buf, *p;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_LPROPS))
+	if (!dbg_is_chk_lprops(c))
 		return 0;
 
 	buf = p = __vmalloc(c->leb_size, GFP_NOFS, PAGE_KERNEL);
@@ -1711,7 +1711,7 @@ int dbg_check_ltab(struct ubifs_info *c)
 {
 	int lnum, err, i, cnt;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_LPROPS))
+	if (!dbg_is_chk_lprops(c))
 		return 0;
 
 	/* Bring the entire tree into memory */
@@ -1754,7 +1754,7 @@ int dbg_chk_lpt_free_spc(struct ubifs_info *c)
 	long long free = 0;
 	int i;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_LPROPS))
+	if (!dbg_is_chk_lprops(c))
 		return 0;
 
 	for (i = 0; i < c->lpt_lebs; i++) {
@@ -1796,7 +1796,7 @@ int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
 	long long chk_lpt_sz, lpt_sz;
 	int err = 0;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_LPROPS))
+	if (!dbg_is_chk_lprops(c))
 		return 0;
 
 	switch (action) {
@@ -2019,7 +2019,7 @@ static int dbg_populate_lsave(struct ubifs_info *c)
 	struct ubifs_lpt_heap *heap;
 	int i;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+	if (!dbg_is_chk_gen(c))
 		return 0;
 	if (random32() & 3)
 		return 0;
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index a5422ff..c542c73 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -929,7 +929,7 @@ static int dbg_check_orphans(struct ubifs_info *c)
 	struct check_info ci;
 	int err;
 
-	if (!(ubifs_chk_flags & UBIFS_CHK_ORPH))
+	if (!dbg_is_chk_orph(c))
 		return 0;
 
 	ci.last_ino = 0;
diff --git a/fs/ubifs/scan.c b/fs/ubifs/scan.c
index 36216b4..c7df916 100644
--- a/fs/ubifs/scan.c
+++ b/fs/ubifs/scan.c
@@ -240,7 +240,7 @@ void ubifs_scanned_corruption(const struct ubifs_info *c, int lnum, int offs,
 	int len;
 
 	ubifs_err("corruption at LEB %d:%d", lnum, offs);
-	if (dbg_failure_mode)
+	if (dbg_is_tst_rcvry(c))
 		return;
 	len = c->leb_size - offs;
 	if (len > 8192)
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index b32a537..526b63c 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -3300,7 +3300,7 @@ int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
 
 	if (!S_ISREG(inode->i_mode))
 		return 0;
-	if (!(ubifs_chk_flags & UBIFS_CHK_GEN))
+	if (!dbg_is_chk_gen(c))
 		return 0;
 
 	block = (size + UBIFS_BLOCK_SIZE - 1) >> UBIFS_BLOCK_SHIFT;
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index d6fab1a..8959c72 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -23,6 +23,7 @@
 /* This file implements TNC functions for committing */
 
 #include "ubifs.h"
+#include <linux/random.h>
 
 /**
  * make_idx_node - make an index node for fill-the-gaps method of TNC commit.
@@ -381,7 +382,7 @@ static int layout_in_gaps(struct ubifs_info *c, int cnt)
 				c->gap_lebs = NULL;
 				return err;
 			}
-			if (dbg_force_in_the_gaps_enabled()) {
+			if (!dbg_is_chk_gen(c)) {
 				/*
 				 * Do not print scary warnings if the debugging
 				 * option which forces in-the-gaps is enabled.
@@ -689,7 +690,7 @@ static int alloc_idx_lebs(struct ubifs_info *c, int cnt)
 		c->ilebs[c->ileb_cnt++] = lnum;
 		dbg_cmt("LEB %d", lnum);
 	}
-	if (dbg_force_in_the_gaps())
+	if (dbg_is_chk_gen(c) && !(random32() & 7))
 		return -ENOSPC;
 	return 0;
 }
-- 
1.7.2.3
