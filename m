Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRYlW-0001I3-0r
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 04:44:50 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v4] ubifs: make ubifs_[get|set]xattr atomic
Date: Tue, 18 Aug 2015 12:38:36 +0800
Message-ID: <1439872716-4810-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

This commit make the ubifs_[get|set]xattr protected by ui_mutex.

Originally, there is a possibility that ubifs_getxattr to get
a wrong value.

  P1                                  P2
----------                  	----------
ubifs_getxattr                      ubifs_setxattr
					- kfree()
- memcpy()
					- kmemdup()

Then ubifs_getxattr() would get a non-sense data. To solve this
problem, this commit make the xattr of ubifs_inode updated in
atomic.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
	-v2
		fix a dead lock in error flow
	-v3
		move kmemdup out of lock window.
 fs/ubifs/xattr.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 96f3448..99364ae 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -200,6 +200,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 	int err;
 	struct ubifs_inode *host_ui = ubifs_inode(host);
 	struct ubifs_inode *ui = ubifs_inode(inode);
+	void *buf = NULL;
 	struct ubifs_budget_req req = { .dirtied_ino = 2,
 		.dirtied_ino_d = ALIGN(size, 8) + ALIGN(host_ui->data_len, 8) };
 
@@ -208,14 +209,17 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
 	if (err)
 		return err;
 
-	kfree(ui->data);
-	ui->data = kmemdup(value, size, GFP_NOFS);
-	if (!ui->data) {
+	buf = kmemdup(value, size, GFP_NOFS);
+	if (!buf) {
 		err = -ENOMEM;
 		goto out_free;
 	}
+	mutex_lock(&ui->ui_mutex);
+	kfree(ui->data);
+	ui->data = buf;
 	inode->i_size = ui->ui_size = size;
 	ui->data_len = size;
+	mutex_unlock(&ui->ui_mutex);
 
 	mutex_lock(&host_ui->ui_mutex);
 	host->i_ctime = ubifs_current_time(host);
@@ -409,6 +413,7 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 	ubifs_assert(inode->i_size == ui->data_len);
 	ubifs_assert(ubifs_inode(host)->xattr_size > ui->data_len);
 
+	mutex_lock(&ui->ui_mutex);
 	if (buf) {
 		/* If @buf is %NULL we are supposed to return the length */
 		if (ui->data_len > size) {
@@ -423,6 +428,7 @@ ssize_t ubifs_getxattr(struct dentry *dentry, const char *name, void *buf,
 	err = ui->data_len;
 
 out_iput:
+	mutex_unlock(&ui->ui_mutex);
 	iput(inode);
 out_unlock:
 	kfree(xent);
-- 
1.8.4.2
