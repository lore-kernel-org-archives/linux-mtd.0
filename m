Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScFxu-0002ea-35
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 13:07:58 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH 2/2] UBIFS: fix debugfs-less systems support
Date: Wed,  6 Jun 2012 16:09:09 +0300
Message-Id: <1338988149-5183-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1338988149-5183-1-git-send-email-dedekind1@gmail.com>
References: <1338943789.75555.YahooMailClassic@web29010.mail.ird.yahoo.com>
 <1338988149-5183-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Commit "f70b7e5 UBIFS: remove Kconfig debugging option" broke UBIFS and it
refuses to initialize if debugfs (CONFIG_DEBUG_FS) is disabled. I incorrectly
assumed that debugfs files creation function will return success if debugfs
is disabled, but they actually return -ENODEV. This patch fixes the issue.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/debug.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 685a837..84a7e6f 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2918,6 +2918,9 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 	struct dentry *dent;
 	struct ubifs_debug_info *d = c->dbg;
 
+	if (!IS_ENABLED(DEBUG_FS))
+		return 0;
+
 	n = snprintf(d->dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DIR_NAME,
 		     c->vi.ubi_num, c->vi.vol_id);
 	if (n == UBIFS_DFS_DIR_LEN) {
@@ -3010,7 +3013,8 @@ out:
  */
 void dbg_debugfs_exit_fs(struct ubifs_info *c)
 {
-	debugfs_remove_recursive(c->dbg->dfs_dir);
+	if (IS_ENABLED(DEBUG_FS))
+		debugfs_remove_recursive(c->dbg->dfs_dir);
 }
 
 struct ubifs_global_debug_info ubifs_dbg;
@@ -3095,6 +3099,9 @@ int dbg_debugfs_init(void)
 	const char *fname;
 	struct dentry *dent;
 
+	if (!IS_ENABLED(DEBUG_FS))
+		return 0;
+
 	fname = "ubifs";
 	dent = debugfs_create_dir(fname, NULL);
 	if (IS_ERR_OR_NULL(dent))
@@ -3159,7 +3166,8 @@ out:
  */
 void dbg_debugfs_exit(void)
 {
-	debugfs_remove_recursive(dfs_rootdir);
+	if (IS_ENABLED(DEBUG_FS))
+		debugfs_remove_recursive(dfs_rootdir);
 }
 
 /**
-- 
1.7.7.6
