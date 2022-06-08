Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B26C43334
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 15:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDe685o5dob48sq2/LpgRN2rq3WwNtVw49OtOrK0DAY=; b=aDPscme1x+mSNJ
	qV1cnr1iSAAvz1DRPLSTS/Pjy1jeBD0slro2HQhqoEe7ju6x7O7uTsEl5GQ4w/MoZeVLLZW/D9eej
	ZDOGo+Mb1pRreQEsjyoRKnT3G1apbXyJG0ZIoua07Gh3oiQ42mKdxHsK/vBO1NdorHsoBOpGgjT1G
	YzZUvaUE2H+CW3w5MjYehxqVHZwYTXya3c2z36/yR3FyUAFHEeRC1kSIjXniiS5/j6QrH6MwgH95l
	t01fKILy9A9hn4lXOYNGJHr4cqRD0J2EaAzB9MD5Ib+yPZHt8XXV7rZeZmwgAOJ2s9vLbWWF5Am7P
	W+OjYtXX22D/a8F3uqOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxFJ-00DtYT-LK; Wed, 08 Jun 2022 15:05:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxEq-00DtBr-JI
	for linux-mtd@bombadil.infradead.org; Wed, 08 Jun 2022 15:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qsTlykJAxZx6jtmG/jT7izH1Dcr5N8n7lryLshNhvTE=; b=e95BlphxpHWFSbkgwIGOMjMcix
	42VFX0xG4pEx4PwDpChY3whbyyU4o7EK6xkxLTB7EAAS0XLLMepgIrkSq9ulWSTEgJHOyeO16jR8H
	KAURiWU1kAGlq5hK6BiRWShPtV19XNzbPScqKcrTKHHOWYXu5HitZoKOBr6oo3ZWM4ay3E9eOvYd5
	Db/0v/dwiBpuKJEL4joGM6o051xOrfUlxR1BNJZpHqRV1evyQNWBqyD72dbNPCEfe3acj84hFUfnR
	TlPkAsw1Taua7T0IisbUN8NeCFSG6wCgm3FxiXOVnvLaNoSCYbESH0E45kZ7WOpT/2BLqigho9EnP
	b+FXacVQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxCu-00CjFM-1T; Wed, 08 Jun 2022 15:02:52 +0000
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
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 04/19] mm/migrate: Convert fallback_migrate_page() to fallback_migrate_folio()
Date: Wed,  8 Jun 2022 16:02:34 +0100
Message-Id: <20220608150249.3033815-5-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220608150249.3033815-1-willy@infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 mm/migrate.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index e064b998ead0..1878de817a01 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -805,11 +805,11 @@ static int writeout(struct address_space *mapping, struct page *page)
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
@@ -817,18 +817,18 @@ static int fallback_migrate_page(struct address_space *mapping,
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
@@ -870,8 +870,7 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 			rc = mapping->a_ops->migratepage(mapping, &dst->page,
 							&src->page, mode);
 		else
-			rc = fallback_migrate_page(mapping, &dst->page,
-							&src->page, mode);
+			rc = fallback_migrate_folio(mapping, dst, src, mode);
 	} else {
 		const struct movable_operations *mops;
 
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
