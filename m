Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9211AC48285
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuCm/oEDT/Rp2Cie4PYikxRRnfAuB09c1dAVgr9V2dI=; b=uY7gfQKDhdT6zN
	5zIhR9oN94qBDLZ0kXT8iMAusFj5nyy7FtgB2mm44+ehQM/CmIHYZifYm51l+erqB6r60aAWUWG5R
	HlG9irF2P392bL2JBppsWyOpofafTaYzEMypAOo8YpPqyFcTlCjvUTnGJ5of0QHE365W9Kp4dPO8U
	IFx+OHbeAziX4xEXxiZhsSLQB82pDQQIwELLYB11Pdk6X/AvvHz10oFapp4tibieeZRbFYtMrfwYW
	ypyTSCA1yEd1Y5Ca8AfYVJKc+/t5PIVFhs5G5LOkZ5etmWbCQ5o7+c7HsHT99C3BpIAdf2ZzDn8mO
	e+aX9Kwk6LCzzFuNgbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR6-004ZsU-24;
	Wed, 24 Jan 2024 17:53:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShQz-004Zn8-2u
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yIKdpzmpN/EGIwbe5YdTmNHTSfTuw6kJAeOp8vViH8Y=; b=LHdHfqMYfBHTY8cfTIT/VcfjxO
	RJQybDMv+9bisFq6OWFfH/lMqdITGhghqtosgbYaY6RUdiQ04pIrRsQ+ha9B5G3MVkjokb3IMGxW9
	AbiExMZFKMMC8YbBOha8rpEvbEMDlYC3L4/wJLgzlaKYEqpX9CBCl9qZuazYijhaDOPJiIMElANTk
	dvj1EjBqMlnFjvZoKpm+tWN8B23eyVCuLOV5EPMHjpzTN74Nl9iRRfEFhm3MhwX0dRTV1408nLFwD
	ee0YUptsly2ESaQMI+W9aPsYpZwxjYkBMXh+iyTS3CvPnXYca7pZTUEAaQwGIPZJrRhXRvo5Xwhp9
	HPIU41Kg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQv-00000007LVk-27e8;
	Wed, 24 Jan 2024 17:53:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 09/15] ubifs: Convert ubifs_write_end() to use a folio
Date: Wed, 24 Jan 2024 17:52:52 +0000
Message-ID: <20240124175302.1750912-10-willy@infradead.org>
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

Convert the incoming page pointer to a folio and use it throughout,
saving several calls to compound_head().  Also remove some PAGE_SIZE
assumptions.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 13c078bdf156..feab95b59b05 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -530,6 +530,7 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 			   loff_t pos, unsigned len, unsigned copied,
 			   struct page *page, void *fsdata)
 {
+	struct folio *folio = page_folio(page);
 	struct inode *inode = mapping->host;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
@@ -537,47 +538,47 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
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
+	if (len == folio_size(folio))
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
@@ -585,8 +586,8 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
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
