Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgni-0006If-6P
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:45 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 20/35] ubifs: implement IO functions for quota files
Date: Thu, 30 Jul 2015 13:48:16 +0800
Message-ID: <1438235311-23788-21-git-send-email-yangds.fnst@cn.fujitsu.com>
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
 fs/ubifs/super.c | 219 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index bc57685..3609d7b 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -940,6 +940,220 @@ static int check_volume_empty(struct ubifs_info *c)
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
+	char *block_buf;
+	struct ubifs_data_node *dn;
+	int ret, err = 0;
+
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
+		ret = ubifs_read_block(inode, block_buf, block, dn);
+		if (ret) {
+			if (ret != -ENOENT) {
+				err = ret;
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
+		ret = ubifs_read_block(inode, data, block, dn);
+		if (ret) {
+			if (ret != -ENOENT) {
+				err = ret;
+				goto free_buf;
+			}
+		}
+		block++;;
+		toread -= tocopy;
+		data += tocopy;
+		tocopy = 0;
+	}
+
+	if (tocopy) {
+		/* Read the data in last block */
+		ret = ubifs_read_block(inode, block_buf, block, dn);
+		if (ret) {
+			if (ret != -ENOENT) {
+				err = ret;
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
+	if (!err)
+		return len;
+	return err;
+}
+
+static ssize_t ubifs_quota_write(struct super_block *sb, int type,
+				const char *data, size_t len, loff_t off)
+{
+	struct inode *inode = sb_dqopt(sb)->files[type];
+	unsigned long block = off >> UBIFS_BLOCK_SHIFT;
+	struct ubifs_info *c = inode->i_sb->s_fs_info;
+	int offset = off & (sb->s_blocksize - 1);
+	union ubifs_key key;
+	int tocopy = 0;
+	size_t towrite = len;
+	int ret, err = 0;
+	struct ubifs_budget_req req = {};
+	int new_block = 0;
+	struct ubifs_data_node *dn;
+	char *block_buf;
+
+	/* There are dirtied blocks and new blockes, but we call them all
+	 * new blocks here, the budgeting is same for them.
+	 */
+	new_block = DIV_ROUND_UP(len - (sb->s_blocksize - offset), sb->s_blocksize);
+	if (offset)
+		new_block += 1;
+
+	req.new_block_num = new_block;
+
+	err = ubifs_budget_space(c, &req);
+	if (err)
+		goto out;
+
+	dn = kmalloc(UBIFS_MAX_DATA_NODE_SZ, GFP_NOFS);
+	if (!dn) {
+		err = -ENOMEM;
+		goto release_budget;
+	}
+
+	block_buf = kmalloc(sb->s_blocksize, GFP_NOFS);
+	if (!block_buf) {
+		err = -ENOMEM;
+		goto free_dn;
+	}
+
+	if (offset) {
+		/* Write the un-aligned data in first block */
+		tocopy = sb->s_blocksize - offset;
+		if (towrite < tocopy)
+			tocopy = towrite;
+
+		ret = ubifs_read_block(inode, block_buf, block, dn);
+		if (ret) {
+			if (ret != -ENOENT) {
+				err = ret;
+				goto free_buf;
+			}
+			memset(block_buf, 0, sb->s_blocksize);
+		}
+
+		memcpy(block_buf + offset, data, tocopy);
+
+		data_key_init(c, &key, inode->i_ino, block);
+		err = ubifs_jnl_write_data(c, inode, &key, block_buf, sb->s_blocksize);
+		if (err) {
+			goto free_buf;
+		}
+		block++;
+		towrite -= tocopy;
+		data += tocopy;
+		tocopy = 0;
+	}
+
+	while (towrite > 0) {
+		tocopy = sb->s_blocksize < towrite ?
+				sb->s_blocksize : towrite;
+
+		/* Break to read the last block */
+		if (tocopy < sb->s_blocksize)
+			break;
+
+		data_key_init(c, &key, inode->i_ino, block);
+		err = ubifs_jnl_write_data(c, inode, &key, data, sb->s_blocksize);
+		if (err)
+			goto free_buf;
+		block++;;
+		towrite -= tocopy;
+		data += tocopy;
+		tocopy = 0;
+	}
+
+	if (tocopy) {
+		/* Read the data in last block */
+		ret = ubifs_read_block(inode, block_buf, block, dn);
+		if (ret) {
+			if (ret != -ENOENT) {
+				err = ret;
+				goto free_buf;
+			}
+			memset(block_buf, 0, sb->s_blocksize);
+		}
+
+		memcpy(block_buf, data, tocopy);
+		data_key_init(c, &key, inode->i_ino, block);
+		err = ubifs_jnl_write_data(c, inode, &key, block_buf, sb->s_blocksize);
+		if (err)
+			goto free_buf;
+	}
+free_buf:
+	kfree(block_buf);
+free_dn:
+	kfree(dn);
+release_budget:
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
@@ -1939,6 +2153,11 @@ const struct super_operations ubifs_super_operations = {
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
