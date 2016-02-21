Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXQbq-0006J4-5P
 for linux-mtd@lists.infradead.org; Sun, 21 Feb 2016 09:47:23 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: dedekind1@gmail.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Implement O_TMPFILE
Date: Sun, 21 Feb 2016 10:46:44 +0100
Message-Id: <1456048004-20365-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patchs adds O_TMPFILE support to UBIFS.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 795992a..660eefe 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -301,6 +301,76 @@ out_budg:
 	return err;
 }
 
+static int ubifs_tmpfile(struct inode *dir, struct dentry *dentry,
+			 umode_t mode)
+{
+	struct inode *inode;
+	struct ubifs_info *c = dir->i_sb->s_fs_info;
+	struct ubifs_budget_req req = { .new_ino = 1, .new_dent = 1};
+	struct ubifs_budget_req ino_req = { .dirtied_ino = 1 };
+	struct ubifs_inode *ui, *dir_ui = ubifs_inode(dir);
+	int err, instantiated = 0;
+
+	/*
+	 * Budget request settings: new dirty inode, new direntry,
+	 * budget for dirtied inode will be released via ubifs_evict_inode().
+	 */
+
+	dbg_gen("dent '%pd', mode %#hx in dir ino %lu",
+		dentry, mode, dir->i_ino);
+
+	err = ubifs_budget_space(c, &req);
+	if (err)
+		return err;
+
+	err = ubifs_budget_space(c, &ino_req);
+	if (err) {
+		ubifs_release_budget(c, &req);
+		return err;
+	}
+
+	inode = ubifs_new_inode(c, dir, mode);
+	if (IS_ERR(inode)) {
+		err = PTR_ERR(inode);
+		goto out_budg;
+	}
+	ui = ubifs_inode(inode);
+
+	err = ubifs_init_security(dir, inode, &dentry->d_name);
+	if (err)
+		goto out_inode;
+
+	mutex_lock(&ui->ui_mutex);
+	insert_inode_hash(inode);
+	d_tmpfile(dentry, inode);
+	ubifs_assert(ui->dirty);
+	instantiated = 1;
+	mutex_unlock(&ui->ui_mutex);
+
+	mutex_lock(&dir_ui->ui_mutex);
+	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 1, 0);
+	if (err)
+		goto out_cancel;
+	mutex_unlock(&dir_ui->ui_mutex);
+
+	ubifs_release_budget(c, &req);
+
+	return 0;
+
+out_cancel:
+	mutex_unlock(&dir_ui->ui_mutex);
+out_inode:
+	make_bad_inode(inode);
+	if (!instantiated)
+		iput(inode);
+out_budg:
+	ubifs_release_budget(c, &req);
+	if (!instantiated)
+		ubifs_release_budget(c, &ino_req);
+	ubifs_err(c, "cannot create temporary file, error %d", err);
+	return err;
+}
+
 /**
  * vfs_dent_type - get VFS directory entry type.
  * @type: UBIFS directory entry type
@@ -1189,6 +1259,7 @@ const struct inode_operations ubifs_dir_inode_operations = {
 #ifdef CONFIG_UBIFS_ATIME_SUPPORT
 	.update_time = ubifs_update_time,
 #endif
+	.tmpfile     = ubifs_tmpfile,
 };
 
 const struct file_operations ubifs_dir_operations = {
-- 
2.5.0
