Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PyCoJ-0004cx-LK
	for linux-mtd@lists.infradead.org; Sat, 12 Mar 2011 00:36:00 +0000
From: "Jian Peng" <jipeng@broadcom.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 11 Mar 2011 16:35:29 -0800
Subject: fix warning in fs/ubifs compiled with gcc-4.5
Message-ID: <E18F441196CA634DB8E1F1C56A50A87432421E2F50@IRVEXCHCCR01.corp.ad.broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using gcc-4.5 based toolchain, without enabling CONFIG_UBIFS_FS_DEBUG, ther=
e are quite a few warnings as shown

fs/ubifs/super.c:1499:2: warning: statement with no effect
fs/ubifs/lpt_commit.c:211:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:219:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:233:4: warning: statement with no effect
fs/ubifs/lpt_commit.c:246:5: warning: statement with no effect
fs/ubifs/lpt_commit.c:254:5: warning: statement with no effect
fs/ubifs/lpt_commit.c:267:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:276:4: warning: statement with no effect
fs/ubifs/lpt_commit.c:288:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:296:4: warning: statement with no effect
fs/ubifs/lpt_commit.c:308:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:313:2: warning: statement with no effect
fs/ubifs/lpt_commit.c:395:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:402:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:421:4: warning: statement with no effect
fs/ubifs/lpt_commit.c:436:5: warning: statement with no effect
fs/ubifs/lpt_commit.c:443:5: warning: statement with no effect
fs/ubifs/lpt_commit.c:465:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:479:4: warning: statement with no effect
fs/ubifs/lpt_commit.c:493:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:506:4: warning: statement with no effect
fs/ubifs/lpt_commit.c:520:3: warning: statement with no effect
fs/ubifs/lpt_commit.c:531:2: warning: statement with no effect

This is caused by fs/ubifs/debug.h

#define dbg_chk_lpt_sz(c, action, len)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0

and the others

To fix it, it need to be converted to

static inline int dbg_chk_lpt_sz(struct ubifs_info *c, int action, int len)
{
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 0;
}

To reduce the duplicated codes, I used gcc token concatenation here.

Here is my patch to fix them


--- a/fs/ubifs/debug.h	2011-03-11 16:30:18.163841807 -0800
+++ b/fs/ubifs/debug.h	2011-03-11 16:30:31.553928541 -0800
@@ -425,58 +425,104 @@
 #define DBGKEY(key)  ((char *)(key))
 #define DBGKEY1(key) ((char *)(key))
=20
-#define ubifs_debugging_init(c)                0
-#define ubifs_debugging_exit(c)                ({})
+#define	ARG1(a)			a
+#define	ARG2(a1, a2)		a1, a2
+#define	ARG3(a1, a2, a3)	a1, a2, a3
+#define	ARG4(a1, a2, a3, a4)	a1, a2, a3, a4
+
+#define void_F(name, x)		\
+static inline void name(x)	\
+{				\
+	return;			\
+}
+
+#define int_F(name, x)		\
+static inline int name(x)	\
+{				\
+	return 0;		\
+}
+
+int_F(ubifs_debugging_init, ARG1(struct ubifs_info *c))
+void_F(ubifs_debugging_exit, ARG1(struct ubifs_info *c))
+
+/* Dump functions */
+void_F(dbg_dump_inode, ARG2(const struct ubifs_info *c,
+				const struct inode *inode))
+void_F(dbg_dump_node, ARG2(const struct ubifs_info *c, const void *node))
+void_F(dbg_dump_lpt_node, ARG4(const struct ubifs_info *c, void *node,
+				int lnum,
+				int offs))
+void_F(dbg_dump_budget_req, ARG1(const struct ubifs_budget_req *req))
+void_F(dbg_dump_lstats, ARG1(const struct ubifs_lp_stats *lst))
+void_F(dbg_dump_budg, ARG1(struct ubifs_info *c))
+void_F(dbg_dump_lprop, ARG2(const struct ubifs_info *c,
+				const struct ubifs_lprops *lp))
+void_F(dbg_dump_lprops, ARG1(struct ubifs_info *c))
+void_F(dbg_dump_lpt_info, ARG1(struct ubifs_info *c))
+void_F(dbg_dump_leb, ARG2(const struct ubifs_info *c, int lnum))
+void_F(dbg_dump_znode, ARG2(const struct ubifs_info *c,
+				const struct ubifs_znode *znode))
+void_F(dbg_dump_heap, ARG3(struct ubifs_info *c,
+				struct ubifs_lpt_heap *heap, int cat))
+void_F(dbg_dump_pnode, ARG4(struct ubifs_info *c, struct ubifs_pnode *pnod=
e,
+			    struct ubifs_nnode *parent, int iip))
+void_F(dbg_dump_tnc, ARG1(struct ubifs_info *c))
+void_F(dbg_dump_index, ARG1(struct ubifs_info *c))
+void_F(dbg_dump_lpt_lebs, ARG1(const struct ubifs_info *c))
=20
 #define dbg_ntype(type)                        ""
 #define dbg_cstate(cmt_state)                  ""
 #define dbg_jhead(jhead)                       ""
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
+
+typedef int (*dbg_leaf_callback)(struct ubifs_info *c,
+				struct ubifs_zbranch *zbr, void *priv);
+typedef int (*dbg_znode_callback)(struct ubifs_info *c,
+				struct ubifs_znode *znode, void *priv);
+
+int_F(dbg_walk_index, ARG4(struct ubifs_info *c, dbg_leaf_callback leaf_cb=
,
+				dbg_znode_callback znode_cb, void *priv))
+
+/* Checking functions */
+void_F(dbg_save_space_info, ARG1(struct ubifs_info *c))
+int_F(dbg_check_space_info, ARG1(struct ubifs_info *c))
+int_F(dbg_check_lprops, ARG1(struct ubifs_info *c))
+int_F(dbg_old_index_check_init, ARG2(struct ubifs_info *c,
+					struct ubifs_zbranch *zroot))
+int_F(dbg_check_old_index, ARG2(struct ubifs_info *c,
+					struct ubifs_zbranch *zroot))
+int_F(dbg_check_cats, ARG1(struct ubifs_info *c))
+int_F(dbg_check_ltab, ARG1(struct ubifs_info *c))
+int_F(dbg_chk_lpt_free_spc, ARG1(struct ubifs_info *c))
+int_F(dbg_chk_lpt_sz, ARG3(struct ubifs_info *c, int action, int len))
+int_F(dbg_check_synced_i_size, ARG1(struct inode *inode))
+int_F(dbg_check_dir_size, ARG2(struct ubifs_info *c, const struct inode *d=
ir))
+int_F(dbg_check_tnc, ARG2(struct ubifs_info *c, int extra))
+int_F(dbg_check_idx_size, ARG2(struct ubifs_info *c, long long idx_size))
+int_F(dbg_check_filesystem, ARG1(struct ubifs_info *c))
+void_F(dbg_check_heap, ARG4(struct ubifs_info *c, struct ubifs_lpt_heap *h=
eap,
+				int cat,
+				int add_pos))
+int_F(dbg_check_lpt_nodes, ARG4(struct ubifs_info *c,
+				struct ubifs_cnode *cnode,
+				int row, int col))
+int_F(dbg_check_inode_size, ARG3(struct ubifs_info *c,
+				const struct inode *inode,
+				loff_t size))
+int_F(dbg_check_data_nodes_order, ARG2(struct ubifs_info *c,
+					struct list_head *head))
+int_F(dbg_check_nondata_nodes_order, ARG2(struct ubifs_info *c,
+						struct list_head *head))
+
 #define dbg_force_in_the_gaps_enabled              0
-#define dbg_force_in_the_gaps()                    0
 #define dbg_failure_mode                           0
=20
-#define dbg_debugfs_init()                         0
-#define dbg_debugfs_exit()
-#define dbg_debugfs_init_fs(c)                     0
-#define dbg_debugfs_exit_fs(c)                     0
+int_F(dbg_force_in_the_gaps, ARG1(void))
+
+/* Debugfs-related stuff */
+int_F(dbg_debugfs_init, ARG1(void))
+void_F(dbg_debugfs_exit, ARG1(void))
+int_F(dbg_debugfs_init_fs, ARG1(struct ubifs_info *c))
+void_F(dbg_debugfs_exit_fs, ARG1(struct ubifs_info *c))
=20
 #endif /* !CONFIG_UBIFS_FS_DEBUG */
 #endif /* !__UBIFS_DEBUG_H__ */
