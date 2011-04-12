Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9lrj-0005Vc-4E
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2011 22:15:20 +0000
From: maksim.rayskiy@gmail.com
To: linux-mtd@lists.infradead.org, dedekind1@gmail.com, vapier.adi@gmail.com
Subject: [PATCH v2] Fix gcc-4.5.2 "statement with no effect" warnings in UBIFS
Date: Tue, 12 Apr 2011 15:14:56 -0700
Message-ID: <1302646496-32261-1-git-send-email-maksim.rayskiy@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Maksim Rayskiy <maksim.rayskiy@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Maksim Rayskiy <maksim.rayskiy@gmail.com>

When compiling UBIFS with CONFIG_UBIFS_FS_DEBUG not set,
gcc-4.5.2 generates a slew of "warning: statement with no effect"
on references to non-void functions defined as 0.
To avoid these warnings, replace #defines with dummy inline functions.

Signed-off-by: Maksim Rayskiy <maksim.rayskiy@gmail.com>
---
 fs/ubifs/debug.h |  137 +++++++++++++++++++++++++++++++----------------------
 1 files changed, 80 insertions(+), 57 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 919f0de..4f6520e 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -23,6 +23,12 @@
 #ifndef __UBIFS_DEBUG_H__
 #define __UBIFS_DEBUG_H__
 
+/* Checking helper functions */
+typedef int (*dbg_leaf_callback)(struct ubifs_info *c,
+				 struct ubifs_zbranch *zbr, void *priv);
+typedef int (*dbg_znode_callback)(struct ubifs_info *c,
+				  struct ubifs_znode *znode, void *priv);
+
 #ifdef CONFIG_UBIFS_FS_DEBUG
 
 /**
@@ -270,11 +276,6 @@ void dbg_dump_tnc(struct ubifs_info *c);
 void dbg_dump_index(struct ubifs_info *c);
 void dbg_dump_lpt_lebs(const struct ubifs_info *c);
 
-/* Checking helper functions */
-typedef int (*dbg_leaf_callback)(struct ubifs_info *c,
-				 struct ubifs_zbranch *zbr, void *priv);
-typedef int (*dbg_znode_callback)(struct ubifs_info *c,
-				  struct ubifs_znode *znode, void *priv);
 int dbg_walk_index(struct ubifs_info *c, dbg_leaf_callback leaf_cb,
 		   dbg_znode_callback znode_cb, void *priv);
 
@@ -401,58 +402,80 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 #define DBGKEY(key)  ((char *)(key))
 #define DBGKEY1(key) ((char *)(key))
 
-#define ubifs_debugging_init(c)                0
-#define ubifs_debugging_exit(c)                ({})
-
-#define dbg_ntype(type)                        ""
-#define dbg_cstate(cmt_state)                  ""
-#define dbg_jhead(jhead)                       ""
-#define dbg_get_key_dump(c, key)               ({})
-#define dbg_dump_inode(c, inode)               ({})
-#define dbg_dump_node(c, node)                 ({})
-#define dbg_dump_lpt_node(c, node, lnum, offs) ({})
-#define dbg_dump_budget_req(req)               ({})
-#define dbg_dump_lstats(lst)                   ({})
-#define dbg_dump_budg(c)                       ({})
-#define dbg_dump_lprop(c, lp)                  ({})
-#define dbg_dump_lprops(c)                     ({})
-#define dbg_dump_lpt_info(c)                   ({})
-#define dbg_dump_leb(c, lnum)                  ({})
-#define dbg_dump_znode(c, znode)               ({})
-#define dbg_dump_heap(c, heap, cat)            ({})
-#define dbg_dump_pnode(c, pnode, parent, iip)  ({})
-#define dbg_dump_tnc(c)                        ({})
-#define dbg_dump_index(c)                      ({})
-#define dbg_dump_lpt_lebs(c)                   ({})
-
-#define dbg_walk_index(c, leaf_cb, znode_cb, priv) 0
-#define dbg_old_index_check_init(c, zroot)         0
-#define dbg_save_space_info(c)                     ({})
-#define dbg_check_space_info(c)                    0
-#define dbg_check_old_index(c, zroot)              0
-#define dbg_check_cats(c)                          0
-#define dbg_check_ltab(c)                          0
-#define dbg_chk_lpt_free_spc(c)                    0
-#define dbg_chk_lpt_sz(c, action, len)             0
-#define dbg_check_synced_i_size(inode)             0
-#define dbg_check_dir_size(c, dir)                 0
-#define dbg_check_tnc(c, x)                        0
-#define dbg_check_idx_size(c, idx_size)            0
-#define dbg_check_filesystem(c)                    0
-#define dbg_check_heap(c, heap, cat, add_pos)      ({})
-#define dbg_check_lprops(c)                        0
-#define dbg_check_lpt_nodes(c, cnode, row, col)    0
-#define dbg_check_inode_size(c, inode, size)       0
-#define dbg_check_data_nodes_order(c, head)        0
-#define dbg_check_nondata_nodes_order(c, head)     0
-#define dbg_force_in_the_gaps_enabled              0
-#define dbg_force_in_the_gaps()                    0
-#define dbg_failure_mode                           0
-
-#define dbg_debugfs_init()                         0
-#define dbg_debugfs_exit()
-#define dbg_debugfs_init_fs(c)                     0
-#define dbg_debugfs_exit_fs(c)                     0
+static inline int ubifs_debugging_init(struct ubifs_info *c)	{ return 0; }
+static inline void ubifs_debugging_exit(struct ubifs_info *c)	{}
+static inline const char *dbg_ntype(int type)			{ return ""; }
+static inline const char *dbg_cstate(int cmt_state)		{ return ""; }
+static inline const char *dbg_jhead(int jhead)			{ return ""; }
+static inline const char *dbg_get_key_dump(const struct ubifs_info *c,
+			     const union ubifs_key *key)	{ return ""; }
+static inline void dbg_dump_inode(const struct ubifs_info *c,
+	const struct inode *inode) {}
+static inline void dbg_dump_node(const struct ubifs_info *c,
+	const void *node)					{}
+static inline void dbg_dump_lpt_node(const struct ubifs_info *c,
+	void *node, int lnum, int offs)				{}
+static inline void dbg_dump_budget_req(const struct ubifs_budget_req *req) {}
+static inline void dbg_dump_lstats(const struct ubifs_lp_stats *lst) {}
+static inline void dbg_dump_budg(struct ubifs_info *c)		{}
+static inline void dbg_dump_lprop(const struct ubifs_info *c,
+	const struct ubifs_lprops *lp)				{}
+static inline void dbg_dump_lprops(struct ubifs_info *c)	{}
+static inline void dbg_dump_lpt_info(struct ubifs_info *c)	{}
+static inline void dbg_dump_leb(const struct ubifs_info *c, int lnum) {}
+static inline void dbg_dump_znode(const struct ubifs_info *c,
+		    const struct ubifs_znode *znode)		{}
+static inline void dbg_dump_heap(struct ubifs_info *c,
+	struct ubifs_lpt_heap *heap, int cat)			{}
+static inline void dbg_dump_pnode(struct ubifs_info *c,
+	struct ubifs_pnode *pnode, struct ubifs_nnode *parent, int iip) {}
+static inline void dbg_dump_tnc(struct ubifs_info *c)		{}
+static inline void dbg_dump_index(struct ubifs_info *c)		{}
+static inline void dbg_dump_lpt_lebs(const struct ubifs_info *c) {}
+
+static inline int dbg_walk_index(struct ubifs_info *c,
+	dbg_leaf_callback leaf_cb, dbg_znode_callback znode_cb, void *priv)
+								{ return 0; }
+
+/* Checking functions */
+static inline void dbg_save_space_info(struct ubifs_info *c)	{}
+static inline int dbg_check_space_info(struct ubifs_info *c)	{ return 0; }
+static inline int dbg_check_lprops(struct ubifs_info *c)	{ return 0; }
+static inline int dbg_old_index_check_init(struct ubifs_info *c,
+	struct ubifs_zbranch *zroot)				{ return 0; }
+static inline int dbg_check_old_index(struct ubifs_info *c,
+	struct ubifs_zbranch *zroot)				{ return 0; }
+static inline int dbg_check_cats(struct ubifs_info *c)		{ return 0; }
+static inline int dbg_check_ltab(struct ubifs_info *c)		{ return 0; }
+static inline int dbg_chk_lpt_free_spc(struct ubifs_info *c)	{ return 0; }
+static inline int dbg_chk_lpt_sz(struct ubifs_info *c,
+	int action, int len)					{ return 0; }
+static inline int dbg_check_synced_i_size(struct inode *inode)	{ return 0; }
+static inline int dbg_check_dir_size(struct ubifs_info *c,
+	const struct inode *dir)				{ return 0; }
+static inline int dbg_check_tnc(struct ubifs_info *c, int extra) { return 0; }
+static inline int dbg_check_idx_size(struct ubifs_info *c,
+	long long idx_size)					{ return 0; }
+static inline int dbg_check_filesystem(struct ubifs_info *c)	{ return 0; }
+static inline void dbg_check_heap(struct ubifs_info *c,
+	struct ubifs_lpt_heap *heap, int cat, int add_pos)	{}
+static inline int dbg_check_lpt_nodes(struct ubifs_info *c,
+	struct ubifs_cnode *cnode, int row, int col)		{ return 0; }
+static inline int dbg_check_inode_size(struct ubifs_info *c,
+	const struct inode *inode, loff_t size)			{ return 0; }
+static inline int dbg_check_data_nodes_order(struct ubifs_info *c,
+	struct list_head *head)					{ return 0; }
+static inline int dbg_check_nondata_nodes_order(struct ubifs_info *c,
+	struct list_head *head)					{ return 0; }
+
+#define dbg_force_in_the_gaps_enabled				0
+static inline int dbg_force_in_the_gaps(void)			{ return 0; }
+#define dbg_failure_mode					0
+
+static inline int dbg_debugfs_init(void)			{ return 0; }
+static inline void dbg_debugfs_exit(void)			{}
+static inline int dbg_debugfs_init_fs(struct ubifs_info *c)	{ return 0; }
+static inline int dbg_debugfs_exit_fs(struct ubifs_info *c)	{ return 0; }
 
 #endif /* !CONFIG_UBIFS_FS_DEBUG */
 #endif /* !__UBIFS_DEBUG_H__ */
-- 
1.7.1
