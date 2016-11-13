Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c62EZ-0004v1-Om
 for linux-mtd@lists.infradead.org; Sun, 13 Nov 2016 21:22:46 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, ebiggers@google.com, mhalcrow@google.com,
 hch@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 06/29] ubifs: Export ubifs_check_dir_empty()
Date: Sun, 13 Nov 2016 22:20:49 +0100
Message-Id: <1479072072-6844-7-git-send-email-richard@nod.at>
In-Reply-To: <1479072072-6844-1-git-send-email-richard@nod.at>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

fscrypto will need this function too. Also get struct ubifs_info
from the provided inode. Not all callers will have a reference to
struct ubifs_info.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c   | 8 ++++----
 fs/ubifs/ubifs.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index ca16c5d7bab1..14a226d47f4c 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -712,15 +712,15 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 
 /**
  * check_dir_empty - check if a directory is empty or not.
- * @c: UBIFS file-system description object
  * @dir: VFS inode object of the directory to check
  *
  * This function checks if directory @dir is empty. Returns zero if the
  * directory is empty, %-ENOTEMPTY if it is not, and other negative error codes
  * in case of of errors.
  */
-static int check_dir_empty(struct ubifs_info *c, struct inode *dir)
+int ubifs_check_dir_empty(struct inode *dir)
 {
+	struct ubifs_info *c = dir->i_sb->s_fs_info;
 	struct qstr nm = { .name = NULL };
 	struct ubifs_dent_node *dent;
 	union ubifs_key key;
@@ -758,7 +758,7 @@ static int ubifs_rmdir(struct inode *dir, struct dentry *dentry)
 		inode->i_ino, dir->i_ino);
 	ubifs_assert(inode_is_locked(dir));
 	ubifs_assert(inode_is_locked(inode));
-	err = check_dir_empty(c, d_inode(dentry));
+	err = ubifs_check_dir_empty(d_inode(dentry));
 	if (err)
 		return err;
 
@@ -1108,7 +1108,7 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 		ubifs_assert(inode_is_locked(new_inode));
 
 	if (unlink && is_dir) {
-		err = check_dir_empty(c, new_inode);
+		err = ubifs_check_dir_empty(new_inode);
 		if (err)
 			return err;
 	}
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 096035eb29d0..6d75cb7578fc 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1737,6 +1737,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
 			      umode_t mode);
 int ubifs_getattr(struct vfsmount *mnt, struct dentry *dentry,
 		  struct kstat *stat);
+int ubifs_check_dir_empty(struct inode *dir);
 
 /* xattr.c */
 extern const struct xattr_handler *ubifs_xattr_handlers[];
-- 
2.7.3
