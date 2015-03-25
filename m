Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1Yah4m-00068V-7C
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 08:54:13 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Taesoo Kim <tsgatesv@gmail.com>, dedekind1@gmail.com,
 adrian.hunter@intel.com, linux-mtd@lists.infradead.org
Subject: [PATCH v2] UBIFS: fix incorrect unlocking handling
Date: Wed, 25 Mar 2015 09:53:37 +0100
Message-Id: <1427273617-13692-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1426644566-29754-1-git-send-email-tsgatesv@gmail.com>
References: <1426644566-29754-1-git-send-email-tsgatesv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: taesoo@gatech.edu, Subodh Nijsure <snijsure@grid-net.com>,
 Shelton <ben.shelton@ni.com>, sanidhya@gatech.edu,
 Terry Wilcox <terry.wilcox@ni.com>, kernel@pengutronix.de, blee@gatech.edu,
 Gratian Crisan <gratian.crisan@ni.com>, csong84@gatech.edu,
 changwoo@gatech.edu, Brad Mouring <brad.mouring@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Taesoo Kim <tsgatesv@gmail.com>

When ubifs_init_security() fails, 'ui_mutex' is incorrectly
unlocked and incorrectly restores 'i_size'. Fix this.

Signed-off-by: Taesoo Kim <tsgatesv@gmail.com>
Fixes: d7f0b70d30ff ("UBIFS: Add security.* XATTR support for the UBIFS")
Reviewed-by: Ben Shelton <ben.shelton@ni.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 fs/ubifs/dir.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 0fa6c803992e..5b24bc42cad9 100644
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
2.1.4
