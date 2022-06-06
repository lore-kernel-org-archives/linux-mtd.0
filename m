Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDD1C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 20:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiX2h3QjRbiOzi++cah6Yn/dpfgV7i+lD8kl8Tv2Pm8=; b=ABtK3XlRx+A8yo
	09nRAMep9tcq8riVjp8OZbJMQU541ERquwdtASPhcbZWdWgTpIprf3kVRaDdw5h1pfhMJBTZ4hLHR
	X8OaacMN+PX6mPeSlMuZSQ/cNr7939QZLaiErKHTZnv6PZFXS0fraMVxjau+vkAiYErEPr2ibyqoW
	DS8byJfFisIQ2yGuFXdMg3Gfm80dW9bJCx/tMaPIUPJhySErUEhenR4I8McO/nJKT5M2lApFi0jxh
	1aXEBmWnnET+DQiVZ4MZvQc2QnQ2yRhmyxeCK+yD9UEU4CCXVgKG+wntEuxCR/NDZJRNhQCVeptgh
	k1LhwJsLq+PimFOeBUVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJZL-002jmA-1Y; Mon, 06 Jun 2022 20:43:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJXU-002i8e-ML
	for linux-mtd@bombadil.infradead.org; Mon, 06 Jun 2022 20:41:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PTb1fSw49y2qxNUUq4k5t2uIOYf1rKQU0qM36b/uqdM=; b=moAsLc7xAe9cCO2yLS/2VDmHEw
	YBwWTVJr9kJRjwoeFhsNnd8JLuuJjbq0xBtc3hJNd0koz0AzNRiu2y+N5Os1g1/u53LaRvxXW4rdM
	tHwy5XlETEs430Lov51yIttD+nu/AmMuCt1+6O5d08aKIMBYPTBY0Yt54xqFYELLNo0/O6twSwDnU
	wa3c1U/y/ETekmwC5gKHpa1nMck5VNxLTjucI7KCgMp9l5cOztmW0nCXmpkBfBeAli7aijjbj7GhC
	zHPVo0ax+4QE/HagbZZ6pGGOB2yVWmyQYd5p+40+xWsAl8Ab1eGJlEDyjqzfn+/+j35DgUlM4Y7a4
	FS4d0iCw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJWw-00B19S-UW; Mon, 06 Jun 2022 20:40:54 +0000
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
Subject: [PATCH 05/20] mm/migrate: Convert expected_page_refs() to folio_expected_refs()
Date: Mon,  6 Jun 2022 21:40:35 +0100
Message-Id: <20220606204050.2625949-6-willy@infradead.org>
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

Now that both callers have a folio, convert this function to
take a folio & rename it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/migrate.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 77b8c662c9ca..e0a593e5b5f9 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -337,13 +337,18 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
 }
 #endif
 
-static int expected_page_refs(struct address_space *mapping, struct page *page)
+static int folio_expected_refs(struct address_space *mapping,
+		struct folio *folio)
 {
-	int expected_count = 1;
+	int refs = 1;
+	if (!mapping)
+		return refs;
 
-	if (mapping)
-		expected_count += compound_nr(page) + page_has_private(page);
-	return expected_count;
+	refs += folio_nr_pages(folio);
+	if (folio_get_private(folio))
+		refs++;
+
+	return refs;;
 }
 
 /*
@@ -360,7 +365,7 @@ int folio_migrate_mapping(struct address_space *mapping,
 	XA_STATE(xas, &mapping->i_pages, folio_index(folio));
 	struct zone *oldzone, *newzone;
 	int dirty;
-	int expected_count = expected_page_refs(mapping, &folio->page) + extra_count;
+	int expected_count = folio_expected_refs(mapping, folio) + extra_count;
 	long nr = folio_nr_pages(folio);
 
 	if (!mapping) {
@@ -670,7 +675,7 @@ static int __buffer_migrate_folio(struct address_space *mapping,
 		return migrate_page(mapping, &dst->page, &src->page, mode);
 
 	/* Check whether page does not have extra refs before we do more work */
-	expected_count = expected_page_refs(mapping, &src->page);
+	expected_count = folio_expected_refs(mapping, src);
 	if (folio_ref_count(src) != expected_count)
 		return -EAGAIN;
 
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
