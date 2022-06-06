Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E58C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 20:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYHpyBX02XSWwLdxtCvbIazPTVqdDI/b/XjrVPsZis0=; b=pPAUiOmAv1OZBI
	wVoJqSUuELAGLoIjqdp4SLQI+yX9SCBO2E8D9oeLhpCdspUPZcLTB0ijM/STgOcgtBK6lVUu+Ep1S
	8RLaks1ceHVVwMHbLRGpdQPgt6m9RguDlYWrR48oVRFqGLgJui56OiEa+X8r+6lfUIitaM4YAeRuQ
	HJkHnWE9j0t/82ySgO9LuleoMxi7ff9ND1n0+P7yEM86Ky3JQY00TG1OwX2EQutd6IWKgJnudSs56
	9PsSBQACNjERApjxOklWsXPV+MUVx+Xk2xefs88yszKbzpvaD8u38hchnyL3iW/48eHrKAG0rN5mW
	pWYMuhruef9nXIcNplwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJYQ-002izI-Rj; Mon, 06 Jun 2022 20:42:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJXF-002hr7-NH
	for linux-mtd@bombadil.infradead.org; Mon, 06 Jun 2022 20:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MljmBGg5QLNrlXQo2zoqyO/w7uyNryh0JirP0K7S3ag=; b=crx1P1AOzfaVjsIjKFsnW/dRPz
	BXw2ENLZjBS3Tf/K4vlxUvTW65vSWeLe4SK5T0Xn+T+dHDiJg0i+lSt2MU+wL0lJZ5+okWaxAgbc0
	Z/vst7YgLlz94wNZjneO8OUXYrNEJKVSQQicN17cN1YoPQTICS4bXGxyDlnzy9O5ahmISSxp7vpN/
	Hwqq/epOdfS0GN2mfRLkGMDSNsHzoUSO3A1kzb8obP6+oMgROyOVolsUsjhQaeGAY7SVGoFC37P39
	vXEmqMt5KDLiFuVK/vK6EVvywxX227bt9H9wiRu2WVwsFGhB7SVM3X8Mlqtvyz7jItHArnFsZxYgX
	ssmeGojg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJWx-00B19c-AH; Mon, 06 Jun 2022 20:40:55 +0000
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
Subject: [PATCH 10/20] btrfs: Convert btrfs_migratepage to migrate_folio
Date: Mon,  6 Jun 2022 21:40:40 +0100
Message-Id: <20220606204050.2625949-11-willy@infradead.org>
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

Use filemap_migrate_folio() to do the bulk of the work, and then copy
the ordered flag across if needed.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/btrfs/inode.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 81737eff92f3..5f41d869c648 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -8255,30 +8255,24 @@ static bool btrfs_release_folio(struct folio *folio, gfp_t gfp_flags)
 }
 
 #ifdef CONFIG_MIGRATION
-static int btrfs_migratepage(struct address_space *mapping,
-			     struct page *newpage, struct page *page,
+static int btrfs_migrate_folio(struct address_space *mapping,
+			     struct folio *dst, struct folio *src,
 			     enum migrate_mode mode)
 {
-	int ret;
+	int ret = filemap_migrate_folio(mapping, dst, src, mode);
 
-	ret = migrate_page_move_mapping(mapping, newpage, page, 0);
 	if (ret != MIGRATEPAGE_SUCCESS)
 		return ret;
 
-	if (page_has_private(page))
-		attach_page_private(newpage, detach_page_private(page));
-
-	if (PageOrdered(page)) {
-		ClearPageOrdered(page);
-		SetPageOrdered(newpage);
+	if (folio_test_ordered(src)) {
+		folio_clear_ordered(src);
+		folio_set_ordered(dst);
 	}
 
-	if (mode != MIGRATE_SYNC_NO_COPY)
-		migrate_page_copy(newpage, page);
-	else
-		migrate_page_states(newpage, page);
 	return MIGRATEPAGE_SUCCESS;
 }
+#else
+#define btrfs_migrate_folio NULL
 #endif
 
 static void btrfs_invalidate_folio(struct folio *folio, size_t offset,
@@ -11422,9 +11416,7 @@ static const struct address_space_operations btrfs_aops = {
 	.direct_IO	= noop_direct_IO,
 	.invalidate_folio = btrfs_invalidate_folio,
 	.release_folio	= btrfs_release_folio,
-#ifdef CONFIG_MIGRATION
-	.migratepage	= btrfs_migratepage,
-#endif
+	.migrate_folio	= btrfs_migrate_folio,
 	.dirty_folio	= filemap_dirty_folio,
 	.error_remove_page = generic_error_remove_page,
 	.swap_activate	= btrfs_swap_activate,
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
