Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmF2-0002lT-1K
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:34 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 22/39] ubifs: implement IO functions for quota files
Date: Tue, 15 Sep 2015 17:02:17 +0800
Message-ID: <1442307754-13233-23-git-send-email-yangds.fnst@cn.fujitsu.com>
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
 fs/ubifs/super.c | 158 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 791bed47..647677d 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -37,6 +37,7 @@
 #include <linux/math64.h>
 #include <linux/writeback.h>
 #include <linux/cdev.h>
+#include <linux/quotaops.h>
 #include "ubifs.h"
 
 /*
@@ -911,6 +912,158 @@ static int check_volume_empty(struct ubifs_info *c)
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
+	loff_t i_size = i_size_read(inode);
+
+	if (off > i_size)
+		return 0;
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
+	while (toread > 0) {
+		tocopy = sb->s_blocksize - offset < toread ?
+				sb->s_blocksize - offset : toread;
+
+		ret = ubifs_read_block(inode, block_buf, block, dn);
+		if (ret) {
+			if (ret != -ENOENT) {
+				err = ret;
+				goto free_buf;
+			}
+			memset(block_buf, 0, sb->s_blocksize);
+		}
+		memcpy(data, block_buf + offset, tocopy);
+		offset = 0;
+		block++;;
+		toread -= tocopy;
+		data += tocopy;
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
+	struct ubifs_data_node *dn;
+	char *block_buf;
+
+	/*
+	 * Since we budget at most two blocks (one for dirtied block and
+	 * one for new block) here, then error out if the length out of
+	 * what allowed. NOTE, the writing length from quota should never
+	 * be larger than what we allowed here. Ext3 and Ext4 are also
+	 * limiting more strict for the len to one block size.
+	 */
+	if (sb->s_blocksize + (sb->s_blocksize - offset) < len) {
+		ubifs_err(c, "Quota write (off=%llu, len=%llu)"
+			" cancelled because length is too large",
+			(unsigned long long)off, (unsigned long long)len);
+		return -EIO;
+	}
+
+	if ((offset + len) > sb->s_blocksize)
+		req.new_block = 1;
+	if (offset)
+		req.dirtied_block = 1;
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
+	while (towrite > 0) {
+		tocopy = sb->s_blocksize - offset < towrite ?
+				sb->s_blocksize - offset : towrite;
+
+		if (offset || tocopy != sb->s_blocksize) {
+			ret = ubifs_read_block(inode, block_buf, block, dn);
+			if (ret) {
+				if (ret != -ENOENT) {
+					err = ret;
+					goto free_buf;
+				}
+				memset(block_buf, 0, sb->s_blocksize);
+			}
+		}
+		memcpy(block_buf + offset, data, tocopy);
+		data_key_init(c, &key, inode->i_ino, block);
+		err = ubifs_jnl_write_data(c, inode, &key, block_buf, sb->s_blocksize);
+		if (err)
+			goto free_buf;
+		offset = 0;
+		block++;;
+		towrite -= tocopy;
+		data += tocopy;
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
@@ -1887,6 +2040,11 @@ const struct super_operations ubifs_super_operations = {
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
