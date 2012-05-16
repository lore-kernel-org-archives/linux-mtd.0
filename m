Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUhov-0002RZ-GD
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 17:15:37 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/5] UBIFS: remove Kconfig debugging option
Date: Wed, 16 May 2012 20:16:25 +0300
Message-Id: <1337188586-32293-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1337188586-32293-1-git-send-email-dedekind1@gmail.com>
References: <1337188586-32293-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Have the debugging stuff always compiled-in instead. It simplifies maintanance
a lot.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/Kconfig      |   17 ------
 fs/ubifs/Makefile     |    4 +-
 fs/ubifs/commit.c     |    6 +-
 fs/ubifs/debug.c      |    4 --
 fs/ubifs/debug.h      |  153 -------------------------------------------------
 fs/ubifs/dir.c        |    8 ---
 fs/ubifs/log.c        |    8 ---
 fs/ubifs/lprops.c     |    6 +-
 fs/ubifs/lpt.c        |    4 --
 fs/ubifs/lpt_commit.c |   10 +---
 fs/ubifs/orphan.c     |   10 +---
 fs/ubifs/sb.c         |    2 -
 fs/ubifs/tnc.c        |    4 --
 fs/ubifs/tnc_commit.c |   10 ----
 fs/ubifs/ubifs.h      |   11 ++--
 15 files changed, 19 insertions(+), 238 deletions(-)

diff --git a/fs/ubifs/Kconfig b/fs/ubifs/Kconfig
index e49a23c..ba66d50 100644
--- a/fs/ubifs/Kconfig
+++ b/fs/ubifs/Kconfig
@@ -35,20 +35,3 @@ config UBIFS_FS_ZLIB
 	default y
 	help
 	  Zlib compresses better than LZO but it is slower. Say 'Y' if unsure.
-
-# Debugging-related stuff
-config UBIFS_FS_DEBUG
-	bool "Enable debugging support"
-	depends on UBIFS_FS
-	select DEBUG_FS
-	select KALLSYMS
-	help
-	  This option enables UBIFS debugging support. It makes sure various
-	  assertions, self-checks, debugging messages and test modes are compiled
-	  in (this all is compiled out otherwise). Assertions are light-weight
-	  and this option also enables them. Self-checks, debugging messages and
-	  test modes are switched off by default. Thus, it is safe and actually
-	  recommended to have debugging support enabled, and it should not slow
-	  down UBIFS. You can then further enable / disable individual  debugging
-	  features using UBIFS module parameters and the corresponding sysfs
-	  interfaces.
diff --git a/fs/ubifs/Makefile b/fs/ubifs/Makefile
index 4878614..2c6f0cb 100644
--- a/fs/ubifs/Makefile
+++ b/fs/ubifs/Makefile
@@ -3,6 +3,4 @@ obj-$(CONFIG_UBIFS_FS) += ubifs.o
 ubifs-y += shrinker.o journal.o file.o dir.o super.o sb.o io.o
 ubifs-y += tnc.o master.o scan.o replay.o log.o commit.o gc.o orphan.o
 ubifs-y += budget.o find.o tnc_commit.o compress.o lpt.o lprops.o
-ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o
-
-ubifs-$(CONFIG_UBIFS_FS_DEBUG) += debug.o
+ubifs-y += recovery.o ioctl.o lpt_commit.o tnc_misc.o xattr.o debug.o
diff --git a/fs/ubifs/commit.c b/fs/ubifs/commit.c
index 4f795d1..5da20c1 100644
--- a/fs/ubifs/commit.c
+++ b/fs/ubifs/commit.c
@@ -496,7 +496,9 @@ int ubifs_gc_should_commit(struct ubifs_info *c)
 	return ret;
 }
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
+/*
+ * Everything below is related to debugging.
+ */
 
 /**
  * struct idx_node - hold index nodes during index tree traversal.
@@ -734,5 +736,3 @@ out_free:
 		err = -EINVAL;
 	return err;
 }
-
-#endif /* CONFIG_UBIFS_FS_DEBUG */
diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 914b4c8..3eef253 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -34,8 +34,6 @@
 #include <linux/random.h>
 #include "ubifs.h"
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
-
 static DEFINE_SPINLOCK(dbg_lock);
 
 static const char *get_key_fmt(int fmt)
@@ -3189,5 +3187,3 @@ void ubifs_debugging_exit(struct ubifs_info *c)
 {
 	kfree(c->dbg);
 }
-
-#endif /* CONFIG_UBIFS_FS_DEBUG */
diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index b34aeff..7a6a9e2 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -29,8 +29,6 @@ typedef int (*dbg_leaf_callback)(struct ubifs_info *c,
 typedef int (*dbg_znode_callback)(struct ubifs_info *c,
 				  struct ubifs_znode *znode, void *priv);
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
-
 /*
  * The UBIFS debugfs directory name pattern and maximum name length (3 for "ubi"
  * + 1 for "_" and plus 2x2 for 2 UBI numbers and 1 for the trailing zero byte.
@@ -317,155 +315,4 @@ void dbg_debugfs_exit(void);
 int dbg_debugfs_init_fs(struct ubifs_info *c);
 void dbg_debugfs_exit_fs(struct ubifs_info *c);
 
-#else /* !CONFIG_UBIFS_FS_DEBUG */
-
-/* Use "if (0)" to make compiler check arguments even if debugging is off */
-#define ubifs_assert(expr)  do {                                               \
-	if (0)                                                                 \
-		printk(KERN_CRIT "UBIFS assert failed in %s at %u (pid %d)\n", \
-		       __func__, __LINE__, current->pid);                      \
-} while (0)
-
-#define dbg_err(fmt, ...)   do {                   \
-	if (0)                                     \
-		ubifs_err(fmt, ##__VA_ARGS__);     \
-} while (0)
-
-#define ubifs_dbg_msg(fmt, ...) do {                        \
-	if (0)                                              \
-		printk(KERN_DEBUG fmt "\n", ##__VA_ARGS__); \
-} while (0)
-
-#define ubifs_assert_cmt_locked(c)
-
-#define dbg_msg(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_gen(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_jnl(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_jnlk(key, fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_tnc(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_tnck(key, fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_lp(fmt, ...)        ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_find(fmt, ...)      ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_mnt(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_mntk(key, fmt, ...) ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_io(fmt, ...)        ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_cmt(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_budg(fmt, ...)      ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_log(fmt, ...)       ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_gc(fmt, ...)        ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_scan(fmt, ...)      ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-#define dbg_rcvry(fmt, ...)     ubifs_dbg_msg(fmt, ##__VA_ARGS__)
-
-static inline int ubifs_debugging_init(struct ubifs_info *c)      { return 0; }
-static inline void ubifs_debugging_exit(struct ubifs_info *c)     { return; }
-static inline const char *dbg_ntype(int type)                     { return ""; }
-static inline const char *dbg_cstate(int cmt_state)               { return ""; }
-static inline const char *dbg_jhead(int jhead)                    { return ""; }
-static inline const char *
-dbg_get_key_dump(const struct ubifs_info *c,
-		 const union ubifs_key *key)                      { return ""; }
-static inline const char *
-dbg_snprintf_key(const struct ubifs_info *c,
-		 const union ubifs_key *key, char *buffer,
-		 int len)                                         { return ""; }
-static inline void ubifs_dump_inode(struct ubifs_info *c,
-				    const struct inode *inode)    { return; }
-static inline void ubifs_dump_node(const struct ubifs_info *c,
-				   const void *node)              { return; }
-static inline void
-ubifs_dump_budget_req(const struct ubifs_budget_req *req)         { return; }
-static inline void
-ubifs_dump_lstats(const struct ubifs_lp_stats *lst)               { return; }
-static inline void
-ubifs_dump_budg(struct ubifs_info *c,
-	      const struct ubifs_budg_info *bi)                   { return; }
-static inline void ubifs_dump_lprop(const struct ubifs_info *c,
-				    const struct ubifs_lprops *lp){ return; }
-static inline void ubifs_dump_lprops(struct ubifs_info *c)        { return; }
-static inline void ubifs_dump_lpt_info(struct ubifs_info *c)      { return; }
-static inline void ubifs_dump_leb(const struct ubifs_info *c,
-				  int lnum)                       { return; }
-static inline void
-ubifs_dump_sleb(const struct ubifs_info *c,
-		const struct ubifs_scan_leb *sleb, int offs)      { return; }
-static inline void
-ubifs_dump_znode(const struct ubifs_info *c,
-		 const struct ubifs_znode *znode)                 { return; }
-static inline void ubifs_dump_heap(struct ubifs_info *c,
-				   struct ubifs_lpt_heap *heap,
-				   int cat)                       { return; }
-static inline void ubifs_dump_pnode(struct ubifs_info *c,
-				    struct ubifs_pnode *pnode,
-				    struct ubifs_nnode *parent,
-				    int iip)                      { return; }
-static inline void ubifs_dump_tnc(struct ubifs_info *c)           { return; }
-static inline void ubifs_dump_index(struct ubifs_info *c)         { return; }
-static inline void ubifs_dump_lpt_lebs(const struct ubifs_info *c){ return; }
-
-static inline int dbg_walk_index(struct ubifs_info *c,
-				 dbg_leaf_callback leaf_cb,
-				 dbg_znode_callback znode_cb,
-				 void *priv)                      { return 0; }
-static inline void dbg_save_space_info(struct ubifs_info *c)      { return; }
-static inline int dbg_check_space_info(struct ubifs_info *c)      { return 0; }
-static inline int dbg_check_lprops(struct ubifs_info *c)          { return 0; }
-static inline int
-dbg_old_index_check_init(struct ubifs_info *c,
-			 struct ubifs_zbranch *zroot)             { return 0; }
-static inline int
-dbg_check_old_index(struct ubifs_info *c,
-		    struct ubifs_zbranch *zroot)                  { return 0; }
-static inline int dbg_check_cats(struct ubifs_info *c)            { return 0; }
-static inline int dbg_check_ltab(struct ubifs_info *c)            { return 0; }
-static inline int dbg_chk_lpt_free_spc(struct ubifs_info *c)      { return 0; }
-static inline int dbg_chk_lpt_sz(struct ubifs_info *c,
-				 int action, int len)             { return 0; }
-static inline int
-dbg_check_synced_i_size(const struct ubifs_info *c,
-			struct inode *inode)                      { return 0; }
-static inline int dbg_check_dir(struct ubifs_info *c,
-				const struct inode *dir)          { return 0; }
-static inline int dbg_check_tnc(struct ubifs_info *c, int extra)  { return 0; }
-static inline int dbg_check_idx_size(struct ubifs_info *c,
-				     long long idx_size)          { return 0; }
-static inline int dbg_check_filesystem(struct ubifs_info *c)      { return 0; }
-static inline void dbg_check_heap(struct ubifs_info *c,
-				  struct ubifs_lpt_heap *heap,
-				  int cat, int add_pos)           { return; }
-static inline int dbg_check_lpt_nodes(struct ubifs_info *c,
-	struct ubifs_cnode *cnode, int row, int col)              { return 0; }
-static inline int dbg_check_inode_size(struct ubifs_info *c,
-				       const struct inode *inode,
-				       loff_t size)               { return 0; }
-static inline int
-dbg_check_data_nodes_order(struct ubifs_info *c,
-			   struct list_head *head)                { return 0; }
-static inline int
-dbg_check_nondata_nodes_order(struct ubifs_info *c,
-			      struct list_head *head)             { return 0; }
-
-static inline int dbg_leb_write(struct ubifs_info *c, int lnum,
-				const void *buf, int offset,
-				int len, int dtype)               { return 0; }
-static inline int dbg_leb_change(struct ubifs_info *c, int lnum,
-				 const void *buf, int len,
-				 int dtype)                       { return 0; }
-static inline int dbg_leb_unmap(struct ubifs_info *c, int lnum)   { return 0; }
-static inline int dbg_leb_map(struct ubifs_info *c, int lnum,
-			      int dtype)                          { return 0; }
-
-static inline int dbg_is_chk_gen(const struct ubifs_info *c)      { return 0; }
-static inline int dbg_is_chk_index(const struct ubifs_info *c)    { return 0; }
-static inline int dbg_is_chk_orph(const struct ubifs_info *c)     { return 0; }
-static inline int dbg_is_chk_lprops(const struct ubifs_info *c)   { return 0; }
-static inline int dbg_is_chk_fs(const struct ubifs_info *c)       { return 0; }
-static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)    { return 0; }
-static inline int dbg_is_power_cut(const struct ubifs_info *c)    { return 0; }
-
-static inline int dbg_debugfs_init(void)                          { return 0; }
-static inline void dbg_debugfs_exit(void)                         { return; }
-static inline int dbg_debugfs_init_fs(struct ubifs_info *c)       { return 0; }
-static inline int dbg_debugfs_exit_fs(struct ubifs_info *c)       { return 0; }
-
-#endif /* !CONFIG_UBIFS_FS_DEBUG */
 #endif /* !__UBIFS_DEBUG_H__ */
diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ad6e550..62a2727 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -170,8 +170,6 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 	return inode;
 }
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
-
 static int dbg_check_name(const struct ubifs_info *c,
 			  const struct ubifs_dent_node *dent,
 			  const struct qstr *nm)
@@ -185,12 +183,6 @@ static int dbg_check_name(const struct ubifs_info *c,
 	return 0;
 }
 
-#else
-
-#define dbg_check_name(c, dent, nm) 0
-
-#endif
-
 static struct dentry *ubifs_lookup(struct inode *dir, struct dentry *dentry,
 				   struct nameidata *nd)
 {
diff --git a/fs/ubifs/log.c b/fs/ubifs/log.c
index f9fd068..9967b5a 100644
--- a/fs/ubifs/log.c
+++ b/fs/ubifs/log.c
@@ -29,11 +29,7 @@
 
 #include "ubifs.h"
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
 static int dbg_check_bud_bytes(struct ubifs_info *c);
-#else
-#define dbg_check_bud_bytes(c) 0
-#endif
 
 /**
  * ubifs_search_bud - search bud LEB.
@@ -734,8 +730,6 @@ out_free:
 	return err;
 }
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
-
 /**
  * dbg_check_bud_bytes - make sure bud bytes calculation are all right.
  * @c: UBIFS file-system description object
@@ -767,5 +761,3 @@ static int dbg_check_bud_bytes(struct ubifs_info *c)
 
 	return err;
 }
-
-#endif /* CONFIG_UBIFS_FS_DEBUG */
diff --git a/fs/ubifs/lprops.c b/fs/ubifs/lprops.c
index 0cf7a18..86eb8e5 100644
--- a/fs/ubifs/lprops.c
+++ b/fs/ubifs/lprops.c
@@ -846,7 +846,9 @@ const struct ubifs_lprops *ubifs_fast_find_frdi_idx(struct ubifs_info *c)
 	return lprops;
 }
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
+/*
+ * Everything below is related to debugging.
+ */
 
 /**
  * dbg_check_cats - check category heaps and lists.
@@ -1315,5 +1317,3 @@ int dbg_check_lprops(struct ubifs_info *c)
 out:
 	return err;
 }
-
-#endif /* CONFIG_UBIFS_FS_DEBUG */
diff --git a/fs/ubifs/lpt.c b/fs/ubifs/lpt.c
index b6db389..5d1d97d 100644
--- a/fs/ubifs/lpt.c
+++ b/fs/ubifs/lpt.c
@@ -2080,8 +2080,6 @@ out:
 	return err;
 }
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
-
 /**
  * dbg_chk_pnode - check a pnode.
  * @c: the UBIFS file-system description object
@@ -2274,5 +2272,3 @@ int dbg_check_lpt_nodes(struct ubifs_info *c, struct ubifs_cnode *cnode,
 	}
 	return 0;
 }
-
-#endif /* CONFIG_UBIFS_FS_DEBUG */
diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index 8294d5a..97822db 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -30,11 +30,7 @@
 #include <linux/random.h>
 #include "ubifs.h"
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
 static int dbg_populate_lsave(struct ubifs_info *c);
-#else
-#define dbg_populate_lsave(c) 0
-#endif
 
 /**
  * first_dirty_cnode - find first dirty cnode.
@@ -1497,7 +1493,9 @@ void ubifs_lpt_free(struct ubifs_info *c, int wr_only)
 	kfree(c->lpt_nod_buf);
 }
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
+/*
+ * Everything below is related to debugging.
+ */
 
 /**
  * dbg_is_all_ff - determine if a buffer contains only 0xFF bytes.
@@ -2046,5 +2044,3 @@ static int dbg_populate_lsave(struct ubifs_info *c)
 
 	return 1;
 }
-
-#endif /* CONFIG_UBIFS_FS_DEBUG */
diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 48ac721..97ad042 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -52,11 +52,7 @@
  * than the maximum number of orphans allowed.
  */
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
 static int dbg_check_orphans(struct ubifs_info *c);
-#else
-#define dbg_check_orphans(c) 0
-#endif
 
 /**
  * ubifs_add_orphan - add an orphan.
@@ -725,7 +721,9 @@ int ubifs_mount_orphans(struct ubifs_info *c, int unclean, int read_only)
 	return err;
 }
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
+/*
+ * Everything below is related to debugging.
+ */
 
 struct check_orphan {
 	struct rb_node rb;
@@ -968,5 +966,3 @@ out:
 	kfree(ci.node);
 	return err;
 }
-
-#endif /* CONFIG_UBIFS_FS_DEBUG */
diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index c51f6a4..a880d0c 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -130,7 +130,6 @@ static int create_default_filesystem(struct ubifs_info *c)
 	 * orphan node.
 	 */
 	orph_lebs = UBIFS_MIN_ORPH_LEBS;
-#ifdef CONFIG_UBIFS_FS_DEBUG
 	if (c->leb_cnt - min_leb_cnt > 1)
 		/*
 		 * For debugging purposes it is better to have at least 2
@@ -138,7 +137,6 @@ static int create_default_filesystem(struct ubifs_info *c)
 		 * consolidations and would be stressed more.
 		 */
 		orph_lebs += 1;
-#endif
 
 	main_lebs = c->leb_cnt - UBIFS_SB_LEBS - UBIFS_MST_LEBS - log_lebs;
 	main_lebs -= orph_lebs;
diff --git a/fs/ubifs/tnc.c b/fs/ubifs/tnc.c
index 12c25d9..a50b6bd 100644
--- a/fs/ubifs/tnc.c
+++ b/fs/ubifs/tnc.c
@@ -3275,8 +3275,6 @@ out_unlock:
 	return err;
 }
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
-
 /**
  * dbg_check_inode_size - check if inode size is correct.
  * @c: UBIFS file-system description object
@@ -3343,5 +3341,3 @@ out_unlock:
 	mutex_unlock(&c->tnc_mutex);
 	return err;
 }
-
-#endif /* CONFIG_UBIFS_FS_DEBUG */
diff --git a/fs/ubifs/tnc_commit.c b/fs/ubifs/tnc_commit.c
index e8cf891..ef5df1e 100644
--- a/fs/ubifs/tnc_commit.c
+++ b/fs/ubifs/tnc_commit.c
@@ -61,11 +61,9 @@ static int make_idx_node(struct ubifs_info *c, struct ubifs_idx_node *idx,
 	}
 	ubifs_prepare_node(c, idx, len, 0);
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
 	znode->lnum = lnum;
 	znode->offs = offs;
 	znode->len = len;
-#endif
 
 	err = insert_old_idx_znode(c, znode);
 
@@ -456,11 +454,9 @@ static int layout_in_empty_space(struct ubifs_info *c)
 
 		offs = buf_offs + used;
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
 		znode->lnum = lnum;
 		znode->offs = offs;
 		znode->len = len;
-#endif
 
 		/* Update the parent */
 		zp = znode->parent;
@@ -536,10 +532,8 @@ static int layout_in_empty_space(struct ubifs_info *c)
 		break;
 	}
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
 	c->dbg->new_ihead_lnum = lnum;
 	c->dbg->new_ihead_offs = buf_offs;
-#endif
 
 	return 0;
 }
@@ -881,13 +875,11 @@ static int write_index(struct ubifs_info *c)
 		}
 		offs = buf_offs + used;
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
 		if (lnum != znode->lnum || offs != znode->offs ||
 		    len != znode->len) {
 			ubifs_err("inconsistent znode posn");
 			return -EINVAL;
 		}
-#endif
 
 		/* Grab some stuff from znode while we still can */
 		cnext = znode->cnext;
@@ -982,13 +974,11 @@ static int write_index(struct ubifs_info *c)
 		break;
 	}
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
 	if (lnum != c->dbg->new_ihead_lnum ||
 	    buf_offs != c->dbg->new_ihead_offs) {
 		ubifs_err("inconsistent ihead");
 		return -EINVAL;
 	}
-#endif
 
 	c->ihead_lnum = lnum;
 	c->ihead_offs = buf_offs;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 93d59ac..c2cf509 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -762,6 +762,9 @@ struct ubifs_zbranch {
  * @offs: offset of the corresponding indexing node
  * @len: length  of the corresponding indexing node
  * @zbranch: array of znode branches (@c->fanout elements)
+ *
+ * Note! The @lnum, @offs, and @len fields are not really needed - we have them
+ * only for internal consistency check. They could be removed to save some RAM.
  */
 struct ubifs_znode {
 	struct ubifs_znode *parent;
@@ -772,9 +775,9 @@ struct ubifs_znode {
 	int child_cnt;
 	int iip;
 	int alt;
-#ifdef CONFIG_UBIFS_FS_DEBUG
-	int lnum, offs, len;
-#endif
+	int lnum;
+	int offs;
+	int len;
 	struct ubifs_zbranch zbranch[];
 };
 
@@ -1444,9 +1447,7 @@ struct ubifs_info {
 	struct rb_root size_tree;
 	struct ubifs_mount_opts mount_opts;
 
-#ifdef CONFIG_UBIFS_FS_DEBUG
 	struct ubifs_debug_info *dbg;
-#endif
 };
 
 extern struct list_head ubifs_infos;
-- 
1.7.10
