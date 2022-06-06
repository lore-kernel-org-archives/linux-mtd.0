Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F85C43334
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 20:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFKN2Stx4udTf76TxyCSIPOlONeE3GOOjaqrIsAD6mw=; b=V1uvlE/ukFPoqa
	AnzK+yYmY3xMSOAVhOHm83LbIrAtyNUcmRaBoOOtQqNaIaE3u+HKpIoYFhJ6yEcqIZ99KLT6ZYl7y
	mimS2CxO9Be8jRZ3vD5ljgILU6lbUWW6fpk/GHz63Mtdv6hsU8a/J7fLhgTI7ltO8IyCHkNuTJC56
	Vl8rFspqqwoYURx2ffLEwZzoPx5VcOaxSzs3r0dHc3Zt1OSLeJfDfdT2ymg6ExYRjkS89JMfw92Z5
	XV3saIhhQeJSzxIdZOBskeH4GZca74NlH5MGHSpqOAxwGZz9foJpVemNB+78n0J7e8XfDcw/erhTp
	7LD0ALgKLegE200MksKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJp0-002o0K-A0; Mon, 06 Jun 2022 20:59:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJox-002nz6-SU
	for linux-mtd@bombadil.infradead.org; Mon, 06 Jun 2022 20:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o3aaQHfQtp8mApg3jGvaUbMxXMesQjforjwRq7Bq2eU=; b=FEnR7eEx/VqQapCb2J1x1R7fqn
	GHGdnHs4TAUYPhigynTRMZ8qU4EWbsdGE3TfoyFJqfBAgGTtewYKTmiwvMMYa2HzGM87YYHNNNBAf
	25WKlfaBUvQt5+7ogUbK8K0pDyk13POFE1JCVwn42/GfMWEBrYZHN2/3N10M2ljY4Z2NIxy968T1O
	HE7TzEF3cSl9U3cZr+DVtzHy9GRmE/G/dKDgi6vIqQx9YHC1/Rfaz1Ct+G2LHZg/lo5tSznhIMqdV
	W1GO7z8A4xasl5WYZ2TeCzudph+MgQrRtd+cB9PyhUGii++9HtpbBEllVTWL/01DS9ex+eqAgijud
	Ea0r0KAw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJWx-00B19k-M6; Mon, 06 Jun 2022 20:40:55 +0000
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
Subject: [PATCH 14/20] hugetlb: Convert to migrate_folio
Date: Mon,  6 Jun 2022 21:40:44 +0100
Message-Id: <20220606204050.2625949-15-willy@infradead.org>
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

This involves converting migrate_huge_page_move_mapping().  We also need a
folio variant of hugetlb_set_page_subpool(), but that's for a later patch.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/hugetlbfs/inode.c    | 19 ++++++++++---------
 include/linux/migrate.h |  6 +++---
 mm/migrate.c            | 18 +++++++++---------
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 14d33f725e05..583ca3f52c04 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -954,25 +954,26 @@ static int hugetlbfs_symlink(struct user_namespace *mnt_userns,
 	return error;
 }
 
-static int hugetlbfs_migrate_page(struct address_space *mapping,
-				struct page *newpage, struct page *page,
+static int hugetlbfs_migrate_folio(struct address_space *mapping,
+				struct folio *dst, struct folio *src,
 				enum migrate_mode mode)
 {
 	int rc;
 
-	rc = migrate_huge_page_move_mapping(mapping, newpage, page);
+	rc = migrate_huge_page_move_mapping(mapping, dst, src);
 	if (rc != MIGRATEPAGE_SUCCESS)
 		return rc;
 
-	if (hugetlb_page_subpool(page)) {
-		hugetlb_set_page_subpool(newpage, hugetlb_page_subpool(page));
-		hugetlb_set_page_subpool(page, NULL);
+	if (hugetlb_page_subpool(&src->page)) {
+		hugetlb_set_page_subpool(&dst->page,
+					hugetlb_page_subpool(&src->page));
+		hugetlb_set_page_subpool(&src->page, NULL);
 	}
 
 	if (mode != MIGRATE_SYNC_NO_COPY)
-		migrate_page_copy(newpage, page);
+		folio_migrate_copy(dst, src);
 	else
-		migrate_page_states(newpage, page);
+		folio_migrate_flags(dst, src);
 
 	return MIGRATEPAGE_SUCCESS;
 }
@@ -1142,7 +1143,7 @@ static const struct address_space_operations hugetlbfs_aops = {
 	.write_begin	= hugetlbfs_write_begin,
 	.write_end	= hugetlbfs_write_end,
 	.dirty_folio	= noop_dirty_folio,
-	.migratepage    = hugetlbfs_migrate_page,
+	.migrate_folio  = hugetlbfs_migrate_folio,
 	.error_remove_page	= hugetlbfs_error_remove_page,
 };
 
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 4ef22806cd8e..088749471485 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -35,8 +35,8 @@ extern int isolate_movable_page(struct page *page, isolate_mode_t mode);
 
 extern void migrate_page_states(struct page *newpage, struct page *page);
 extern void migrate_page_copy(struct page *newpage, struct page *page);
-extern int migrate_huge_page_move_mapping(struct address_space *mapping,
-				  struct page *newpage, struct page *page);
+int migrate_huge_page_move_mapping(struct address_space *mapping,
+		struct folio *dst, struct folio *src);
 extern int migrate_page_move_mapping(struct address_space *mapping,
 		struct page *newpage, struct page *page, int extra_count);
 void migration_entry_wait_on_locked(swp_entry_t entry, pte_t *ptep,
@@ -67,7 +67,7 @@ static inline void migrate_page_copy(struct page *newpage,
 				     struct page *page) {}
 
 static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
-				  struct page *newpage, struct page *page)
+				  struct folio *dst, struct folio *src)
 {
 	return -ENOSYS;
 }
diff --git a/mm/migrate.c b/mm/migrate.c
index 148dd0463dec..a8edd226c72d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -475,26 +475,26 @@ EXPORT_SYMBOL(folio_migrate_mapping);
  * of folio_migrate_mapping().
  */
 int migrate_huge_page_move_mapping(struct address_space *mapping,
-				   struct page *newpage, struct page *page)
+				   struct folio *dst, struct folio *src)
 {
-	XA_STATE(xas, &mapping->i_pages, page_index(page));
+	XA_STATE(xas, &mapping->i_pages, folio_index(src));
 	int expected_count;
 
 	xas_lock_irq(&xas);
-	expected_count = 2 + page_has_private(page);
-	if (!page_ref_freeze(page, expected_count)) {
+	expected_count = 2 + folio_has_private(src);
+	if (!folio_ref_freeze(src, expected_count)) {
 		xas_unlock_irq(&xas);
 		return -EAGAIN;
 	}
 
-	newpage->index = page->index;
-	newpage->mapping = page->mapping;
+	dst->index = src->index;
+	dst->mapping = src->mapping;
 
-	get_page(newpage);
+	folio_get(dst);
 
-	xas_store(&xas, newpage);
+	xas_store(&xas, dst);
 
-	page_ref_unfreeze(page, expected_count - 1);
+	folio_ref_unfreeze(src, expected_count - 1);
 
 	xas_unlock_irq(&xas);
 
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
