Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA1EC48260
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kUYiYwVCFBg9Qmyovgje580cfInb9PrqmsyG37T5Zs=; b=tLnOQoU4sKLDCN
	RfUfTRsrfzMMo39YgCVRZZT9LDQYiu95Ny5oFY7frb8lXMu/zbuGj4PYHkOfsInAPy27fAPt304S/
	zn7TYd9QNqlv41q1qdVT1pr2ruq5eELlSbDlRQHLi79uWJdGj2xCJKPIRwtexAWOPc8SU9t/jWyC1
	/Zj9WJwqZVEr92ptl1F1XNOADxWub7+0rS6WDqaiR/u2VwxE5xIPH0PtFr8INIo7ce3jTBW+1jN9y
	yUw3YG8cNupq6xrcwbHWGPKbf4g78lZ6s3GKsZym277QZC+Z5I1Yv3atcFvRRg4U+uW8ksA4K5gyI
	DuNC/8B7/FzIzCZ84g+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR2-004Zq6-2g;
	Wed, 24 Jan 2024 17:53:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShQz-004ZnB-2u
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3VPySplgqEpPTWCU5htFvwUd6dgERYMSGO7Mf1OrmkU=; b=QyNGEle2JRC+jUvJ2HdO3nIaum
	SBrxg/J7cd0inNwAABut16NPuZY+UNgBgWeIPf82NRdo3AvhRGcJoP3tEWO92bCyIKBf+WvsQW5QK
	dHBNKSu8gzXQDWq9euFlf1HpmqL35j/EdsLpagLBz9ifzmbXsdmx8LfNzhMr+u3fF067tpPsWhHX6
	T5Q2M/Hn/AifiYiDkfYaGrYM75/Lox6Vv7jfPF6zB34K3/BLk0R92N7uZu7sLLBYuBmh0hUPrReq1
	Y+KU18yf3KrKwJe+7RMJjVXwcTzI1SE+NZggtT5XbT4ykCicUi69MtOPqkyH2v4xzPIWxfwwdxkSD
	fbFNRfrA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQv-00000007LVm-2PD4;
	Wed, 24 Jan 2024 17:53:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 10/15] ubifs: Convert do_readpage() to take a folio
Date: Wed, 24 Jan 2024 17:52:53 +0000
Message-ID: <20240124175302.1750912-11-willy@infradead.org>
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

All the callers now have a folio, so pass it in, and convert do_readpage()
to us folios directly.  Includes unifying the exit paths from this
function and using kmap_local instead of plain kmap.  This function
should now work with large folios, but this is not tested.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 64 +++++++++++++++++++++++--------------------------
 1 file changed, 30 insertions(+), 34 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index feab95b59b05..654af636b11d 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -96,36 +96,36 @@ static int read_block(struct inode *inode, void *addr, unsigned int block,
 	return -EINVAL;
 }
 
-static int do_readpage(struct page *page)
+static int do_readpage(struct folio *folio)
 {
 	void *addr;
 	int err = 0, i;
 	unsigned int block, beyond;
-	struct ubifs_data_node *dn;
-	struct inode *inode = page->mapping->host;
+	struct ubifs_data_node *dn = NULL;
+	struct inode *inode = folio->mapping->host;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	loff_t i_size = i_size_read(inode);
 
 	dbg_gen("ino %lu, pg %lu, i_size %lld, flags %#lx",
-		inode->i_ino, page->index, i_size, page->flags);
-	ubifs_assert(c, !PageChecked(page));
-	ubifs_assert(c, !PagePrivate(page));
+		inode->i_ino, folio->index, i_size, folio->flags);
+	ubifs_assert(c, !folio_test_checked(folio));
+	ubifs_assert(c, !folio->private);
 
-	addr = kmap(page);
+	addr = kmap_local_folio(folio, 0);
 
-	block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
+	block = folio->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	beyond = (i_size + UBIFS_BLOCK_SIZE - 1) >> UBIFS_BLOCK_SHIFT;
 	if (block >= beyond) {
 		/* Reading beyond inode */
-		SetPageChecked(page);
-		memset(addr, 0, PAGE_SIZE);
+		folio_set_checked(folio);
+		addr = folio_zero_tail(folio, 0, addr);
 		goto out;
 	}
 
 	dn = kmalloc(UBIFS_MAX_DATA_NODE_SZ, GFP_NOFS);
 	if (!dn) {
 		err = -ENOMEM;
-		goto error;
+		goto out;
 	}
 
 	i = 0;
@@ -150,39 +150,35 @@ static int do_readpage(struct page *page)
 					memset(addr + ilen, 0, dlen - ilen);
 			}
 		}
-		if (++i >= UBIFS_BLOCKS_PER_PAGE)
+		if (++i >= (UBIFS_BLOCKS_PER_PAGE << folio_order(folio)))
 			break;
 		block += 1;
 		addr += UBIFS_BLOCK_SIZE;
+		if (folio_test_highmem(folio) && (offset_in_page(addr) == 0)) {
+			kunmap_local(addr - UBIFS_BLOCK_SIZE);
+			addr = kmap_local_folio(folio, i * UBIFS_BLOCK_SIZE);
+		}
 	}
+
 	if (err) {
 		struct ubifs_info *c = inode->i_sb->s_fs_info;
 		if (err == -ENOENT) {
 			/* Not found, so it must be a hole */
-			SetPageChecked(page);
+			folio_set_checked(folio);
 			dbg_gen("hole");
-			goto out_free;
+			err = 0;
+		} else {
+			ubifs_err(c, "cannot read page %lu of inode %lu, error %d",
+				  folio->index, inode->i_ino, err);
 		}
-		ubifs_err(c, "cannot read page %lu of inode %lu, error %d",
-			  page->index, inode->i_ino, err);
-		goto error;
 	}
 
-out_free:
-	kfree(dn);
 out:
-	SetPageUptodate(page);
-	ClearPageError(page);
-	flush_dcache_page(page);
-	kunmap(page);
-	return 0;
-
-error:
 	kfree(dn);
-	ClearPageUptodate(page);
-	SetPageError(page);
-	flush_dcache_page(page);
-	kunmap(page);
+	if (!err)
+		folio_mark_uptodate(folio);
+	flush_dcache_folio(folio);
+	kunmap_local(addr);
 	return err;
 }
 
@@ -254,7 +250,7 @@ static int write_begin_slow(struct address_space *mapping,
 		if (pos == folio_pos(folio) && len >= folio_size(folio))
 			folio_set_checked(folio);
 		else {
-			err = do_readpage(&folio->page);
+			err = do_readpage(folio);
 			if (err) {
 				folio_unlock(folio);
 				folio_put(folio);
@@ -455,7 +451,7 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 			folio_set_checked(folio);
 			skipped_read = 1;
 		} else {
-			err = do_readpage(&folio->page);
+			err = do_readpage(folio);
 			if (err) {
 				folio_unlock(folio);
 				folio_put(folio);
@@ -559,7 +555,7 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 		 * Return 0 to force VFS to repeat the whole operation, or the
 		 * error code if 'do_readpage()' fails.
 		 */
-		copied = do_readpage(&folio->page);
+		copied = do_readpage(folio);
 		goto out;
 	}
 
@@ -895,7 +891,7 @@ static int ubifs_read_folio(struct file *file, struct folio *folio)
 
 	if (ubifs_bulk_read(page))
 		return 0;
-	do_readpage(page);
+	do_readpage(folio);
 	folio_unlock(folio);
 	return 0;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
