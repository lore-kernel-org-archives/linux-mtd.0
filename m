Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHT9g-0002qj-C7
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 08:44:06 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: [PATCH 20/25] ubifs: alloc quota space in ubifs_write_begin
Date: Tue, 21 Jul 2015 16:37:51 +0800
Message-ID: <1437467876-22106-21-git-send-email-yangds.fnst@cn.fujitsu.com>
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

Besides inode, quota also limit the space. When
use want to write something, we have to tell quota
subsystem there is something is going to be written
into ubifs, please check the quota limit. If it exceed
the limit, return EQUOT. Else, record it and go on.

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
 fs/ubifs/file.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 113c3a6..0c03a88 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -53,6 +53,7 @@
 #include <linux/mount.h>
 #include <linux/namei.h>
 #include <linux/slab.h>
+#include <linux/quotaops.h>
 
 int read_block(struct inode *inode, void *addr, unsigned int block,
 		      struct ubifs_data_node *dn)
@@ -434,8 +435,10 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
 	int uninitialized_var(err), appending = !!(pos + len > inode->i_size);
+	int quota_size = 0;
 	int skipped_read = 0;
 	struct page *page;
+	int ret = 0;
 
 	ubifs_assert(ubifs_inode(inode)->ui_size == inode->i_size);
 	ubifs_assert(!c->ro_media && !c->ro_mount);
@@ -443,10 +446,19 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	if (unlikely(c->ro_error))
 		return -EROFS;
 
+	quota_size = ((pos + len) - inode->i_size);
+	if (quota_size < 0)
+		quota_size = 0;
+	ret = dquot_alloc_space_nodirty(inode, quota_size);
+	if (unlikely(ret))
+		goto err;
+
 	/* Try out the fast-path part first */
 	page = grab_cache_page_write_begin(mapping, index, flags);
-	if (unlikely(!page))
-		return -ENOMEM;
+	if (unlikely(!page)) {
+		ret = -ENOMEM;
+		goto free_quot;
+	}
 
 	if (!PageUptodate(page)) {
 		/* The page is not loaded from the flash */
@@ -500,7 +512,9 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 		unlock_page(page);
 		page_cache_release(page);
 
-		return write_begin_slow(mapping, pos, len, pagep, flags);
+		ret = write_begin_slow(mapping, pos, len, pagep, flags);
+		if (unlikely(ret))
+			goto free_quot;
 	}
 
 	/*
@@ -510,7 +524,12 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	 * otherwise. This is an optimization (slightly hacky though).
 	 */
 	*pagep = page;
-	return 0;
+
+	return ret;
+free_quot:
+	dquot_free_space_nodirty(inode, quota_size);
+err:
+	return ret;
 
 }
 
-- 
1.8.4.2
