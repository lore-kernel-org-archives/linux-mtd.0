Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5YgX-0002O4-0h
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 07:22:22 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p317MH9C026126
	for <linux-mtd@lists.infradead.org>; Fri, 1 Apr 2011 10:22:17 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Phil Carmody <ext-phil.2.carmody@nokia.com>,
	MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] UBIFS: unify error path dbg_debugfs_init_fs
Date: Fri,  1 Apr 2011 10:25:29 +0300
Message-Id: <1301642730-9582-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1301642730-9582-1-git-send-email-dedekind1@gmail.com>
References: <1301642730-9582-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

This is just a small clean-up patch which simlifies and unifies the
error path in the dbg_debugfs_init_fs(). We have common error path
for all failure cases in this function except of the very first
case. And this patch makes the first failure case use the same
error path as the other cases by using the 'fname' and 'dent'
variables.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   14 ++++++--------
 1 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 68cc992..4abaf72 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2807,13 +2807,11 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 	struct ubifs_debug_info *d = c->dbg;
 
 	sprintf(d->dfs_dir_name, "ubi%d_%d", c->vi.ubi_num, c->vi.vol_id);
-	d->dfs_dir = debugfs_create_dir(d->dfs_dir_name, dfs_rootdir);
-	if (IS_ERR(d->dfs_dir)) {
-		err = PTR_ERR(d->dfs_dir);
-		ubifs_err("cannot create \"%s\" debugfs directory, error %d\n",
-			  d->dfs_dir_name, err);
+	fname = d->dfs_dir_name;
+	dent = debugfs_create_dir(fname, dfs_rootdir);
+	if (IS_ERR(dent))
 		goto out;
-	}
+	d->dfs_dir = dent;
 
 	fname = "dump_lprops";
 	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
@@ -2836,11 +2834,11 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 	return 0;
 
 out_remove:
+	debugfs_remove_recursive(d->dfs_dir);
+out:
 	err = PTR_ERR(dent);
 	ubifs_err("cannot create \"%s\" debugfs directory, error %d\n",
 		  fname, err);
-	debugfs_remove_recursive(d->dfs_dir);
-out:
 	return err;
 }
 
-- 
1.7.2.3
