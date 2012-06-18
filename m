Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SglQ8-00083K-NR
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 23:31:45 +0000
Received: by pbbrq13 with SMTP id rq13so9410685pbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2012 16:31:43 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 1/2] UBIFS: correct usage of IS_ENABLED()
Date: Mon, 18 Jun 2012 16:31:22 -0700
Message-Id: <1340062283-11421-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1340062283-11421-1-git-send-email-computersforpeace@gmail.com>
References: <1340062283-11421-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

IS_ENABLED() arguments should be used with the CONFIG_* prefix.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
based on ubifs.git

 fs/ubifs/debug.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 84a7e6f..92df3b0 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2918,7 +2918,7 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 	struct dentry *dent;
 	struct ubifs_debug_info *d = c->dbg;
 
-	if (!IS_ENABLED(DEBUG_FS))
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
 
 	n = snprintf(d->dfs_dir_name, UBIFS_DFS_DIR_LEN + 1, UBIFS_DFS_DIR_NAME,
@@ -3013,7 +3013,7 @@ out:
  */
 void dbg_debugfs_exit_fs(struct ubifs_info *c)
 {
-	if (IS_ENABLED(DEBUG_FS))
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		debugfs_remove_recursive(c->dbg->dfs_dir);
 }
 
@@ -3099,7 +3099,7 @@ int dbg_debugfs_init(void)
 	const char *fname;
 	struct dentry *dent;
 
-	if (!IS_ENABLED(DEBUG_FS))
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
 
 	fname = "ubifs";
@@ -3166,7 +3166,7 @@ out:
  */
 void dbg_debugfs_exit(void)
 {
-	if (IS_ENABLED(DEBUG_FS))
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		debugfs_remove_recursive(dfs_rootdir);
 }
 
-- 
1.7.0.4
