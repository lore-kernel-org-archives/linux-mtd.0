Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2D6C47258
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WXbi9A/KMKxOECUFuCFnZCOazSw6FVukQkJbtC315h4=; b=yYjuhi796F8WLi
	cPczVsOAcTwIfyDWIXVjkRoWKBHHQ+bH3auR/a7YMzzCqHKOhjvCXBsfnY2gYrzYl2weWmArlB8ag
	JXXVLkBHfWEuIed+4EZ0Ai7dnfEdTdS8qgOeYh7Y9jHZG6qd9T8I4kLIIcHcECRQSa5Tn0n1XxOhh
	rqUHVy9gtwB9RC+yR8ia0K9217TbeWl+LBMEbJNtR+O7f8bMl02yzZ951reiWIBYp6nezufZ2vRrM
	9eK+oLaiLcTmtz/ZeD7sXapz2EbS3dTq/VJwcf7DBEKOE66C+zdZcENeae+mAdavjV+5WMkzp38JL
	TcTjj5tSV/NUc2GXAQaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS3-008ZKn-1a;
	Sat, 20 Jan 2024 23:08:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZI6-1g
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SN5s8QMGe2z44Ixnh9xatnj0Oo+pNrQls9YNjaDmxbc=; b=ku4YTm22u+tBAIVZMEPFKROQmw
	BAU1g3hR2+JFj+HoHwBcjNhkrgH2mgjrt/3UNDpfGdGClJIAT8KOGfXnFGla6EXHnz4j9RbNSUb0g
	jHkVIrU6UWQ2m2XfTjn4aBiJK1MW9yeifjCF5NOk8G5tEFl7N+Qgv3dlIOSFLgouLu+aKuTmVu/tK
	AmpFtRU2xXIUcQDKWS+ggepJMKOR8XhavOXoVuFCwlXrVFGTzuJI2mR3pLxZAC94rQuLFXlTYc6Sr
	b5i6a0wqlgu0YnBfBcWEqDECpWs+uVXfUO6773jAMleYtIh+nOFKMSPms8udjER/r7RKfIkE9dSYi
	9ZBL6Etg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRu-0000000AzW7-46CA;
	Sat, 20 Jan 2024 23:08:27 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 03/15] ubifs: Convert ubifs_writepage to use a folio
Date: Sat, 20 Jan 2024 23:08:11 +0000
Message-ID: <20240120230824.2619716-4-willy@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240120230824.2619716-1-willy@infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
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
---
 fs/ubifs/file.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 007a73052561..7d0967daded3 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1009,21 +1009,18 @@ static int do_writepage(struct page *page, int len)
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
@@ -1032,9 +1029,9 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
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
@@ -1047,20 +1044,18 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
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
@@ -1068,16 +1063,16 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
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
