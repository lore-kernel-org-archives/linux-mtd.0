Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RumFY-0002xe-VN
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 14:42:29 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux FS Maling List <linux-fsdevel@vger.kernel.org>
Subject: [PATCH] UBIFS: do not use inc_link when i_nlink is zero
Date: Tue,  7 Feb 2012 16:44:36 +0200
Message-Id: <1328625876-31390-1-git-send-email-dedekind1@gmail.com>
Cc: Al Viro <viro@ZenIV.linux.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

This patch changes the 'i_nlink' counter handling in 'ubifs_unlink()',
'ubifs_rmdir()' and 'ubifs_rename()'. In these function  'i_nlink' may become 0,
and if 'ubifs_jnl_update()' failed, we would use 'inc_nlink()' to restore
the previous 'i_nlink' value, which is incorrect from the VFS point of view and
would cause a 'WARN_ON()' (see 'inc_nlink() implementation).

This patches saves the previous 'i_nlink' value in a local variable and uses it
at the error path instead of calling 'inc_nlink()'. We do this only for the
inodes where 'i_nlink' may potentially become zero.

This change has been requested by Al Viro <viro@ZenIV.linux.org.uk>.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---

Al, I assume this goes in via the UBIFS tree.

 fs/ubifs/dir.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index d6fe1c7..ec9f187 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -566,6 +566,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	int sz_change = CALC_DENT_SIZE(dentry->d_name.len);
 	int err, budgeted = 1;
 	struct ubifs_budget_req req = { .mod_dent = 1, .dirtied_ino = 2 };
+	unsigned int saved_nlink = inode->i_nlink;
 
 	/*
 	 * Budget request settings: deletion direntry, deletion inode (+1 for
@@ -613,7 +614,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 out_cancel:
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
-	inc_nlink(inode);
+	set_nlink(inode, saved_nlink);
 	unlock_2_inodes(dir, inode);
 	if (budgeted)
 		ubifs_release_budget(c, &req);
@@ -704,8 +705,7 @@ out_cancel:
 	dir->i_size += sz_change;
 	dir_ui->ui_size = dir->i_size;
 	inc_nlink(dir);
-	inc_nlink(inode);
-	inc_nlink(inode);
+	set_nlink(inode, 2);
 	unlock_2_inodes(dir, inode);
 	if (budgeted)
 		ubifs_release_budget(c, &req);
@@ -977,6 +977,7 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	struct ubifs_budget_req ino_req = { .dirtied_ino = 1,
 			.dirtied_ino_d = ALIGN(old_inode_ui->data_len, 8) };
 	struct timespec time;
+	unsigned int saved_nlink;
 
 	/*
 	 * Budget request settings: deletion direntry, new direntry, removing
@@ -1059,13 +1060,14 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (unlink) {
 		/*
 		 * Directories cannot have hard-links, so if this is a
-		 * directory, decrement its @i_nlink twice because an empty
-		 * directory has @i_nlink 2.
+		 * directory, just clear @i_nlink.
 		 */
+		saved_nlink = new_inode->i_nlink;
 		if (is_dir)
+			clear_nlink(new_inode);
+		else
 			drop_nlink(new_inode);
 		new_inode->i_ctime = time;
-		drop_nlink(new_inode);
 	} else {
 		new_dir->i_size += new_sz;
 		ubifs_inode(new_dir)->ui_size = new_dir->i_size;
@@ -1102,9 +1104,7 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 out_cancel:
 	if (unlink) {
-		if (is_dir)
-			inc_nlink(new_inode);
-		inc_nlink(new_inode);
+		set_nlink(new_inode, saved_nlink);
 	} else {
 		new_dir->i_size -= new_sz;
 		ubifs_inode(new_dir)->ui_size = new_dir->i_size;
-- 
1.7.7.6
