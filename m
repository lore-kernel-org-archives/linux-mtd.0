Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9D5C47E49
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjWB0yWH4+C+hu92Obfwp2TibxTXVikZ6ZCB0TVhuRk=; b=iGycSmutYUmUrH
	LQ8iYxkBdhLWp6icQKlU4PBPQqPqyMKQnxWhbxYjJIwXo7rAt1AnYkb29sNnRekc2DhPTD9VplmCo
	3gqfSep0XryxiVXbzH0THdR/dyLGtoQMv7T3u9vOhDO4xZp3aaeLvHPaz/B8jBWUaNtFiOaFukeuE
	kXvxhkoFfq3j7SUZ/UapWm5W+5ruoSdf9AaLriNndM+yO/8nuCEsKCKELWU9z7LU+aJPbaqf4qrzG
	CkTPZWJ/wNLY4hmBE5xdElELC9zHmVYBLHKu7Gf5pYBfszVLsCOySgxemcDSMJBimPI8HE/xrV1Fs
	v/rvZgk5KO/LHRsHx7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRK-004a4i-04;
	Wed, 24 Jan 2024 17:53:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRF-004Zzd-2S
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=myqNdypVDbPYSg5YAYZPXmed5Q22UouItoM0k9nn62w=; b=N0W/4RN9qOyKfBUOmaU4v8XyGI
	1N/872GVz1bu+72k8dWgI3wGRNDLIrB9Tunk7OtXZvF1sbeJQEoQlddy9N362UtrYlIRYLchVmLJA
	q3QiDo3z7vhEpIWKjO5vrLWho19P7T4onZy5uvK7sXzuRBi61R1gKSJ/hjjdFoUBYlbdt0yp9P+ns
	62pqB+4bzFZ64uZl7K4lFKmCDJj+xKqGes/gWUGCebyCkoG78lFMjfOlaW/h1lanaks7vjkZPx0WB
	elFcD6GALk4G1NKfNjF26jVPSBu+SRvhAprUZNXHmh5b3rhyzgvBmAxKUDf254d0VksHbU+uXSZE2
	EVwbbi+w==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQv-00000007LVe-1dNa;
	Wed, 24 Jan 2024 17:53:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 08/15] ubifs: Convert ubifs_write_begin() to use a folio
Date: Wed, 24 Jan 2024 17:52:51 +0000
Message-ID: <20240124175302.1750912-9-willy@infradead.org>
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

Save eight calls to compound_head() by using the new folio API.
Remove a few assumptions that would break with large folios.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index cc4d2ec95b70..13c078bdf156 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -426,7 +426,7 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 	pgoff_t index = pos >> PAGE_SHIFT;
 	int err, appending = !!(pos + len > inode->i_size);
 	int skipped_read = 0;
-	struct page *page;
+	struct folio *folio;
 
 	ubifs_assert(c, ubifs_inode(inode)->ui_size == inode->i_size);
 	ubifs_assert(c, !c->ro_media && !c->ro_mount);
@@ -435,13 +435,14 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
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
@@ -451,19 +452,19 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
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
@@ -471,7 +472,7 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 		 * write all of it, then it is not up to date.
 		 */
 		if (skipped_read)
-			ClearPageChecked(page);
+			folio_clear_checked(folio);
 		/*
 		 * Budgeting failed which means it would have to force
 		 * write-back but didn't, because we set the @fast flag in the
@@ -483,8 +484,8 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
 			ubifs_assert(c, mutex_is_locked(&ui->ui_mutex));
 			mutex_unlock(&ui->ui_mutex);
 		}
-		unlock_page(page);
-		put_page(page);
+		folio_unlock(folio);
+		folio_put(folio);
 
 		return write_begin_slow(mapping, pos, len, pagep);
 	}
@@ -495,9 +496,8 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
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
