Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgcv-0001e7-CO
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:43:34 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH] ubifs: make ubifs_[get|set]xattr atomic
Date: Thu, 30 Jul 2015 13:37:30 +0800
Message-ID: <1438234650-21289-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit make the ubifs_[get|set]xattr protected by ui_mutex,
making xfstests/generic/037 passed.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/xattr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 96f3448..dec1afd 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -208,6 +208,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 	if (err)
 		return err;
 
+	mutex_lock(&ui->ui_mutex);
 	kfree(ui->data);
 	ui->data = kmemdup(value, size, GFP_NOFS);
 	if (!ui->data) {
@@ -216,6 +217,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 	}
 	inode->i_size = ui->ui_size = size;
 	ui->data_len = size;
+	mutex_unlock(&ui->ui_mutex);
 
 	mutex_lock(&host_ui->ui_mutex);
 	host->i_ctime = ubifs_current_time(host);
@@ -409,6 +411,7 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 	ubifs_assert(inode->i_size == ui->data_len);
 	ubifs_assert(ubifs_inode(host)->xattr_size > ui->data_len);
 
+	mutex_lock(&ui->ui_mutex);
 	if (buf) {
 		/* If @buf is %NULL we are supposed to return the length */
 		if (ui->data_len > size) {
@@ -423,6 +426,7 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 	err = ui->data_len;
 
 out_iput:
+	mutex_unlock(&ui->ui_mutex);
 	iput(inode);
 out_unlock:
 	kfree(xent);
-- 
1.8.4.2
