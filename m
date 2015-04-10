Received: from [2a01:4f8:130:230c::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YgXN8-0003vo-Ax
 for linux-mtd@lists.infradead.org; Fri, 10 Apr 2015 11:45:19 +0000
From: Felix Fietkau <nbd@openwrt.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: use .rename2 and add RENAME_WHITEOUT support
Date: Fri, 10 Apr 2015 13:44:50 +0200
Message-Id: <1428666290-94685-1-git-send-email-nbd@openwrt.org>
Cc: dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is required for renames on overlayfs

Signed-off-by: Felix Fietkau <nbd@openwrt.org>
---
 fs/jffs2/dir.c | 39 +++++++++++++++++++++++++++++++++------
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index f21b6fb..9d7fc43 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -35,7 +35,7 @@ static int jffs2_mkdir (struct inode *,struct dentry *,umode_t);
 static int jffs2_rmdir (struct inode *,struct dentry *);
 static int jffs2_mknod (struct inode *,struct dentry *,umode_t,dev_t);
 static int jffs2_rename (struct inode *, struct dentry *,
-			 struct inode *, struct dentry *);
+			 struct inode *, struct dentry *, unsigned int);
 
 const struct file_operations jffs2_dir_operations =
 {
@@ -57,7 +57,7 @@ const struct inode_operations jffs2_dir_inode_operations =
 	.mkdir =	jffs2_mkdir,
 	.rmdir =	jffs2_rmdir,
 	.mknod =	jffs2_mknod,
-	.rename =	jffs2_rename,
+	.rename2 =	jffs2_rename,
 	.get_acl =	jffs2_get_acl,
 	.set_acl =	jffs2_set_acl,
 	.setattr =	jffs2_setattr,
@@ -756,8 +756,27 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
 	return ret;
 }
 
+static int jffs2_whiteout(struct inode *old_dir, struct dentry *old_dentry)
+{
+	struct dentry *wh;
+	int err;
+
+	wh = d_alloc(old_dentry->d_parent, &old_dentry->d_name);
+	if (!wh)
+		return -ENOMEM;
+
+	err = jffs2_mknod(old_dir, wh, S_IFCHR | WHITEOUT_MODE,
+			  WHITEOUT_DEV);
+	if (err)
+		return err;
+
+	d_rehash(wh);
+	return 0;
+}
+
 static int jffs2_rename (struct inode *old_dir_i, struct dentry *old_dentry,
-			 struct inode *new_dir_i, struct dentry *new_dentry)
+			 struct inode *new_dir_i, struct dentry *new_dentry,
+			 unsigned int flags)
 {
 	int ret;
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(old_dir_i->i_sb);
@@ -765,6 +784,9 @@ static int jffs2_rename (struct inode *old_dir_i, struct dentry *old_dentry,
 	uint8_t type;
 	uint32_t now;
 
+	if (flags & ~RENAME_WHITEOUT)
+		return -EINVAL;
+
 	/* The VFS will check for us and prevent trying to rename a
 	 * file over a directory and vice versa, but if it's a directory,
 	 * the VFS can't check whether the victim is empty. The filesystem
@@ -828,9 +850,14 @@ static int jffs2_rename (struct inode *old_dir_i, struct dentry *old_dentry,
 	if (d_is_dir(old_dentry) && !victim_f)
 		inc_nlink(new_dir_i);
 
-	/* Unlink the original */
-	ret = jffs2_do_unlink(c, JFFS2_INODE_INFO(old_dir_i),
-			      old_dentry->d_name.name, old_dentry->d_name.len, NULL, now);
+	if (flags & RENAME_WHITEOUT)
+		/* Replace with whiteout */
+		ret = jffs2_whiteout(old_dir_i, old_dentry);
+	else
+		/* Unlink the original */
+		ret = jffs2_do_unlink(c, JFFS2_INODE_INFO(old_dir_i),
+				      old_dentry->d_name.name,
+				      old_dentry->d_name.len, NULL, now);
 
 	/* We don't touch inode->i_nlink */
 
-- 
2.2.2
