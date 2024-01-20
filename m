Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B37C47DB7
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJ6RzWRDYPBreRm8yQ++3Ab6eAEIsWeCQek7ElHB6SA=; b=tzGYWCl+6kNdw5
	j8M9qb0/NM506wAkMXTD7sd9sN/Ro+l32uYvlWTbEueGPDe4op1W8jaFTBGp/86dypYhy2M4W+HfW
	SFXGBzTAzJmAxAqTj+du55mkqn2fBGsj9aZMMYMaC3d9mbviYYuo0avTtkA3fFUc9HrTdHP8tjf9N
	LEAMmkKJwNbMrs4b0b5Uv5FWIs/EaJNpE07Z/55PyxqhxAJsN/jYSohzxzEhMlg+/8isjst8IrNoM
	9q7umLFuWatwEWbqhlItr50fpH4u3EBPedbpGbbZmPEaMKjYEaglq0oEzJp0LJt32hygXf72ZiWwN
	SFE0EiE9dSO91kXE7znw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS5-008ZLM-26;
	Sat, 20 Jan 2024 23:08:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZIH-1g
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1eZBtlPMhjaMnH0zztaU9yAqOLnsHSz5hPP6gny/kKE=; b=LlO8WSKxborpLwCUiPFWTTe0gP
	Lg6Fh2LdwlPzpCOqpwTeCAXoHHELJi62pzlX4kvSgP+EWOMQuig4g5r/wdI7IccXu81b2BxH+L4Ej
	gztE9yaU6zImWvV/4c3gWWoRO6l/F7PXsh9mAkgVrv4zgjzz/TspbhKjg7HhA0F3Fl0MSQIqNwzDJ
	gr4qokyk2JvDtu1rpAVxzINF8gZKLtdymGmxpZXU3vqh3yHtMTm64ubB6b0XUL5QNR1N/EYxKSZHM
	4GIHjP/wDIMlZhfqugYpsYw4RdcgzWnKS37im/wPo/foJJRt1lKriF8ofLb4oY2yVVz+z8e+cfQnX
	XFJNIAdw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRv-0000000AzX2-3VIa;
	Sat, 20 Jan 2024 23:08:27 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 09/15] ubifs: Convert ubifs_write_end() to use a folio
Date: Sat, 20 Jan 2024 23:08:17 +0000
Message-ID: <20240120230824.2619716-10-willy@infradead.org>
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

Convert the incoming page pointer to a folio and use it throughout,
saving several calls to compound_head().  Also remove some PAGE_SIZE
assumptions.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index ef262499f228..52027b4feebf 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -532,6 +532,7 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 			   loff_t pos, unsigned len, unsigned copied,
 			   struct page *page, void *fsdata)
 {
+	struct folio *folio = page_folio(page);
 	struct inode *inode = mapping->host;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
@@ -539,47 +540,47 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 	int appending = !!(end_pos > inode->i_size);
 
 	dbg_gen("ino %lu, pos %llu, pg %lu, len %u, copied %d, i_size %lld",
-		inode->i_ino, pos, page->index, len, copied, inode->i_size);
+		inode->i_ino, pos, folio->index, len, copied, inode->i_size);
 
-	if (unlikely(copied < len && len == PAGE_SIZE)) {
+	if (unlikely(copied < len && !folio_test_uptodate(folio))) {
 		/*
-		 * VFS copied less data to the page that it intended and
+		 * VFS copied less data to the folio than it intended and
 		 * declared in its '->write_begin()' call via the @len
-		 * argument. If the page was not up-to-date, and @len was
-		 * @PAGE_SIZE, the 'ubifs_write_begin()' function did
+		 * argument. If the folio was not up-to-date,
+		 * the 'ubifs_write_begin()' function did
 		 * not load it from the media (for optimization reasons). This
-		 * means that part of the page contains garbage. So read the
-		 * page now.
+		 * means that part of the folio contains garbage. So read the
+		 * folio now.
 		 */
 		dbg_gen("copied %d instead of %d, read page and repeat",
 			copied, len);
-		cancel_budget(c, page, ui, appending);
-		ClearPageChecked(page);
+		cancel_budget(c, &folio->page, ui, appending);
+		folio_clear_checked(folio);
 
 		/*
 		 * Return 0 to force VFS to repeat the whole operation, or the
 		 * error code if 'do_readpage()' fails.
 		 */
-		copied = do_readpage(page);
+		copied = do_readpage(&folio->page);
 		goto out;
 	}
 
-	if (len == PAGE_SIZE)
-		SetPageUptodate(page);
+	if (len >= folio_size(folio))
+		folio_mark_uptodate(folio);
 
-	if (!PagePrivate(page)) {
-		attach_page_private(page, (void *)1);
+	if (!folio->private) {
+		folio_attach_private(folio, (void *)1);
 		atomic_long_inc(&c->dirty_pg_cnt);
-		__set_page_dirty_nobuffers(page);
+		filemap_dirty_folio(mapping, folio);
 	}
 
 	if (appending) {
 		i_size_write(inode, end_pos);
 		ui->ui_size = end_pos;
 		/*
-		 * Note, we do not set @I_DIRTY_PAGES (which means that the
-		 * inode has dirty pages), this has been done in
-		 * '__set_page_dirty_nobuffers()'.
+		 * We do not set @I_DIRTY_PAGES (which means that
+		 * the inode has dirty pages), this was done in
+		 * filemap_dirty_folio().
 		 */
 		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
 		ubifs_assert(c, mutex_is_locked(&ui->ui_mutex));
@@ -587,8 +588,8 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 	}
 
 out:
-	unlock_page(page);
-	put_page(page);
+	folio_unlock(folio);
+	folio_put(folio);
 	return copied;
 }
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
