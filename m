Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fSUZP-0000qx-Hk
 for linux-mtd@lists.infradead.org; Mon, 11 Jun 2018 21:41:49 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org
Subject: [PATCH] ubifs: Fix directory size calculation for symlinks
Date: Mon, 11 Jun 2018 23:41:09 +0200
Message-Id: <20180611214109.14424-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We have to account the name of the symlink and not the target length.

Fixes: ca7f85be8d6c ("ubifs: Add support for encrypted symlinks")
Cc: <stable@vger.kernel.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 4e267cc21c77..5c0d9a89663d 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1123,8 +1123,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	struct ubifs_inode *ui;
 	struct ubifs_inode *dir_ui = ubifs_inode(dir);
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
-	int err, len = strlen(symname);
-	int sz_change = CALC_DENT_SIZE(len);
+	int err, sz_change, len = strlen(symname);
 	struct fscrypt_str disk_link;
 	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1,
 					.new_ino_d = ALIGN(len, 8),
@@ -1151,6 +1150,8 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 	if (err)
 		goto out_budg;
 
+	sz_change = CALC_DENT_SIZE(fname_len(&nm));
+
 	inode = ubifs_new_inode(c, dir, S_IFLNK | S_IRWXUGO);
 	if (IS_ERR(inode)) {
 		err = PTR_ERR(inode);
-- 
2.13.6
