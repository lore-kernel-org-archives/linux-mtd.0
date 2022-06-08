Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CBF5C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhEP94D9TTZvv62LMd5+u2FHi5FLSVoLs6YkWAoDB3s=; b=Tg4bZZJFcHL1AL
	z2xWiDUYb079RYZdLqdT3N9BAcOXjcT+pPrhb5S94RgQEBldgK6/g/Wn1VHIJwzcv1gjWV4zC+7Rx
	F5jpWGGJCF5VsO4L/0afXfMp2kduOHFLEV4JfbpSU3/DEuU/wm2oLTHAlTxopJPdBbB2Hl6bYQAbu
	YrtewoCRDRzLydjfLcxAULsm/Qv26+evrLc1kzVM+oaHTmcHOdcCN7M+4XvmQ99w1zIeJwAF6etlv
	lhn0LAbAK+N936g0z3gUuc5UwPO6bmbwMNQZAk4ahpO3FeZ2140qSfHatewy6mxKYeJBvxnMhT772
	i2HCy4Ak1FgO/XHBXsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxJP-00Dvhf-Va; Wed, 08 Jun 2022 15:09:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxJM-00DvgH-0Z
	for linux-mtd@bombadil.infradead.org; Wed, 08 Jun 2022 15:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3fQqNRsX2k9U5g+9eAzNLqy1rB1a5hC9OuR/TIVAv1c=; b=BzgCA3dtIfrrNOFOqZw+rQudkD
	nQHTv0fThp0cTrpRot0mmwRsAJIVnWEYdCMHR9+BI2vGiioilWMA0f5/jrc3m/9O4FeZRtFwrPPEc
	CRfaG1TVqvJZrjE8U7i8Qn0EyWZ+Huymk4p+kP5MwP0AvEE0aparXlmBO+8OO8YLNJ/O8TNmYzM1V
	BXTwncOLifnP30UapOFmT9Bg5IFrHfXxgFF0f3vKoRKkVZZE0LLbqRMWs/kl31OrOiRyD/mlQMkWG
	nU/8onyZGsVXhJq4qZ+wDdd8mdRf0/qTyqE2iJ8XwE6Cg7sqF/OMB+hYJd6qhVzvrxdp3ZngOZ9qD
	bKJsjzIg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxCu-00CjFO-89; Wed, 08 Jun 2022 15:02:52 +0000
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
Subject: [PATCH v2 05/19] mm/migrate: Convert writeout() to take a folio
Date: Wed,  8 Jun 2022 16:02:35 +0100
Message-Id: <20220608150249.3033815-6-willy@infradead.org>
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

Use a folio throughout this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 mm/migrate.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 1878de817a01..6b6fec26f4d0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -761,11 +761,10 @@ int buffer_migrate_page_norefs(struct address_space *mapping,
 #endif
 
 /*
- * Writeback a page to clean the dirty state
+ * Writeback a folio to clean the dirty state
  */
-static int writeout(struct address_space *mapping, struct page *page)
+static int writeout(struct address_space *mapping, struct folio *folio)
 {
-	struct folio *folio = page_folio(page);
 	struct writeback_control wbc = {
 		.sync_mode = WB_SYNC_NONE,
 		.nr_to_write = 1,
@@ -779,25 +778,25 @@ static int writeout(struct address_space *mapping, struct page *page)
 		/* No write method for the address space */
 		return -EINVAL;
 
-	if (!clear_page_dirty_for_io(page))
+	if (!folio_clear_dirty_for_io(folio))
 		/* Someone else already triggered a write */
 		return -EAGAIN;
 
 	/*
-	 * A dirty page may imply that the underlying filesystem has
-	 * the page on some queue. So the page must be clean for
-	 * migration. Writeout may mean we loose the lock and the
-	 * page state is no longer what we checked for earlier.
+	 * A dirty folio may imply that the underlying filesystem has
+	 * the folio on some queue. So the folio must be clean for
+	 * migration. Writeout may mean we lose the lock and the
+	 * folio state is no longer what we checked for earlier.
 	 * At this point we know that the migration attempt cannot
 	 * be successful.
 	 */
 	remove_migration_ptes(folio, folio, false);
 
-	rc = mapping->a_ops->writepage(page, &wbc);
+	rc = mapping->a_ops->writepage(&folio->page, &wbc);
 
 	if (rc != AOP_WRITEPAGE_ACTIVATE)
 		/* unlocked. Relock */
-		lock_page(page);
+		folio_lock(folio);
 
 	return (rc < 0) ? -EIO : -EAGAIN;
 }
@@ -817,7 +816,7 @@ static int fallback_migrate_folio(struct address_space *mapping,
 		default:
 			return -EBUSY;
 		}
-		return writeout(mapping, &src->page);
+		return writeout(mapping, src);
 	}
 
 	/*
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
