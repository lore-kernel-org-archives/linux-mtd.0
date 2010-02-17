Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nhouo-00049P-9s
	for linux-mtd@lists.infradead.org; Wed, 17 Feb 2010 18:46:30 +0000
Received: by fxm1 with SMTP id 1so8153427fxm.4
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Feb 2010 10:46:25 -0800 (PST)
Sender: Dmitry Monakhov <rjevskiy@gmail.com>
From: Dmitry Monakhov <dmonakhov@openvz.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 17/19] ubifs: replace inode uid, gid,
	mode initialization with helper function
Date: Wed, 17 Feb 2010 21:46:20 +0300
Message-Id: <1266432380-9951-1-git-send-email-dmonakhov@openvz.org>
In-Reply-To: <1266431353-8549-1-git-send-email-dmonakhov@openvz.org>
References: <1266431353-8549-1-git-send-email-dmonakhov@openvz.org>
Cc: Dmitry Monakhov <dmonakhov@openvz.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Dmitry Monakhov <dmonakhov@openvz.org>
---
 fs/ubifs/dir.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 552fb01..5a357bf 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -104,14 +104,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 	 */
 	inode->i_flags |= (S_NOCMTIME);
 
-	inode->i_uid = current_fsuid();
-	if (dir->i_mode & S_ISGID) {
-		inode->i_gid = dir->i_gid;
-		if (S_ISDIR(mode))
-			mode |= S_ISGID;
-	} else
-		inode->i_gid = current_fsgid();
-	inode->i_mode = mode;
+	inode_init_owner(inode, dir, mode);
 	inode->i_mtime = inode->i_atime = inode->i_ctime =
 			 ubifs_current_time(inode);
 	inode->i_mapping->nrpages = 0;
-- 
1.6.6
