Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D3FC47E49
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvG2pojSHpxQPcpVZBY8qzKYJbVxj8pu5cpimu4Odcc=; b=GglU2V+SEJonCp
	EJS8rlQvfdIdwgDOzcV3dlTmQpD3nj4f+FKsE5xVazpodJrNwGO14gfUuRukOIC4K0qTKdXlg80BX
	Pe3b3DtR86dbDacLCXv08w1J+Xu0v8gbSt3W7HtWRIp1S0CV7d6q3ZBZnr4cReMzNRrc44GmfI278
	Z/IFaPtJ5m+tdyF7gZL0OoF2atwzoXxlYC2ynMOTCINplf9dqQ8zQJXKnnhwnAdUNenviSvINAHvJ
	sNgyL6b5LeLaP8fbZPhvyQLb6T6zyDWMOkBJKRsPVW6aQUT4mbFWeT0KmB2Rz30ksIoSMeBOvmOrT
	EDEO6twHgDb6VxrGefMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRT-004aDI-28;
	Wed, 24 Jan 2024 17:53:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRR-004aBA-2e
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bBV9wdg0ftfYMLoYCIiEOJkgpB1SWeaCu1Cd2JScvd4=; b=ZCdXiCpOtIjnffAS1/H0gvOaoT
	SjYtQFRfRRH372/Hag6vI3EFFm91jcxd1CAAidThKAryDyYmB3cpWEWYBtocO6mhF8nD4IWWMnMsd
	X+gZn2kE9C6QY3GNA+9WvjW9Zp9r+Jq3KUZ2VaIvwquQPixbRSfvby76QQTulDhOjvRVeA5Y8zjER
	xA1J4ruw0Zj0QfctTtK4rMeaDoHiMuEroSFWi9S3+QJ0d8cycK6APocn3DX7Vo5QJCnzQxADthocG
	Mf6d0REAxLv7n+VplmYXLFzHSivrBWXFk3rEWesz31qyK7CtXApQZ2bUECysI5hxakUalJjZngWTG
	NDD3n6tQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQu-00000007LVR-3zpt;
	Wed, 24 Jan 2024 17:53:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 03/15] ubifs: Convert ubifs_writepage to use a folio
Date: Wed, 24 Jan 2024 17:52:46 +0000
Message-ID: <20240124175302.1750912-4-willy@infradead.org>
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

We still pass the page down to do_writepage(), but ubifs_writepage()
itself is now large folio safe.  It also contains far fewer hidden calls
to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 2022a31006df..a4e8bec6c03c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1004,21 +1004,18 @@ static int do_writepage(struct page *page, int len)
 static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
 		void *data)
 {
-	struct page *page = &folio->page;
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio->mapping->host;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	loff_t i_size =  i_size_read(inode), synced_i_size;
-	pgoff_t end_index = i_size >> PAGE_SHIFT;
-	int err, len = i_size & (PAGE_SIZE - 1);
-	void *kaddr;
+	int err, len = folio_size(folio);
 
 	dbg_gen("ino %lu, pg %lu, pg flags %#lx",
-		inode->i_ino, page->index, page->flags);
-	ubifs_assert(c, PagePrivate(page));
+		inode->i_ino, folio->index, folio->flags);
+	ubifs_assert(c, folio->private != NULL);
 
-	/* Is the page fully outside @i_size? (truncate in progress) */
-	if (page->index > end_index || (page->index == end_index && !len)) {
+	/* Is the folio fully outside @i_size? (truncate in progress) */
+	if (folio_pos(folio) >= i_size) {
 		err = 0;
 		goto out_unlock;
 	}
@@ -1027,9 +1024,9 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
 	synced_i_size = ui->synced_i_size;
 	spin_unlock(&ui->ui_lock);
 
-	/* Is the page fully inside @i_size? */
-	if (page->index < end_index) {
-		if (page->index >= synced_i_size >> PAGE_SHIFT) {
+	/* Is the folio fully inside i_size? */
+	if (folio_pos(folio) + len <= i_size) {
+		if (folio_pos(folio) >= synced_i_size) {
 			err = inode->i_sb->s_op->write_inode(inode, NULL);
 			if (err)
 				goto out_redirty;
@@ -1042,20 +1039,18 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
 			 * with this.
 			 */
 		}
-		return do_writepage(page, PAGE_SIZE);
+		return do_writepage(&folio->page, len);
 	}
 
 	/*
-	 * The page straddles @i_size. It must be zeroed out on each and every
+	 * The folio straddles @i_size. It must be zeroed out on each and every
 	 * writepage invocation because it may be mmapped. "A file is mapped
 	 * in multiples of the page size. For a file that is not a multiple of
 	 * the page size, the remaining memory is zeroed when mapped, and
 	 * writes to that region are not written out to the file."
 	 */
-	kaddr = kmap_atomic(page);
-	memset(kaddr + len, 0, PAGE_SIZE - len);
-	flush_dcache_page(page);
-	kunmap_atomic(kaddr);
+	len = i_size - folio_pos(folio);
+	folio_zero_segment(folio, len, folio_size(folio));
 
 	if (i_size > synced_i_size) {
 		err = inode->i_sb->s_op->write_inode(inode, NULL);
@@ -1063,16 +1058,16 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
 			goto out_redirty;
 	}
 
-	return do_writepage(page, len);
+	return do_writepage(&folio->page, len);
 out_redirty:
 	/*
-	 * redirty_page_for_writepage() won't call ubifs_dirty_inode() because
+	 * folio_redirty_for_writepage() won't call ubifs_dirty_inode() because
 	 * it passes I_DIRTY_PAGES flag while calling __mark_inode_dirty(), so
 	 * there is no need to do space budget for dirty inode.
 	 */
-	redirty_page_for_writepage(wbc, page);
+	folio_redirty_for_writepage(wbc, folio);
 out_unlock:
-	unlock_page(page);
+	folio_unlock(folio);
 	return err;
 }
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
