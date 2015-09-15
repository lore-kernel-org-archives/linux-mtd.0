Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbmF8-0002lT-8g
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 09:09:40 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <viro@ZenIV.linux.org.uk>, <jack@suse.cz>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH v3 30/39] ubifs: alloc quota space in ubifs writing path
Date: Tue, 15 Sep 2015 17:02:25 +0800
Message-ID: <1442307754-13233-31-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Besides inode, quota also limit the space. When
user want to write something, we have to tell quota
subsystem there is something is going to be written
into ubifs, please check the quota limit. If it exceed
the limit, return EQUOT. Else, record it and go on.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/file.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 4cff712..64ca91c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -52,6 +52,7 @@
 #include "ubifs.h"
 #include <linux/mount.h>
 #include <linux/slab.h>
+#include <linux/quotaops.h>
 
 /**
  * ubifs_read_block - read a block from inode
@@ -439,8 +440,10 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
 	int uninitialized_var(err), appending = !!(pos + len > inode->i_size);
+	int quota_size = 0;
 	int skipped_read = 0;
 	struct page *page;
+	int ret = 0;
 
 	ubifs_assert(ubifs_inode(inode)->ui_size == inode->i_size);
 	ubifs_assert(!c->ro_media && !c->ro_mount);
@@ -448,6 +451,16 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	if (unlikely(c->ro_error))
 		return -EROFS;
 
+	quota_size = ((pos + len) - inode->i_size);
+	if (quota_size < 0)
+		quota_size = 0;
+	if (S_ISREG(inode->i_mode)) {
+		dquot_initialize(inode);
+		ret = dquot_alloc_space_nodirty(inode, quota_size);
+		if (unlikely(ret))
+			return ret;
+	}
+
 	/* Try out the fast-path part first */
 	page = grab_cache_page_write_begin(mapping, index, flags);
 	if (unlikely(!page))
@@ -553,6 +566,7 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	loff_t end_pos = pos + len;
+	int quota_size = 0;
 	int appending = !!(end_pos > inode->i_size);
 
 	dbg_gen("ino %lu, pos %llu, pg %lu, len %u, copied %d, i_size %lld",
@@ -571,6 +585,12 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 		dbg_gen("copied %d instead of %d, read page and repeat",
 			copied, len);
 		cancel_budget(c, page, ui, appending);
+		quota_size = ((pos + len) - inode->i_size);
+		if (quota_size < 0)
+			quota_size = 0;
+		if (S_ISREG(inode->i_mode)) {
+			dquot_free_space_nodirty(inode, quota_size);
+		}
 		ClearPageChecked(page);
 
 		/*
-- 
1.8.4.2
