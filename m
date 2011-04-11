Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9P26-00027V-Lx
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2011 21:52:31 +0000
From: maksim.rayskiy@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Fix gcc-4.5.2 "statement with no effect" warnings in
 UBIFS
Date: Mon, 11 Apr 2011 14:50:59 -0700
Message-ID: <1302558659-29472-1-git-send-email-maksim.rayskiy@gmail.com>
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
To avoid these warnings, change appropriate definitions from
 #define dbg_xxx(a)	0
to
 #define dbg_xxx(a)	({0; })

Signed-off-by: Maksim Rayskiy <maksim.rayskiy@gmail.com>
---
 fs/ubifs/debug.h |   50 +++++++++++++++++++++++++-------------------------
 1 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 919f0de..e30a629 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -425,34 +425,34 @@ void dbg_debugfs_exit_fs(struct ubifs_info *c);
 #define dbg_dump_index(c)                      ({})
 #define dbg_dump_lpt_lebs(c)                   ({})
 
-#define dbg_walk_index(c, leaf_cb, znode_cb, priv) 0
-#define dbg_old_index_check_init(c, zroot)         0
+#define dbg_walk_index(c, leaf_cb, znode_cb, priv) ({0; })
+#define dbg_old_index_check_init(c, zroot)         ({0; })
 #define dbg_save_space_info(c)                     ({})
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
+#define dbg_check_space_info(c)                    ({0; })
+#define dbg_check_old_index(c, zroot)              ({0; })
+#define dbg_check_cats(c)                          ({0; })
+#define dbg_check_ltab(c)                          ({0; })
+#define dbg_chk_lpt_free_spc(c)                    ({0; })
+#define dbg_chk_lpt_sz(c, action, len)             ({0; })
+#define dbg_check_synced_i_size(inode)             ({0; })
+#define dbg_check_dir_size(c, dir)                 ({0; })
+#define dbg_check_tnc(c, x)                        ({0; })
+#define dbg_check_idx_size(c, idx_size)            ({0; })
+#define dbg_check_filesystem(c)                    ({0; })
 #define dbg_check_heap(c, heap, cat, add_pos)      ({})
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
+#define dbg_check_lprops(c)                        ({0; })
+#define dbg_check_lpt_nodes(c, cnode, row, col)    ({0; })
+#define dbg_check_inode_size(c, inode, size)       ({0; })
+#define dbg_check_data_nodes_order(c, head)        ({0; })
+#define dbg_check_nondata_nodes_order(c, head)     ({0; })
+#define dbg_force_in_the_gaps_enabled              ({0; })
+#define dbg_force_in_the_gaps()                    ({0; })
+#define dbg_failure_mode                           ({0; })
+
+#define dbg_debugfs_init()                         ({0; })
 #define dbg_debugfs_exit()
-#define dbg_debugfs_init_fs(c)                     0
-#define dbg_debugfs_exit_fs(c)                     0
+#define dbg_debugfs_init_fs(c)                     ({0; })
+#define dbg_debugfs_exit_fs(c)                     ({0; })
 
 #endif /* !CONFIG_UBIFS_FS_DEBUG */
 #endif /* !__UBIFS_DEBUG_H__ */
-- 
1.7.1
