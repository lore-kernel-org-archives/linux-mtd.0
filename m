Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9vrL-0000Ri-PB
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 08:55:37 +0000
Received: by fxm14 with SMTP id 14so394168fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Apr 2011 01:55:34 -0700 (PDT)
Subject: Re: [PATCH v2] Fix gcc-4.5.2 "statement with no effect" warnings
	in UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maksim Rayskiy <maksim.rayskiy@gmail.com>
In-Reply-To: <BANLkTinwRXGTSP+zhzY2jMiX_ymwabkc3w@mail.gmail.com>
References: <1302646496-32261-1-git-send-email-maksim.rayskiy@gmail.com>
	<1302683190.2768.11.camel@localhost>
	<1302683341.2768.12.camel@localhost>
	<BANLkTinwRXGTSP+zhzY2jMiX_ymwabkc3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 13 Apr 2011 11:52:43 +0300
Message-ID: <1302684763.2768.17.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-04-13 at 01:49 -0700, Maksim Rayskiy wrote:
> Artem,
> 
> >> This patch does not compile and does not apply to the current tree. I'll
> >> need to do a lot of massage as well because I dislike the "tabs as
> >> dynamic spaces" style which you use, and the whole UBIFS code does not
> >> use this approach, so I would like to maintain consistency.
> >
> > Sorry, it does compile with older UBIFS, but not with the current one.
> >
> >
> 
> I checked it against Linus tree. What tree you want me to use?

I was talking about the ubifs-2.6.git tree.

> I am not clear what you want me to do with formatting.

I was talking about tabs as "dynamic" spaces, like:

static inline int func(int a)\t\t{ return 0; }

IMHO they are ugly, but this is personal opinion, I know many people use
them. But since whole UBIFS code-base does not use them, I do not want
to add them. Anyway, I've tweaked your patch a bit and pushed to the
ubifs-2.6.git tree. Here is it:

From: Maksim Rayskiy <maksim.rayskiy@gmail.com>
Subject: [PATCH] UBIFS: fix compilation warnings when compiling with gcc 4.5

When compiling UBIFS with CONFIG_UBIFS_FS_DEBUG not set,
gcc-4.5.2 generates a slew of "warning: statement with no effect"
on references to non-void functions defined as 0.
To avoid these warnings, replace #defines with dummy inline functions.

Artem: massage the patch a bit, also remove the duplicate
       'dbg_check_lprops()' prototype.

Signed-off-by: Maksim Rayskiy <maksim.rayskiy@gmail.com>
Acked-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.h |  152 +++++++++++++++++++++++++++++++++---------------------
 1 files changed, 94 insertions(+), 58 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 919f0de..e6493ca 100644
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
 
@@ -295,7 +296,6 @@ int dbg_check_idx_size(struct ubifs_info *c, long long idx_size);
 int dbg_check_filesystem(struct ubifs_info *c);
 void dbg_check_heap(struct ubifs_info *c, struct ubifs_lpt_heap *heap, int cat,
 		    int add_pos);
-int dbg_check_lprops(struct ubifs_info *c);
 int dbg_check_lpt_nodes(struct ubifs_info *c, struct ubifs_cnode *cnode,
 			int row, int col);
 int dbg_check_inode_size(struct ubifs_info *c, const struct inode *inode,
@@ -401,58 +401,94 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
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
+static inline int ubifs_debugging_init(struct ubifs_info *c)      { return 0; }
+static inline void ubifs_debugging_exit(struct ubifs_info *c)     { return; }
+static inline const char *dbg_ntype(int type)                     { return ""; }
+static inline const char *dbg_cstate(int cmt_state)               { return ""; }
+static inline const char *dbg_jhead(int jhead)                    { return ""; }
+static inline const char *
+dbg_get_key_dump(const struct ubifs_info *c,
+		 const union ubifs_key *key)                      { return ""; }
+static inline void dbg_dump_inode(const struct ubifs_info *c,
+				  const struct inode *inode)      { return; }
+static inline void dbg_dump_node(const struct ubifs_info *c,
+				 const void *node)                { return; }
+static inline void dbg_dump_lpt_node(const struct ubifs_info *c,
+				     void *node, int lnum,
+				     int offs)                    { return; }
+static inline void
+dbg_dump_budget_req(const struct ubifs_budget_req *req)           { return; }
+static inline void
+dbg_dump_lstats(const struct ubifs_lp_stats *lst)                 { return; }
+static inline void dbg_dump_budg(struct ubifs_info *c)            { return; }
+static inline void dbg_dump_lprop(const struct ubifs_info *c,
+				  const struct ubifs_lprops *lp)  { return; }
+static inline void dbg_dump_lprops(struct ubifs_info *c)          { return; }
+static inline void dbg_dump_lpt_info(struct ubifs_info *c)        { return; }
+static inline void dbg_dump_leb(const struct ubifs_info *c,
+				int lnum)                         { return; }
+static inline void
+dbg_dump_znode(const struct ubifs_info *c,
+	       const struct ubifs_znode *znode)                   { return; }
+static inline void dbg_dump_heap(struct ubifs_info *c,
+				 struct ubifs_lpt_heap *heap,
+				 int cat)                         { return; }
+static inline void dbg_dump_pnode(struct ubifs_info *c,
+				  struct ubifs_pnode *pnode,
+				  struct ubifs_nnode *parent,
+				  int iip)                        { return; }
+static inline void dbg_dump_tnc(struct ubifs_info *c)             { return; }
+static inline void dbg_dump_index(struct ubifs_info *c)           { return; }
+static inline void dbg_dump_lpt_lebs(const struct ubifs_info *c)  { return; }
+
+static inline int dbg_walk_index(struct ubifs_info *c,
+				 dbg_leaf_callback leaf_cb,
+				 dbg_znode_callback znode_cb,
+				 void *priv)                      { return 0; }
+static inline void dbg_save_space_info(struct ubifs_info *c)      { return; }
+static inline int dbg_check_space_info(struct ubifs_info *c)      { return 0; }
+static inline int dbg_check_lprops(struct ubifs_info *c)          { return 0; }
+static inline int
+dbg_old_index_check_init(struct ubifs_info *c,
+			 struct ubifs_zbranch *zroot)             { return 0; }
+static inline int
+dbg_check_old_index(struct ubifs_info *c,
+		    struct ubifs_zbranch *zroot)                  { return 0; }
+static inline int dbg_check_cats(struct ubifs_info *c)            { return 0; }
+static inline int dbg_check_ltab(struct ubifs_info *c)            { return 0; }
+static inline int dbg_chk_lpt_free_spc(struct ubifs_info *c)      { return 0; }
+static inline int dbg_chk_lpt_sz(struct ubifs_info *c,
+				 int action, int len)             { return 0; }
+static inline int dbg_check_synced_i_size(struct inode *inode)    { return 0; }
+static inline int dbg_check_dir_size(struct ubifs_info *c,
+				     const struct inode *dir)     { return 0; }
+static inline int dbg_check_tnc(struct ubifs_info *c, int extra)  { return 0; }
+static inline int dbg_check_idx_size(struct ubifs_info *c,
+				     long long idx_size)          { return 0; }
+static inline int dbg_check_filesystem(struct ubifs_info *c)      { return 0; }
+static inline void dbg_check_heap(struct ubifs_info *c,
+				  struct ubifs_lpt_heap *heap,
+				  int cat, int add_pos)           { return; }
+static inline int dbg_check_lpt_nodes(struct ubifs_info *c,
+	struct ubifs_cnode *cnode, int row, int col)              { return 0; }
+static inline int dbg_check_inode_size(struct ubifs_info *c,
+				       const struct inode *inode,
+				       loff_t size)               { return 0; }
+static inline int
+dbg_check_data_nodes_order(struct ubifs_info *c,
+			   struct list_head *head)                { return 0; }
+static inline int
+dbg_check_nondata_nodes_order(struct ubifs_info *c,
+			      struct list_head *head)             { return 0; }
+
+static inline int dbg_force_in_the_gaps(void)                     { return 0; }
+#define dbg_force_in_the_gaps_enabled 0
+#define dbg_failure_mode              0
+
+static inline int dbg_debugfs_init(void)                          { return 0; }
+static inline void dbg_debugfs_exit(void)                         { return; }
+static inline int dbg_debugfs_init_fs(struct ubifs_info *c)       { return 0; }
+static inline int dbg_debugfs_exit_fs(struct ubifs_info *c)       { return 0; }
 
 #endif /* !CONFIG_UBIFS_FS_DEBUG */
 #endif /* !__UBIFS_DEBUG_H__ */
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
