Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9b-0002r6-No
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:44:02 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 14/25] ubifs: implement IO functions for quota files
Date: Tue, 21 Jul 2015 16:37:45 +0800
Message-ID: <1437467876-22106-15-git-send-email-yangds.fnst@cn.fujitsu.com>
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

We have to implement 3 functions to support quota in ubifs:
ubifs_quota_read(), ubifs_quota_write() and ubifs_get_quotas()

ubifs_quota_read():
	callback to read quota file.
ubifs_quota_write():
	callback to write data to quota file.
ubifs_get_quotas():
	callback to get quota instance for inode.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/super.c | 206 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 5fa21d6..4e60330 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -929,6 +929,207 @@ static int check_volume_empty(struct ubifs_info *c)
 	return 0;
 }
 
+#ifdef CONFIG_QUOTA
+static ssize_t ubifs_quota_read(struct super_block *sb, int type, char *data,
+			       size_t len, loff_t off)
+{
+	struct inode *inode = sb_dqopt(sb)->files[type];
+	unsigned long block = off >> UBIFS_BLOCK_SHIFT;
+	int offset = off & (sb->s_blocksize - 1);
+	int tocopy = 0;
+	size_t toread;
+	loff_t i_size = i_size_read(inode);
+	char *block_buf;
+	struct ubifs_data_node *dn;
+	int ret, err = 0;
+
+	if (off > i_size)
+		goto out;
+
+	if (off + len > i_size)
+		len = i_size - off;
+	toread = len;
+
+	dn = kmalloc(UBIFS_MAX_DATA_NODE_SZ, GFP_NOFS);
+	if (!dn) {
+		err = -ENOMEM;
+		goto out;
+	}
+
+	block_buf = kmalloc(sb->s_blocksize, GFP_NOFS);
+	if (!block_buf) {
+		err = -ENOMEM;
+		goto free_dn;
+	}
+
+	if (offset) {
+		/* Read the un-aligned data in first block */
+		tocopy = sb->s_blocksize - offset;
+		if (toread < tocopy)
+			tocopy = toread;
+
+		ret = read_block(inode, block_buf, block, dn);
+		if (ret) {
+			err = ret;
+			if (err != ENOENT) {
+				goto free_buf;
+			}
+		}
+
+		memcpy(data, block_buf + offset, tocopy);
+
+		block++;
+		toread -= tocopy;
+		data += tocopy;
+		tocopy = 0;
+	}
+
+	while (toread > 0) {
+		tocopy = sb->s_blocksize < toread ?
+				sb->s_blocksize : toread;
+
+		/* Break to read the last block */
+		if (tocopy < sb->s_blocksize)
+			break;
+
+		ret = read_block(inode, data, block, dn);
+		if (ret) {
+			err = ret;
+			if (err != -ENOENT)
+				goto free_buf;
+		}
+		block++;;
+		toread -= tocopy;
+		data += tocopy;
+		tocopy = 0;
+	}
+
+	if (tocopy) {
+		/* Read the data in last block */
+		ret = read_block(inode, block_buf, block, dn);
+		if (ret) {
+			err = ret;
+			if (err != ENOENT) {
+				goto free_buf;
+			}
+		}
+
+		memcpy(data, block_buf, tocopy);
+	}
+free_buf:
+	kfree(block_buf);
+free_dn:
+	kfree(dn);
+out:
+	if (!err) {
+		return len;
+	}
+	return err;
+}
+
+static ssize_t ubifs_quota_write(struct super_block *sb, int type,
+				const char *data, size_t len, loff_t off)
+{
+	struct inode *inode = sb_dqopt(sb)->files[type];
+	unsigned long block = off >> UBIFS_BLOCK_SHIFT;
+	unsigned long blocks = len >> UBIFS_BLOCK_SHIFT;
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
+	int offset = off & (sb->s_blocksize - 1);
+	union ubifs_key key;
+	int tocopy = 0;
+	size_t towrite = len;
+	int ret, err = 0;
+	struct ubifs_budget_req req = {};
+	int dirtied_block = 0, new_block = 0;
+
+	if (off + len > inode->i_size)
+		new_block = (off + len - inode->i_size) >> UBIFS_BLOCK_SHIFT;
+	dirtied_block = blocks - new_block;
+	if (offset)
+		dirtied_block += 1;
+	req.dirtied_block_num = dirtied_block;
+	req.new_block_num = new_block;
+
+	err = ubifs_budget_space(c, &req);
+	if (err)
+		goto out;
+
+	if (offset) {
+		struct ubifs_data_node *dn;
+		char *block_buf;
+
+		dn = kmalloc(UBIFS_MAX_DATA_NODE_SZ, GFP_NOFS);
+		if (!dn) {
+			err = -ENOMEM;
+			goto release_budget;
+		}
+
+		block_buf = kmalloc(sb->s_blocksize, GFP_NOFS);
+		if (!block_buf) {
+			err = -ENOMEM;
+			kfree(dn);
+			goto release_budget;
+		}
+
+		/* Write the un-aligned data in first block */
+		tocopy = sb->s_blocksize - offset;
+		if (towrite < tocopy)
+			tocopy = towrite;
+
+		ret = read_block(inode, block_buf, block, dn);
+		if (ret) {
+			err = ret;
+			if (err != ENOENT) {
+				kfree(block_buf);
+				kfree(dn);
+				goto release_budget;
+			}
+		}
+
+		memcpy(block_buf + offset, data, tocopy);
+
+		data_key_init(c, &key, inode->i_ino, block);
+		err = ubifs_jnl_write_data(c, inode, &key, block_buf, sb->s_blocksize);
+		if (err) {
+			kfree(block_buf);
+			kfree(dn);
+			goto release_budget;
+		}
+
+		block++;
+		towrite -= tocopy;
+		data += tocopy;
+	}
+
+	while (towrite > 0) {
+		tocopy = sb->s_blocksize < towrite ?
+				sb->s_blocksize : towrite;
+
+		data_key_init(c, &key, inode->i_ino, block);
+		err = ubifs_jnl_write_data(c, inode, &key, data, tocopy);
+		if (err)
+			break;
+		block++;;
+		towrite -= tocopy;
+		data += tocopy;
+	}
+
+	err = inode->i_sb->s_op->write_inode(inode, NULL);
+release_budget:
+	/* quota write success, we have to release the budget.*/
+	ubifs_release_budget(c, &req);
+out:
+	if (!err)
+		return len;
+	return err;
+}
+
+static struct dquot **ubifs_get_dquots(struct inode *inode)
+{
+	return ubifs_inode(inode)->i_dquot;
+}
+#endif
+
 /*
  * UBIFS mount options.
  *
@@ -1928,6 +2129,11 @@ const struct super_operations ubifs_super_operations = {
 	.remount_fs    = ubifs_remount_fs,
 	.show_options  = ubifs_show_options,
 	.sync_fs       = ubifs_sync_fs,
+#ifdef CONFIG_QUOTA
+	.quota_read    = ubifs_quota_read,
+	.quota_write   = ubifs_quota_write,
+	.get_dquots    = ubifs_get_dquots,
+#endif
 };
 
 /**
-- 
1.8.4.2
