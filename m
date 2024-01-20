Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A47BC47258
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hv3U8LWusaXbBzlvVINoNHCkmQF2KIXk33rj436Q9Pc=; b=UzKm0kKsQBtjm2
	dl2qsFVhky5IM0vmOJ7fVrwMjYa3jCebNKcMyRyqWswL6ld8rU2l6tfsu0VMZMVNEnfzacdmMD54M
	Hsquk970cBbx/8gQ+oy+oCkkA64yvPlqSfi7FytxWrGuu2Ir+tDqY910gGzc6tmm7rpwjUJHHNAfq
	KhhFVXeNWKjwbAVi2HsYPcyh0pYXibMnk5Wt1/XXwtsLV1wM0Kz18yr5yhQuFI8+lGb3VO7RKINIA
	/OdgIaGk6Na0pWJ8LalcGWUpgjoAnhb7uL0HcKaXo6XC4yMz+WIl/kyOsVX19RCFwjhxUN0KI3XKk
	w3HyFAo+qF1+SbvIOnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS6-008ZLf-2L;
	Sat, 20 Jan 2024 23:08:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZIG-1g
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/Aug0Xm3x69SETlLxtE4WIsqNVgcTUMjI3DkrbFXGWo=; b=Zj5N4AOGjvzY/nI2hEiHJswPkJ
	tXpCB0nLNTAqM70U4J5U4N/wgPmRCjslYWGDzGrimvwMKtgvqoIU5RtPyXlQ2X+4WnBOR42BjqChn
	HcevrZf0B28JpgCs8v0CdwoMQRYcgBAfUorTr8DWaI14oE0JoTenYiZcjaLgDAWbSJnIeXMN8T8eB
	4/Cp2R1dldSnmHEEbWyVEKt6olkL0TqVr9xtXx3t2Q1LOjfQnijoyOGKz8I9X1WcyThWxJ7ddfq6I
	83uygsTQue95Y3FnBkncdiKwn88b0Eb2KKACsZp9DX5qtcVCXlQbkXAMXQBhCB9nbc9ZggtMuNjrL
	fc7QI7bw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRv-0000000AzWv-2h5J;
	Sat, 20 Jan 2024 23:08:27 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 08/15] ubifs: Convert ubifs_write_begin() to use a folio
Date: Sat, 20 Jan 2024 23:08:16 +0000
Message-ID: <20240120230824.2619716-9-willy@infradead.org>
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

Save eight calls to compound_head() by using the new folio API.
Remove a few assumptions that would break with large folios.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 6302ce65e0b3..ef262499f228 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -428,7 +428,7 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	pgoff_t index = pos >> PAGE_SHIFT;
 	int err, appending = !!(pos + len > inode->i_size);
 	int skipped_read = 0;
-	struct page *page;
+	struct folio *folio;
 
 	ubifs_assert(c, ubifs_inode(inode)->ui_size == inode->i_size);
 	ubifs_assert(c, !c->ro_media && !c->ro_mount);
@@ -437,13 +437,14 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 		return -EROFS;
 
 	/* Try out the fast-path part first */
-	page = grab_cache_page_write_begin(mapping, index);
-	if (unlikely(!page))
-		return -ENOMEM;
+	folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
+			mapping_gfp_mask(mapping));
+	if (IS_ERR(folio))
+		return PTR_ERR(folio);
 
-	if (!PageUptodate(page)) {
+	if (!folio_test_uptodate(folio)) {
 		/* The page is not loaded from the flash */
-		if (!(pos & ~PAGE_MASK) && len == PAGE_SIZE) {
+		if (pos == folio_pos(folio) && len >= folio_size(folio)) {
 			/*
 			 * We change whole page so no need to load it. But we
 			 * do not know whether this page exists on the media or
@@ -453,29 +454,27 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 			 * media. Thus, we are setting the @PG_checked flag
 			 * here.
 			 */
-			SetPageChecked(page);
+			folio_set_checked(folio);
 			skipped_read = 1;
 		} else {
-			err = do_readpage(page);
+			err = do_readpage(&folio->page);
 			if (err) {
-				unlock_page(page);
-				put_page(page);
+				folio_unlock(folio);
+				folio_put(folio);
 				return err;
 			}
 		}
 	}
 
-	err = allocate_budget(c, page, ui, appending);
+	err = allocate_budget(c, &folio->page, ui, appending);
 	if (unlikely(err)) {
 		ubifs_assert(c, err == -ENOSPC);
 		/*
 		 * If we skipped reading the page because we were going to
 		 * write all of it, then it is not up to date.
 		 */
-		if (skipped_read) {
-			ClearPageChecked(page);
-			ClearPageUptodate(page);
-		}
+		if (skipped_read)
+			folio_clear_checked(folio);
 		/*
 		 * Budgeting failed which means it would have to force
 		 * write-back but didn't, because we set the @fast flag in the
@@ -487,8 +486,8 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 			ubifs_assert(c, mutex_is_locked(&ui->ui_mutex));
 			mutex_unlock(&ui->ui_mutex);
 		}
-		unlock_page(page);
-		put_page(page);
+		folio_unlock(folio);
+		folio_put(folio);
 
 		return write_begin_slow(mapping, pos, len, pagep);
 	}
@@ -499,9 +498,8 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	 * with @ui->ui_mutex locked if we are appending pages, and unlocked
 	 * otherwise. This is an optimization (slightly hacky though).
 	 */
-	*pagep = page;
+	*pagep = &folio->page;
 	return 0;
-
 }
 
 /**
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
