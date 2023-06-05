Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94712C7EE23
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRo80mldmzetFOa1Gm868d2MJYWvnkqicHS/GPONs7A=; b=3XvfSZMao2jnDw
	HJlQqs/DiuUoIGWa0AS82mXsszGr+MYD4XRG9UAZuXeGdK52ZM3TUbpdn2mLpNgTMMSftoMx73kII
	RIBBQ24TMytpg9BaIc2UQqACGB92fP6m56IxU1XHEiHWgnihU2gFk+1sVDsO6uPfBmktG4fvtqJ5X
	0SO8okMwSrkZCVlUE79Dh+mDg5lwsxcaqsHBwF6WPOcc81J/Vynb89mLt4c1hghuBBjFnDDDz+ShN
	grX3lvb+VRwYdOZgDt1OUMorTysj3rlf2ieJOgbl041wCe/vdtcfFJhOYdCTMPYhStVVdkMjtlaho
	F83HPxAijoSOyClaJLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DPd-00GBn8-23;
	Mon, 05 Jun 2023 16:50:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DPc-00GBmC-0b
	for linux-mtd@bombadil.infradead.org;
	Mon, 05 Jun 2023 16:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y39+FBraiXLKMk72eXSZr8izj/cd6Fnar3TzALVxBdM=; b=XR9MeB+DfmTA+MHy+COe/5I9Dg
	ezGVCSlvfXQ7j74wgSRhiC1L//JWVHrMwh35PeTCGXjgRPsxuHbgxcMOM2dsLFzWWL7jIPm0/SwNU
	Ky0caPIPF2vfxaMGanwjIYAujatLdr0VjI7DKFaN/Y8psa+xDxrVjFjKsBX/VT5sK1F5bvuIpsmmw
	Cc8A6ItnCjlgbZJTdnoh1aehoq6vL2llhD5CgnB1oN9nKmKFbomamzYAqE2tF52DLhCG+smVtW7kU
	nXThWapyJZV/E9J4X6+Nt+cSmFvs5ILtdpMEvL24dQ/sq4Tu6Cuq1QkZZyeFeya6h2Hk5mdG1UjwI
	IcUBMBFw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6DPa-00CCav-Ng; Mon, 05 Jun 2023 16:50:30 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 3/4] ubifs: Use a folio in do_truncation()
Date: Mon,  5 Jun 2023 17:50:28 +0100
Message-Id: <20230605165029.2908304-4-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230605165029.2908304-1-willy@infradead.org>
References: <20230605165029.2908304-1-willy@infradead.org>
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

Convert from the old page APIs to the new folio APIs which saves
a few hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 1c7a99c36906..c0e68b3d7582 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1153,11 +1153,11 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 
 	if (offset) {
 		pgoff_t index = new_size >> PAGE_SHIFT;
-		struct page *page;
+		struct folio *folio;
 
-		page = find_lock_page(inode->i_mapping, index);
-		if (page) {
-			if (PageDirty(page)) {
+		folio = filemap_lock_folio(inode->i_mapping, index);
+		if (folio) {
+			if (folio_test_dirty(folio)) {
 				/*
 				 * 'ubifs_jnl_truncate()' will try to truncate
 				 * the last data node, but it contains
@@ -1166,14 +1166,14 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 				 * 'ubifs_jnl_truncate()' will see an already
 				 * truncated (and up to date) data node.
 				 */
-				ubifs_assert(c, PagePrivate(page));
+				ubifs_assert(c, folio->private != NULL);
 
-				clear_page_dirty_for_io(page);
+				folio_clear_dirty_for_io(folio);
 				if (UBIFS_BLOCKS_PER_PAGE_SHIFT)
-					offset = new_size &
-						 (PAGE_SIZE - 1);
-				err = do_writepage(page, offset);
-				put_page(page);
+					offset = offset_in_folio(folio,
+							new_size);
+				err = do_writepage(&folio->page, offset);
+				folio_put(folio);
 				if (err)
 					goto out_budg;
 				/*
@@ -1186,8 +1186,8 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 				 * to 'ubifs_jnl_truncate()' to save it from
 				 * having to read it.
 				 */
-				unlock_page(page);
-				put_page(page);
+				folio_unlock(folio);
+				folio_put(folio);
 			}
 		}
 	}
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
