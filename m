Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5ZV0-00014S-Pj
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 10:23:37 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH RFC 5/5] UBIFS: add ubifs_err() to print error reason
Date: Wed, 13 Feb 2013 11:23:18 +0100
Message-Id: <1360750998-15191-6-git-send-email-mkl@pengutronix.de>
In-Reply-To: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
Cc: Subodh Nijsure <snijsure@grid-net.com>, artem.bityutskiy@linux.intel.com,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Subodh Nijsure <snijsure@grid-net.com>

This patch add ubifs_err() output to some error pathes to tell the user what's
going on.

Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 fs/ubifs/dir.c   |   20 ++++++++++++++++----
 fs/ubifs/xattr.c |   12 ++++++++++--
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 6aa31b5..d0dd7a9 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -282,8 +282,11 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 		goto out_cancel;
 
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
-	if (err)
+	if (err) {
+		ubifs_err("cannot initialize extended attribute, error %d",
+			  err);
 		goto out_cancel;
+	}
 	mutex_unlock(&dir_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
@@ -748,8 +751,11 @@ static int ubifs_mkdir(struct inode *dir, struct dentry *dentry, umode_t mode)
 	}
 
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
-	if (err)
+	if (err) {
+		ubifs_err("cannot initialize extended attribute, error %d",
+			  err);
 		goto out_cancel;
+	}
 	mutex_unlock(&dir_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
@@ -828,8 +834,11 @@ static int ubifs_mknod(struct inode *dir, struct dentry *dentry,
 		goto out_cancel;
 
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
-	if (err)
+	if (err) {
+		ubifs_err("cannot initialize extended attribute, error %d",
+			  err);
 		goto out_cancel;
+	}
 	mutex_unlock(&dir_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
@@ -908,8 +917,11 @@ static int ubifs_symlink(struct inode *dir, struct dentry *dentry,
 		goto out_cancel;
 
 	err = ubifs_init_security(dir, inode, &dentry->d_name);
-	if (err)
+	if (err) {
+		ubifs_err("cannot initialize extended attribute, error %d",
+			  err);
 		goto out_cancel;
+	}
 	mutex_unlock(&dir_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index aa81bd3..380fcc9 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -107,8 +107,11 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 				.new_ino_d = ALIGN(size, 8), .dirtied_ino = 1,
 				.dirtied_ino_d = ALIGN(host_ui->data_len, 8) };
 
-	if (host_ui->xattr_cnt >= MAX_XATTRS_PER_INODE)
+	if (host_ui->xattr_cnt >= MAX_XATTRS_PER_INODE) {
+		ubifs_err("ubifs xattr_cnt %d exceeds MAX_XATTR_PER_NODE (%d)",
+			  host_ui->xattr_cnt, MAX_XATTRS_PER_INODE);
 		return -ENOSPC;
+	}
 	/*
 	 * Linux limits the maximum size of the extended attribute names list
 	 * to %XATTR_LIST_MAX. This means we should not allow creating more
@@ -116,8 +119,13 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	 * is artificial for UBIFS, though.
 	 */
 	if (host_ui->xattr_names + host_ui->xattr_cnt +
-					nm->len + 1 > XATTR_LIST_MAX)
+					nm->len + 1 > XATTR_LIST_MAX) {
+		ubifs_err("xattr name list too large %d > %d",
+			  host_ui->xattr_names + host_ui->xattr_cnt +
+			  nm->len + 1,
+			  XATTR_LIST_MAX);
 		return -ENOSPC;
+	}
 
 	err = ubifs_budget_space(c, &req);
 	if (err)
-- 
1.7.10.4
