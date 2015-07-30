Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnr-0006Ib-IX
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:53 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 32/35] ubifs: write inode in ubifs_quota_write if we are
 appending
Date: Thu, 30 Jul 2015 13:48:28 +0800
Message-ID: <1438235311-23788-33-git-send-email-yangds.fnst@cn.fujitsu.com>
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

When we are appending writing quota file, we have to do a
budgeting for the inode and write inode in ubifs_quota_write.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 20500f0..acc5d2f 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1040,6 +1040,10 @@ static ssize_t ubifs_quota_write(struct super_block *sb, int type,
 				const char *data, size_t len, loff_t off)
 {
 	struct inode *inode = sb_dqopt(sb)->files[type];
+	struct ubifs_inode *ui = ubifs_inode(inode);
+	loff_t end_pos = off + len;
+	int appending = (end_pos > inode->i_size);
+	int ino_released = 0;
 	unsigned long block = off >> UBIFS_BLOCK_SHIFT;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	int offset = off & (sb->s_blocksize - 1);
@@ -1048,6 +1052,8 @@ static ssize_t ubifs_quota_write(struct super_block *sb, int type,
 	size_t towrite = len;
 	int ret, err = 0;
 	struct ubifs_budget_req req = {};
+	struct ubifs_budget_req ino_req = { .dirtied_ino = 1,
+				.dirtied_ino_d = ALIGN(ui->data_len, 8) };
 	int new_block = 0;
 	struct ubifs_data_node *dn;
 	char *block_buf;
@@ -1058,13 +1064,17 @@ static ssize_t ubifs_quota_write(struct super_block *sb, int type,
 	new_block = DIV_ROUND_UP(len - (sb->s_blocksize - offset), sb->s_blocksize);
 	if (offset)
 		new_block += 1;
-
 	req.new_block_num = new_block;
-
 	err = ubifs_budget_space(c, &req);
 	if (err)
 		goto out;
 
+	if (appending) {
+		err = ubifs_budget_space(c, &ino_req);
+		if (err)
+			goto release_block;
+	}
+
 	dn = kmalloc(UBIFS_MAX_DATA_NODE_SZ, GFP_NOFS);
 	if (!dn) {
 		err = -ENOMEM;
@@ -1140,11 +1150,23 @@ static ssize_t ubifs_quota_write(struct super_block *sb, int type,
 		if (err)
 			goto free_buf;
 	}
+	if (appending) {
+		mutex_lock(&ui->ui_mutex);
+		i_size_write(inode, end_pos);
+		ui->ui_size = end_pos;
+		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
+		mutex_unlock(&ui->ui_mutex);
+		err = inode->i_sb->s_op->write_inode(inode, NULL);
+		ino_released = 1;
+	}
 free_buf:
 	kfree(block_buf);
 free_dn:
 	kfree(dn);
 release_budget:
+	if (appending && !ino_released)
+		ubifs_release_budget(c, &ino_req);
+release_block:
 	ubifs_release_budget(c, &req);
 out:
 	if (!err)
-- 
1.8.4.2
