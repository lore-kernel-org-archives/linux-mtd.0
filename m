Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D6AC47DDB
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQqj/winmhAQL1A0NpM9W+hA2mPXO90OGwH+IppKzVU=; b=FQMc9KL120ZzXp
	a+5yW85o5WcOvqzRKCQRVrsXIxm5Sz0L9LHNw5PajK1fyi+xFP+GYNdfZ/lmDVxum8fkOLhnl2ktD
	yt08sUxU5jVnK+nfTgDDMa7RfmN9YTb6TWQMa/dqm/SVFOo8s8LLR5gkjUCSia4gavAhfXbOdGk4j
	hAsFf/eYywBD/ArBBrQIj0JuzgyjZjKx7CeW3a3NpQ74H+ddf004Mw9/I6b7rbBnalkN4Nfftyl4n
	wZ76PuU3jXX8tVOJkIkPi41Q6c/VcrMtu509Y7T+x/ThKxuPjlQqj+VfOrXKutxi4pZfXlxwWHscd
	apD+XbkcCWJkvY6X77cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS0-008ZJj-2L;
	Sat, 20 Jan 2024 23:08:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZID-1g
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=W3yaTu0fWJ+2XiCFPTm3U9cvRE3xDrPUDPEaIuLiViw=; b=akkejIvj2K4/2xUSpMzpzn3fEZ
	Q8c01QTSmyW7DmUh9+tot/P+7FnBM9YCh4/AsOAAtlSj0CSvE2GvfUHcaXajh7ww94z2FiYqQYMbx
	C58KQV1/lI8LRePUpDALSUlJZUgPnC7nHO8hPHhCJUT4mrFgPTNU//mEwq+snWA4cv4Rr8goXas82
	3kQtCM8UOusqs+PRNlj+x014VgmCAmktGRbJ9z69IPr7TolqSeOPgGsxOYVJNn7ROwYqIZ0UrPNBZ
	6bN1Dh19wLPbmQnLJ2LbAcDTHUUVk1v1G48jneJBt1g2D77aHXtHPwIXEXMsKNZw0Aff/y3DdHwZx
	8ymCk0lQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRv-0000000AzWp-27hu;
	Sat, 20 Jan 2024 23:08:27 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 07/15] ubifs: Convert write_begin_slow() to use a folio
Date: Sat, 20 Jan 2024 23:08:15 +0000
Message-ID: <20240120230824.2619716-8-willy@infradead.org>
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

Update to new APIs, removing several calls to compound_head() and
including support for large folios.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 9dfedd91b576..6302ce65e0b3 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -222,16 +222,16 @@ static int write_begin_slow(struct address_space *mapping,
 	pgoff_t index = pos >> PAGE_SHIFT;
 	struct ubifs_budget_req req = { .new_page = 1 };
 	int err, appending = !!(pos + len > inode->i_size);
-	struct page *page;
+	struct folio *folio;
 
 	dbg_gen("ino %lu, pos %llu, len %u, i_size %lld",
 		inode->i_ino, pos, len, inode->i_size);
 
 	/*
-	 * At the slow path we have to budget before locking the page, because
-	 * budgeting may force write-back, which would wait on locked pages and
-	 * deadlock if we had the page locked. At this point we do not know
-	 * anything about the page, so assume that this is a new page which is
+	 * At the slow path we have to budget before locking the folio, because
+	 * budgeting may force write-back, which would wait on locked folios and
+	 * deadlock if we had the folio locked. At this point we do not know
+	 * anything about the folio, so assume that this is a new folio which is
 	 * written to a hole. This corresponds to largest budget. Later the
 	 * budget will be amended if this is not true.
 	 */
@@ -243,45 +243,45 @@ static int write_begin_slow(struct address_space *mapping,
 	if (unlikely(err))
 		return err;
 
-	page = grab_cache_page_write_begin(mapping, index);
-	if (unlikely(!page)) {
+	folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
+			mapping_gfp_mask(mapping));
+	if (IS_ERR(folio)) {
 		ubifs_release_budget(c, &req);
-		return -ENOMEM;
+		return PTR_ERR(folio);
 	}
 
-	if (!PageUptodate(page)) {
-		if (!(pos & ~PAGE_MASK) && len == PAGE_SIZE)
-			SetPageChecked(page);
+	if (!folio_test_uptodate(folio)) {
+		if (pos == folio_pos(folio) && len >= folio_size(folio))
+			folio_set_checked(folio);
 		else {
-			err = do_readpage(page);
+			err = do_readpage(&folio->page);
 			if (err) {
-				unlock_page(page);
-				put_page(page);
+				folio_unlock(folio);
+				folio_put(folio);
 				ubifs_release_budget(c, &req);
 				return err;
 			}
 		}
 
-		SetPageUptodate(page);
-		ClearPageError(page);
+		folio_mark_uptodate(folio);
 	}
 
-	if (PagePrivate(page))
+	if (folio->private)
 		/*
-		 * The page is dirty, which means it was budgeted twice:
+		 * The folio is dirty, which means it was budgeted twice:
 		 *   o first time the budget was allocated by the task which
-		 *     made the page dirty and set the PG_private flag;
+		 *     made the folio dirty and set the private field;
 		 *   o and then we budgeted for it for the second time at the
 		 *     very beginning of this function.
 		 *
-		 * So what we have to do is to release the page budget we
+		 * So what we have to do is to release the folio budget we
 		 * allocated.
 		 */
 		release_new_page_budget(c);
-	else if (!PageChecked(page))
+	else if (!folio_test_checked(folio))
 		/*
-		 * We are changing a page which already exists on the media.
-		 * This means that changing the page does not make the amount
+		 * We are changing a folio which already exists on the media.
+		 * This means that changing the folio does not make the amount
 		 * of indexing information larger, and this part of the budget
 		 * which we have already acquired may be released.
 		 */
@@ -304,7 +304,7 @@ static int write_begin_slow(struct address_space *mapping,
 			ubifs_release_dirty_inode_budget(c, ui);
 	}
 
-	*pagep = page;
+	*pagep = &folio->page;
 	return 0;
 }
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
