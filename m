Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2OHV-0007Sj-AZ
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2011 13:39:26 +0000
From: Phil Carmody <ext-phil.2.carmody@nokia.com>
To: dedekind1@gmail.com
Subject: [PATCH 1/1] ubifs: debugfs operations may return both ERRs and NULLs
Date: Wed, 23 Mar 2011 15:35:04 +0200
Message-Id: <1300887304-20932-1-git-send-email-ext-phil.2.carmody@nokia.com>
In-Reply-To: <20110323131614.GC18296@esdhcp04044.research.nokia.com>
References: <20110323131614.GC18296@esdhcp04044.research.nokia.com>
Cc: linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I knew I invented IS_ERR_OR_NULL for something, and this was probably
it. NULL has lost all information about what the error was, and the most
appropriate error code is ENODEV. However, that's the only error code
that the debugfs functions can return. So basically, any error = ENODEV.

Signed-off-by: Phil Carmody <ext-phil.2.carmody@nokia.com>
---
 fs/ubifs/debug.c |   24 ++++++++++--------------
 1 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index dbc093a..7b41b30 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2578,11 +2578,10 @@ static struct dentry *dfs_rootdir;
 int dbg_debugfs_init(void)
 {
 	dfs_rootdir = debugfs_create_dir("ubifs", NULL);
-	if (IS_ERR(dfs_rootdir)) {
-		int err = PTR_ERR(dfs_rootdir);
+	if (IS_ERR_OR_NULL(dfs_rootdir)) {
 		ubifs_err("cannot create \"ubifs\" debugfs directory, "
-			  "error %d\n", err);
-		return err;
+			  "error %d\n", PTR_ERR(dfs_rootdir));
+		return -ENODEV;
 	}
 
 	return 0;
@@ -2645,47 +2644,44 @@ static const struct file_operations dfs_fops = {
  */
 int dbg_debugfs_init_fs(struct ubifs_info *c)
 {
-	int err;
 	const char *fname;
 	struct dentry *dent;
 	struct ubifs_debug_info *d = c->dbg;
 
 	sprintf(d->dfs_dir_name, "ubi%d_%d", c->vi.ubi_num, c->vi.vol_id);
 	d->dfs_dir = debugfs_create_dir(d->dfs_dir_name, dfs_rootdir);
-	if (IS_ERR(d->dfs_dir)) {
-		err = PTR_ERR(d->dfs_dir);
+	if (IS_ERR_OR_NULL(d->dfs_dir)) {
 		ubifs_err("cannot create \"%s\" debugfs directory, error %d\n",
-			  d->dfs_dir_name, err);
+			  d->dfs_dir_name, PTR_ERR(d->dfs_rootdir));
 		goto out;
 	}
 
 	fname = "dump_lprops";
 	dent = debugfs_create_file(fname, S_IWUGO, d->dfs_dir, c, &dfs_fops);
-	if (IS_ERR(dent))
+	if (IS_ERR_OR_NULL(dent))
 		goto out_remove;
 	d->dfs_dump_lprops = dent;
 
 	fname = "dump_budg";
 	dent = debugfs_create_file(fname, S_IWUGO, d->dfs_dir, c, &dfs_fops);
-	if (IS_ERR(dent))
+	if (IS_ERR_OR_NULL(dent))
 		goto out_remove;
 	d->dfs_dump_budg = dent;
 
 	fname = "dump_tnc";
 	dent = debugfs_create_file(fname, S_IWUGO, d->dfs_dir, c, &dfs_fops);
-	if (IS_ERR(dent))
+	if (IS_ERR_OR_NULL(dent))
 		goto out_remove;
 	d->dfs_dump_tnc = dent;
 
 	return 0;
 
 out_remove:
-	err = PTR_ERR(dent);
 	ubifs_err("cannot create \"%s\" debugfs directory, error %d\n",
-		  fname, err);
+		  fname, PTR_ERR(dent));
 	debugfs_remove_recursive(d->dfs_dir);
 out:
-	return err;
+	return -ENODEV;
 }
 
 /**
-- 
1.7.2.rc1.37.gf8c40
