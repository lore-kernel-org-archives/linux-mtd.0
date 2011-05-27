Received: from cobra.newdream.net ([66.33.216.30])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QQ3qz-0007BM-Rb
	for linux-mtd@lists.infradead.org; Fri, 27 May 2011 20:41:54 +0000
From: Sage Weil <sage@newdream.net>
To: hch@infradead.org,
	viro@ZenIV.linux.org.uk
Subject: [PATCH 07/26] ubifs: remove unnecessary dentry_unhash from rmdir,
	dir rename
Date: Fri, 27 May 2011 13:42:00 -0700
Message-Id: <1306528939-30636-8-git-send-email-sage@newdream.net>
In-Reply-To: <1306528939-30636-1-git-send-email-sage@newdream.net>
References: <1306528939-30636-1-git-send-email-sage@newdream.net>
Cc: linux-fsdevel@vger.kernel.org, Sage Weil <sage@newdream.net>,
	Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubifs does not have problems with references to unlinked directories.

CC: Artem Bityutskiy <dedekind1@gmail.com>
CC: Adrian Hunter <adrian.hunter@nokia.com>
CC: linux-mtd@lists.infradead.org
Signed-off-by: Sage Weil <sage@newdream.net>
---
 fs/ubifs/dir.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index d80810b..7217d67 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -656,8 +656,6 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
 	struct ubifs_budget_req req = { .mod_dent = 1, .dirtied_ino = 2 };
 
-	dentry_unhash(dentry);
-
 	/*
 	 * Budget request settings: deletion direntry, deletion inode and
 	 * changing the parent inode. If budgeting fails, go ahead anyway
@@ -978,9 +976,6 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 			.dirtied_ino_d = ALIGN(old_inode_ui->data_len, 8) };
 	struct timespec time;
 
-	if (new_inode && S_ISDIR(new_inode->i_mode))
-		dentry_unhash(new_dentry);
-
 	/*
 	 * Budget request settings: deletion direntry, new direntry, removing
 	 * the old inode, and changing old and new parent directory inodes.
-- 
1.7.0
