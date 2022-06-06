Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1ED3C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 20:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rcASQ0FCLdBJ1JagF00P6mgzoK6Jgmn8CXHyS8KJxZc=; b=raQGtYaCGlKz15
	jW9H3/4fV73gknZjWOm3j/WORUY+CIztLQYOdqLaXXHdjIzv2YPnYBXxSoooVrqrrE09dBFCi5W+A
	yLisoGs5vo2Ykasp/FM//txBvdccpjCr2F+O+SV2sXT7vMLllL/4XHNmx/1wWgHwG6jKvhAZEWTeX
	ixCrgR0ed7Z+fXUTWqQwzxql0YJCUxRPiNGTHVOmbuekGQTEVTsrdjpd3VP08V64qmRfcfyv4B0Nf
	18ebHqySW7SH1V9cvBRUIUTV7PFHBMpDFSpXuppcZCCmjUm518H5UQoCW9F4apfD85RKQAfr14AQi
	JgawN0Qscok7gPvlHcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJYJ-002isp-Oq; Mon, 06 Jun 2022 20:42:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJXC-002ho0-M7
	for linux-mtd@bombadil.infradead.org; Mon, 06 Jun 2022 20:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mh8Dq/H+EOoK+/6ImN6CHd/++DWMbIlB07P33o4BRwg=; b=kTMy4T7HlsUwOQX8f4QQV+5GP0
	d2BPsYV05ijHNUiGSBK/JJIvv3xLKspkoGfdX+PMam1j5Xg9jzguWsSeUNE35UNwheoWchJtICWKd
	v6bX2YXq8GSXTqi1MGo6L/yfFvOIttBKUu1LImX/eWRZ4ENj5Ta17pHs4l9ec5jgZR1Xjda2ExWS+
	yNjb7Y47V7B9Yo7pPITZdYU0NXdb8X5TcQTDL57j2z8HCFFsG3/TQ9RZNnnIOmkvMRexAJki1GE57
	L3C0azwbeRNYpI/2G26pxpropqDN9TfoMXJHf/DLJLI/bI6XNuSxoFpAHcfTC/sJz6vMnR2IhRaTR
	Nsw3A0UA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJWw-00B19M-NB; Mon, 06 Jun 2022 20:40:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com,
	linux-mm@kvack.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH 02/20] mm/migrate: Convert fallback_migrate_page() to fallback_migrate_folio()
Date: Mon,  6 Jun 2022 21:40:32 +0100
Message-Id: <20220606204050.2625949-3-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
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

Use a folio throughout.  migrate_page() will be converted to
migrate_folio() later.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/migrate.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 75cb6aa38988..d772ce63d7e2 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -806,11 +806,11 @@ static int writeout(struct address_space *mapping, struct page *page)
 /*
  * Default handling if a filesystem does not provide a migration function.
  */
-static int fallback_migrate_page(struct address_space *mapping,
-	struct page *newpage, struct page *page, enum migrate_mode mode)
+static int fallback_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
-	if (PageDirty(page)) {
-		/* Only writeback pages in full synchronous migration */
+	if (folio_test_dirty(src)) {
+		/* Only writeback folios in full synchronous migration */
 		switch (mode) {
 		case MIGRATE_SYNC:
 		case MIGRATE_SYNC_NO_COPY:
@@ -818,18 +818,18 @@ static int fallback_migrate_page(struct address_space *mapping,
 		default:
 			return -EBUSY;
 		}
-		return writeout(mapping, page);
+		return writeout(mapping, &src->page);
 	}
 
 	/*
 	 * Buffers may be managed in a filesystem specific way.
 	 * We must have no buffers or drop them.
 	 */
-	if (page_has_private(page) &&
-	    !try_to_release_page(page, GFP_KERNEL))
+	if (folio_test_private(src) &&
+	    !filemap_release_folio(src, GFP_KERNEL))
 		return mode == MIGRATE_SYNC ? -EAGAIN : -EBUSY;
 
-	return migrate_page(mapping, newpage, page, mode);
+	return migrate_page(mapping, &dst->page, &src->page, mode);
 }
 
 /*
@@ -872,8 +872,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 			rc = mapping->a_ops->migratepage(mapping, &dst->page,
 							&src->page, mode);
 		else
-			rc = fallback_migrate_page(mapping, &dst->page,
-							&src->page, mode);
+			rc = fallback_migrate_folio(mapping, dst, src, mode);
 	} else {
 		/*
 		 * In case of non-lru page, it could be released after
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
