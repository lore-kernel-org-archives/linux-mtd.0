Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScFxt-0002eZ-7R
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 13:07:57 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Parsons <lost.distance@yahoo.com>
Subject: [PATCH 1/2] UBI: fix debugfs-less systems support
Date: Wed,  6 Jun 2012 16:09:08 +0300
Message-Id: <1338988149-5183-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1338943789.75555.YahooMailClassic@web29010.mail.ird.yahoo.com>
References: <1338943789.75555.YahooMailClassic@web29010.mail.ird.yahoo.com>
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

Commit "aa44d1d UBI: remove Kconfig debugging option" broke UBI and it
refuses to initialize if debugfs (CONFIG_DEBUG_FS) is disabled. I incorrectly
assumed that debugfs files creation function will return success if debugfs
is disabled, but they actually return -ENODEV. This patch fixes the issue.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/debug.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 9f957c2..09d4f8d 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -264,6 +264,9 @@ static struct dentry *dfs_rootdir;
  */
 int ubi_debugfs_init(void)
 {
+	if (!IS_ENABLED(DEBUG_FS))
+		return 0;
+
 	dfs_rootdir = debugfs_create_dir("ubi", NULL);
 	if (IS_ERR_OR_NULL(dfs_rootdir)) {
 		int err = dfs_rootdir ? -ENODEV : PTR_ERR(dfs_rootdir);
@@ -281,7 +284,8 @@ int ubi_debugfs_init(void)
  */
 void ubi_debugfs_exit(void)
 {
-	debugfs_remove(dfs_rootdir);
+	if (IS_ENABLED(DEBUG_FS))
+		debugfs_remove(dfs_rootdir);
 }
 
 /* Read an UBI debugfs file */
@@ -403,6 +407,9 @@ int ubi_debugfs_init_dev(struct ubi_device *ubi)
 	struct dentry *dent;
 	struct ubi_debug_info *d = ubi->dbg;
 
+	if (!IS_ENABLED(DEBUG_FS))
+		return 0;
+
 	n = snprintf(d->dfs_dir_name, UBI_DFS_DIR_LEN + 1, UBI_DFS_DIR_NAME,
 		     ubi->ubi_num);
 	if (n == UBI_DFS_DIR_LEN) {
@@ -470,5 +477,6 @@ out:
  */
 void ubi_debugfs_exit_dev(struct ubi_device *ubi)
 {
-	debugfs_remove_recursive(ubi->dbg->dfs_dir);
+	if (IS_ENABLED(DEBUG_FS))
+		debugfs_remove_recursive(ubi->dbg->dfs_dir);
 }
-- 
1.7.7.6
