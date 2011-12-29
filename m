Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCF3-0004RA-1d
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:25:43 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 01/27] logfs: rename functions starting with mtd_
Date: Thu, 29 Dec 2011 11:27:05 +0200
Message-Id: <1325150851-2805-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
References: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?J=C3=B6rn=20Engel?= <joern@logfs.org>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We are going to re-work the MTD interface and change 'mtd->write()' to
'mtd_write()', 'mtd->read()' to 'mtd_read()' and so forth for all functions
in the 'struct mtd_info' structure.

However, logfs has its own 'mtd_read()', 'mtd_write()', etc functions
which collide with our changes. This patch renames these logfs functions
to 'logfs_mtd_read()', 'logfs_mtd_write()', etc.

Additionally, to make the 'fs/logfs/dev_mtd.c' file look consistent, rename
similarly all the other functions starting with 'mtd_'.

Cc: Jörn Engel <joern@logfs.org>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/logfs/dev_mtd.c |   61 +++++++++++++++++++++++++++------------------------
 1 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/fs/logfs/dev_mtd.c b/fs/logfs/dev_mtd.c
index 339e17e..eb423eb 100644
--- a/fs/logfs/dev_mtd.c
+++ b/fs/logfs/dev_mtd.c
@@ -13,7 +13,8 @@
 
 #define PAGE_OFS(ofs) ((ofs) & (PAGE_SIZE-1))
 
-static int mtd_read(struct super_block *sb, loff_t ofs, size_t len, void *buf)
+static int logfs_mtd_read(struct super_block *sb, loff_t ofs, size_t len,
+			void *buf)
 {
 	struct mtd_info *mtd = logfs_super(sb)->s_mtd;
 	size_t retlen;
@@ -31,7 +32,8 @@ static int mtd_read(struct super_block *sb, loff_t ofs, size_t len, void *buf)
 	return 0;
 }
 
-static int mtd_write(struct super_block *sb, loff_t ofs, size_t len, void *buf)
+static int loffs_mtd_write(struct super_block *sb, loff_t ofs, size_t len,
+			void *buf)
 {
 	struct logfs_super *super = logfs_super(sb);
 	struct mtd_info *mtd = super->s_mtd;
@@ -60,14 +62,15 @@ static int mtd_write(struct super_block *sb, loff_t ofs, size_t len, void *buf)
  * asynchronous properties.  So just to prevent the first implementor of such
  * a thing from breaking logfs in 2350, we do the usual pointless dance to
  * declare a completion variable and wait for completion before returning
- * from mtd_erase().  What an exercise in futility!
+ * from logfs_mtd_erase().  What an exercise in futility!
  */
 static void logfs_erase_callback(struct erase_info *ei)
 {
 	complete((struct completion *)ei->priv);
 }
 
-static int mtd_erase_mapping(struct super_block *sb, loff_t ofs, size_t len)
+static int logfs_mtd_erase_mapping(struct super_block *sb, loff_t ofs,
+				size_t len)
 {
 	struct logfs_super *super = logfs_super(sb);
 	struct address_space *mapping = super->s_mapping_inode->i_mapping;
@@ -84,7 +87,7 @@ static int mtd_erase_mapping(struct super_block *sb, loff_t ofs, size_t len)
 	return 0;
 }
 
-static int mtd_erase(struct super_block *sb, loff_t ofs, size_t len,
+static int logfs_mtd_erase(struct super_block *sb, loff_t ofs, size_t len,
 		int ensure_write)
 {
 	struct mtd_info *mtd = logfs_super(sb)->s_mtd;
@@ -109,10 +112,10 @@ static int mtd_erase(struct super_block *sb, loff_t ofs, size_t len,
 	wait_for_completion(&complete);
 	if (ei.state != MTD_ERASE_DONE)
 		return -EIO;
-	return mtd_erase_mapping(sb, ofs, len);
+	return logfs_mtd_erase_mapping(sb, ofs, len);
 }
 
-static void mtd_sync(struct super_block *sb)
+static void logfs_mtd_sync(struct super_block *sb)
 {
 	struct mtd_info *mtd = logfs_super(sb)->s_mtd;
 
@@ -120,12 +123,12 @@ static void mtd_sync(struct super_block *sb)
 		mtd->sync(mtd);
 }
 
-static int mtd_readpage(void *_sb, struct page *page)
+static int logfs_mtd_readpage(void *_sb, struct page *page)
 {
 	struct super_block *sb = _sb;
 	int err;
 
-	err = mtd_read(sb, page->index << PAGE_SHIFT, PAGE_SIZE,
+	err = logfs_mtd_read(sb, page->index << PAGE_SHIFT, PAGE_SIZE,
 			page_address(page));
 	if (err == -EUCLEAN || err == -EBADMSG) {
 		/* -EBADMSG happens regularly on power failures */
@@ -143,11 +146,11 @@ static int mtd_readpage(void *_sb, struct page *page)
 	return err;
 }
 
-static struct page *mtd_find_first_sb(struct super_block *sb, u64 *ofs)
+static struct page *logfs_mtd_find_first_sb(struct super_block *sb, u64 *ofs)
 {
 	struct logfs_super *super = logfs_super(sb);
 	struct address_space *mapping = super->s_mapping_inode->i_mapping;
-	filler_t *filler = mtd_readpage;
+	filler_t *filler = logfs_mtd_readpage;
 	struct mtd_info *mtd = super->s_mtd;
 
 	if (!mtd->block_isbad)
@@ -163,11 +166,11 @@ static struct page *mtd_find_first_sb(struct super_block *sb, u64 *ofs)
 	return read_cache_page(mapping, *ofs >> PAGE_SHIFT, filler, sb);
 }
 
-static struct page *mtd_find_last_sb(struct super_block *sb, u64 *ofs)
+static struct page *logfs_mtd_find_last_sb(struct super_block *sb, u64 *ofs)
 {
 	struct logfs_super *super = logfs_super(sb);
 	struct address_space *mapping = super->s_mapping_inode->i_mapping;
-	filler_t *filler = mtd_readpage;
+	filler_t *filler = logfs_mtd_readpage;
 	struct mtd_info *mtd = super->s_mtd;
 
 	if (!mtd->block_isbad)
@@ -184,7 +187,7 @@ static struct page *mtd_find_last_sb(struct super_block *sb, u64 *ofs)
 	return read_cache_page(mapping, *ofs >> PAGE_SHIFT, filler, sb);
 }
 
-static int __mtd_writeseg(struct super_block *sb, u64 ofs, pgoff_t index,
+static int __logfs_mtd_writeseg(struct super_block *sb, u64 ofs, pgoff_t index,
 		size_t nr_pages)
 {
 	struct logfs_super *super = logfs_super(sb);
@@ -196,8 +199,8 @@ static int __mtd_writeseg(struct super_block *sb, u64 ofs, pgoff_t index,
 		page = find_lock_page(mapping, index + i);
 		BUG_ON(!page);
 
-		err = mtd_write(sb, page->index << PAGE_SHIFT, PAGE_SIZE,
-				page_address(page));
+		err = loffs_mtd_write(sb, page->index << PAGE_SHIFT, PAGE_SIZE,
+					page_address(page));
 		unlock_page(page);
 		page_cache_release(page);
 		if (err)
@@ -206,7 +209,7 @@ static int __mtd_writeseg(struct super_block *sb, u64 ofs, pgoff_t index,
 	return 0;
 }
 
-static void mtd_writeseg(struct super_block *sb, u64 ofs, size_t len)
+static void logfs_mtd_writeseg(struct super_block *sb, u64 ofs, size_t len)
 {
 	struct logfs_super *super = logfs_super(sb);
 	int head;
@@ -227,15 +230,15 @@ static void mtd_writeseg(struct super_block *sb, u64 ofs, size_t len)
 		len += head;
 	}
 	len = PAGE_ALIGN(len);
-	__mtd_writeseg(sb, ofs, ofs >> PAGE_SHIFT, len >> PAGE_SHIFT);
+	__logfs_mtd_writeseg(sb, ofs, ofs >> PAGE_SHIFT, len >> PAGE_SHIFT);
 }
 
-static void mtd_put_device(struct logfs_super *s)
+static void logfs_mtd_put_device(struct logfs_super *s)
 {
 	put_mtd_device(s->s_mtd);
 }
 
-static int mtd_can_write_buf(struct super_block *sb, u64 ofs)
+static int logfs_mtd_can_write_buf(struct super_block *sb, u64 ofs)
 {
 	struct logfs_super *super = logfs_super(sb);
 	void *buf;
@@ -244,7 +247,7 @@ static int mtd_can_write_buf(struct super_block *sb, u64 ofs)
 	buf = kmalloc(super->s_writesize, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
-	err = mtd_read(sb, ofs, super->s_writesize, buf);
+	err = logfs_mtd_read(sb, ofs, super->s_writesize, buf);
 	if (err)
 		goto out;
 	if (memchr_inv(buf, 0xff, super->s_writesize))
@@ -255,14 +258,14 @@ out:
 }
 
 static const struct logfs_device_ops mtd_devops = {
-	.find_first_sb	= mtd_find_first_sb,
-	.find_last_sb	= mtd_find_last_sb,
-	.readpage	= mtd_readpage,
-	.writeseg	= mtd_writeseg,
-	.erase		= mtd_erase,
-	.can_write_buf	= mtd_can_write_buf,
-	.sync		= mtd_sync,
-	.put_device	= mtd_put_device,
+	.find_first_sb	= logfs_mtd_find_first_sb,
+	.find_last_sb	= logfs_mtd_find_last_sb,
+	.readpage	= logfs_mtd_readpage,
+	.writeseg	= logfs_mtd_writeseg,
+	.erase		= logfs_mtd_erase,
+	.can_write_buf	= logfs_mtd_can_write_buf,
+	.sync		= logfs_mtd_sync,
+	.put_device	= logfs_mtd_put_device,
 };
 
 int logfs_get_sb_mtd(struct logfs_super *s, int mtdnr)
-- 
1.7.7.4
