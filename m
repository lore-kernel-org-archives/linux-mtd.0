Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKgnf-0006Ib-QC
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 05:54:41 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v2 17/35] ubifs: export read_block() from file.c
Date: Thu, 30 Jul 2015 13:48:13 +0800
Message-ID: <1438235311-23788-18-git-send-email-yangds.fnst@cn.fujitsu.com>
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

We want to use read_block to read quota file bypass the page cache.
So export it from file.c, then we can use it in somewhere else.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/file.c  | 4 ++--
 fs/ubifs/ubifs.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 554d7b9..f307e86 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -54,7 +54,7 @@
 #include <linux/namei.h>
 #include <linux/slab.h>
 
-static int read_block(struct inode *inode, void *addr, unsigned int block,
+int ubifs_read_block(struct inode *inode, void *addr, unsigned int block,
 		      struct ubifs_data_node *dn)
 {
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
@@ -141,7 +141,7 @@ static int do_readpage(struct page *page)
 			err = -ENOENT;
 			memset(addr, 0, UBIFS_BLOCK_SIZE);
 		} else {
-			ret = read_block(inode, addr, block, dn);
+			ret = ubifs_read_block(inode, addr, block, dn);
 			if (ret) {
 				err = ret;
 				if (err != -ENOENT)
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index 71b79b5..c48fb41 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1749,6 +1749,8 @@ const struct ubifs_lprops *ubifs_fast_find_frdi_idx(struct ubifs_info *c);
 int ubifs_calc_dark(const struct ubifs_info *c, int spc);
 
 /* file.c */
+int ubifs_read_block(struct inode *inode, void *addr, unsigned int block,
+		      struct ubifs_data_node *dn);
 int ubifs_fsync(struct file *file, loff_t start, loff_t end, int datasync);
 int ubifs_setattr(struct dentry *dentry, struct iattr *attr);
 int ubifs_update_time(struct inode *inode, struct timespec *time, int flags);
-- 
1.8.4.2
