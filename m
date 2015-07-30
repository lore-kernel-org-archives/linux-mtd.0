Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgno-0006If-BZ
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:49 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 28/35] ubifs: free quota space in do_truncation
Date: Thu, 30 Jul 2015 13:48:24 +0800
Message-ID: <1438235311-23788-29-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

In truncation, we have to tell quota subsystem
to update the quota information of the space changing.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/dir.c  | 1 +
 fs/ubifs/file.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 5bfce44..d430bb6 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -607,6 +607,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 1, 0);
 	if (err)
 		goto out_cancel;
+
 	unlock_2_inodes(dir, inode);
 
 	if (budgeted)
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b1e89ff..1e8ee41 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1130,6 +1130,7 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 	int err;
 	struct ubifs_budget_req req;
 	loff_t old_size = inode->i_size, new_size = attr->ia_size;
+	loff_t quota_size = (old_size - new_size);
 	int offset = new_size & (UBIFS_BLOCK_SIZE - 1), budgeted = 1;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 
@@ -1209,6 +1210,10 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 	do_attr_changes(inode, attr);
 	err = ubifs_jnl_truncate(c, inode, old_size, new_size);
 	mutex_unlock(&ui->ui_mutex);
+	if (quota_size < 0)
+		quota_size = 0;
+	if (S_ISREG(inode->i_mode))
+		dquot_free_space_nodirty(inode, quota_size);
 
 out_budg:
 	if (budgeted)
-- 
1.8.4.2
