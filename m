Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD12C47E49
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsEHwls4Vd4RbfLa8Ma3O5VQffR0I/JUCbBSyPujyHw=; b=JLx/yuXF045hsU
	LFVluwNSLNk52cqx0rJh90WsLPdB9H1ZHLVF28Kmhpoyo3XKo3bMSuNEj0enPT7PRYsYhOqkPFynN
	mz/Ya6tH+8gn+dY/U8AVTn5z5WQRGZ64PduVZJM+7iAa+4/UZa0tgRNY1Jte+wqY6hLihct3rj2nF
	wq+Bk6c1iieaGbzbO5N/5OgqoHa+h8Ql/eplNg+/SyL1mi7KXeoztPOsiJSKc4ih5Lem463yYTcGF
	woxfu5kXuWkQNzKDjPfgXLl9vIG1n7owtIuWtfFGl+n7LvIOh2YQED950x6IxcdATIZvu7N3wIRtk
	xeHpyRzY38jQpD5pYPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR9-004ZuS-1p;
	Wed, 24 Jan 2024 17:53:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR2-004ZpZ-0b
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Yfukrl63pDT9YdJAQm/2xR2RtMxsdfpdJRK7RXif2YM=; b=BHhWfbYJQa/ZoaWTiDUTqWxBSy
	xepEDPd7vPihtc+G3LyGvA+2bewE+noEzBIT7EHQQzi21beBuC4FvkegSRl9T+6dtLY45paSRlS6E
	HNqHGZLzFHMeT/EDcoZEHbhw1XB1yXJewVJT+Z9CLZoh5mlSdwuR6iti4TzTdtSaJ71pD2ZOOKYUr
	sfwIbXezwuHQhopi3meRpEWDhvU1LnKeckCTzJseFB/b34fnHZ6cU8HxY9EE/nnfztpOjhdYrxy4O
	k31SqpgeSMPwdtD4jUbaviIuJlTVFVgaOyWfkl2eMFR711qMuhZieGyESEPiziLJyEVqNs1uluM/i
	flf/1Igg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQv-00000007LVy-421s;
	Wed, 24 Jan 2024 17:53:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 14/15] ubifs: Use a folio in ubifs_do_bulk_read()
Date: Wed, 24 Jan 2024 17:52:57 +0000
Message-ID: <20240124175302.1750912-15-willy@infradead.org>
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

When looking in the page cache, retrieve a folio instead of a page.
This would need some work to make it safe for large folios.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index f481fca7f53d..11bf9f8cca6c 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -775,19 +775,19 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 
 	for (page_idx = 1; page_idx < page_cnt; page_idx++) {
 		pgoff_t page_offset = offset + page_idx;
-		struct page *page;
+		struct folio *folio;
 
 		if (page_offset > end_index)
 			break;
-		page = pagecache_get_page(mapping, page_offset,
+		folio = __filemap_get_folio(mapping, page_offset,
 				 FGP_LOCK|FGP_ACCESSED|FGP_CREAT|FGP_NOWAIT,
 				 ra_gfp_mask);
-		if (!page)
+		if (IS_ERR(folio))
 			break;
-		if (!PageUptodate(page))
-			err = populate_page(c, page, bu, &n);
-		unlock_page(page);
-		put_page(page);
+		if (!folio_test_uptodate(folio))
+			err = populate_page(c, &folio->page, bu, &n);
+		folio_unlock(folio);
+		folio_put(folio);
 		if (err)
 			break;
 	}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
