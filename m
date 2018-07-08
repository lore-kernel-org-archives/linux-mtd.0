Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcHJO-0002hf-Vb
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 21:33:44 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 stable@vger.kernel.org
Subject: [PATCH] ubifs: xattr: Don't operate on deleted inodes
Date: Sun,  8 Jul 2018 23:33:25 +0200
Message-Id: <20180708213325.24941-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

xattr operations can race with unlink and the following assert triggers:
UBIFS assert failed in ubifs_jnl_change_xattr at 1606 (pid 6256)

Fix this by checking i_nlink before working on the host inode.

Cc: <stable@vger.kernel.org>
Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/xattr.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 6f720fdf5020..09e37e63bddd 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -152,6 +152,12 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	ui->data_len = size;
 
 	mutex_lock(&host_ui->ui_mutex);
+
+	if (!host->i_nlink) {
+		err = -ENOENT;
+		goto out_noent;
+	}
+
 	host->i_ctime = current_time(host);
 	host_ui->xattr_cnt += 1;
 	host_ui->xattr_size += CALC_DENT_SIZE(fname_len(nm));
@@ -184,6 +190,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	host_ui->xattr_size -= CALC_XATTR_BYTES(size);
 	host_ui->xattr_names -= fname_len(nm);
 	host_ui->flags &= ~UBIFS_CRYPT_FL;
+out_noent:
 	mutex_unlock(&host_ui->ui_mutex);
 out_free:
 	make_bad_inode(inode);
@@ -235,6 +242,12 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 	mutex_unlock(&ui->ui_mutex);
 
 	mutex_lock(&host_ui->ui_mutex);
+
+	if (!host->i_nlink) {
+		err = -ENOENT;
+		goto out_noent;
+	}
+
 	host->i_ctime = current_time(host);
 	host_ui->xattr_size -= CALC_XATTR_BYTES(old_size);
 	host_ui->xattr_size += CALC_XATTR_BYTES(size);
@@ -256,6 +269,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 out_cancel:
 	host_ui->xattr_size -= CALC_XATTR_BYTES(size);
 	host_ui->xattr_size += CALC_XATTR_BYTES(old_size);
+out_noent:
 	mutex_unlock(&host_ui->ui_mutex);
 	make_bad_inode(inode);
 out_free:
@@ -482,6 +496,12 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
 		return err;
 
 	mutex_lock(&host_ui->ui_mutex);
+
+	if (!host->i_nlink) {
+		err = -ENOENT;
+		goto out_noent;
+	}
+
 	host->i_ctime = current_time(host);
 	host_ui->xattr_cnt -= 1;
 	host_ui->xattr_size -= CALC_DENT_SIZE(fname_len(nm));
@@ -501,6 +521,7 @@ static int remove_xattr(struct ubifs_info *c, struct inode *host,
 	host_ui->xattr_size += CALC_DENT_SIZE(fname_len(nm));
 	host_ui->xattr_size += CALC_XATTR_BYTES(ui->data_len);
 	host_ui->xattr_names += fname_len(nm);
+out_noent:
 	mutex_unlock(&host_ui->ui_mutex);
 	ubifs_release_budget(c, &req);
 	make_bad_inode(inode);
@@ -540,6 +561,9 @@ static int ubifs_xattr_remove(struct inode *host, const char *name)
 
 	ubifs_assert(inode_is_locked(host));
 
+	if (!host->i_nlink)
+		return -ENOENT;
+
 	if (fname_len(&nm) > UBIFS_MAX_NLEN)
 		return -ENAMETOOLONG;
 
-- 
2.18.0
