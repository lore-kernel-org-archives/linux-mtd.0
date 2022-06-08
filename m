Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80902C43334
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 15:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vM1H6aqgCKkJHfqeGgTvgfCHH4iGyGzNiz30wY7V/I=; b=jSSfM9KbgQ5KYX
	39GjOJdZNiTBZLJVSo0o9IUIfZSNohi5ImByL5pn0Apgv/WfNiKh/UwBWCrC5CnsDQf+1hnuD8qBT
	7/XR/abrygUgOQmBDNLEiHnapCK5godHRsyo5J6bOgecliZKhqX00iyw2HY+hq1/aScpN9giBFW9F
	xbhdASMFGhHB5hA8f8/+JxLoKUj8z2CuQWjpDniKyrFX2xr1CHbtogs4U5iM6M1BmWeZdbIf+UlTp
	BPQ/EDnKbjXOwTROMj3RGvTsvp9LwzUeDlVPfVdRgk2YDWILXPjWnxj4lXs6ohiIhTPy+KMZ2YJRJ
	BPcNOVm39USWuBwSe5Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxF5-00DtM2-BP; Wed, 08 Jun 2022 15:05:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxEp-00DtBr-HQ
	for linux-mtd@bombadil.infradead.org; Wed, 08 Jun 2022 15:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rXRIRcK5aBVZ2wBOi68suVknWfPexbmGif0IEKfZsbs=; b=lsRn9gaO5tAEYD/OWJOs5+zBTI
	NCwTDYynMk1lnd9OTbJ4EfJRYdVl+3dODL7tzXJVPHXM+7SlQHXOVlUsUboFXhSdXz3aSmA3UKZ6F
	L5v7sh+GECC4njYbIAGlnHpfB8UwcWrwo0wyP4BhZlRei7kEvvdyW2VaiPkXgO55R9kKQgx/YjEqw
	tYFIlMpDyJj5vqIZK5lcNkMFc7QTZ02ItadvJCgbfwAGx5UGipfrdrSUQujOmia2pjwzdNOAWZ616
	V6c9pTOiEz7pLpSwn0iaK2fRQggU3GplOvlDyjFYnosAScOy2AdneQp1BzdO4NPq9SyDvONshsH4r
	X68Lp0aw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxCt-00CjFG-OC; Wed, 08 Jun 2022 15:02:51 +0000
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
Subject: [PATCH v2 01/19] secretmem: Remove isolate_page
Date: Wed,  8 Jun 2022 16:02:31 +0100
Message-Id: <20220608150249.3033815-2-willy@infradead.org>
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

The isolate_page operation is never called for filesystems, only
for device drivers which call SetPageMovable.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/secretmem.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 206ed6b40c1d..1c7f1775b56e 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -133,11 +133,6 @@ static const struct file_operations secretmem_fops = {
 	.mmap		= secretmem_mmap,
 };
 
-static bool secretmem_isolate_page(struct page *page, isolate_mode_t mode)
-{
-	return false;
-}
-
 static int secretmem_migratepage(struct address_space *mapping,
 				 struct page *newpage, struct page *page,
 				 enum migrate_mode mode)
@@ -155,7 +150,6 @@ const struct address_space_operations secretmem_aops = {
 	.dirty_folio	= noop_dirty_folio,
 	.free_folio	= secretmem_free_folio,
 	.migratepage	= secretmem_migratepage,
-	.isolate_page	= secretmem_isolate_page,
 };
 
 static int secretmem_setattr(struct user_namespace *mnt_userns,
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
