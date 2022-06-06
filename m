Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F67EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jun 2022 21:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUvGdHqFtaAl13ItB8lxkkXb11NPmHBh2O2bWIpEEfo=; b=JYFYWvsBh71WXp
	ohqN8Ct1DtoUE5iE/gTslLvrPMvOLJUZW6nfg15RriAdxE/7w15+K+39ncCik9Mw4YFIv0RX6k6nU
	Ww/ihDtSmE8i6xJLamdgqBUCcQqi2j2hUgNUbW5zPJ53dBjdexX8KO7Axsgq7BDvV6ZBCV+wEGVQq
	cQAUTlZePmRhpWCwPPX0tpO3Qvr7vgpLgE6PZX0n4TmpWVpIKhD0VaCWeQQ3q2FrsHCKijDGDeNDG
	F+6KIWKvsLgiK/RTh+z03DcrYE0eGqgdBjYnjRVGzbZTHa8zocpLBpf3/IJOpucg12K0zwxeFd7Py
	N2mcDBNL45lXa20+a70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJp2-002o0o-Vp; Mon, 06 Jun 2022 20:59:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJoy-002nz6-8X
	for linux-mtd@bombadil.infradead.org; Mon, 06 Jun 2022 20:59:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=sw3xGMu8EIPPhanldW93F5IagC/JMQIeTrByOXSqams=; b=JRGvxIipv7m6v6BYy6Iv5o96an
	NjXbRwZx1kTpdL1gggi3uNnj2ZYHaGoDzYgFT9yWRY6RNrAPmjSRZuyOiiwaQM/1+M4AVwuYk+PBK
	EhpIMqcN0q2USPv0aKU3dVjpSas0DHRDV7v4Cj/0tVzmx9G3IVaaTh1VHsmINPnXLtdg0pn0oK/os
	mZ5HSWwosmZWEQkulkmXHnZdh3UXU16V/nVWQplhy19ME/Fyl4IioqID8E9V19f67diSrjjEsp+Bj
	J6Yy4FA8M6KmTvtuBy+S1CbohBt8Z1KKKPT8ganbhA1EGJjXoSXsZPQfL0++fMRIBpXima3JffJKS
	uzjNM9wQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyJWx-00B19o-Ro; Mon, 06 Jun 2022 20:40:55 +0000
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
Subject: [PATCH 16/20] secretmem: Convert to migrate_folio
Date: Mon,  6 Jun 2022 21:40:46 +0100
Message-Id: <20220606204050.2625949-17-willy@infradead.org>
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

This is little more than changing the types over; there's no real work
being done in this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/secretmem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 206ed6b40c1d..9c7f6e3bf3e1 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -138,8 +138,8 @@ static bool secretmem_isolate_page(struct page *page, isolate_mode_t mode)
 	return false;
 }
 
-static int secretmem_migratepage(struct address_space *mapping,
-				 struct page *newpage, struct page *page,
+static int secretmem_migrate_folio(struct address_space *mapping,
+				 struct folio *dst, struct folio *src,
 				 enum migrate_mode mode)
 {
 	return -EBUSY;
@@ -154,7 +154,7 @@ static void secretmem_free_folio(struct folio *folio)
 const struct address_space_operations secretmem_aops = {
 	.dirty_folio	= noop_dirty_folio,
 	.free_folio	= secretmem_free_folio,
-	.migratepage	= secretmem_migratepage,
+	.migrate_folio	= secretmem_migrate_folio,
 	.isolate_page	= secretmem_isolate_page,
 };
 
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
