Received: from mail-qc0-x231.google.com ([2607:f8b0:400d:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YY3Qe-0003YA-H5
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 02:09:53 +0000
Received: by qcbkw5 with SMTP id kw5so26897769qcb.2
 for <linux-mtd@lists.infradead.org>; Tue, 17 Mar 2015 19:09:29 -0700 (PDT)
From: Taesoo Kim <tsgatesv@gmail.com>
To: dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] UBIFS: fix incorrect unlocking handling
Date: Tue, 17 Mar 2015 22:09:26 -0400
Message-Id: <1426644566-29754-1-git-send-email-tsgatesv@gmail.com>
Cc: taesoo@gatech.edu, sanidhya@gatech.edu, Taesoo Kim <tsgatesv@gmail.com>,
 blee@gatech.edu, csong84@gatech.edu, changwoo@gatech.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When ubifs_init_security() fails, 'ui_mutex' is incorrectly
unlocked and incorrectly restores 'i_size'. There are four
such places that were introduce by the last commit.

Signed-off-by: Taesoo Kim <tsgatesv@gmail.com>
---
 fs/ubifs/dir.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 0fa6c80..5b24bc4 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -272,7 +272,7 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,

 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
-		goto out_cancel;
+		goto out_inode;

 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
@@ -292,6 +292,7 @@ out_cancel:
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
 	mutex_unlock(&dir_ui->ui_mutex);
+out_inode:
 	make_bad_inode(inode);
 	iput(inode);
 out_budg:
@@ -732,7 +733,7 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)

 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
-		goto out_cancel;
+		goto out_inode;

 	mutex_lock(&dir_ui->ui_mutex);
 	insert_inode_hash(inode);
@@ -757,6 +758,7 @@ out_cancel:
 	dir_ui->ui_size = dir->i_size;
 	drop_nlink(dir);
 	mutex_unlock(&dir_ui->ui_mutex);
+out_inode:
 	make_bad_inode(inode);
 	iput(inode);
 out_budg:
@@ -816,7 +818,7 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,

 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
-		goto out_cancel;
+		goto out_inode;

 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
@@ -836,6 +838,7 @@ out_cancel:
 	dir->i_size -= sz_change;
 	dir_ui->ui_size = dir->i_size;
 	mutex_unlock(&dir_ui->ui_mutex);
+out_inode:
 	make_bad_inode(inode);
 	iput(inode);
 out_budg:
@@ -896,7 +899,7 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,

 	err = ubifs_init_security(dir, inode, &dentry->d_name);
 	if (err)
-		goto out_cancel;
+		goto out_inode;

 	mutex_lock(&dir_ui->ui_mutex);
 	dir->i_size += sz_change;
--
2.3.3
