Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA521C48260
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZE3ZRszkFLBdn6M6TGjK6eXU/2QSKoK1ysfXTIAHTQ=; b=ztrcKihbYjbRaK
	nchKhWz9/8TGKP0EOSQYSMNMXi1F34In6t7IezZ3ZhLfjHLa+mjiJJZwiNpkirueXp2eocYEcj5B+
	Ox2UPWhm8n/+JZdFYvT7v2w2z45VFwdYZae5EqWAr3bR0ASg1OBFg2HM6P1+e8DmfmzgmDfoUHD3X
	jcrLqhWrm7svU/PDKH8OzC62liIysbV1sONmgadFzc2Vbc4fR/M32fft5dYWAnIbc6CFSbP3FQGBf
	IA3LSq2peaNcwQiTzuBaNZDSCtrRgzC4a8MntsxlqkqC8Uo1Z28vY553HrKn9otLOqNawLS8RrLwZ
	d3PVzXzr/zTkkCalt++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRA-004ZvB-2E;
	Wed, 24 Jan 2024 17:53:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR3-004ZqO-2H
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JI7TRcrNAWTGD3JADBBjfQKlKi2IoQX6n2CFdIsy/E4=; b=XGl3b6wAc3wR3IgrapwULGUAvQ
	k40XFAKc91jjY9B8Pyzn7eth0fWgo4DURFNFwGDE9WxifxiPTGMdYrtqfTR2BZ9paex6RAq4ZTrEw
	ED5D4tTqSRT+2Kzb1lHI9dBv5wr+HDmFo78EinT4yomoNTD/5sGKZWzcfwE1E/nTRkxCfaFhEjtdN
	/x9L9M5napsobmCcGfSKrpStXPclqP3JO7x/J0S2nut6EqJdrhQUCC/ZRv/4qZUNVcQEMIMGLjyr+
	63UyM65k18L+0cID0Y6yQHzXMO/UVnzu9hoZoXnGiW1n2N7U3jeWUHGQ8VKieaFYIyHWJ1NDLatrl
	HbLdeHCA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQv-00000007LVa-12dc;
	Wed, 24 Jan 2024 17:53:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 06/15] ubifs: Convert ubifs_vm_page_mkwrite() to use a folio
Date: Wed, 24 Jan 2024 17:52:49 +0000
Message-ID: <20240124175302.1750912-7-willy@infradead.org>
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

Replace six implicit calls to compound_head() with one.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 Documentation/mm/page_cache.rst | 10 +++++++++
 fs/ubifs/file.c                 | 36 ++++++++++++++++-----------------
 2 files changed, 28 insertions(+), 18 deletions(-)

diff --git a/Documentation/mm/page_cache.rst b/Documentation/mm/page_cache.rst
index 75eba7c431b2..138d61f869df 100644
--- a/Documentation/mm/page_cache.rst
+++ b/Documentation/mm/page_cache.rst
@@ -3,3 +3,13 @@
 ==========
 Page Cache
 ==========
+
+The page cache is the primary way that the user and the rest of the kernel
+interact with filesystems.  It can be bypassed (e.g. with O_DIRECT),
+but normal reads, writes and mmaps go through the page cache.
+
+Folios
+======
+
+The folio is the unit of memory management within the page cache.
+Operations 
diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 70d391b72897..3c4a98476c23 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1514,14 +1514,14 @@ static bool ubifs_release_folio(struct folio *folio, gfp_t unused_gfp_flags)
  */
 static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 {
-	struct page *page = vmf->page;
+	struct folio *folio = page_folio(vmf->page);
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	struct timespec64 now = current_time(inode);
 	struct ubifs_budget_req req = { .new_page = 1 };
 	int err, update_time;
 
-	dbg_gen("ino %lu, pg %lu, i_size %lld",	inode->i_ino, page->index,
+	dbg_gen("ino %lu, pg %lu, i_size %lld",	inode->i_ino, folio->index,
 		i_size_read(inode));
 	ubifs_assert(c, !c->ro_media && !c->ro_mount);
 
@@ -1529,17 +1529,17 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS; /* -EROFS */
 
 	/*
-	 * We have not locked @page so far so we may budget for changing the
-	 * page. Note, we cannot do this after we locked the page, because
+	 * We have not locked @folio so far so we may budget for changing the
+	 * folio. Note, we cannot do this after we locked the folio, because
 	 * budgeting may cause write-back which would cause deadlock.
 	 *
-	 * At the moment we do not know whether the page is dirty or not, so we
-	 * assume that it is not and budget for a new page. We could look at
+	 * At the moment we do not know whether the folio is dirty or not, so we
+	 * assume that it is not and budget for a new folio. We could look at
 	 * the @PG_private flag and figure this out, but we may race with write
-	 * back and the page state may change by the time we lock it, so this
+	 * back and the folio state may change by the time we lock it, so this
 	 * would need additional care. We do not bother with this at the
 	 * moment, although it might be good idea to do. Instead, we allocate
-	 * budget for a new page and amend it later on if the page was in fact
+	 * budget for a new folio and amend it later on if the folio was in fact
 	 * dirty.
 	 *
 	 * The budgeting-related logic of this function is similar to what we
@@ -1562,21 +1562,21 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 	}
 
-	lock_page(page);
-	if (unlikely(page->mapping != inode->i_mapping ||
-		     page_offset(page) > i_size_read(inode))) {
-		/* Page got truncated out from underneath us */
+	folio_lock(folio);
+	if (unlikely(folio->mapping != inode->i_mapping ||
+		     folio_pos(folio) >= i_size_read(inode))) {
+		/* Folio got truncated out from underneath us */
 		goto sigbus;
 	}
 
-	if (PagePrivate(page))
+	if (folio->private)
 		release_new_page_budget(c);
 	else {
-		if (!PageChecked(page))
+		if (!folio_test_checked(folio))
 			ubifs_convert_page_budget(c);
-		attach_page_private(page, (void *)1);
+		folio_attach_private(folio, (void *)1);
 		atomic_long_inc(&c->dirty_pg_cnt);
-		__set_page_dirty_nobuffers(page);
+		filemap_dirty_folio(folio->mapping, folio);
 	}
 
 	if (update_time) {
@@ -1592,11 +1592,11 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 			ubifs_release_dirty_inode_budget(c, ui);
 	}
 
-	wait_for_stable_page(page);
+	folio_wait_stable(folio);
 	return VM_FAULT_LOCKED;
 
 sigbus:
-	unlock_page(page);
+	folio_unlock(folio);
 	ubifs_release_budget(c, &req);
 	return VM_FAULT_SIGBUS;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
