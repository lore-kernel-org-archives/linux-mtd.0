Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmFC-0002kO-BL
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:44 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 35/39] ubifs: write inode in ubifs_quota_write if we are
 appending
Date: Tue, 15 Sep 2015 17:02:30 +0800
Message-ID: <1442307754-13233-36-git-send-email-yangds.fnst@cn.fujitsu.com>
In-Reply-To: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
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
 fs/ubifs/super.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 47b1f44..d3213a2 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -980,6 +980,10 @@ static ssize_t ubifs_quota_write(struct super_block *sb, int type,
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
@@ -988,6 +992,8 @@ static ssize_t ubifs_quota_write(struct super_block *sb, int type,
 	size_t towrite = len;
 	int ret, err = 0;
 	struct ubifs_budget_req req = {};
+	struct ubifs_budget_req ino_req = { .dirtied_ino = 1,
+				.dirtied_ino_d = ALIGN(ui->data_len, 8) };
 	struct ubifs_data_node *dn;
 	char *block_buf;
 
@@ -1014,6 +1020,12 @@ static ssize_t ubifs_quota_write(struct super_block *sb, int type,
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
@@ -1050,11 +1062,23 @@ static ssize_t ubifs_quota_write(struct super_block *sb, int type,
 		towrite -= tocopy;
 		data += tocopy;
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
