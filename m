Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bwbHo-0000Hg-MI
 for linux-mtd@lists.infradead.org; Tue, 18 Oct 2016 20:47:03 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dedekind1@gmail.com, adrian.hunter@intel.com,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Rename ubifs_rename2
Date: Tue, 18 Oct 2016 22:46:31 +0200
Message-Id: <1476823591-6137-2-git-send-email-richard@nod.at>
In-Reply-To: <1476823591-6137-1-git-send-email-richard@nod.at>
References: <1476823591-6137-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since ->rename2 is gone, rename ubifs_rename2() to ubifs_rename().

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index c8f60df2733e..668ec3b90ea1 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -1060,9 +1060,9 @@ static void unlock_4_inodes(struct inode *inode1, struct inode *inode2,
 	mutex_unlock(&ubifs_inode(inode1)->ui_mutex);
 }
 
-static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
-			struct inode *new_dir, struct dentry *new_dentry,
-			unsigned int flags)
+static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
+		     struct inode *new_dir, struct dentry *new_dentry,
+		     unsigned int flags)
 {
 	struct ubifs_info *c = old_dir->i_sb->s_fs_info;
 	struct inode *old_inode = d_inode(old_dentry);
@@ -1323,7 +1323,7 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 	return err;
 }
 
-static int ubifs_rename2(struct inode *old_dir, struct dentry *old_dentry,
+static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 			struct inode *new_dir, struct dentry *new_dentry,
 			unsigned int flags)
 {
@@ -1336,7 +1336,7 @@ static int ubifs_rename2(struct inode *old_dir, struct dentry *old_dentry,
 	if (flags & RENAME_EXCHANGE)
 		return ubifs_xrename(old_dir, old_dentry, new_dir, new_dentry);
 
-	return ubifs_rename(old_dir, old_dentry, new_dir, new_dentry, flags);
+	return do_rename(old_dir, old_dentry, new_dir, new_dentry, flags);
 }
 
 int ubifs_getattr(struct vfsmount *mnt, struct dentry *dentry,
@@ -1387,7 +1387,7 @@ const struct inode_operations ubifs_dir_inode_operations = {
 	.mkdir       = ubifs_mkdir,
 	.rmdir       = ubifs_rmdir,
 	.mknod       = ubifs_mknod,
-	.rename      = ubifs_rename2,
+	.rename      = ubifs_rename,
 	.setattr     = ubifs_setattr,
 	.getattr     = ubifs_getattr,
 	.listxattr   = ubifs_listxattr,
-- 
2.7.3
