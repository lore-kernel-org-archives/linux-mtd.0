Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9Y-0002qt-Gt
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:43:59 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 11/25] ubifs: export read_block() from file.c
Date: Tue, 21 Jul 2015 16:37:42 +0800
Message-ID: <1437467876-22106-12-git-send-email-yangds.fnst@cn.fujitsu.com>
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

We want to use read_block to read quota file bypass the page cache.
So export it from file.c, then we can use it in somewhere else.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/file.c  | 2 +-
 fs/ubifs/ubifs.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 27de484..dc8bf0b 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -54,7 +54,7 @@
 #include <linux/namei.h>
 #include <linux/slab.h>
 
-static int read_block(struct inode *inode, void *addr, unsigned int block,
+int read_block(struct inode *inode, void *addr, unsigned int block,
 		      struct ubifs_data_node *dn)
 {
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index ae6723e..a6ad955 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -1749,6 +1749,8 @@ const struct ubifs_lprops *ubifs_fast_find_frdi_idx(struct ubifs_info *c);
 int ubifs_calc_dark(const struct ubifs_info *c, int spc);
 
 /* file.c */
+int read_block(struct inode *inode, void *addr, unsigned int block,
+		      struct ubifs_data_node *dn);
 int ubifs_fsync(struct file *file, loff_t start, loff_t end, int datasync);
 int ubifs_setattr(struct dentry *dentry, struct iattr *attr);
 
-- 
1.8.4.2
