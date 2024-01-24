Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37474C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5VEQ7ubtcKYXaG0zqk4DOnOtrLE3GUoBMVO3HP13OeU=; b=r+gDjQqGg/1hNp
	qEFc/M5PceqI0x9giFcX4XI1lIcNmkQrUURJQYSCShgOANyq+2KHn7YQPwXSM5bkCVzUHN8+OfD/w
	9YRcqwxE8R1a7RGwB6E3/w5KQ3DjOVuWhYyHI+iMclSkUos5ZfIlGTT9FkKg3klfiR/d5LWuIMVDn
	mVqaRs46hxbKdf4GmNzIYwA2YVum/2T4yk8Y9ssglyH2xVKjOXKul3VD+evZ4qimSIsVW2Egl9WKd
	lZs1HSu1JT1w3PV3x1P+I88CinTgRMyZcqy0tmLPz/f31pCYmTms0l6py728VZ8Vhfnh8TbGTeJkR
	CFOzRkFG4gWcyPJFneCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRN-004a7H-0H;
	Wed, 24 Jan 2024 17:53:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRL-004a5e-2a
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uCHbLgCV9zy7rGbnpECRVHQsD31NrJzQDK4qy5/rI/M=; b=omFWOdRf62F2ZE7txGOEATmH3C
	QYGJIh5JbgHpWNmN8VsTeitTxyH/4Xsaliw5E99ov2JXSVdQleYzBMH7l4zPDPIwKZGNUqgsJ116D
	VyhJfeIlUxcnAwOZjv3VpUsa2hmkhWWvROBh6d2NR/9FBL0W8fI8qTEFr+sclX46jpMB8kKlAdbci
	R4smK/LjOVnQl1ceo9u9x99M+pMnTimLubhwx1mIPHaOLTlXTRAVbRNYLnHlTMeqWmL3zSj/Wc7vv
	KCNsfaOiCTM0XHCzqM316W+RsedU9VP2d+L09bTVrfAKxu0X0YH31vS3LoD3Hd7NsoYSBPa69MRlW
	DWtkVuNw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQw-00000007LW0-0g0t;
	Wed, 24 Jan 2024 17:53:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 15/15] ubifs: Convert populate_page() to take a folio
Date: Wed, 24 Jan 2024 17:52:58 +0000
Message-ID: <20240124175302.1750912-16-willy@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124175302.1750912-1-willy@infradead.org>
References: <20240124175302.1750912-1-willy@infradead.org>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Both callers now have a folio, so pass it in.  This function contains
several assumptions that folios are not large.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 11bf9f8cca6c..a1f46919934c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -590,35 +590,35 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 /**
  * populate_page - copy data nodes into a page for bulk-read.
  * @c: UBIFS file-system description object
- * @page: page
+ * @folio: folio
  * @bu: bulk-read information
  * @n: next zbranch slot
  *
  * Returns: %0 on success and a negative error code on failure.
  */
-static int populate_page(struct ubifs_info *c, struct page *page,
+static int populate_page(struct ubifs_info *c, struct folio *folio,
 			 struct bu_info *bu, int *n)
 {
 	int i = 0, nn = *n, offs = bu->zbranch[0].offs, hole = 0, read = 0;
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio->mapping->host;
 	loff_t i_size = i_size_read(inode);
 	unsigned int page_block;
 	void *addr, *zaddr;
 	pgoff_t end_index;
 
 	dbg_gen("ino %lu, pg %lu, i_size %lld, flags %#lx",
-		inode->i_ino, page->index, i_size, page->flags);
+		inode->i_ino, folio->index, i_size, folio->flags);
 
-	addr = zaddr = kmap(page);
+	addr = zaddr = kmap_local_folio(folio, 0);
 
 	end_index = (i_size - 1) >> PAGE_SHIFT;
-	if (!i_size || page->index > end_index) {
+	if (!i_size || folio->index > end_index) {
 		hole = 1;
-		memset(addr, 0, PAGE_SIZE);
+		addr = folio_zero_tail(folio, 0, addr);
 		goto out_hole;
 	}
 
-	page_block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
+	page_block = folio->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	while (1) {
 		int err, len, out_len, dlen;
 
@@ -667,9 +667,13 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 			break;
 		addr += UBIFS_BLOCK_SIZE;
 		page_block += 1;
+		if (folio_test_highmem(folio) && (offset_in_page(addr) == 0)) {
+			kunmap_local(addr - UBIFS_BLOCK_SIZE);
+			addr = kmap_local_folio(folio, i * UBIFS_BLOCK_SIZE);
+		}
 	}
 
-	if (end_index == page->index) {
+	if (end_index == folio->index) {
 		int len = i_size & (PAGE_SIZE - 1);
 
 		if (len && len < read)
@@ -678,22 +682,19 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 
 out_hole:
 	if (hole) {
-		SetPageChecked(page);
+		folio_set_checked(folio);
 		dbg_gen("hole");
 	}
 
-	SetPageUptodate(page);
-	ClearPageError(page);
-	flush_dcache_page(page);
-	kunmap(page);
+	folio_mark_uptodate(folio);
+	flush_dcache_folio(folio);
+	kunmap_local(addr);
 	*n = nn;
 	return 0;
 
 out_err:
-	ClearPageUptodate(page);
-	SetPageError(page);
-	flush_dcache_page(page);
-	kunmap(page);
+	flush_dcache_folio(folio);
+	kunmap_local(addr);
 	ubifs_err(c, "bad data node (block %u, inode %lu)",
 		  page_block, inode->i_ino);
 	return -EINVAL;
@@ -761,7 +762,7 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 			goto out_warn;
 	}
 
-	err = populate_page(c, &folio1->page, bu, &n);
+	err = populate_page(c, folio1, bu, &n);
 	if (err)
 		goto out_warn;
 
@@ -785,7 +786,7 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 		if (IS_ERR(folio))
 			break;
 		if (!folio_test_uptodate(folio))
-			err = populate_page(c, &folio->page, bu, &n);
+			err = populate_page(c, folio, bu, &n);
 		folio_unlock(folio);
 		folio_put(folio);
 		if (err)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
