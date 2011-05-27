Received: from cobra.newdream.net ([66.33.216.30])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QQ3qz-0007BL-RX
	for linux-mtd@lists.infradead.org; Fri, 27 May 2011 20:41:54 +0000
From: Sage Weil <sage@newdream.net>
To: hch@infradead.org,
	viro@ZenIV.linux.org.uk
Subject: [PATCH 03/26] jffs2: remove unnecessary dentry_unhash from rmdir,
	dir rename
Date: Fri, 27 May 2011 13:41:56 -0700
Message-Id: <1306528939-30636-4-git-send-email-sage@newdream.net>
In-Reply-To: <1306528939-30636-1-git-send-email-sage@newdream.net>
References: <1306528939-30636-1-git-send-email-sage@newdream.net>
Cc: linux-fsdevel@vger.kernel.org, Sage Weil <sage@newdream.net>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jffs2 does not have problems with references to unlinked directories.

CC: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Signed-off-by: Sage Weil <sage@newdream.net>
---
 fs/jffs2/dir.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 05f7332..82faddd 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -609,8 +609,6 @@ static int jffs2_rmdir (struct inode *dir_i, struct dentry *dentry)
 	int ret;
 	uint32_t now = get_seconds();
 
-	dentry_unhash(dentry);
-
 	for (fd = f->dents ; fd; fd = fd->next) {
 		if (fd->ino)
 			return -ENOTEMPTY;
@@ -786,9 +784,6 @@ static int jffs2_rename (struct inode *old_dir_i, struct dentry *old_dentry,
 	uint8_t type;
 	uint32_t now;
 
-	if (new_dentry->d_inode && S_ISDIR(new_dentry->d_inode->i_mode))
-		dentry_unhash(new_dentry);
-
 	/* The VFS will check for us and prevent trying to rename a
 	 * file over a directory and vice versa, but if it's a directory,
 	 * the VFS can't check whether the victim is empty. The filesystem
-- 
1.7.0
