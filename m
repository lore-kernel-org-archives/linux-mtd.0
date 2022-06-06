Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7757CCA487
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 20:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eseZeY4ar7bYfoeE/iwdWLKMm4zm1tLI/v1SaVRSjPM=; b=r7mnrFezSIEVQ+
	VhvoHNftKEIhvatJtnCioVOQNCagdaU9nAFVgItBvV8E+pgEEwhso3RSVjl1iWZlzezIZE1BRe/O2
	/7BaQjtPQpKjAWoeHQY+TzyfLqvUGPwKRvE1Lc96Gdgcj2Jsj5YwsUov6l0QrIzkOrqw8EfFoO0vd
	TT82SYRAVHebX8o++3rQrQyekWCedsqTUOophkQABAjJemnji84L3jN6pGFyqqEZZ37i584Fmt9V6
	xVd7/SkrwOpK+kOK5SoKLBd1GMb84nWVRUYc8TcCFYkjCv0SuSpanqZE36z3FF61aPrDS0s4qmIG3
	jaJBPOpiYuyZ9+4MM07w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJXX-002iAj-2t; Mon, 06 Jun 2022 20:41:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJX5-002hiA-85
	for linux-mtd@bombadil.infradead.org; Mon, 06 Jun 2022 20:41:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Nbr9wUy4GZu/A9I5fNiEUH8YjHUTRzvYZO3QnrtHfqs=; b=Gd3hSiL+/E0dfHLBarUzOacZ5+
	RgLt/HR3/LRhEZeLymFVkZyeDV4o45ibioJi0eraHf6ehCGQbtosb1TjID04N286tCzWwDmpddr27
	H3ByN9G6hK5riWHYLqRkTy3GsEZUgLnYhezqas1+XNq5pmGlpRnM2NevyEDgUXJ8ZYsVlaLiCT3RO
	8Ehpw8He8k5yQNPfIvPT9F5a/3yz8jOKKKyGe7pM1yVoqkDKz2YPmFcUn0VPuUW3SPY9tPOvKaZJU
	1Vf1NH8uVC9GEQzwQCTJYo35GSSSaLqMV3XH1X1fzAEkojyoaH3wkOkh+Z2rcUydL6L7kLEvUr3mZ
	LKB+9tpQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJWx-00B19q-Uf; Mon, 06 Jun 2022 20:40:55 +0000
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
Subject: [PATCH 17/20] z3fold: Convert to migrate_folio
Date: Mon,  6 Jun 2022 21:40:47 +0100
Message-Id: <20220606204050.2625949-18-willy@infradead.org>
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

z3fold doesn't really use folios, but it needs to be called like this
in order to migrate an individual page.  Convert from a folio back to
a page until we decide how to handle migration better for z3fold.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/z3fold.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/z3fold.c b/mm/z3fold.c
index f41f8b0d9e9a..5d091c41fb35 100644
--- a/mm/z3fold.c
+++ b/mm/z3fold.c
@@ -1554,9 +1554,11 @@ static bool z3fold_page_isolate(struct page *page, isolate_mode_t mode)
 	return false;
 }
 
-static int z3fold_page_migrate(struct address_space *mapping, struct page *newpage,
-			       struct page *page, enum migrate_mode mode)
+static int z3fold_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
+	struct page *newpage = &dst->page;
+	struct page *page = &src->page;
 	struct z3fold_header *zhdr, *new_zhdr;
 	struct z3fold_pool *pool;
 	struct address_space *new_mapping;
@@ -1644,7 +1646,7 @@ static void z3fold_page_putback(struct page *page)
 
 static const struct address_space_operations z3fold_aops = {
 	.isolate_page = z3fold_page_isolate,
-	.migratepage = z3fold_page_migrate,
+	.migrate_folio = z3fold_migrate_folio,
 	.putback_page = z3fold_page_putback,
 };
 
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
