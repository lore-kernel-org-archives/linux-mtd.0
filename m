Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UsWtB-0002L6-S0
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2013 11:30:55 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Al Viro <viro@ZenIV.linux.org.uk>
Subject: [PATCH 1/2] UBIFS: prepare to fix a horrid bug
Date: Fri, 28 Jun 2013 14:15:14 +0300
Message-Id: <1372418115-16713-1-git-send-email-dedekind1@gmail.com>
Cc: Linux FS Maling List <linux-fsdevel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Al Viro pointed me to the fact that '->readdir()' and '->llseek()' have no
mutual exclusion, which means the 'ubifs_dir_llseek()' can be run while we are
in the middle of 'ubifs_readdir()'.

First of all, this means that 'file->private_data' can be freed while
'ubifs_readdir()' uses it.  But this particular patch does not fix the problem.
This patch is only a preparation, and the fix will follow next.

In this patch we make 'ubifs_readdir()' stop using 'file->f_pos' directly,
because 'file->f_pos' can be changed by '->llseek()' at any point. This may
lead 'ubifs_readdir()' to returning inconsistent data: directory entry names
may correspond to incorrect file positions.

So here we introduce a local variable 'pos', read 'file->f_pose' once at very
the beginning, and then stick to 'pos'. The result of this is that when
'ubifs_dir_llseek()' changes 'file->f_pos' while we are in the middle of
'ubifs_readdir()', the latter "wins".

Cc: stable@vger.kernel.org
Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Tested-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/dir.c |   24 ++++++++++++------------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index de08c92f..8e587af 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -349,15 +349,16 @@ static unsigned int vfs_dent_type(uint8_t type)
 static int ubifs_readdir(struct file *file, void *dirent, filldir_t filldir)
 {
 	int err, over = 0;
+	loff_t pos = file->f_pos;
 	struct qstr nm;
 	union ubifs_key key;
 	struct ubifs_dent_node *dent;
 	struct inode *dir = file_inode(file);
 	struct ubifs_info *c = dir->i_sb->s_fs_info;
 
-	dbg_gen("dir ino %lu, f_pos %#llx", dir->i_ino, file->f_pos);
+	dbg_gen("dir ino %lu, f_pos %#llx", dir->i_ino, pos);
 
-	if (file->f_pos > UBIFS_S_KEY_HASH_MASK || file->f_pos == 2)
+	if (pos > UBIFS_S_KEY_HASH_MASK || pos == 2)
 		/*
 		 * The directory was seek'ed to a senseless position or there
 		 * are no more entries.
@@ -365,15 +366,15 @@ static int ubifs_readdir(struct file *file, void *dirent, filldir_t filldir)
 		return 0;
 
 	/* File positions 0 and 1 correspond to "." and ".." */
-	if (file->f_pos == 0) {
+	if (pos == 0) {
 		ubifs_assert(!file->private_data);
 		over = filldir(dirent, ".", 1, 0, dir->i_ino, DT_DIR);
 		if (over)
 			return 0;
-		file->f_pos = 1;
+		file->f_pos = pos = 1;
 	}
 
-	if (file->f_pos == 1) {
+	if (pos == 1) {
 		ubifs_assert(!file->private_data);
 		over = filldir(dirent, "..", 2, 1,
 			       parent_ino(file->f_path.dentry), DT_DIR);
@@ -389,7 +390,7 @@ static int ubifs_readdir(struct file *file, void *dirent, filldir_t filldir)
 			goto out;
 		}
 
-		file->f_pos = key_hash_flash(c, &dent->key);
+		file->f_pos = pos = key_hash_flash(c, &dent->key);
 		file->private_data = dent;
 	}
 
@@ -397,17 +398,16 @@ static int ubifs_readdir(struct file *file, void *dirent, filldir_t filldir)
 	if (!dent) {
 		/*
 		 * The directory was seek'ed to and is now readdir'ed.
-		 * Find the entry corresponding to @file->f_pos or the
-		 * closest one.
+		 * Find the entry corresponding to @pos or the closest one.
 		 */
-		dent_key_init_hash(c, &key, dir->i_ino, file->f_pos);
+		dent_key_init_hash(c, &key, dir->i_ino, pos);
 		nm.name = NULL;
 		dent = ubifs_tnc_next_ent(c, &key, &nm);
 		if (IS_ERR(dent)) {
 			err = PTR_ERR(dent);
 			goto out;
 		}
-		file->f_pos = key_hash_flash(c, &dent->key);
+		file->f_pos = pos = key_hash_flash(c, &dent->key);
 		file->private_data = dent;
 	}
 
@@ -419,7 +419,7 @@ static int ubifs_readdir(struct file *file, void *dirent, filldir_t filldir)
 			     ubifs_inode(dir)->creat_sqnum);
 
 		nm.len = le16_to_cpu(dent->nlen);
-		over = filldir(dirent, dent->name, nm.len, file->f_pos,
+		over = filldir(dirent, dent->name, nm.len, pos,
 			       le64_to_cpu(dent->inum),
 			       vfs_dent_type(dent->type));
 		if (over)
@@ -435,7 +435,7 @@ static int ubifs_readdir(struct file *file, void *dirent, filldir_t filldir)
 		}
 
 		kfree(file->private_data);
-		file->f_pos = key_hash_flash(c, &dent->key);
+		file->f_pos = pos = key_hash_flash(c, &dent->key);
 		file->private_data = dent;
 		cond_resched();
 	}
-- 
1.7.7.6
