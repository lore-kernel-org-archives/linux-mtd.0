Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PlKi7-00016y-PO
	for linux-mtd@lists.infradead.org; Fri, 04 Feb 2011 12:24:24 +0000
Received: by fxm19 with SMTP id 19so2379311fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Feb 2011 04:24:22 -0800 (PST)
Sender: Vasiliy Kulikov <segooon@gmail.com>
From: Vasiliy Kulikov <segoon@openwall.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 20/20] fs: ubifs: world-writable debugfs dump_* files
Date: Fri,  4 Feb 2011 15:24:19 +0300
Message-Id: <cd575609cc07581a71ba925308d9d69c6e0c6d79.1296818921.git.segoon@openwall.com>
In-Reply-To: <cover.1296818921.git.segoon@openwall.com>
References: <cover.1296818921.git.segoon@openwall.com>
Cc: security@kernel.org, Adrian Hunter <adrian.hunter@nokia.com>,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't allow everybody to dump sensitive information about filesystems.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 fs/ubifs/debug.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 0bee4db..bcb1acb 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -2813,19 +2813,19 @@ int dbg_debugfs_init_fs(struct ubifs_info *c)
 	}
 
 	fname = "dump_lprops";
-	dent = debugfs_create_file(fname, S_IWUGO, d->dfs_dir, c, &dfs_fops);
+	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
 	if (IS_ERR(dent))
 		goto out_remove;
 	d->dfs_dump_lprops = dent;
 
 	fname = "dump_budg";
-	dent = debugfs_create_file(fname, S_IWUGO, d->dfs_dir, c, &dfs_fops);
+	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
 	if (IS_ERR(dent))
 		goto out_remove;
 	d->dfs_dump_budg = dent;
 
 	fname = "dump_tnc";
-	dent = debugfs_create_file(fname, S_IWUGO, d->dfs_dir, c, &dfs_fops);
+	dent = debugfs_create_file(fname, S_IWUSR, d->dfs_dir, c, &dfs_fops);
 	if (IS_ERR(dent))
 		goto out_remove;
 	d->dfs_dump_tnc = dent;
-- 
1.7.0.4
