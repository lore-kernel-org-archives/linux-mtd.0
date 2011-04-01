Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5YgX-0002O5-0l
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 07:22:25 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p317MI1b026135
	for <linux-mtd@lists.infradead.org>; Fri, 1 Apr 2011 10:22:18 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Phil Carmody <ext-phil.2.carmody@nokia.com>,
	MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBIFS: fix error path in dbg_debugfs_init_fs
Date: Fri,  1 Apr 2011 10:25:30 +0300
Message-Id: <1301642730-9582-3-git-send-email-dedekind1@gmail.com>
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

The debug interface is substandard and on error returns either
NULL or an error code packed in the pointer. So using "IS_ERR"
for the pointers returned by debugfs function is incorrect.
Instead, we should use IS_ERR_OR_NULL.

This path is an improved vestion of the original patch from
Phil Carmody.

Reported-by: Phil Carmody <ext-phil.2.carmody@nokia.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/debug.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 4abaf72..c04efa8 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2809,25 +2809,25 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 	sprintf(d->dfs_dir_name, "ubi%d_%d", c->vi.ubi_num, c->vi.vol_id);
 	fname = d->dfs_dir_name;
 	dent = debugfs_create_dir(fname, dfs_rootdir);
-	if (IS_ERR(dent))
+	if (IS_ERR_OR_NULL(dent))
 		goto out;
 	d->dfs_dir = dent;
 
 	fname = "dump_lprops";
 	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
-	if (IS_ERR(dent))
+	if (IS_ERR_OR_NULL(dent))
 		goto out_remove;
 	d->dfs_dump_lprops = dent;
 
 	fname = "dump_budg";
 	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
-	if (IS_ERR(dent))
+	if (IS_ERR_OR_NULL(dent))
 		goto out_remove;
 	d->dfs_dump_budg = dent;
 
 	fname = "dump_tnc";
 	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
-	if (IS_ERR(dent))
+	if (IS_ERR_OR_NULL(dent))
 		goto out_remove;
 	d->dfs_dump_tnc = dent;
 
@@ -2836,7 +2836,7 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 out_remove:
 	debugfs_remove_recursive(d->dfs_dir);
 out:
-	err = PTR_ERR(dent);
+	err = dent ? PTR_ERR(dent) : -ENODEV;
 	ubifs_err("cannot create \"%s\" debugfs directory, error %d\n",
 		  fname, err);
 	return err;
-- 
1.7.2.3
