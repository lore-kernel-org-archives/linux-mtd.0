Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SglQ9-00083L-TX
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 23:31:46 +0000
Received: by dadm1 with SMTP id m1so7946175dad.36
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jun 2012 16:31:44 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/2] UBI: correct usage of IS_ENABLED()
Date: Mon, 18 Jun 2012 16:31:23 -0700
Message-Id: <1340062283-11421-3-git-send-email-computersforpeace@gmail.com>
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

 drivers/mtd/ubi/debug.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 09d4f8d..7c13803 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -264,7 +264,7 @@ static struct dentry *dfs_rootdir;
  */
 int ubi_debugfs_init(void)
 {
-	if (!IS_ENABLED(DEBUG_FS))
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
 
 	dfs_rootdir = debugfs_create_dir("ubi", NULL);
@@ -284,7 +284,7 @@ int ubi_debugfs_init(void)
  */
 void ubi_debugfs_exit(void)
 {
-	if (IS_ENABLED(DEBUG_FS))
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		debugfs_remove(dfs_rootdir);
 }
 
@@ -407,7 +407,7 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 	struct dentry *dent;
 	struct ubi_debug_info *d = ubi->dbg;
 
-	if (!IS_ENABLED(DEBUG_FS))
+	if (!IS_ENABLED(CONFIG_DEBUG_FS))
 		return 0;
 
 	n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN + 1, UBI_DFS_DIR_NAME,
@@ -477,6 +477,6 @@ out:
  */
 void ubi_debugfs_exit_dev(struct ubi_device *ubi)
 {
-	if (IS_ENABLED(DEBUG_FS))
+	if (IS_ENABLED(CONFIG_DEBUG_FS))
 		debugfs_remove_recursive(ubi->dbg->dfs_dir);
 }
-- 
1.7.0.4
