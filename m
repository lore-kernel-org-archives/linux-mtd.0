Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9h-0002r6-Q6
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:44:08 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 21/25] ubifs: free quota space in do_truncation and unlink
Date: Tue, 21 Jul 2015 16:37:52 +0800
Message-ID: <1437467876-22106-22-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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

In truncation and unlink, we have to tell quota subsystem
to update the quota information of the space changing.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/dir.c  | 4 ++++
 fs/ubifs/file.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 01cbc8b..b83ebb6 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -574,6 +574,7 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	int err, budgeted = 1;
 	struct ubifs_budget_req req = { .mod_dent = 1, .dirtied_ino = 2 };
 	unsigned int saved_nlink = inode->i_nlink;
+	loff_t quota_size = inode->i_size;
 
 	/*
 	 * Budget request settings: deletion direntry, deletion inode (+1 for
@@ -607,8 +608,11 @@ static int ubifs_unlink(struct inode *dir, struct dentry *dentry)
 	err = ubifs_jnl_update(c, dir, &dentry->d_name, inode, 1, 0);
 	if (err)
 		goto out_cancel;
+
 	unlock_2_inodes(dir, inode);
 
+	dquot_free_space_nodirty(inode, quota_size);
+
 	if (budgeted)
 		ubifs_release_budget(c, &req);
 	else {
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 0c03a88..b907f197 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1130,6 +1130,7 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 	int err;
 	struct ubifs_budget_req req;
 	loff_t old_size = inode->i_size, new_size = attr->ia_size;
+	loff_t quota_size = (old_size - new_size);
 	int offset = new_size & (UBIFS_BLOCK_SIZE - 1), budgeted = 1;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 
@@ -1209,6 +1210,9 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 	do_attr_changes(inode, attr);
 	err = ubifs_jnl_truncate(c, inode, old_size, new_size);
 	mutex_unlock(&ui->ui_mutex);
+	if (quota_size < 0)
+		quota_size = 0;
+	dquot_free_space_nodirty(inode, quota_size);
 
 out_budg:
 	if (budgeted)
-- 
1.8.4.2
